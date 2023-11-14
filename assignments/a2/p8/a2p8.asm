; $11 is set to be number 1
; $1 is the address of the beginning of the array (will not modify)
; $2 is the length fo the array (will not modify)
; $3 stores the height of the tree, which will be modified
; $4 is set to be number 4
; $5, $6 are two temp variables that stores the height of the left and right subtree respectively
; $7 is a temp variable that uses as a boolean during the comparing
; $8 stores the address of height procedure
; $9 is set to be the address of the end part of the programe
; $10 holds the address of current nodes
; $12 is set to be number -1

lis $11
.word 1
lis $4
.word 4
lis $12
.word -1
lis $9
.word end
add $10, $1, $0
lis $8
.word height	; initializations

height:
sw $5, -4($30)
sw $6, -8($30)
lis $5
.word 8
sub $30, $30, $5	; save previous $5,$6 since we need to use it in the previous height/

lw $5, 4($10)	; let $5 holds the index of current root's left child
lw $6, 8($10)	; let $6 holds the index of current root's right child

bne $5, $12, left	; consider if $5 is -1
bne $6, $12, left	; consider if $6 is -1
basecase:		; basecase: if $5,$6 both are -1(current root is leaf)
  add $3, $11, $0 	; set $3 = 1, and return
  jr $9

left:
  beq $5, $12, right	; if $5 == -1, then skip calculating left child
  mult $5, $4
  mflo $10
  add $10, $1, $10	; $10=$1+($5*4), which stores the address of its left child
  sw $31, -4($30)
  sub $30, $30, $4
  jalr $8		; recursive call
  add $5, $3, $0	; let $5 stores the height of its left child
  add $30, $30, $4
  lw $31, -4($30)
  
 
right:
  beq $6, $12, compare	; if $6 == -1, then skip calculating right child
  mult $6, $4
  mflo $10
  add $10, $1, $10	; $10=$1+($6*4), which stores the address of its right child
  sw $31, -4($30)
  sub $30, $30, $4
  jalr $8		; recursive call
  add $6, $3, $0	; let $6 stores the height of its right child
  add $30, $30, $4
  lw $31, -4($30)

compare:
  slt $7, $5, $6
  beq $7, $0, chooseL	; compare $5, $6, set the larger one to $3
  chooseR: add $3, $6, $11
           jr $9
  chooseL: add $3, $5, $11
           jr $9

end:
lis $5
.word 8
add $30, $30, $5
lw $5, -4($30)
lw $6, -8($30)		; restore $5, $6
jr $31
