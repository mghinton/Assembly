TITLE Matthew Hinton's Assembly Program (fibonacci.asm)
;Description: Creates and manipulates the fibonacci sequence
;
; Matthew Hinton
; 100144139
; CPSC 2180 2010 Spring
; Dr. Ardeshir Bagheri
;
; Revision date: Febuary 9, 2010
.686
.MODEL FLAT, STDCALL
.STACK
INCLUDE c:\Irvine\Irvine32.inc
.DATA
twofibs WORD 12 DUP(?)
sums DWORD 12 DUP(?)
subs DWORD ?

.CODE
main PROC
	count = 10
	MOV CX, count
	MOV AX, 0
	MOV BX, 1
	MOV SI, twofibs 
	L1:
		MOV SI, AX
		ADD AX, BX
		MOV AX, BX
		INC SI
		LOOP L1
		
	MOV DI, SI
	INC DI
	L2:
		MOV DI, SI
		DEC SI
		INC DI
		LOOP L2
	
	exit
main ENDP
END main