; $1 holds the address of the beginning of an array of 32-bit integers
; $2 holds the number of elements in the array
; $4 is the temp variable which is set to 4
; $6 is the temp variable which is set to 64
; $3 is used to calculate the ASCII decimal representation for characters
; $5 is used to keep track on the array
; $7 is set to 0xffff000c
; $8 stores the time the loop goes
; $11 holds the value 1
lis $4
.word 4
add $5, $1, $0
lis $6
.word 64
lis $7
.word 0xffff000c
add $8, $0, $0
lis $11
.word 1		; all above are initializing as the comments stated above
beq $2, $0, end ; judge if the lenght of array is 0, if so, then return
loop:
	lw $3, 0($5)  ; read the present element in array and store in $3
	bne $3, $0, branch  ; judge if the element represents space
	lis $3
	.word 32
	sw $3, 0($7) ; if so, then output a space
	lis $3
	.word loopctrl
	jr $3  ; we jump to the preparation of the next loop
    branch:
	add $3, $3, $6 ; if not, then we calculated the ASCII representation
	sw $3, 0($7) ; and output it
    loopctrl:
	add $5, $4, $5
	add $8, $8, $11
	bne $8, $2, loop
end: add $3, $0, $0 ; set $3 to 0 as the example output shows.
jr $31
