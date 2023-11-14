; stirling will modify $3 as the unsigned Stirling numbers of the first kind with parameter $1, $2
; Since given that $1 >= $2, we will not consider the case that $1 < $2 
; Register:
; 	$1 and $2 are two given ints
;	$3 is the result, and will be modified
; 	$11 is set to be number 1
;	$4 is the temp variable
;	$5 stores the address of the end part of the procedure
;	$6 is the temp variable that stores partial result

stirling:
sw $1, -4($30)
sw $2, -8($30)
sw $4, -12($30)
sw $5, -16($30)
sw $6, -20($30)
sw $11, -24($30)
lis $4
.word 24
sub $30, $30, $4	; saving previous values

lis $5
.word end
lis $11
.word 1			; initializing


bne $1, $0, brch1
 bne $2, $0, basecase2
  basecase1: 		; basecase 1: $1=0 and $2=0
    add $3, $11, $0
    jr $5
  basecase2:		; basecase 2: $1=0 and $2!=0
    add $3, $0, $0
    jr $5
brch1:			; branch1: $1!=0
 bne $2, $0, brch2
  basecase3:		; basecase 3: $1!=0 and $2=0
    add $3, $0, $0
    jr $5

  brch2:		; brach2(which is under branch1): $1!=0 and $2!=0
    sub $1, $1, $11	; n--
    lis $4
    .word stirling    

    sw $31, -4($30)	; saving the previous return address
    lis $31
    .word 4
    sub $30, $30, $31
    jalr $4		; recursive call
    mult $3, $1
    mflo $6		; $6 stores the partial result(the first half)
    sub $2, $2, $11	; k--
    jalr $4		; recursive call
    lis $31
    .word 4
    add $30, $30, $31
    lw $31, -4($30)	; restore the original return address
    add $3, $3, $6	; store the final result in $3

    add $1, $1, $11	; n++
    add $2, $2, $11	; k++


end:
lis $4
.word 24
add $30, $30, $4
lw $1, -4($30)
lw $2, -8($30)
lw $4, -12($30)
lw $5, -16($30)
lw $6, -20($30)
lw $11, -24($30)	; restore the original values of rejisters
jr $31
