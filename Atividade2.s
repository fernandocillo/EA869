MOV R1, #6  	@estabelecendo índice n=6 -> resposta deve ser 8
MOV R2, #0  	@variável de contagem
MOV R3, #0  	@fibo n-2
MOV R4, #1  	@fibo n-1
MOV R5, #0  	@variável auxiliar

CASO_ZERO:	CMP R2, R1 	@verifica se R2=R1, ou seja, se n=0
			BEQ FIM		@se sim, vai para "FIM"
			B CASO_UM	@se não, vai para "CASO_UM"

CASO_UM:	ADD R5, R4, R3		@calcula fibo 1
			ADD R2, R2, #1		@soma 1 no contador
			CMP R2, R1			@compara n com com o a variável de contagem
			BEQ FIM				@se for 0, chama "FIM"
			B LOOP 				@se não, chama "LOOP"


LOOP:	ADD R5, R4, R3		@calcula fibo n
		MOV R3, R4			@passa o valor de n-1 para n-2
		MOV R4, R5			@passa fibo n para fibo n-1
		ADD R2, R2, #1			@aumenta 1 na contagem
		CMP R2, R1			@compara a variável de contagem com n
		BEQ FIM			@se for 0, chama a função "FIM"
		B LOOP			@se não for, retorna ao loop

FIM: SWI 0x11			@finaliza o programa