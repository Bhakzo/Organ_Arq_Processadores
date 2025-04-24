
#int raiz_quadrada(int x, int i){
 
#    if(i == 0){
#        return 1;
#    }

#    return    ( raiz_quadrada(x, i - 1) + x / raiz_quadrada(x, i - 1) )  / 2; 
    

#}


#int main() {

#   int x;
#    int i;
#   printf("Digite um numero e um indice: ");
#   scanf("%d %d", &x, &i);


 #   //double para mais precisão?
  #  int res = raiz_quadrada(x,i);
   #     printf("raiz quadrada de %d é %d\n", x, res);
    

    #return 0;
#}





.data 
    	x: 	.word 0  	# int x;
    	i: 	.word 0  	# int i;
    	res:	.word 0 	
   	msg: .asciiz "Digite um numero e um indice: "
   	msg2: .asciiz "A resposta é: "

.text
	.global main

	main:				# int main()
		
		
		jal print_msg			# printf("Digite um numero e um indice: ");
		jal read_ints 			# scanf("%d %d", &x, &i);
		 		
		addi 	$sp, $sp, -16 		# aloca espaço na pilha
		sw   	$t0, 4($sp)		#salva x na pilha
		sw	$t1, 8($sp)		#salva i na pilha
		sw	$ra, 0($sp)     	#salva o endereço na pilha
			
		jal raiz_quadrada # a partir daqui melhorar
		
		lw   	$t0, 4($sp)		#recupera x na pilha
		lw	$t1, 8($sp)		#recupera i na pilha
		lw	$ra, 0($sp)     	#recupera o endereço na pilha
		addi	$sp, $sp, 16 		#desaloca espaço da pilha
		sw	$v0, res
		jal	print_msg2
		
	
		j exit	  			#fim do programa
    	
    
    print_msg2:				# printf("O resultado é: "); //melhorar
	
		la 	$a0, msg2
    		li 	$v0, 4
    		syscall
    		
    		la	$a0, res
    		li	$v0, 1
    		syscall
    
    		jr 	$ra     
    		 
	print_msg:				# printf("Digite um numero e um indice: ");
	
		la 	$a0, msg
    		li 	$v0, 4
    		syscall
    		jr 	$ra      
      

	read_ints:			# scanf("%d %d", &x, &i);
	
		li 	$v0, 5          
		syscall
		sw 	$v0, x
	      ##################
		li	$v0, 5
		syscall
		sw 	$v0, i
	      ##################
		lw 	$t0, x
		lw 	$t1, i 
	
		jr 	$ra
    
    	exit:				#fim do programa
	
		li 	$v0, 10
		syscall	
    #############################################################################################################	
	
	raiz_quadrada:  #melhorar apartir daqui
    		
    		lw	$a0, 4($sp)		# recupera x da pilha
    		lw	$a1, 8($sp)		# recupera i da pilha	
    		
    		bne  	$a1, 0, recursão  	# if (i == 0) goto base_case
		li 	$v0, 1             	# return 1;
   		jr	$ra
   		
   	recursão:   
   		# chamada recursiva 1: raiz_quadrada(x, i - 1)
    		
    		addiu 	$a1, $a1, -1
    		addi	$sp, $sp, -16
    		sw	$a1, 8($sp)
    		sw	$a0, 4($sp) 
    		sw	$ra, 0($sp)
    		
    		jal  raiz_quadrada
    		
    		lw   	$a0, 4($sp)		
		lw	$a1, 8($sp)		
		lw	$ra, 0($sp) 
		
    		move 	$t0, $v0          # salva resultado da 1ª chamada em $t0

    		# chamada recursiva 2: precisa restaurar $a0 e $a1

    		addi 	$a1, $a1, -1
    		sw	$a1, 8($sp)
    		sw	$a0, 4($sp) 
    		sw	$ra, 0($sp)
    		
    		jal  	raiz_quadrada
    		
    		lw   	$a0, 4($sp)		
		lw	$a1, 8($sp)		
		lw	$ra, 0($sp) 
		
    		move 	$t1, $v0          # resultado da 2ª chamada em $t1

    		# cálculo: ($t0 + $a0 / $t1) / 2
    		
    		
    		div  	$a0, $t1
    		mflo 	$t2               # t2 = x / raiz_quadrada(x, i-1)
    		add  	$t3, $t0, $t2     # t3 = t0 + t2
    		li   	$t4, 2
    		div  	$t3, $t4
   		mflo 	$v0               # v0 = resultado final
    		addiu 	$sp, $sp, 16
    		jr 	$ra
    		
		
		

	
