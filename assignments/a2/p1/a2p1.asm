; $1 $2 hold 32-bit integers(in 2's complement)
; $3 is the max($1,$2)
; $4 is the temp register we used
slt $4, $1, $2
add $3, $0, $1
beq $0, $4, end
add $3, $0, $2
end: jr $31
