; $1, $2 hold 32-bit integers(unsigned int notation)
; we will modify $3 to be max($1, $2)
; $4 is the register we will use
sltu $4, $1, $2
add $3, $0, $1
beq $4, $0, end
add $3, $0, $2
end: jr $31
