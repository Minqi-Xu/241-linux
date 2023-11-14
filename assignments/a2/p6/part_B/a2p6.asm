; $1 holding the address of the beginning of the array of 32-bit ints
; $2 holding the number of elements in the array
; $3 tracks the address of the elements in array
; $4 stores the number 4
; $5 counts the number of loop (and is at which number of elements in array)
; $6 is the temp variable
; $7 is the temp variable which is used to save previous value of $1
; $11 stores the number 1
beq $2, $0, endd	; consider if the length of arr is 0, if so, return

add $3, $1, $0
lis $4
.word 4
add $5, $0, $0
lis $11
.word 1	;initialize the rejisters

loop:
	lw $6, 0($3)	;load the present element into $6
	add $3, $3, $4
	add $5, $5, $11	; counter and present address pointer both increase
	add $7, $1, $0	; save the original $1
	add $1, $6, $0	; modify the $1 to be the element that we want to print to make print work

	sw $31, -4($30)
	lis $31
	.word 4
	sub $30, $30, $31

	lis $6
	.word print
	jalr $6	; do the recursion
	
	lis $31
	.word 4
	add $30, $30, $31
	lw $31, -4($30)	; restore the original $31
	
	add $1, $7, $0	; restore the original $1
	bne $5, $2, loop

endd:
jr $31
