#include "music.h"

using namespace digitalcave;

static SerialAVR* serialAVR = NULL;

static uint8_t playbackState;
static uint8_t current_folder = 1;
static uint8_t current_file_count = MAX_SOUND_FILE_COUNT;
static uint8_t queue[MAX_SOUND_FILE_COUNT];
static uint8_t currentFileIndex;

void music_shuffle_queue(uint8_t file_count);


void music_init(){
	serialAVR = new SerialAVR(9600, 8, 0, 1, 1);		//Serial Port 1 is the hardware serial port
	playbackState = SOUND_STATE_STOP;

	dfplayermini_init(serialAVR);
}

void music_shuffle_queue(uint8_t file_count){
	//Init the array in order
	for (uint8_t i = 0; i < MAX_SOUND_FILE_COUNT; i++){
		queue[i] = (i + 1);
	}

	if (file_count == 0){
		return;
	}
	else if (file_count > MAX_SOUND_FILE_COUNT){
		file_count = MAX_SOUND_FILE_COUNT;
	}

	// Start from the last element and swap one by one. We don't
	// need to run for the first element that's why i > 0
	for (uint8_t i = file_count - 1; i > 0; i--){
		// Pick a random index from 0 to i
		uint8_t j = random() % (i + 1);

		// Swap arr[i] with the element at random index
		uint8_t temp = queue[i];
		queue[i] = queue[j];
		queue[j] = temp;
	}

	currentFileIndex = 0;
}

//This should not be called more than once every 50ms or so.  Calling it from the 1Hz update in state.cpp is fine.
void music_poll(){
	//Clear out and ignore any waiting messages from the input buffer.
	while (dfplayermini_poll());

	if (playbackState == SOUND_STATE_PLAY && (PINF & _BV(PINF1))){		//If we are supposed to be playing, but PINF1 has gone high (meaning the last song is finished), we go to the next one.
		dfplayermini_send_command(DFPLAYER_COMMAND_FOLDER_SET, (current_folder << 8) + queue[currentFileIndex]);

		//Increment the file pointer for next time.
		currentFileIndex++;
		if (currentFileIndex >= current_file_count){
			currentFileIndex = 0;
		}
	}
}

void music_set_volume(int8_t volume){
	if (volume < 1){
		volume = 1;
	}
	else if (volume > 30){
		volume = 30;
	}
	dfplayermini_send_command(DFPLAYER_COMMAND_VOL_SET, volume);
}

void music_start(uint8_t folder, uint8_t file_count){
	current_folder = folder;
	current_file_count = file_count;

	music_shuffle_queue(file_count);
	playbackState = SOUND_STATE_PLAY;
}

void music_stop(){
	dfplayermini_send_command(DFPLAYER_COMMAND_PAUSE);
	playbackState = SOUND_STATE_STOP;
}

void music_toggle(uint8_t folder, uint8_t file_count){
	if (playbackState == SOUND_STATE_PLAY){
		music_stop();
	}
	else {
		music_start(folder, file_count);
	}
}

uint8_t music_is_playing(){
	return playbackState == SOUND_STATE_PLAY;
}

ISR(USART1_RX_vect){
	if (serialAVR != NULL){
		serialAVR->isr();
	}
}
