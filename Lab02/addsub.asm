TITLE Matthew Hinton's First Assembly Language Program (Lab02.asm)
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
.code
main PROC
	mov	eax, 20500h
	add eax, 30100h
	sub eax, 10200h
	call DumpRegs
	exit
main ENDP
END main