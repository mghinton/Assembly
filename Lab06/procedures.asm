TITLE Matthew Hinton's Assembly Program (procedures.asm)
;Description: Program that works with the stack
;
; Matthew Hinton
; 100144139
; CPSC 2180 2010 Spring
; Dr. Ardeshir Bagheri
;
; Revision date: March 9, 2010
.686
.MODEL FLAT, STDCALL
.STACK
INCLUDE c:\Irvine\Irvine32.inc
.DATA

;Variables for addTwo procedure.
	addTwoOne DWORD 5
	addTwoTwo DWORD 3
	
;Variable for addset procedure.
	addSetOne DWORD 8
	
;Variable for sumArray procedure.
	arr DWORD 3, 5, 6, 2, 12, 4, 3, 8, 4, 5, 14
	
.CODE
main PROC

;Using addTwo procedure.
	push addTwoOne
	push addTwoTwo
	call addTwo
	
;Using addSet procedure.
	push addSetOne
	call addSet
	
;Using sumArray procedure.
	push OFFSET arr
	push SIZEOF arr
	call sumArray
	
;Using mySort procedure.
	push OFFSET arr
	push SIZEOF arr
	call mySort
	
	exit
main ENDP

;-------------------------------------------
PROC addTwo
; Takes two 32-bit arguments
; adds them are places sum into eax
;-------------------------------------------
	push ebp
	mov ebp, esp
	mov eax, [ebp + 12]				;Second number
	add ebx, [ebp + 8]				;First number
	pop ebp
	ret 8
addTwo ENDP
	
;-------------------------------------------
PROC addSet
; Single 32-bit argument
; Adds two local variable to argument, stores in eax
;-------------------------------------------
	push ebp
	mov ebp, esp
	sub esp, 8						;Creates local variables.
	mov DWORD PTR [ebp - 4], 6
	mov DWORD PTR [ebp - 8], 4
	
	mov eax, [ebp + 12]				;Moves passed argument to eax.
	add eax, [ebp - 4]				;Adds first local to eax.
	add eax, [ebp - 8]				;Adds second local to eax.
	mov esp, ebp					;removes local variables from stack.
	pop ebp
	ret	4
addSet ENDP
	
;-------------------------------------------
PROC sumArray
; Takes address of an array, and number of arguments in array
; Sums the array and places the sum into eax
;-------------------------------------------
	push ebp
	mov ebp, esp
	pop ecx							;Pops the length of the array to the counter.
	pop esi							;Pops the starting address of array to esi.
	
	L1:
		add eax, [esi]				;Sums the contents of the array, stores in eax
		add esi, TYPE esi
		loop L1
	ret	8
sumArray ENDP
	
;-------------------------------------------
PROC mySort
; Takes starting address of an array and its length
; Sorts the array with the bubble sort method.
;-------------------------------------------
	push ebp
	mov ebp, esp
	pop ecx							;Pops the length of the array to the counter.
	pop esi							;Pops the starting address of array to esi.
	
	sub esp, 8
	mov DWORD PTR [ebp - 4], 1
	
	mov eax, ecx
	sub eax, 2
	sub ecx, 2
	L1:
		mov [ebp - 4], 0			;Stores 0 into [ebp - 4], 0 is used for "false"
		L2:
			cmp esi, [esi + 4]		;Checks if esi[i] > esi[i + 1]
			JA L3
		L4:
			add esi, TYPE esi		;Increment esi
			loop L2
			
		cmp [esi - 4], 1			;Compares [esi - 4] with 1 to see if its "true" 
		JE L1						;and repeats until its false
		jmp L5
			
			
	L3:
		mov ebx, esi				;Moves the value at esi to ebx
		xchg ebx, [esi + 4]			;Swaps ebx with whats at [esi + 4]
		xchg esi, ebx				;Now swaps whats in esi with whats in ebx
		mov [esi - 4], 1			;Sets [esi - 4] to 1, which means "true"
		jmp L4
		
	L5:
	mov esp, ebp					;removes local variables from stack.
	pop ebp
	ret	8
	ENDP
END main