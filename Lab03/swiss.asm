TITLE Matthew Hinton's Assembly Program (Lab03.asm)
;Description: moves a value into EAX, adds another value, and subtracts the third
;
; Matthew Hinton
; 100144139
; CPSC 2180 2010 Spring
; Dr. Ardeshir Bagheri
;
; Revision date: January 19, 2010
.686
.MODEL FLAT, STDCALL
.STACK
INCLUDE c:\Irvine\Irvine32.inc

BITE TYPEDEF BYTE

.DATA

;Ten copies of SOS
	sos BYTE 10 DUP("...---")
	
;Array of the alphabet
	alpha BYTE "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
	
;Array of the ROT13 alphabet
	rot13 BYTE "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"
	
;300 bytes of random data
	random BYTE 300 DUP(?)
	
;Here on changing BYTE to BITE
;Numbers from 1-10 in at most 5 bytes
	oneToTen BITE 00010010b, 00110100b, 01010110b, 01111000b, 10011010b
	
;Numbers from 1-10 stored as four byte integers
	myArr BYTE 01h, 00h, 00h, 00h, 02h, 00h, 00h, 00h, 03h, 00h, 00h, 00h, 04h, 00h, 00h, 00h, 05h, 00h, 00h, 00h, 06h, 00h, 00h, 00h, 07h, 00h, 00h, 00h, 08h, 00h, 00h, 00h, 09h, 00h, 00h, 00h, 0Ah, 00h, 00h, 00h
	
;Location of myArr
	locationArr DWORD OFFSET oneToTen
	
;Size of myArr
	sizeArr BYTE SIZEOF oneToTen

;The type of myArr
	typeArr BYTE TYPE oneToTen
.CODE
main PROC
	MOV EAX, OFFSET myArr		;Storing address of array to EAX
	MOV EBX, SIZEOF myArr		;Storing the size of array to EBX
	MOV ECX, TYPE myArr			;Storing array's type ECX
	exit
main ENDP
END main