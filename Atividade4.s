
MOV R0, #5 @Estabelece n=5
Bl PILHA @Chama a função PILHA

@Casos especiais n=0 ou n=1
CMP R0, #0                  @Compara R0 com o valor 0
BEQ CASOESP                 @Se for igual, chama a função CASOESP
CMP R0, #1                  @Compara R0 com o valor 1
BEQ CASOESP                 @Se for igual, chama a função CASOESP
BNE FATORIAL                @Se não for, chama a função FATORIAL

@Casos especiais
CASOESP:    MOV R2, #1      @Coloca o valor 1 em R@, porque 0!=1!=1
            B FIM           @Caham a função FIM

@Cálculo recursivo de n!
FATORIAL:   SUB R0, R0, #1  @Subtrai 1 do valor de R0
            Bl PILHA        @Chama a função PILHA
            Bl LOADR3       @Chama a função LOADR3
            CMP R0, #0      @Compara R0 com o valor 0
            BEQ FIM         @Se for igual, finaliza o programa
            MUL R2, R3, R0  @Se não for, multiplica n por n-1
            Bl SOMA         @Chama a função SOMA

@Salva o valor que está em R2 na pilha
SOMA:       add sp, sp, #8  @Pula duas linhas na pilha
            str R2, [sp]    @Salva R2 no endereço de sp
            B FATORIAL      @Chama a função FATORIAL

@Carrega em R3 o valor que está na pilha
LOADR3:     add sp, sp, #-4 @Volta uma linha na pilha
            ldr R3, [sp]    @Carrega o valor do que está no endereço de sp em R3
            Bx lr           @Sai da subrotina

@Salva o valor que está em R0 na pilha
PILHA:      add sp, sp, #4  @Vai para a próxima linha da pilha
            str R0, [sp]    @Salva R0 no endereço de sp
            Bx lr           @Sai da subrotina

FIM: SWI 0x11               @Interrupção programada para finalizar o programa fonte