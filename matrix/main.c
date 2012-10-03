#include "lib/draw/matrix/matrix.h"
#include "lib/draw/draw.h"
#include "lib/Shift/Shift.h"

int main (void){
	Shift shift(&PORTB, PORTB0, &PORTB, PORTB1);
	matrix_init();
	
	uint8_t incoming[5];

	while (1) {
		//Loop until we get the sync frame
		//while(incoming != 0x42) shift.receive(&incoming, 1);
		//incoming = 0x00;
		
		//Read the data directly into the working buffer
		shift.receive(incoming, 5);	//MATRIX_WIDTH * (MATRIX_HEIGHT >> 1));
		for	(uint8_t i = 0; i < 5; i++){
			set_pixel(i, 0, 0x0F, OVERLAY_NAND);
			set_pixel(i, 0, incoming[i], OVERLAY_OR);
		}
		
		matrix_flush();
	}
}
