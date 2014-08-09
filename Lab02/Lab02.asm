TITLE Matthew Hinton's First Assembly Language Program (first.asm)
;Description: The traditional first program you write in a language
;
; Matthew Hinton
; 100144139
; CPSC 2180 2010 Spring
; Dr. Ardeshir Bagheri
;
; Revision date: January 12, 2010
.686
.MODEL FLAT, STDCALL
.STACK
INCLUDE Irvine32.inc
.data
myMessage BYTE "Matthew Hinton says, ",22h,"Hello, World!", 22h,0dh,0ah,0
.code
main PROC
	mov	edx, OFFSET myMessage
	call WriteString
	exit
main ENDP
END main 