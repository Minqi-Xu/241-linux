; print prints a integer in register 1 in base 10
; Registers:
; 	$1 holds a 32-bit integer(2's complement) which will change during the calculate
;	 $3 is the temp variable
;	 $30 holds the "stack" pointer for the remainders
;	 $4 is initialed to be 0 and count the time of loop (number of digit in base 10)
;	 $10 holds 10
;	 $11 holds 0xffff000c
;	 $5 holds the number 4
;	 $6 is used to calculate the ASCII represention for the digit
print:
sw $1, -4($30)
sw $3, -8($30)
sw $4, -12($30)
sw $5, -16($30)
sw $6, -20($30)
sw $10, -24($30)
sw $11, -28($30)	; saving previous values
lis $10
.word 28
sub $30, $30, $10

lis $10
.word 10
lis $11
.word 0xffff000c
add $4, $0, $0
lis $5
.word 4	; initializing as stated above

bne $1, $0, branch	; consider if the number is 0
lis $3
.word 48
sw $3, 0($11)	; if so, then output 0
lis $3
.word end
jr $3	; jump to the end part of the procedure

branch:
slt $3, $1, $0	; if not, then consider if it's less than 0
beq $3, $0, calculate
lis $3
.word 45
sw $3, 0($11)	; if so, print a '-'
sub $1, $0, $1	; and let it becomes its absolute value

calculate:	; the loop called calculate
	div $1, $10	; let itself devided by 10
	mflo $1
	mfhi $6
	lis $3
	.word 48
	add $6, $6, $3	; store the ASCII representation of the remainder
	sw $6, -4($30)
	sub $30, $30, $5	; change the pointer to let us know where it is
	lis $3
	.word 1
	add $4, $4, $3	; add one to the digit counter
	bne $1, $0, calculate

output:
	add $30, $30, $5
	lw $6, -4($30)
	sw $6, 0($11)	; since output in the inverse order, we start poping it
	sub $4, $4, $3
	bne $4, $0, output

end:
lis $6
.word 10
sw $6, 0($11)	; print the new line character
lis $10
.word 28
add $30, $30, $10
lw $1, -4($30)
lw $3, -8($30)
lw $4, -12($30)
lw $5, -16($30)
lw $6, -20($30)
lw $10, -24($30)
lw $11, -28($30)	; restore original values
jr $31	; return to caller
