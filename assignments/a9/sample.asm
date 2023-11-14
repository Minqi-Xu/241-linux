; some initial settings
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
add $3, $0, $11
sw $3, -8($29)
sub $30, $30, $4
lis $3
.word -4
add $3, $3, $29
sw $3, -8($29)
lw $3, 0($29)
lw $3, 0($3)
sw $3, -4($30)
sub $30, $30, $4
lis $3
.word 7
add $30, $30, $4
lw $5, -4($30)
mult $5, $3
mflo $3
sw $3, -4($30)
sub $30, $30, $4
lw $3, -8($29)
add $30, $30, $4
lw $5, -4($30)
sw $5, 0($3)
lw $3, -4($29)
; begin epilogue
add $30, $30, $4
add $30, $30, $4
add $30, $30, $4
jr $31
