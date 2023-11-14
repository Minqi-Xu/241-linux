; $1 holds the possition of the starting elememt of arr
; $2 holds the length of the arr
; we will modify $3 into max(arr[])
; $4 is the temp rejister that will be set to -1
; $5 is also the temp rejister to control the end of the loop
; $6 is the temp rejister which will be set to 4
; $7 will be set to calculate the address of the element in arr and stores that element
; $8 is the temp rejister to be the result of comparing the elements in ar
add $5, $2, $0
lis $4
.word -1
lis $6
.word 4
add $5, $5, $4
mult $6, $5
mflo $7
add $7, $7, $1
lw $3, 0($7)  ;set $3 be the last element in arr before the loop
loop:
	add $5, $5, $4
	mult $6, $5
	mflo $7
	add $7, $7, $1
	lw $7, 0($7)   ;let $7 be the previous element in the arr
	slt $8, $7, $3   ;compare the new element with the present largest
	bne $8, $0, 1	
	add $3, $7, $0	;if $7 > $3, overwrite $3, if not, nothing happend
	bne $5, $0, loop   ;doing the loop until we reach the first element
jr $31
