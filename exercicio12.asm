
.data
msg1: .asciiz "Digite a altura em centimetros: "
msg2: .asciiz "\nMenor altura: "
msg3: .asciiz "\nMaior altura: "

.text
.globl main
main:
    # Ler a primeira altura
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall

    # Inicializar menor e maior
    move $t0, $v0
    move $t1, $v0

    # Faltam 14 pessoas
    li $t2, 14

ler:
    beq $t2, $zero, mostrar

    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t3, $v0

    # Verificar menor altura
    bge $t3, $t0, verificar_maior
    move $t0, $t3

verificar_maior:
    # Verificar maior altura
    ble $t3, $t1, continuar
    move $t1, $t3

continuar:
    addi $t2, $t2, -1
    j ler

mostrar:
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall
