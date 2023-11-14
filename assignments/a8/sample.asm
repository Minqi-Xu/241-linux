; some initial settings
.import print
lis $10
.word print
lis $4
.word 4
lis $11
.word 1
; generator reach the main function
sub $29, $30, $4
sw $1, -4($30)
sub $30, $30, $4
sw $2, -4($30)
sub $30, $30, $4
lis $3
.word 0
sw $3, -8($29)
sub $30, $30, $4
loop0:
lis $3
.word 1
sw $3, -4($30)
sub $30, $30, $4
lw $3, -8($29)
add $30, $30, $4
lw $5, -4($30)
slt $3, $3, $5
sub $3, $11, $3
beq $3, $0, endWhile0
sw $1, -4($30)
sub $30, $30, $4
lw $3, -8($29)
add $1, $3, $0
sw $31, -4($30)
sub $30, $30, $4
lis $5
.word print
jalr $5
add $30, $30, $4
lw $31, -4($30)
add $30, $30, $4
lw $1, -4($30)
lw $3, -8($29)
sw $3, -4($30)
sub $30, $30, $4
lis $3
.word 1
add $30, $30, $4
lw $5, -4($30)
add $3, $5, $3
sw $3, -8($29)
beq $0, $0, loop0
endWhile0:
lw $3, -8($29)
; begin epilogue
add $30, $30, $4
add $30, $30, $4
add $30, $30, $4
jr $31
