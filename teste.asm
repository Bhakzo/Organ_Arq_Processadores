.data
	str: .asciiz "tEsTe"

.text 
	.globl main
main:
	la $s0, str

while: 
	lb $t0, 0($s0)			#$t0 recebe 1 byte str
	beq $t0, $zero, fim		#se igual a zero, vai para fim	Else continue
	j toLower
	addi $s0, $s0, 1		#p ++  cada caracter tem 1 byte.
	j while
	
#função toLower
toLower: 
	blt $t0, 'A', fim
	bgt $t0, 'Z' fim
	subi $t0, $t0, 'A'		#p - 'A' 
	addi $t0, $t0, 'a'		# + 'a'
	sb $t0, 0($s0)			# $t0 -> $s0
	jr $ra				#jumpReg  para reg de retorno
	
fim:
	la $s0, str
	move $a0, $s0
	li $v0, 4
	syscall 	
		
				
	la $s0, str
while2: 
	lb $t0, 0($s0)			#$t0 recebe 1 byte str
	beq $t0, $zero, fim		#se igual a zero, vai para fim	Else continue
	move $a0, $t0
	li $v0, 11
	syscall 
	addi $s0, $s0, 1		#p ++  cada caracter tem 1 byte.
	j while2

fim2:
	li $v0, 10			#comando de fim
	syscall