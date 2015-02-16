/*
 * An abstraction to allow simpler access to a display, and avoid all the low level stuff.
 * This class includes a display buffer of the specified size, along with metadata
 * about display geometry, dirty states, etc.
 * 
 * Supports any number of rows (up to 4) and columns (up to 20), which should work for most 
 * common display modules.
 */

#include "Hd44780.h"

namespace digitalcave {

	class Display {
		private:
			Hd44780* hd44780; 
			char buffer[80];
			uint32_t dirty[4];		//Dirty flags for each line.  Only the first 20 bits are used for each line.
			uint8_t rows;
			uint8_t cols;
			int8_t row_offsets[4]; //The start address of each row
			
		public:
			/*
			 * Initializes the display with guesses for row offsets.
			 */
			Display(Hd44780* hd44780, uint8_t rows, uint8_t cols);

			/*
			 * Initializes the display with specific row offsets.
			 */
			Display(Hd44780* hd44780, uint8_t rows, uint8_t cols, int8_t* row_offsets);
			/*
			 * Set a string at the given location in the buffer.  Will write (at most) 
			 * <length> chars at the proper offset.  Will cut off the text if it 
			 * overflows the bounds.
			 * Note that this function only writes to the buffer, not to the display.
			 * You must call refresh() to copy data to the display.
			 */
			void set_text(uint8_t row, uint8_t col, char* text, uint8_t length);
			
			/*
			 * Sets the specified character at the given location, respecting
			 * geometry bounds.
			 * Note that this function only writes to the buffer, not to the display.
			 * You must call refresh() to copy data to the display.
			 */
			void set_text(uint8_t row, uint8_t col, char text);
			
			/*
			 * Writes all dirty characters from the buffer to the display, and marks
			 * the buffer as clean.
			 */
			void refresh();
	};
}