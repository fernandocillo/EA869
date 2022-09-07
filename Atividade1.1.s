MOV r0, #0				@estabelece o valor inicial de r0 como 0
MOV r3, #5				@estabelece o valor inicial de r3 como 5
ADD r1, r0, #1 			@r1 será nossa variável auxiliar
ADD r0, r0, r1 			@soma r0 e r1  em r0
LOOP: CMP R1, r3		@loop comparando os valores nos registradores r1 e r3
    BEQ FIM				@se a diferença for 0, a função "FIM" é chamada
    BLT MENOR			@se r1 for menor que r3, a função "MENOR" é chamada
MENOR: ADD R1, R1, #1   @aumenta 1 em r1
    ADD R0, R0, R1 		@soma r1 em  r0
    B LOOP 				@volta para o loop
FIM: SWI 0x11			@estabelece o final do programa
SWI 0x6b 				@printa