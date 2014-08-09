TITLE Matthew Hinton Assembly Program (hellofancy.asm)
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
    getNum1 BYTE "Enter first integer: ", 0
    getNum2 BYTE "and another number ", 0
    num1 SDWORD ?
    num2 SDWORD ?
    errorMsg BYTE "Cannot divide by zero", 0
    
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
    
    mov eax, black + (red * 16)           ;Sets red blackground with black text
    call SetTextColor
    mov edx, OFFSET byteCount           ;Displays the users name.
    call WriteString
    
    mov eax, white + (black * 16)        ;Sets back black background with white text
    call SetTextColor
    mov edx, OFFSET punctionation       ;Adds a ! at the end of the string.
    call WriteString
    
    mov edx, OFFSET getNum1             ;Prompts user for first integer
    call WriteString
    call ReadInt
    mov num1, eax                              ;Gets and stores num1
    
    mov edx, OFFSET getNum2             ;Prompts user for second integer
    call WriteString
    call ReadInt
    mov num2, eax                              ;Gets and stores num2
    
    mov eax, num1
    mov ebx, num2
    call twoInts
    
    
	exit
main ENDP

;----------------------------------------------------
twoInts PROC
;Procedure takes two integers and prints the
; sum product, difference, and quotient
;Receives: two ints in EAX and EBX
;Returns: nothing
;----------------------------------------------------
    add eax, ebx        ;Adds two ints, displays them
    call WriteInt
    sub eax, ebx
    
    sub eax, ebx        ;Subs two ints, displays them
    call WriteInt
    add eax, ebx
    
    mul eax, ebx        ;Multiplies two ints, displays them
    call WriteInt
    div eax, ebx
    
    cmp ebx, 0
    jz L1
    div eax, ebx        ;Divides two ints, displays them
    call WriteInt 
    jmp L2
    
    L1:
        mov edx, errorMsg
        call WriteString
    L2:

    ret
twoInts ENDP
END main