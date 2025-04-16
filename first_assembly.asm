#void main(){
#	int a = getChar();   $t0 = a
#	int b = getChar();   $t1 = b
#	int c = a + b;	     $t2 = c
#	printf(("%d", c);
#} 

.data

.text
	.global main
main:					#void main(){
	li $v0, 5			#le um inteiro
	syscall 			#
	move $t0, $v0			#int a = getChar()
	
	li $v0, 5			#le outro inteiro
	syscall
	
	move $t1, $v0			#int b = getChar()
	add $t2, $t0, $t1		#c = a + b
	move $a0, $t2			#$a0 = c
	li $v0, 1			# imprime $a0
	syscall
	
	li $v0, 10			#
	syscall				#
