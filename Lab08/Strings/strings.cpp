#include <stdio.h>

extern "C"{
	int asminsert(char* location, char value);
	int asmreplace(char* target, int target1, char* source, int source1, int index);
}
int main(){
	char* sentence = "Rain in spain stays mainly on the Plain.\0";
	char* alt = "Complied code";

	printf( "%s\n", sentence);
	//Prints: Rain in spain stays mainly on the Plain.

	asminsert( sentence[8], 'S');
	printf( "%s\n", sentence);
	//Prints: Rain in Spain stays mainly on the Plain.

	asmreplace( sentence, 41, alt, 13, 0);
	printf( "%s\n", sentence);
	//Prints: Compiled code stays mainly on the Plain.
}