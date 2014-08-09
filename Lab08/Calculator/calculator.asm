TITLE Matthew Hinton Assembly Program (externFns.asm)
;Description: The traditional first program you write in a language
;
; Matthew Hinton
; 100144139
; CPSC 2180 2010 Spring
; Dr. Ardeshir Bagheri
;
; Revision date: April 6, 2010
.386
.MODEL flat

writeC PROTO, C

.data
	promptMsg BYTE "Calculator V1.0", 0, 0Dh, 0Ah, "Written by Matthew Hinton", 0
	inMsg BYTE "-> ", 0
	outMsg BYTE "<- ", 0
	fnLength DWORD ($- outMsg)
	errorMsg BYTE "ERROR", 0
	errLength DWORD ($ - errorMsg)
	input BYTE 5 dup(?)
	inLength DWORD ($ - input)
	
.code
main PROC
	mov edx, OFFSET promptMsg
	call WriteString
L1:
	mov edx, inMsg
	call WriteString
	call ReadString
	mov input, eax
	cmp input[0], 'q'
	je quit

;Section determies if the opperation is addition.
L2:
	cmp input[2], '+'
	jne L3							;Jumps to next section if operation isn't '+'.
	mov al, input[0]
	miov bl, input[length-1]
	call addP
	jmp L6
	
;Section determines if the operation is subtraction.
L3:
	cmp input[2], '-'
	jne L4							;Jumps to next section if operation isn't '-'.
	mov al, input[0]
	miov bl, input[length-1]
	call subP
	jmp L6
	
;Section determines if the operation is multiplication.
L4:
	cmp input[2], '*'
	jne L5							;Jumps to next section if operation isn't '*'.
	mov al, input[0]
	miov bl, input[length-1]
	call mulP
	jmp L6
	
;Section determines if the operation is division.
L5:
	cmp input[2], '/'
	jne error						;Jumps to next section if operation isn't valid.
	mov al, input[0]
	miov bl, input[length-1]
	call divP
	jmp L6
	
error:
	push PTR errorMsg
	push errLength
	call WriteC
	add esp, 8
	
;Program keeps looping until an input with 'q' is given.
L6:
	jmp L1
	
quit:
	exit
main ENDP

;-------------------------------------
addP PROC
; Program takes two ascii numbers 
; Receives: ascii numbers in AL, and BL
; Returns: NA
;-------------------------------------
	mov ah, 0
	add al, bl				;Adds two Ascii numbers together
	aaa						;ascii adjusts after addition
	mov edx, outMsg			;Prints "<- "
	call WriteString
	push PTR eax			;Pushs variables for c++ function
	push LENGTHOF eax 
	call WriteC				;Calls WriteC function
	add esp, 8
addP ENDP

;-------------------------------------
subP PROC
; Program takes two ascii numbers
; in AL, and BL
; Returns: NA
;-------------------------------------
	mov ah, 0
	sub al, bl				;Subtracts two Ascii numbers
	aas						;Ascii adjust after subtraction
	mov edx, outMsg			;Prints "<- "
	call WriteString
	push PTR eax			;Pushes variables for c++ function
	push LENGTHOF eax 
	call WriteC				;Calls WriteC function
	add esp, 8
subP ENDP

;-------------------------------------
mulP PROC
; Program takes two ascii numbers
; in AL, and BL
; Returns: NA
;-------------------------------------
	mov ah, 0
	mul al, bl				;Multiplies two Ascii numbers
	aam						;Ascii adjust after multiplication
	mov edx, outMsg			;Prints "<- "
	call WriteString
	push PTR eax			;Pushes variables for c++ function
	push LENGTHOF eax 
	call WriteC				;Calls WriteC function
	add esp, 8
mulP ENDP

;-------------------------------------
divP PROC
; Program takes two ascii numbers
; in AL, and BL
; Returns: NA
;-------------------------------------
	mov ah, 0
	aad						;Ascii adjust before division
	div al, bl				;Divides two ascii numbers
	mov edx, outMsg			;Prints "<- "
	call WriteString
	push PTR eax			;Pushes variables for C++ function
	push LENGTHOF eax 
	call WriteC				;Calls WriteC function
	add esp, 8
divP ENDP
END