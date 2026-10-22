
.data
msg1: .asciiz "Digite um numero: "
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

    # Se for zero ou positivo, dobrar
    blt $t0, $zero, negativo

    mul $t1, $t0, 2
    j mostrar

negativo:
    # Se for negativo, triplicar
    mul $t1, $t0, 3

mostrar:
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall
