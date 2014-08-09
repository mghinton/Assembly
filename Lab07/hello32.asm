TITLE Matthew Hinton Assembly Program (hello32.asm)
;Description: The traditional first program you write in a language
;
; Matthew Hinton
; 100144139
; CPSC 2180 2010 Spring
; Dr. Ardeshir Bagheri
;
; Revision date: March 16, 2010
.686
.MODEL FLAT, STDCALL
.STACK
INCLUDE c:\Irvine\Irvine32.inc
.data
    welcome BYTE "Hello, World!"
    namePrompt BYTE "Whats your name?"
    hello BYTE "Hello, ", 0
    punctionation BYTE "!", 0
    buffer BYTE 21 dup(0)
    byteCount DWORD ?
    
.code
main PROC
    call Clrscr              ;Clears screen
    
    mov dh, 0              ;Moves cursor to top left corner
    mov dl, 0
    call Gotoxy
    
	mov edx, OFFSET welcome             ;Displays Welcome message.
    call WriteString
    
    mov edx, OFFSET namePrompt        ;Prompts the user for their name.
    call WriteString
    
    mov edx, OFFSET buffer                  ;Gets the users name.
    mov ecx, SIZEOF buffer
    call ReadString
    mov byteCount, eax
    
    mov edx, OFFSET hello                   ;Displays "Hello, ".
    call WriteString
    mov edx, OFFSET byteCount           ;Displays the users name.
    call WriteString
    mov edx, OFFSET punctionation       ;Adds a ! at the end of the string.
    call WriteString
    
	exit
main ENDP
END main