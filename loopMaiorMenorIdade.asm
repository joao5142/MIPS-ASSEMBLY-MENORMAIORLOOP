.data 
    pergunta :         .asciiz "Digite sua Idade:"
    msg1:              .asciiz "Voce é menor de idade\n"
    msg2:              .asciiz "Voce é maior de idade\n"
.text
.globl main

main:

li $v0,4            #Prepara o processador para imprimir uma string
la $a0,pergunta     #a0=pergunta
syscall             #Executa
li $v0,5            #Prepara o processador para receber um inteiro
syscall
move $t1,$v0        #t1=v0

#Comparacoes
beq  $t1, $0,sair     #Se for igual a 0 desvia para o bloco sair
blt  $t1, 18,menor    #Se for menor que 18 desvia para o bloco sair
bge  $t1,18,maior     #Se for maior ou igual a 18 desvia para o bloco maior
jal main              #volta para a linha de codigo onde eu criei o bloco main e fica em laço ate digitar 0


menor:
li $v0,4
la $a0,msg1
syscall
jal main             #retorna para o bloco main

maior:
li $v0,4
la $a0,msg2
syscall
jal main             #retorna para o bloco main

sair:
li $v0,10
syscall              #retorna para o bloco main
