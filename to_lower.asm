.text
	.globl main
main:				
	#carrega a string												
	la $s0, str
	
	#imprime
	move $a0, $s0
	li $v0, 4
	syscall 			
	
while:								
	lb $t0, 0($s0)		#carrega o primeiro byte da str			
	beq $t0, $zero, fim	#se for \0 vai para o fim (\0 = ultimo char) else continue
	jal toLower  		#jump and link (cria um #ra para poder voltar), quando a função acaba vai para baixo
	addi $s0, $s0, 1        #p++ (cada caracter tem 1 byte)
	j while			#volta para o while (até o beq ir para o fim.)		
fim:			
	
	#impressão
	la $s0, str
	move $a0, $s0
	li $v0, 4
	syscall 						
		
	#termina o programa																										#
	li $v0, 10						
	syscall								
	
toLower
	bge $t0, 'A', verZ	#analise se está maior que A
	jr  $ra			#vai para $ra (reg com endereço da função que estava antes)		
verZ:					
			
	ble $t0, 'Z', toLow	#analisa se está menor que Z
	jr $ra			#vai para $ra (reg com endereço da função que estava antes)				
toLow:			
			
	subi $t0, $t0, 'A'	# p - a		
	addi $t0, $t0, 'a'	# + a
	sb   $t0, 0($s0)	#salva valor do caracter analisado em $t0
	jr $ra			#vai para $ra (reg com endereço da função que estava antes)	
	
.data
str: .asciiz "\n - IstO eh 1 TEste"

	