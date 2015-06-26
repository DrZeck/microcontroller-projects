#include "WProgram.h"

#include <SerialFlash.h>
#include <SPI.h>

const int FlashChipSelect = 6;

void error(const char *message) {
  while (1) {
    Serial.println(message);
    delay(2500);
  }
}

void spaces(int num) {
  for (int i=0; i < num; i++) {
    Serial.print(" ");
  }
}

void setup() {
  //uncomment these if using Teensy audio shield
  //SPI.setSCK(14);  // Audio shield has SCK on pin 14
  //SPI.setMOSI(7);  // Audio shield has MOSI on pin 7

  // wait for Arduino Serial Monitor
  while (!Serial) ;
  delay(100);
  Serial.println("All Files on SPI Flash chip:");

  if (!SerialFlash.begin()) {
    error("Unable to access SPI Flash chip");
  }

  SerialFlash.opendir();
  unsigned int count = 0;
  while (1) {
    char filename[64];
    unsigned long filesize;

    if (SerialFlash.readdir(filename, sizeof(filename), filesize)) {
      Serial.print("  ");
      Serial.print(filename);
      spaces(20 - strlen(filename));
      Serial.print("  ");
      Serial.print(filesize);
      Serial.print(" bytes");
      Serial.println();
    } else {
      break; // no more files
    }
  }
}

void loop() {
}




extern "C" int main(void){
	/*
	pinMode(13, OUTPUT);
	while (1) {
		digitalWriteFast(13, HIGH);
		delay(500);
		digitalWriteFast(13, LOW);
		delay(500);
	}
	*/
	setup();
	
	while (1){
		loop();
	}
}


