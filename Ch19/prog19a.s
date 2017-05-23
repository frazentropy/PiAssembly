/*
	Printing a string using libc
	entry requirements change
	and string must end with 0
	when using printf function
*/

	.global main
	.func main

.text
main:
	STMFD SP!, {LR}				@ "Store Multiple Full Descending"--save LR
	LDR R0, =string				@ R0 points to string
	BL printf					@ Call libc
	LDMFD SP!, {PC}				@ restore PC

_exit:
	MOV PC, LR					@ simple exit

.data
string:
	.asciz "Hello World String\n"
