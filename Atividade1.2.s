MOV R5, #62 	@Insere o valor 62 em r5
MOV R6, #50		@Insere o valor 50 em r6
MOV R7, #62		@Insere o valor 62 em r7
MOV R0, #12 	@Máscara: 1100 --- mantém bits 3 e 4
AND R5, R5, R0 	@Mantém os bits 3 e 4 do R5 e salva-os no r5
MOV R0, #6 		@Máscara: 110 --- seta os bits 2 e 3
ORR R6, R6, R0  @Seta os bits 2 e 3 de R6 e salva-os no r6
MOV R0, #93 	@Máscara: 1011101 --- zera os bits 2 e 6
AND R7, R7, R0  @Zera os bits 2 e 6 de R7 e salva-os no r7
SWI 0x11 		@Finaliza o programa