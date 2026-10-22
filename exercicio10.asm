
.data
msg1: .asciiz "Digite o primeiro numero positivo: "
msg2: .asciiz "Digite o segundo numero positivo: "
msg3: .asciiz "Resto da divisao: "

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

    # Garantir que o maior seja o dividendo
    bge $t0, $t1, calcular

    # Trocar os valores
    move $t2, $t0
    move $t0, $t1
    move $t1, $t2

calcular:
    # Quociente = maior / menor
    div $t0, $t1
    mflo $t2

    # Produto = quociente * menor
    mul $t3, $t2, $t1

    # Resto = maior - produto
    sub $t4, $t0, $t3

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall
