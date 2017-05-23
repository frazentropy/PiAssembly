/*
	Reading a number using scanf
	and printing it using printf
*/

	.global main
	.func main
	
	.text
main:
		PUSH {LR}
		SUB SP, SP, #4			@ make space for scanf word on stack
		
		LDR R0, addr_messin		@ get address of message in
		BL printf				@ and print it
		
		LDR R0, addr_format		@ get address of format
		MOV R1, SP				@ place SP in R1
		BL scanf				@ call scanf, store entry on stack
		
		LDR R1, [SP]			@ get addr of scanf input
		LDR R0, addr_messout	@ get address of messageout
		BL printf				@ print it all
		
		ADD SP, SP, #4			@ adjust stack
		POP {PC}

_exit:
	MOV PC, LR					@ simple exit

addr_messin:	.word messagein
addr_format:	.word scanformat
addr_messout:	.word messageout

	.data
messagein:	.asciz "Enter your number: "
scanformat:	.asciz "%d"
messageout:	.asciz "your number was 0x%X\n"
