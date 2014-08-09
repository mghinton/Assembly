TITLE Matthew Hinton Assembly Program (externFns.asm)
;Description: External functions for strings.cpp
;
; Matthew Hinton
; 100144139
; CPSC 2180 2010 Spring
; Dr. Ardeshir Bagheri
;
; Revision date: March 30, 2010
.386
.MODEL flat, C
    
.code

;------------------------------------------
asminsert PROC setence:PTR BYTE, char: PTR BYTE
; 
;Program replaces the character in a setence with
;a given character
;------------------------------------------
	mov eax, setence
	mov [eax], char
	ret
asminsert ENDP

;------------------------------------------
asmreplace PROC	target:PTR BYTE, lengthT:DWORD, source:PTR BYTE, lengthS:DWORD, index:DWORD
; 
;Program replaces a section of a string with
;a given string
;------------------------------------------
	push eax
	mov eax, lengthT
	cmp eax, lengthS		;Checks if string is long enough to hold new string
	ja next
	
	mov ecx, lengthS
L1:
	mov target[index], source[index]
	inc index
	loop L1
next:
	pop eax
	ret
asmreplace ENDP
END