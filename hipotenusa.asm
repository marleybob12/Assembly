
.data
msg1: .asciiz "Valor do primeiro cateto: "
msg2: .asciiz "Valor do segundo cateto: "
msg3: .asciiz "Hipotenusa: "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Converter os inteiros para float
    mtc1 $t0, $f0
    cvt.s.w $f0, $f0

    mtc1 $t1, $f2
    cvt.s.w $f2, $f2

    # a*a + b*b
    mul.s $f4, $f0, $f0
    mul.s $f6, $f2, $f2
    add.s $f8, $f4, $f6

    # Raiz quadrada
    sqrt.s $f12, $f8

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 2
    syscall

    li $v0, 10
    syscall
