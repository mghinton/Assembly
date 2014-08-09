TITLE Matthew Hinton Assembly Program (hello16.asm)
;Description: The traditional first program you write in a language
;
; Matthew Hinton
; 100144139
; CPSC 2180 2010 Spring
; Dr. Ardeshir Bagheri
;
; Revision date: March 16, 2010
.686
.MODEL flat, stdcall
.stack
INCLUDE c:\Irvine\Irvine32.inc
.data
    welcome BYTE "Hello, World!"
    namePrompt BYTE "Whats your name?"
    hello BYTE "Hello, ", 0
    punctionation BYTE "!", 0
    buffer BYTE 21 dup(0)
    byteCount WORD ?
    
.code
main PROC
	    mov ax @data
        mov ds, ax
        call Clrscr
        
        mov dh, 0							;Moves cursor to top left corner
		mov dl, 0
		call Gotoxy
		
		mov dx, OFFSET welcome				;Displays Welcome message.
		call WriteString
	    
		mov dx, OFFSET namePrompt			;Prompts the user for their name.
		call WriteString
		
		mov dx, OFFSET buffer               ;Gets the users name.
		mov cx, SIZEOF buffer
		call ReadString
		mov byteCount, ax
		
		mov dx, OFFSET hello                ;Displays "Hello, ".
		call WriteString
		mov dx, OFFSET byteCount            ;Displays the users name.
		call WriteString
		mov dx, OFFSET punctionation        ;Adds a ! at the end of the string.
		call WriteString
        
        
        mov ah, 4Ch
        int 21h
	exit
main ENDP
END main