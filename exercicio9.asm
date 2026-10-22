
.data
msg1: .asciiz "Digite o primeiro numero: "
msg2: .asciiz "Digite o segundo numero (diferente de zero): "
msg3: .asciiz "Quociente inteiro: "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

ler_segundo:
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Se B == 0, solicitar novamente
    beq $t1, $zero, ler_segundo

    div $t0, $t1
    mflo $t2

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
