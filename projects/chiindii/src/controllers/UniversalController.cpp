#include "UniversalController.h"

#include "../Chiindii.h"

using namespace digitalcave;

UniversalController::UniversalController(Chiindii *chiindii) :
	mode(MODE_FLIGHT),
	axis(AXIS_RX),
	pid(PID_P),
	chiindii(chiindii)
{
	;
}

PID* UniversalController::getPid(){
	switch(axis){
		case AXIS_RX:
			return chiindii->getRateX();
		case AXIS_RY:
			return chiindii->getRateY();
		case AXIS_RZ:
			return chiindii->getRateZ();
		case AXIS_AX:
			return chiindii->getAngleX();
		case AXIS_AY:
			return chiindii->getAngleY();
		case AXIS_AZ:
			return chiindii->getAngleZ();
		default:
			axis = AXIS_T;
			return chiindii->getGforce();
	}
}

void UniversalController::updatePidDisplay(){
	const char* axisLabel;
	const char* pidLabel;
	PID* selectedPid;
	int16_t value;
	char temp[15];
	
	
	switch(axis){
		case AXIS_RX:
			axisLabel = "RX";
			selectedPid = chiindii->getRateX();
			break;
		case AXIS_RY:
			axisLabel = "RY";
			selectedPid = chiindii->getRateY();
			break;
		case AXIS_RZ:
			axisLabel = "RZ";
			selectedPid = chiindii->getRateZ();
			break;
		case AXIS_AX:
			axisLabel = "AX";
			selectedPid = chiindii->getAngleX();
			break;
		case AXIS_AY:
			axisLabel = "AY";
			selectedPid = chiindii->getAngleY();
			break;
		case AXIS_AZ:
			axisLabel = "AZ";
			selectedPid = chiindii->getAngleZ();
			break;
		default:
			axisLabel = "TH";
			selectedPid = chiindii->getGforce();
			break;
	}
	switch(pid){
		case PID_P:
			pidLabel = "P";
			value = selectedPid->getKp() * 100;
			break;
		case PID_I:
			pidLabel = "I";
			value = selectedPid->getKi() * 100;
			break;
		default:
			pidLabel = "D";
			value = selectedPid->getKd() * 1000;
			break;
	}
	
	snprintf(temp, sizeof(temp), "%s %s: %4d", axisLabel, pidLabel, value);
	chiindii->sendDebug(temp);
}

void UniversalController::dispatch(FramedSerialMessage* message) {
	uint8_t cmd = message->getCommand();
	if (cmd == MESSAGE_UC_JOYSTICK_MOVE) {
		if (chiindii->getMode() == MODE_ARMED_THROTTLE){
			uint8_t* sticks = message->getData();
			uint8_t lx = sticks[0];
			uint8_t rx = sticks[2];
			uint8_t ry = sticks[3];
		
			vector_t* angle_sp = chiindii->getAngleSp();
			vector_t* rate_sp = chiindii->getRateSp();
			//For the joysticks, we read 20 degrees from each side (with 0.2 degree resolution),
			// and leave the remainder in the center unused to allow for slop in the center readings
			if (rx < 100){
				angle_sp->x = -1 * degToRad((100.0 - rx) / 10 * 2);
			}
			else if (rx > 155){
				angle_sp->x = degToRad((rx - 155.0) / 10 * 2);
			}
			else {
				angle_sp->x = 0;
			}
		
			if (ry < 100){
				angle_sp->y = degToRad((100.0 - ry) / 10 * 2);
			}
			else if (ry > 155){
				angle_sp->y = -1 * degToRad((ry - 155.0) / 10 * 2);
			}
			else {
				angle_sp->y = 0;
			}
			
			if (lx < 100){
				rate_sp->z = degToRad((100 - lx) / 10);
			}
			else if (ry > 155){
				angle_sp->z = degToRad((lx - 155) / 10);
			}
			else {
				rate_sp->z = 0;
			}
		}
		else if (chiindii->getMode() == MODE_ARMED_RATE){
			uint8_t* sticks = message->getData();
			uint8_t lx = sticks[0];
			uint8_t rx = sticks[2];
			uint8_t ry = sticks[3];
		
			vector_t* rate_sp = chiindii->getRateSp();
			//For the joysticks (rate mode), we read 20 degrees from each side (with 0.2 degree resolution),
			// and leave the remainder in the center unused to allow for slop in the center readings
			if (rx < 100){
				rate_sp->x = -1 * degToRad((100.0 - rx) / 10 * 2);
			}
			else if (rx > 155){
				rate_sp->x = degToRad((rx - 155.0) / 10 * 2);
			}
			else {
				rate_sp->x = 0;
			}
		
			if (ry < 100){
				rate_sp->y = degToRad((100.0 - ry) / 10 * 2);
			}
			else if (ry > 155){
				rate_sp->y = -1 * degToRad((ry - 155.0) / 10 * 2);
			}
			else {
				rate_sp->y = 0;
			}
			
			if (lx < 100){
				rate_sp->z = -1 * degToRad((100.0 - lx) / 10 * 2);
			}
			else if (ry > 155){
				rate_sp->z = degToRad((lx - 155) / 10 * 2);
			}
			else {
				rate_sp->z = 0;
			}
		}
	}
	else if (cmd == MESSAGE_UC_THROTTLE_MOVE){
		//chiindii->setThrottle(message->getData()[0] / 255.0 * 0.7);		//Max throttle stick returns a 70% throttle rate, to allow for overhead maneuvering thrust
// 		if (message->getData()[0] < 5) chiindii->setThrottle(0);
// 		else chiindii->setThrottle(message->getData()[0] / 255.0 * 0.5 + 0.1);	//Non-zero throttle linear in between 10% and 60%
		chiindii->setThrottle(((double) (message->getData()[0]) * message->getData()[0]) / 80000);	//Exponential throttle
	}
	else if (cmd == MESSAGE_UC_BUTTON_PUSH){
		//To arm in angle mode, press the triangle (top discrete) button while the throttle is all the way down.
		if (message->getData()[0] == CONTROLLER_BUTTON_VALUE_TRIANGLE && chiindii->getThrottle() < 0.01){
			mode = MODE_FLIGHT;
			chiindii->sendStatus("Armed (Angle) ");
			chiindii->setMode(MODE_ARMED_THROTTLE);
		}
		//To arm in rate mode, press the circle (right discrete) button while the throttle is all the way down.
		else if (message->getData()[0] == CONTROLLER_BUTTON_VALUE_CIRCLE && chiindii->getThrottle() < 0.01){
			mode = MODE_FLIGHT;
			chiindii->sendStatus("Armed (Rate)  ");
			chiindii->setMode(MODE_ARMED_RATE);
		}
		//To disarm, press the cross (bottom discrete) button at any time
		else if (message->getData()[0] == CONTROLLER_BUTTON_VALUE_CROSS){
			mode = MODE_FLIGHT;
			chiindii->sendStatus("Disarmed      ");
			chiindii->setMode(MODE_UNARMED);
			chiindii->setThrottle(0);
		}
		//Square (left discrete) button is PID tuning
		else if (message->getData()[0] == CONTROLLER_BUTTON_VALUE_SQUARE){
			mode = MODE_TUNING;
			chiindii->sendStatus("PID Tuning    ");
			chiindii->setMode(MODE_UNARMED);
			chiindii->setThrottle(0);
			updatePidDisplay();
		}
		else if (mode == MODE_TUNING){
			//Up / down adjusts selected value
			if (message->getData()[0] == CONTROLLER_BUTTON_VALUE_PADUP || message->getData()[0] == CONTROLLER_BUTTON_VALUE_PADDOWN){
				int8_t direction = (message->getData()[0] == CONTROLLER_BUTTON_VALUE_PADUP ? 1 : -1);
				switch(pid){
					case PID_P:
						getPid()->setKp(getPid()->getKp() + direction * 0.1);
					case PID_I:
						getPid()->setKp(getPid()->getKp() + direction * 0.1);
					case PID_D:
						getPid()->setKp(getPid()->getKp() + direction * 0.01);
				}
			}
			//Right selects between P/I/D
			else if (message->getData()[0] == CONTROLLER_BUTTON_VALUE_PADRIGHT){
				pid++;
				if (pid > PID_D) pid = PID_P;
			}
			//Left selects between axis
			else if (message->getData()[0] == CONTROLLER_BUTTON_VALUE_PADLEFT){
				axis++;
				if (axis > AXIS_T) axis = AXIS_RX;
			}
			
			updatePidDisplay();
		}
	}
}
