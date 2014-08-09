TITLE Matthew Hinton's First Assembly Language Program (first.asm)
;Description: The traditional first program you write in a language
;
; Matthew Hinton
; 100144139
; CPSC 2180 2010 Spring
; Dr. Ardeshir Bagheri
;
; Revision date: January 12, 2010
INCLUDE Irvine32.inc
.data
data1 BYTE 3, 5, 2, 6, 34, 8, 3, 12, 52, 11
data2 BYTE 10 DUP(?)
data3 BYTE 10 DUP(?)
data4 BYTE 10 DUP(?)
.code
main PROC
bitmask1 = 00010000b
bitmask2 = 11101111b

MOV ESI, OFFSET data1
MOV EDI, OFFSET data2
MOV ECX, LENGTHOF data1
L1:
	AND BYTE PTR [esi], bitmask1
	MOV EDI, ESI
	INC EDI
	INC ESI
	LOOP L1
	
MOV ESI, OFFSET data1
MOV EDI, OFFSET data2
MOV ECX, LENGTHOF data1
L2:
	AND BYTE PTR [esi], bitmask2
	MOV EDI, ESI
	INC EDI
	INC ESI
	LOOP L2
	
	
MOV ESI, OFFSET data1
MOV EDI, OFFSET data3
MOV ECX, LENGTHOF data1
L3:
	OR BYTE PTR [esi], bitmask1
	INC EDI
	INC ESI
	LOOP L3
	
	exit
main ENDP
END main 