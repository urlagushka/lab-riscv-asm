.data
    N:
        .word 4
    M:
        .word 2
    matrix:
        .word -1, 1, -2, 2
        .word -3, 3, -4, 4
    result:
        .word 0

.text

main:
    la a2, N
    la a3, M
    la a4, matrix

    call process

    sw a0, result, t0

    la a2, result

    call single_print

    call exit

single_print:
    addi  a0, zero, 1 # print_int ecall
    lw    a1, 0(a2)   # print value
    ecall

    ret

exit:
    addi  a0, zero, 10
    ecall

# INPUT
# a2 - N
# a3 - M
# a4 - matrix
# OUTPUT
# a0 - result
process:
    lw t0, 0(a2) # N
    lw t1, 0(a3) # M

    addi t2, zero, 0 # tmp result

    addi t3, zero, 0 # N offset
    entry_N:
    
        addi t4, zero, 0 # M offset
        entry_M:
            lw t5, 0(a4) # load value from matrix

            ble t5, zero, if_positive # contains positive value
            add t2, t2,   t5          # inc result by matrix value
            if_positive:

            addi a4, a4, 4 # inc matrix ptr
            addi t4, t4, 1 # inc M offset
            
            blt t4, t1, entry_M

        addi t3, t3, 1 # inc N offset

        blt t3, t0, entry_N

    addi a0, t2, 0 # save result to return value

    ret
