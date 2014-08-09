
#include <iostream>
#include <math.h>
#include <fstream>
#include <string>
using namespace std;

void writeC(string msgPTR[], int len)
{
     int i
	 for(i = len; i < len; i++)
		 cout << msgPTR[i];
	 cout << "\n";

	 output(msgPTR, len);
}


/**
Function is used to print the output of the calculator to an output file.
*/
void output(string arr[], int len){
    ofstream out;
    int i;
    
    out.open("calclogfile.txt");
    if(!out.good()){
        cout << "File cannot be written";
        out.close();
        exit(0);
    }
    
    for(i = 0; i < len; i++){
            out << arr[i] << endl;
    }
        out << endl;
}
