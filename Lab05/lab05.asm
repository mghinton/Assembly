TITLE Matthew Hinton's Assembly Program (lab05.asm)
;Description: Using Jump and Conditional Jumps
;
; Matthew Hinton
; 100144139
; CPSC 2180 2010 Spring
; Dr. Ardeshir Bagheri
;
; Revision date: March 2, 2010
.686
.MODEL FLAT, STDCALL
.STACK
INCLUDE c:\Irvine\Irvine32.inc

.data
data BYTE "This is our lab five"
lenData = ($ - data)
products BYTE "This is still our lab"
lenProduct = ($ - products) - 1

.code
main PROC

	mov ecx, lenData
	mov ebx, OFFSET (data + 1)
	mov eax, OFFSET data
	L1:
		cmp eax, 00000010b				;Checks if the 2nd bit is set
		jz L8
	L2:	
		cmp eax, ebx					;Compares byte to following byte
		jg L5
	L3: 
		cmp eax, 0x57
		jl L7							;Jumps if the byte is smaller then 0x57
	L4:	
		inc eax							;Increments eax to point to next byte
		loop  L1
		jmp L8							;Once the loop finishes it will jump to the very bottom
	L6: 
		sub, eax, ebx					;Subtracts following byte from byte
		inc ebx
		jmp L3
	L7:									;Suppose to shift half of the previous byte into this byte
		mov edx, OFFSET 
		jmp L4
	L8:
		
	mov eax, OFFSET data
	mov ebx, OFFSET products
	mov ecx, lenData
	next = 1
	place = 0
	Label1:
			mul eax, [eax + next]		;Multiplies the byte by the next byte
			mov [ebx + place], eax		;Moves the product into array products
			inc eax						;Points to next byte in data
			inc place					;Increment section to store in products
			jmp Label1
			
	mov eax, OFFSET products
	mov ecx, lenProduct
	divisor = 8
	Label2:
			div eax, divisor			;divides byte by 8
			inc eax						;Points to next byte
			loop Label2
	exit
main ENDP
END main