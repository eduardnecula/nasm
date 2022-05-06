	.file	"dan.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$464, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movabsq	$2334397743342120513, %rax
	movq	%rax, -34(%rbp)
	movl	$1701995885, -26(%rbp)
	movb	$0, -22(%rbp)
	movabsq	$7089336938131513954, %rax
	movq	%rax, -21(%rbp)
	movl	$1650614882, -13(%rbp)
	movb	$0, -9(%rbp)
	movl	$0, -452(%rbp)
	jmp	.L2
.L3:
	movl	-452(%rbp), %eax
	cltq
	movzbl	-34(%rbp,%rax), %edx
	movl	-452(%rbp), %eax
	cltq
	movzbl	-21(%rbp,%rax), %eax
	xorl	%edx, %eax
	movsbl	%al, %edx
	movl	-452(%rbp), %eax
	cltq
	movl	%edx, -448(%rbp,%rax,4)
	addl	$1, -452(%rbp)
.L2:
	cmpl	$11, -452(%rbp)
	jle	.L3
	movl	$0, -452(%rbp)
	jmp	.L4
.L5:
	movl	-452(%rbp), %eax
	cltq
	movl	-448(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -452(%rbp)
.L4:
	cmpl	$11, -452(%rbp)
	jle	.L5
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
