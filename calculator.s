	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
Ltmp3:
	.cfi_offset %rbx, -24
	leaq	_sub(%rip), %rax
	movd	%rax, %xmm0
	leaq	_sum(%rip), %rax
	movd	%rax, %xmm1
	punpcklqdq	%xmm0, %xmm1    ## xmm1 = xmm1[0],xmm0[0]
	movq	_p@GOTPCREL(%rip), %rbx
	movdqa	%xmm1, (%rbx)
	leaq	_div(%rip), %rax
	movd	%rax, %xmm0
	leaq	_mul(%rip), %rax
	movd	%rax, %xmm1
	punpcklqdq	%xmm0, %xmm1    ## xmm1 = xmm1[0],xmm0[0]
	movdqa	%xmm1, 16(%rbx)
	leaq	L_str(%rip), %rdi
	callq	_puts
	leaq	L_.str.1(%rip), %rdi
	leaq	-12(%rbp), %rsi
	leaq	-16(%rbp), %rdx
	xorl	%eax, %eax
	callq	_scanf
	leaq	L_str.7(%rip), %rdi
	callq	_puts
	leaq	L_.str.3(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movl	-12(%rbp), %edi
	movl	-16(%rbp), %esi
	callq	*(%rbx)
	movl	%eax, %ecx
	leaq	L_.str.5(%rip), %rdi
	xorl	%eax, %eax
	movl	%ecx, %esi
	callq	_printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_sum
	.align	4, 0x90
_sum:                                   ## @sum
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp4:
	.cfi_def_cfa_offset 16
Ltmp5:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp6:
	.cfi_def_cfa_register %rbp
	leal	(%rdi,%rsi), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_sub
	.align	4, 0x90
_sub:                                   ## @sub
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp7:
	.cfi_def_cfa_offset 16
Ltmp8:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp9:
	.cfi_def_cfa_register %rbp
	subl	%esi, %edi
	movl	%edi, %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_mul
	.align	4, 0x90
_mul:                                   ## @mul
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp10:
	.cfi_def_cfa_offset 16
Ltmp11:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp12:
	.cfi_def_cfa_register %rbp
	imull	%esi, %edi
	movl	%edi, %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_div
	.align	4, 0x90
_div:                                   ## @div
	.cfi_startproc
## BB#0:
	testl	%esi, %esi
	je	LBB4_1
## BB#2:
	movl	%edi, %eax
	cltd
	idivl	%esi
	retq
LBB4_1:
	pushq	%rbp
Ltmp13:
	.cfi_def_cfa_offset 16
Ltmp14:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp15:
	.cfi_def_cfa_register %rbp
	leaq	L_str.8(%rip), %rdi
	callq	_puts
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc

	.comm	_p,32,4                 ## @p
	.section	__TEXT,__cstring,cstring_literals
L_.str.1:                               ## @.str.1
	.asciz	"%d%d"

L_.str.3:                               ## @.str.3
	.asciz	"Enter number of operations: "

L_.str.5:                               ## @.str.5
	.asciz	"%d\n"

	.align	4                       ## @str
L_str:
	.asciz	"Enter the two numbers you want to perform operations on"

	.align	4                       ## @str.7
L_str.7:
	.asciz	"0: Add, 1: Subtract, 2: Multiply, 3: Divide"

L_str.8:                                ## @str.8
	.asciz	"UNDEFINED"


.subsections_via_symbols
