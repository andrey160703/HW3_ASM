	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	expSin
	.type	expSin, @function
expSin:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 24
	.cfi_offset 3, -24
	movsd	QWORD PTR -24[rbp], xmm0
	pxor	xmm2, xmm2
	cvtsd2ss	xmm2, QWORD PTR -24[rbp]
	movd	eax, xmm2
	movd	xmm0, eax
	call	expf@PLT
	movd	ebx, xmm0
	pxor	xmm0, xmm0
	cvtsd2ss	xmm0, QWORD PTR -24[rbp]
	movss	xmm1, DWORD PTR .LC0[rip]
	xorps	xmm0, xmm1
	movd	eax, xmm0
	movd	xmm0, eax
	call	expf@PLT
	movaps	xmm1, xmm0
	movd	xmm0, ebx
	subss	xmm0, xmm1
	movss	xmm1, DWORD PTR .LC1[rip]
	divss	xmm0, xmm1
	cvtss2sd	xmm0, xmm0
	movq	rax, xmm0
	movq	xmm0, rax
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	expSin, .-expSin
	.globl	is_good
	.type	is_good, @function
is_good:
.LFB1:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	QWORD PTR -16[rbp], xmm1
	movsd	xmm0, QWORD PTR -16[rbp]
	comisd	xmm0, QWORD PTR -8[rbp]
	jbe	.L8
	movsd	xmm0, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	divsd	xmm1, QWORD PTR -16[rbp]
	movsd	xmm0, QWORD PTR .LC2[rip]
	comisd	xmm0, xmm1
	seta	al
	jmp	.L6
.L8:
	movsd	xmm0, QWORD PTR -16[rbp]
	movapd	xmm1, xmm0
	divsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC2[rip]
	comisd	xmm0, xmm1
	seta	al
.L6:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	is_good, .-is_good
	.globl	mySin
	.type	mySin, @function
mySin:
.LFB2:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	movsd	QWORD PTR -56[rbp], xmm0
	#double result = x;
	movsd	xmm0, QWORD PTR -56[rbp]
	movsd	QWORD PTR -32[rbp], xmm0
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rax
	call	expSin
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
	#double myX = x;
	movsd	xmm0, QWORD PTR -56[rbp]
	movsd	QWORD PTR -24[rbp], xmm0
	double fact = 1;
	movsd	xmm0, QWORD PTR .LC3[rip]
	movsd	QWORD PTR -16[rbp], xmm0
	mov	DWORD PTR -36[rbp], 1
	jmp	.L10
.L11:
	movsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -56[rbp]
	movsd	xmm1, QWORD PTR -56[rbp]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	add	DWORD PTR -36[rbp], 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -36[rbp]
	movsd	xmm1, QWORD PTR -16[rbp]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	add	DWORD PTR -36[rbp], 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -36[rbp]
	movsd	xmm1, QWORD PTR -16[rbp]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	divsd	xmm0, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR -32[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0
.L10:
	movsd	xmm0, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	is_good
	test	al, al
	jne	.L11
	movsd	xmm0, QWORD PTR -32[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	mySin, .-mySin
	.globl	diff
	.type	diff, @function
diff:
.LFB3:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	QWORD PTR -16[rbp], xmm1
	movsd	xmm0, QWORD PTR -16[rbp]
	comisd	xmm0, QWORD PTR -8[rbp]
	jbe	.L18
	movsd	xmm0, QWORD PTR -8[rbp]
	divsd	xmm0, QWORD PTR -16[rbp]
	jmp	.L16
.L18:
	movsd	xmm0, QWORD PTR -16[rbp]
	divsd	xmm0, QWORD PTR -8[rbp]
.L16:
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	diff, .-diff
	.section	.rodata
.LC4:
	.string	"%lf"
.LC5:
	.string	"ExpSin: "
.LC6:
	.string	"%.5f\n"
.LC7:
	.string	"%.5f\n\n"
.LC8:
	.string	"Difference: "
.LC9:
	.string	"%.5f"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, -24[rbp]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	rax, QWORD PTR -24[rbp] #x
	movq	xmm0, rax
	call	mySin
	movq	rax, xmm0
	mov	QWORD PTR -16[rbp], rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -24[rbp] #x
	movq	xmm0, rax
	call	expSin
	movq	rax, xmm0
	movq	xmm0, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp] #ans
	movq	xmm0, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	lea	rax, .LC8[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -24[rbp] #x
	movq	xmm0, rax
	call	expSin
	movq	rdx, xmm0
	mov	rax, QWORD PTR -16[rbp] #ans
	movq	xmm1, rdx
	movq	xmm0, rax
	call	diff
	movq	rax, xmm0
	movq	xmm0, rax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.section	.rodata
	.align 16
.LC0:
	.long	-2147483648
	.long	0
	.long	0
	.long	0
	.align 4
.LC1:
	.long	1073741824
	.align 8
.LC2:
	.long	-652835029
	.long	1072691150
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4: