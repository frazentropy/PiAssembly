/*
	Using ORR to toggle character case
*/

	.global _start

.text
_start:

_read:
	MOV R7, #3				@ read syscall
	MOV R0, #0				@ stdin is keyboard
	MOV R2, #1				@ read one character only
	LDR R1, =string			@ string at string:
	SWI 0

_togglecase:
	LDR R1, =string			@ address of char
	LDR R0, [R1]			@ load char from R1 into R0
	EOR R0, R0, #0x20		@ toggle bit to add or subtract 32 from ASCII value
	STR R0, [R1]			@ write char back to address in R0
	
_write:
	MOV R7, #4				@ write syscall
	MOV R0, #1				@ stdout is monitor
	MOV R2, #2				@ string has 2 chars
	LDR R1, =string			@ string at string:
	SWI 0
	
_exit:
	MOV R7, #1				@ exit syscall
	SWI 0
.data
string:	.ascii " \n"
