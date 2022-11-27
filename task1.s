	.file	"task.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.3.0-1ubuntu1~22.04) version 11.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fcf-protection=none -fstack-protector-strong -fstack-clash-protection
	.text
	.globl	expSin
	.type	expSin, @function
expSin:
	push	rbp	#
	mov	rbp, rsp	#,
	push	rbx	#
	sub	rsp, 24	#,
	movsd	QWORD PTR -24[rbp], xmm0	# x, x
# task.c:6:     return (expf(x) - expf(-x)) / 2;
	pxor	xmm2, xmm2	# _1
	cvtsd2ss	xmm2, QWORD PTR -24[rbp]	# _1, x
	movd	eax, xmm2	# _1, _1
	movd	xmm0, eax	#, _1
	call	expf@PLT	#
	movd	ebx, xmm0	# _2,
# task.c:6:     return (expf(x) - expf(-x)) / 2;
	pxor	xmm0, xmm0	# _3
	cvtsd2ss	xmm0, QWORD PTR -24[rbp]	# _3, x
	movss	xmm1, DWORD PTR .LC0[rip]	# tmp91,
	xorps	xmm0, xmm1	# _3, tmp91
	movd	eax, xmm0	# _4, _3
	movd	xmm0, eax	#, _4
	call	expf@PLT	#
	movaps	xmm1, xmm0	# _5,
# task.c:6:     return (expf(x) - expf(-x)) / 2;
	movd	xmm0, ebx	# _2, _2
	subss	xmm0, xmm1	# _2, _5
# task.c:6:     return (expf(x) - expf(-x)) / 2;
	movss	xmm1, DWORD PTR .LC1[rip]	# tmp92,
	divss	xmm0, xmm1	# _7, tmp92
	cvtss2sd	xmm0, xmm0	# _12, _7
	movq	rax, xmm0	# <retval>, _12
# task.c:7: }
	movq	xmm0, rax	#, <retval>
	mov	rbx, QWORD PTR -8[rbp]	#,
	leave
	ret
	.size	expSin, .-expSin
	.globl	is_good
	.type	is_good, @function
is_good:
	push	rbp	#
	mov	rbp, rsp	#,
	movsd	QWORD PTR -8[rbp], xmm0	# x, x
	movsd	QWORD PTR -16[rbp], xmm1	# y, y
# task.c:10:     if (x < y) {
	movsd	xmm0, QWORD PTR -16[rbp]	# tmp86, y
	comisd	xmm0, QWORD PTR -8[rbp]	# tmp86, x
	jbe	.L8	#,
# task.c:11:         return (x / y) < 0.999;
	movsd	xmm0, QWORD PTR -8[rbp]	# tmp87, x
	movapd	xmm1, xmm0	# tmp87, tmp87
	divsd	xmm1, QWORD PTR -16[rbp]	# tmp87, y
# task.c:11:         return (x / y) < 0.999;
	movsd	xmm0, QWORD PTR .LC2[rip]	# tmp88,
	comisd	xmm0, xmm1	# tmp88, _1
	seta	al	#, _3
	jmp	.L6	#
.L8:
# task.c:13:         return (y / x) < 0.999;
	movsd	xmm0, QWORD PTR -16[rbp]	# tmp89, y
	movapd	xmm1, xmm0	# tmp89, tmp89
	divsd	xmm1, QWORD PTR -8[rbp]	# tmp89, x
# task.c:13:         return (y / x) < 0.999;
	movsd	xmm0, QWORD PTR .LC2[rip]	# tmp90,
	comisd	xmm0, xmm1	# tmp90, _2
	seta	al	#, _3
.L6:
# task.c:15: }
	pop	rbp	#
	ret
	.size	is_good, .-is_good
	.globl	mySin
	.type	mySin, @function
mySin:
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 64	#,
	movsd	QWORD PTR -56[rbp], xmm0	# x, x
# task.c:18:     double result = x;
	movsd	xmm0, QWORD PTR -56[rbp]	# tmp89, x
	movsd	QWORD PTR -32[rbp], xmm0	# result, tmp89
# task.c:19:     double sample = expSin(x);
	mov	rax, QWORD PTR -56[rbp]	# tmp90, x
	movq	xmm0, rax	#, tmp90
	call	expSin	#
	movq	rax, xmm0	# tmp91,
	mov	QWORD PTR -8[rbp], rax	# sample, tmp91
# task.c:20:     double myX = x;
	movsd	xmm0, QWORD PTR -56[rbp]	# tmp92, x
	movsd	QWORD PTR -24[rbp], xmm0	# myX, tmp92
# task.c:21:     double fact = 1;
	movsd	xmm0, QWORD PTR .LC3[rip]	# tmp93,
	movsd	QWORD PTR -16[rbp], xmm0	# fact, tmp93
# task.c:22:     int i = 1;
	mov	DWORD PTR -36[rbp], 1	# i,
# task.c:23:     while (is_good(result, sample)) {
	jmp	.L10	#
.L11:
# task.c:24:         myX = myX * x * x;
	movsd	xmm0, QWORD PTR -24[rbp]	# tmp94, myX
	mulsd	xmm0, QWORD PTR -56[rbp]	# _1, x
# task.c:24:         myX = myX * x * x;
	movsd	xmm1, QWORD PTR -56[rbp]	# tmp96, x
	mulsd	xmm0, xmm1	# tmp95, tmp96
	movsd	QWORD PTR -24[rbp], xmm0	# myX, tmp95
# task.c:25:         i++;
	add	DWORD PTR -36[rbp], 1	# i,
# task.c:26:         fact *= i;
	pxor	xmm0, xmm0	# _2
	cvtsi2sd	xmm0, DWORD PTR -36[rbp]	# _2, i
	movsd	xmm1, QWORD PTR -16[rbp]	# tmp98, fact
	mulsd	xmm0, xmm1	# tmp97, tmp98
	movsd	QWORD PTR -16[rbp], xmm0	# fact, tmp97
# task.c:27:         i++;
	add	DWORD PTR -36[rbp], 1	# i,
# task.c:28:         fact *= i;
	pxor	xmm0, xmm0	# _3
	cvtsi2sd	xmm0, DWORD PTR -36[rbp]	# _3, i
	movsd	xmm1, QWORD PTR -16[rbp]	# tmp100, fact
	mulsd	xmm0, xmm1	# tmp99, tmp100
	movsd	QWORD PTR -16[rbp], xmm0	# fact, tmp99
# task.c:29:         result += (myX / fact);
	movsd	xmm0, QWORD PTR -24[rbp]	# tmp101, myX
	divsd	xmm0, QWORD PTR -16[rbp]	# _4, fact
# task.c:29:         result += (myX / fact);
	movsd	xmm1, QWORD PTR -32[rbp]	# tmp103, result
	addsd	xmm0, xmm1	# tmp102, tmp103
	movsd	QWORD PTR -32[rbp], xmm0	# result, tmp102
.L10:
# task.c:23:     while (is_good(result, sample)) {
	movsd	xmm0, QWORD PTR -8[rbp]	# tmp104, sample
	mov	rax, QWORD PTR -32[rbp]	# tmp105, result
	movapd	xmm1, xmm0	#, tmp104
	movq	xmm0, rax	#, tmp105
	call	is_good	#
	test	al, al	# _5
	jne	.L11	#,
# task.c:31:     return result;
	movsd	xmm0, QWORD PTR -32[rbp]	# _20, result
	movq	rax, xmm0	# <retval>, _20
# task.c:32: }
	movq	xmm0, rax	#, <retval>
	leave
	ret
	.size	mySin, .-mySin
	.globl	diff
	.type	diff, @function
diff:
	push	rbp	#
	mov	rbp, rsp	#,
	movsd	QWORD PTR -8[rbp], xmm0	# x, x
	movsd	QWORD PTR -16[rbp], xmm1	# y, y
# task.c:35:     if (x < y) {
	movsd	xmm0, QWORD PTR -16[rbp]	# tmp84, y
	comisd	xmm0, QWORD PTR -8[rbp]	# tmp84, x
	jbe	.L18	#,
# task.c:36:         return (x / y);
	movsd	xmm0, QWORD PTR -8[rbp]	# tmp85, x
	divsd	xmm0, QWORD PTR -16[rbp]	# _1, y
	jmp	.L16	#
.L18:
# task.c:38:         return (y / x);
	movsd	xmm0, QWORD PTR -16[rbp]	# tmp86, y
	divsd	xmm0, QWORD PTR -8[rbp]	# _1, x
.L16:
# task.c:40: }
	movq	rax, xmm0	# <retval>, _1
	movq	xmm0, rax	#, <retval>
	pop	rbp	#
	ret
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
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 32	#,
# task.c:43: {
	mov	rax, QWORD PTR fs:40	# tmp102, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.3443, tmp102
	xor	eax, eax	# tmp102
# task.c:45:     scanf("%lf", &x);
	lea	rax, -24[rbp]	# tmp90,
	mov	rsi, rax	#, tmp90
	lea	rax, .LC4[rip]	# tmp91,
	mov	rdi, rax	#, tmp91
	mov	eax, 0	#,
	call	__isoc99_scanf@PLT	#
# task.c:46:     double ans = mySin(x);
	mov	rax, QWORD PTR -24[rbp]	# x.0_1, x
	movq	xmm0, rax	#, x.0_1
	call	mySin	#
	movq	rax, xmm0	# tmp92,
	mov	QWORD PTR -16[rbp], rax	# ans, tmp92
# task.c:47:     printf("ExpSin: ");
	lea	rax, .LC5[rip]	# tmp93,
	mov	rdi, rax	#, tmp93
	mov	eax, 0	#,
	call	printf@PLT	#
# task.c:48:     printf("%.5f\n", expSin(x));
	mov	rax, QWORD PTR -24[rbp]	# x.1_2, x
	movq	xmm0, rax	#, x.1_2
	call	expSin	#
	movq	rax, xmm0	# _3,
	movq	xmm0, rax	#, _3
	lea	rax, .LC6[rip]	# tmp94,
	mov	rdi, rax	#, tmp94
	mov	eax, 1	#,
	call	printf@PLT	#
# task.c:49:     printf("ExpSin: ");
	lea	rax, .LC5[rip]	# tmp95,
	mov	rdi, rax	#, tmp95
	mov	eax, 0	#,
	call	printf@PLT	#
# task.c:50:     printf("%.5f\n\n", ans);
	mov	rax, QWORD PTR -16[rbp]	# tmp96, ans
	movq	xmm0, rax	#, tmp96
	lea	rax, .LC7[rip]	# tmp97,
	mov	rdi, rax	#, tmp97
	mov	eax, 1	#,
	call	printf@PLT	#
# task.c:51:     printf("Difference: ");
	lea	rax, .LC8[rip]	# tmp98,
	mov	rdi, rax	#, tmp98
	mov	eax, 0	#,
	call	printf@PLT	#
# task.c:52:     printf("%.5f", diff(ans, expSin(x)));
	mov	rax, QWORD PTR -24[rbp]	# x.2_4, x
	movq	xmm0, rax	#, x.2_4
	call	expSin	#
	movq	rdx, xmm0	# _5,
	mov	rax, QWORD PTR -16[rbp]	# tmp99, ans
	movq	xmm1, rdx	#, _5
	movq	xmm0, rax	#, tmp99
	call	diff	#
	movq	rax, xmm0	# _6,
	movq	xmm0, rax	#, _6
	lea	rax, .LC9[rip]	# tmp100,
	mov	rdi, rax	#, tmp100
	mov	eax, 1	#,
	call	printf@PLT	#
	mov	eax, 0	# _21,
# task.c:54: }
	mov	rdx, QWORD PTR -8[rbp]	# tmp103, D.3443
	sub	rdx, QWORD PTR fs:40	# tmp103, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L21	#,
	call	__stack_chk_fail@PLT	#
.L21:
	leave
	ret
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