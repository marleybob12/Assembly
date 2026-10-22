
.data
msg1: .asciiz "Horas normais: "
msg2: .asciiz "Horas extras: "
msg3: .asciiz "Desconto em reais: "
msg4: .asciiz "\nSalario bruto: R$ "
msg5: .asciiz "\nSalario liquido: R$ "

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

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    # Salario normal = horas * 10
    li $t3, 10
    mul $t0, $t0, $t3

    # Salario extra = horas extras * 15
    li $t3, 15
    mul $t1, $t1, $t3

    # Bruto = normal + extra
    add $t4, $t0, $t1

    # Liquido = bruto - desconto
    sub $t5, $t4, $t2

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 4
    la $a0, msg5
    syscall
    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 10
    syscall
