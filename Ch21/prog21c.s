
	.section	.rodata
	.align	2
.LC0:
	.ascii	"hello world\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r0, .L3
	bl	puts
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp!, {fp, pc}
.L4:
	.align	2
.L3:
	.word	.LC0
