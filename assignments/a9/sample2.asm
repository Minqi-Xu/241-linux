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
sw $1, -4($30)
sub $30, $30, $4
sw $2, -4($30)
sub $30, $30, $4
sw $5, -4($30)
sub $30, $30, $4
sw $6, -4($30)
sub $30, $30, $4
sw $7, -4($30)
sub $30, $30, $4
sw $29, -4($30)
sub $30, $30, $4
sw $31, -4($30)
sub $30, $30, $4
lw $3, 0($29)
sw $3, -4($30)
sub $30, $30, $4
lw $3, -4($29)
sw $3, -4($30)
sub $30, $30, $4
lis $3
.word 20
sw $3, -4($30)
sub $30, $30, $4
lis $5
.word Fthree
jalr $5
add $30, $30, $4
lw $5, -4($30)
add $30, $30, $4
lw $5, -4($30)
add $30, $30, $4
lw $5, -4($30)
add $30, $30, $4
lw $31, -4($30)
add $30, $30, $4
lw $29, -4($30)
add $30, $30, $4
lw $7, -4($30)
add $30, $30, $4
lw $6, -4($30)
add $30, $30, $4
lw $5, -4($30)
add $30, $30, $4
lw $2, -4($30)
add $30, $30, $4
lw $1, -4($30)
; begin epilogue
add $30, $30, $4
add $30, $30, $4
jr $31
Fthree:
sub $29, $30, $4
lw $3, 12($29)
sw $3, -4($30)
sub $30, $30, $4
lw $3, 8($29)
add $30, $30, $4
lw $5, -4($30)
mult $5, $3
mflo $3
sw $3, -4($30)
sub $30, $30, $4
lw $3, 4($29)
add $30, $30, $4
lw $5, -4($30)
add $3, $5, $3
add $30, $29, $4
jr $31
