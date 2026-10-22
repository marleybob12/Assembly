
.data
msg1: .asciiz "Digite um numero inteiro: "
msg2: .asciiz "Resultado: "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 2
    div $t0, $t1
    mfhi $t2

    # Resto zero significa par
    beq $t2, $zero, par

    # Impar: somar 8
    addi $t0, $t0, 8
    j mostrar

par:
    # Par: somar 5
    addi $t0, $t0, 5

mostrar:
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall
