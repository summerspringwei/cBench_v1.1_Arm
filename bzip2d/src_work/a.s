	.text
	.file	"llvm-link"
	.globl	BZ2_blockSort                   # -- Begin function BZ2_blockSort
	.p2align	4, 0x90
	.type	BZ2_blockSort,@function
BZ2_blockSort:                          # @BZ2_blockSort
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	%rdi, -32(%rbp)
	movq	56(%rdi), %rax
	movq	%rax, -64(%rbp)
	movq	64(%rdi), %rax
	movq	%rax, -56(%rbp)
	movq	40(%rdi), %rax
	movq	%rax, -40(%rbp)
	movl	108(%rdi), %eax
	movl	%eax, -8(%rbp)
	movl	656(%rdi), %ecx
	movl	%ecx, -16(%rbp)
	movl	88(%rdi), %ecx
	movl	%ecx, -12(%rbp)
	cmpl	$9999, %eax                     # imm = 0x270F
	jg	.LBB0_1
.LBB0_15:
	movq	-32(%rbp), %rax
	movq	24(%rax), %rdi
	movq	32(%rax), %rsi
	movq	-40(%rbp), %rdx
	movl	-8(%rbp), %ecx
	movl	-16(%rbp), %r8d
	callq	fallbackSort
	jmp	.LBB0_16
.LBB0_1:
	movl	-8(%rbp), %eax
	addl	$34, %eax
	movl	%eax, -4(%rbp)
	testb	$1, %al
	je	.LBB0_3
# %bb.2:
	addl	$1, -4(%rbp)
.LBB0_3:
	movslq	-4(%rbp), %rax
	addq	-56(%rbp), %rax
	movq	%rax, -72(%rbp)
	cmpl	$0, -12(%rbp)
	jle	.LBB0_4
# %bb.5:
	cmpl	$101, -12(%rbp)
	jl	.LBB0_7
.LBB0_6:
	movl	$100, -12(%rbp)
.LBB0_7:
	movl	-8(%rbp), %r8d
	movl	-12(%rbp), %eax
	addl	$-1, %eax
	cltq
	imulq	$1431655766, %rax, %rax         # imm = 0x55555556
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$32, %rax
	addl	%ecx, %eax
	imull	%r8d, %eax
	movl	%eax, -44(%rbp)
	movl	%eax, -20(%rbp)
	movq	-64(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movq	-72(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movl	-16(%rbp), %r9d
	leaq	-20(%rbp), %rax
	movq	%rax, (%rsp)
	callq	mainSort
	cmpl	$3, -16(%rbp)
	jl	.LBB0_12
# %bb.8:
	movq	stderr(%rip), %rdi
	movl	-44(%rbp), %edx
	subl	-20(%rbp), %edx
	movl	-8(%rbp), %ecx
	cvtsi2ss	%edx, %xmm0
	testl	%ecx, %ecx
	je	.LBB0_9
# %bb.10:
	movl	-8(%rbp), %eax
	jmp	.LBB0_11
.LBB0_4:
	movl	$1, -12(%rbp)
	cmpl	$101, -12(%rbp)
	jge	.LBB0_6
	jmp	.LBB0_7
.LBB0_9:
	movl	$1, %eax
.LBB0_11:
	cvtsi2ss	%eax, %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str, %esi
	movb	$1, %al
	callq	fprintf
.LBB0_12:
	cmpl	$0, -20(%rbp)
	js	.LBB0_13
.LBB0_16:
	movq	-32(%rbp), %rax
	movl	$-1, 48(%rax)
	movl	$0, -4(%rbp)
	.p2align	4, 0x90
.LBB0_17:                               # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	movq	-32(%rbp), %rcx
	cmpl	108(%rcx), %eax
	jge	.LBB0_20
# %bb.18:                               #   in Loop: Header=BB0_17 Depth=1
	movq	-64(%rbp), %rax
	movslq	-4(%rbp), %rcx
	cmpl	$0, (%rax,%rcx,4)
	je	.LBB0_19
# %bb.23:                               #   in Loop: Header=BB0_17 Depth=1
	addl	$1, -4(%rbp)
	jmp	.LBB0_17
.LBB0_19:
	movl	-4(%rbp), %eax
	movq	-32(%rbp), %rcx
	movl	%eax, 48(%rcx)
.LBB0_20:
	movq	-32(%rbp), %rax
	cmpl	$-1, 48(%rax)
	jne	.LBB0_22
# %bb.21:
	movl	$1003, %edi                     # imm = 0x3EB
	callq	BZ2_bz__AssertH__fail
.LBB0_22:
	addq	$80, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB0_13:
	.cfi_def_cfa %rbp, 16
	cmpl	$2, -16(%rbp)
	jl	.LBB0_15
# %bb.14:
	movq	stderr(%rip), %rdi
	movl	$.L.str.1, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB0_15
.Lfunc_end0:
	.size	BZ2_blockSort, .Lfunc_end0-BZ2_blockSort
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function fallbackSort
	.type	fallbackSort,@function
fallbackSort:                           # @fallbackSort
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$2144, %rsp                     # imm = 0x860
	movq	%rdi, -56(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -12(%rbp)
	movl	%r8d, -44(%rbp)
	movq	%rsi, -72(%rbp)
	cmpl	$4, %r8d
	jl	.LBB1_2
# %bb.1:
	movq	stderr(%rip), %rdi
	movl	$.L.str.2, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB1_2:
	movl	$0, -4(%rbp)
	cmpl	$256, -4(%rbp)                  # imm = 0x100
	jg	.LBB1_5
	.p2align	4, 0x90
.LBB1_4:                                # =>This Inner Loop Header: Depth=1
	movslq	-4(%rbp), %rax
	movl	$0, -1120(%rbp,%rax,4)
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	cmpl	$256, -4(%rbp)                  # imm = 0x100
	jle	.LBB1_4
.LBB1_5:
	movl	$0, -4(%rbp)
	.p2align	4, 0x90
.LBB1_6:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB1_8
# %bb.7:                                #   in Loop: Header=BB1_6 Depth=1
	movq	-72(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzbl	(%rax,%rcx), %eax
	addl	$1, -1120(%rbp,%rax,4)
	leal	1(%rcx), %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB1_6
.LBB1_8:
	movl	$0, -4(%rbp)
	cmpl	$255, -4(%rbp)
	jg	.LBB1_11
	.p2align	4, 0x90
.LBB1_10:                               # =>This Inner Loop Header: Depth=1
	movslq	-4(%rbp), %rax
	movl	-1120(%rbp,%rax,4), %ecx
	movl	%ecx, -2144(%rbp,%rax,4)
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	cmpl	$255, -4(%rbp)
	jle	.LBB1_10
.LBB1_11:
	movl	$1, -4(%rbp)
	cmpl	$256, -4(%rbp)                  # imm = 0x100
	jg	.LBB1_14
	.p2align	4, 0x90
.LBB1_13:                               # =>This Inner Loop Header: Depth=1
	movslq	-4(%rbp), %rax
	movl	-1124(%rbp,%rax,4), %ecx
	addl	%ecx, -1120(%rbp,%rax,4)
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	cmpl	$256, -4(%rbp)                  # imm = 0x100
	jle	.LBB1_13
.LBB1_14:
	movl	$0, -4(%rbp)
	.p2align	4, 0x90
.LBB1_15:                               # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB1_17
# %bb.16:                               #   in Loop: Header=BB1_15 Depth=1
	movq	-72(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzbl	(%rax,%rcx), %eax
	movl	%eax, -16(%rbp)
	movl	-1120(%rbp,%rax,4), %edx
	addl	$-1, %edx
	movl	%edx, -8(%rbp)
	movl	%edx, -1120(%rbp,%rax,4)
	movq	-56(%rbp), %rax
	movslq	%edx, %rdx
	movl	%ecx, (%rax,%rdx,4)
	addl	$1, -4(%rbp)
	jmp	.LBB1_15
.LBB1_17:
	movl	-12(%rbp), %eax
	leal	31(%rax), %ecx
	testl	%eax, %eax
	cmovnsl	%eax, %ecx
	sarl	$5, %ecx
	addl	$2, %ecx
	movl	%ecx, -84(%rbp)
	movl	$0, -4(%rbp)
	.p2align	4, 0x90
.LBB1_18:                               # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jge	.LBB1_20
# %bb.19:                               #   in Loop: Header=BB1_18 Depth=1
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	$0, (%rax,%rcx,4)
	addl	$1, -4(%rbp)
	jmp	.LBB1_18
.LBB1_20:
	movl	$0, -4(%rbp)
	cmpl	$255, -4(%rbp)
	jg	.LBB1_23
	.p2align	4, 0x90
.LBB1_22:                               # =>This Inner Loop Header: Depth=1
	movslq	-4(%rbp), %rax
	movl	-1120(%rbp,%rax,4), %ecx
	movl	$1, %eax
	shll	%cl, %eax
	movq	-24(%rbp), %rdx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	orl	%eax, (%rdx,%rcx,4)
	addl	$1, -4(%rbp)
	cmpl	$255, -4(%rbp)
	jle	.LBB1_22
.LBB1_23:
	movl	$0, -4(%rbp)
	cmpl	$31, -4(%rbp)
	jg	.LBB1_26
	.p2align	4, 0x90
.LBB1_25:                               # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %ecx
	addl	%ecx, %ecx
	addl	-12(%rbp), %ecx
	movl	$1, %eax
	shll	%cl, %eax
	movq	-24(%rbp), %rdx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	orl	%eax, (%rdx,%rcx,4)
	movl	-12(%rbp), %eax
	movl	-4(%rbp), %ecx
	leal	(%rax,%rcx,2), %ecx
	addl	$1, %ecx
	movl	$-2, %eax
	roll	%cl, %eax
	movq	-24(%rbp), %rdx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	andl	%eax, (%rdx,%rcx,4)
	addl	$1, -4(%rbp)
	cmpl	$31, -4(%rbp)
	jle	.LBB1_25
.LBB1_26:
	movl	$1, -36(%rbp)
	.p2align	4, 0x90
.LBB1_27:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_30 Depth 2
                                        #     Child Loop BB1_37 Depth 2
                                        #       Child Loop BB1_38 Depth 3
                                        #       Child Loop BB1_44 Depth 3
                                        #       Child Loop BB1_46 Depth 3
                                        #       Child Loop BB1_49 Depth 3
                                        #       Child Loop BB1_55 Depth 3
                                        #       Child Loop BB1_57 Depth 3
                                        #       Child Loop BB1_62 Depth 3
	cmpl	$4, -44(%rbp)
	jl	.LBB1_29
# %bb.28:                               #   in Loop: Header=BB1_27 Depth=1
	movq	stderr(%rip), %rdi
	movl	-36(%rbp), %edx
	movl	$.L.str.3, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB1_29:                               #   in Loop: Header=BB1_27 Depth=1
	movl	$0, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.LBB1_30
	.p2align	4, 0x90
.LBB1_35:                               #   in Loop: Header=BB1_30 Depth=2
	movl	-16(%rbp), %eax
	movq	-80(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$1, -4(%rbp)
.LBB1_30:                               #   Parent Loop BB1_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB1_36
# %bb.31:                               #   in Loop: Header=BB1_30 Depth=2
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %ecx
	movl	%ecx, %edx
	sarl	$5, %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	btl	%ecx, %eax
	jae	.LBB1_33
# %bb.32:                               #   in Loop: Header=BB1_30 Depth=2
	movl	-4(%rbp), %eax
	movl	%eax, -16(%rbp)
.LBB1_33:                               #   in Loop: Header=BB1_30 Depth=2
	movq	-56(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	subl	-36(%rbp), %eax
	movl	%eax, -8(%rbp)
	jns	.LBB1_35
# %bb.34:                               #   in Loop: Header=BB1_30 Depth=2
	movl	-12(%rbp), %eax
	addl	%eax, -8(%rbp)
	jmp	.LBB1_35
	.p2align	4, 0x90
.LBB1_36:                               #   in Loop: Header=BB1_27 Depth=1
	movl	$0, -32(%rbp)
	movl	$-1, -28(%rbp)
	.p2align	4, 0x90
.LBB1_37:                               #   Parent Loop BB1_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_38 Depth 3
                                        #       Child Loop BB1_44 Depth 3
                                        #       Child Loop BB1_46 Depth 3
                                        #       Child Loop BB1_49 Depth 3
                                        #       Child Loop BB1_55 Depth 3
                                        #       Child Loop BB1_57 Depth 3
                                        #       Child Loop BB1_62 Depth 3
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	.p2align	4, 0x90
.LBB1_38:                               #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %ecx
	movl	%ecx, %edx
	sarl	$5, %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	btl	%ecx, %eax
	jae	.LBB1_39
# %bb.40:                               #   in Loop: Header=BB1_38 Depth=3
	testb	$31, -8(%rbp)
	setne	%al
	testb	%al, %al
	jne	.LBB1_42
	jmp	.LBB1_43
	.p2align	4, 0x90
.LBB1_39:                               #   in Loop: Header=BB1_38 Depth=3
	xorl	%eax, %eax
	testb	%al, %al
	je	.LBB1_43
.LBB1_42:                               #   in Loop: Header=BB1_38 Depth=3
	addl	$1, -8(%rbp)
	jmp	.LBB1_38
	.p2align	4, 0x90
.LBB1_43:                               #   in Loop: Header=BB1_37 Depth=2
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %ecx
	movl	%ecx, %edx
	sarl	$5, %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	btl	%ecx, %eax
	jae	.LBB1_48
	.p2align	4, 0x90
.LBB1_44:                               #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	cmpl	$-1, (%rax,%rcx,4)
	jne	.LBB1_46
# %bb.45:                               #   in Loop: Header=BB1_44 Depth=3
	addl	$32, -8(%rbp)
	jmp	.LBB1_44
	.p2align	4, 0x90
.LBB1_47:                               #   in Loop: Header=BB1_46 Depth=3
	addl	$1, -8(%rbp)
.LBB1_46:                               #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %ecx
	movl	%ecx, %edx
	sarl	$5, %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	btl	%ecx, %eax
	jb	.LBB1_47
.LBB1_48:                               #   in Loop: Header=BB1_37 Depth=2
	movl	-8(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -40(%rbp)
	cmpl	-12(%rbp), %eax
	jge	.LBB1_66
	.p2align	4, 0x90
.LBB1_49:                               #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %ecx
	movl	%ecx, %edx
	sarl	$5, %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	btl	%ecx, %eax
	jae	.LBB1_51
# %bb.50:                               #   in Loop: Header=BB1_49 Depth=3
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB1_53
	jmp	.LBB1_54
	.p2align	4, 0x90
.LBB1_51:                               #   in Loop: Header=BB1_49 Depth=3
	testb	$31, -8(%rbp)
	setne	%al
	testb	%al, %al
	je	.LBB1_54
.LBB1_53:                               #   in Loop: Header=BB1_49 Depth=3
	addl	$1, -8(%rbp)
	jmp	.LBB1_49
	.p2align	4, 0x90
.LBB1_54:                               #   in Loop: Header=BB1_37 Depth=2
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %ecx
	movl	%ecx, %edx
	sarl	$5, %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	btl	%ecx, %eax
	jb	.LBB1_59
	jmp	.LBB1_55
	.p2align	4, 0x90
.LBB1_56:                               #   in Loop: Header=BB1_55 Depth=3
	addl	$32, -8(%rbp)
.LBB1_55:                               #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	cmpl	$0, (%rax,%rcx,4)
	je	.LBB1_56
	jmp	.LBB1_57
	.p2align	4, 0x90
.LBB1_58:                               #   in Loop: Header=BB1_57 Depth=3
	addl	$1, -8(%rbp)
.LBB1_57:                               #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %ecx
	movl	%ecx, %edx
	sarl	$5, %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	btl	%ecx, %eax
	jae	.LBB1_58
.LBB1_59:                               #   in Loop: Header=BB1_37 Depth=2
	movl	-8(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -28(%rbp)
	cmpl	-12(%rbp), %eax
	jge	.LBB1_66
# %bb.60:                               #   in Loop: Header=BB1_37 Depth=2
	movl	-28(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jle	.LBB1_37
# %bb.61:                               #   in Loop: Header=BB1_37 Depth=2
	movl	-28(%rbp), %ecx
	movl	-40(%rbp), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	-32(%rbp), %esi
	addl	%esi, %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	movq	-56(%rbp), %rdi
	movq	-80(%rbp), %rsi
	callq	fallbackQSort3
	movl	$-1, -60(%rbp)
	movl	-40(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB1_62
	.p2align	4, 0x90
.LBB1_65:                               #   in Loop: Header=BB1_62 Depth=3
	addl	$1, -4(%rbp)
.LBB1_62:                               #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jg	.LBB1_37
# %bb.63:                               #   in Loop: Header=BB1_62 Depth=3
	movq	-80(%rbp), %rax
	movq	-56(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movl	(%rcx,%rdx,4), %ecx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -88(%rbp)
	cmpl	%eax, -60(%rbp)
	je	.LBB1_65
# %bb.64:                               #   in Loop: Header=BB1_62 Depth=3
	movl	-4(%rbp), %ecx
	movl	$1, %eax
	shll	%cl, %eax
	movq	-24(%rbp), %rdx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	orl	%eax, (%rdx,%rcx,4)
	movl	-88(%rbp), %eax
	movl	%eax, -60(%rbp)
	jmp	.LBB1_65
	.p2align	4, 0x90
.LBB1_66:                               #   in Loop: Header=BB1_27 Depth=1
	cmpl	$4, -44(%rbp)
	jl	.LBB1_68
# %bb.67:                               #   in Loop: Header=BB1_27 Depth=1
	movq	stderr(%rip), %rdi
	movl	-32(%rbp), %edx
	movl	$.L.str.4, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB1_68:                               #   in Loop: Header=BB1_27 Depth=1
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -36(%rbp)
	cmpl	-12(%rbp), %eax
	jg	.LBB1_70
# %bb.69:                               #   in Loop: Header=BB1_27 Depth=1
	cmpl	$0, -32(%rbp)
	jne	.LBB1_27
.LBB1_70:
	cmpl	$4, -44(%rbp)
	jl	.LBB1_72
# %bb.71:
	movq	stderr(%rip), %rdi
	movl	$.L.str.5, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB1_72:
	movl	$0, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.LBB1_73
	.p2align	4, 0x90
.LBB1_76:                               #   in Loop: Header=BB1_73 Depth=1
	movslq	-16(%rbp), %rax
	addl	$-1, -2144(%rbp,%rax,4)
	movb	-16(%rbp), %al
	movq	-72(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movslq	-4(%rbp), %rsi
	movl	(%rdx,%rsi,4), %edx
	movb	%al, (%rcx,%rdx)
	addl	$1, -4(%rbp)
.LBB1_73:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_74 Depth 2
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB1_77
	.p2align	4, 0x90
.LBB1_74:                               #   Parent Loop BB1_73 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	-16(%rbp), %rax
	cmpl	$0, -2144(%rbp,%rax,4)
	jne	.LBB1_76
# %bb.75:                               #   in Loop: Header=BB1_74 Depth=2
	addl	$1, -16(%rbp)
	jmp	.LBB1_74
.LBB1_77:
	cmpl	$256, -16(%rbp)                 # imm = 0x100
	jl	.LBB1_79
# %bb.78:
	movl	$1005, %edi                     # imm = 0x3ED
	callq	BZ2_bz__AssertH__fail
.LBB1_79:
	addq	$2144, %rsp                     # imm = 0x860
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	fallbackSort, .Lfunc_end1-fallbackSort
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function mainSort
	.type	mainSort,@function
mainSort:                               # @mainSort
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$3448, %rsp                     # imm = 0xD78
	.cfi_offset %rbx, -24
	movq	%rdi, -72(%rbp)
	movq	%rsi, -56(%rbp)
	movq	%rdx, -80(%rbp)
	movq	%rcx, -40(%rbp)
	movl	%r8d, -44(%rbp)
	movl	%r9d, -104(%rbp)
	cmpl	$4, %r9d
	jl	.LBB2_2
# %bb.1:
	movq	stderr(%rip), %rdi
	movl	$.L.str.6, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB2_2:
	movl	$65536, -12(%rbp)               # imm = 0x10000
	cmpl	$0, -12(%rbp)
	js	.LBB2_5
	.p2align	4, 0x90
.LBB2_4:                                # =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movl	$0, (%rax,%rcx,4)
	addl	$-1, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jns	.LBB2_4
.LBB2_5:
	movq	-56(%rbp), %rax
	movzbl	(%rax), %eax
	shll	$8, %eax
	movl	%eax, -16(%rbp)
	movl	-44(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -12(%rbp)
	cmpl	$3, -12(%rbp)
	jl	.LBB2_8
	.p2align	4, 0x90
.LBB2_7:                                # =>This Inner Loop Header: Depth=1
	movq	-80(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movw	$0, (%rax,%rcx,2)
	movl	-16(%rbp), %eax
	sarl	$8, %eax
	movq	-56(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movzbl	(%rcx,%rdx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -16(%rbp)
	movq	-40(%rbp), %rax
	movslq	%ecx, %rcx
	addl	$1, (%rax,%rcx,4)
	movq	-80(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movw	$0, -2(%rax,%rcx,2)
	movl	-16(%rbp), %eax
	sarl	$8, %eax
	movq	-56(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movzbl	-1(%rdx,%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -16(%rbp)
	movq	-40(%rbp), %rax
	movslq	%ecx, %rcx
	addl	$1, (%rax,%rcx,4)
	movq	-80(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movw	$0, -4(%rax,%rcx,2)
	movl	-16(%rbp), %eax
	sarl	$8, %eax
	movq	-56(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movzbl	-2(%rdx,%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -16(%rbp)
	movq	-40(%rbp), %rax
	movslq	%ecx, %rcx
	addl	$1, (%rax,%rcx,4)
	movq	-80(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movw	$0, -6(%rax,%rcx,2)
	movl	-16(%rbp), %eax
	sarl	$8, %eax
	movq	-56(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movzbl	-3(%rdx,%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -16(%rbp)
	movq	-40(%rbp), %rax
	movslq	%ecx, %rcx
	addl	$1, (%rax,%rcx,4)
	addl	$-4, -12(%rbp)
	cmpl	$3, -12(%rbp)
	jge	.LBB2_7
	jmp	.LBB2_8
	.p2align	4, 0x90
.LBB2_9:                                #   in Loop: Header=BB2_8 Depth=1
	movq	-80(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movw	$0, (%rax,%rcx,2)
	movl	-16(%rbp), %eax
	sarl	$8, %eax
	movq	-56(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movzbl	(%rcx,%rdx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -16(%rbp)
	movq	-40(%rbp), %rax
	movslq	%ecx, %rcx
	addl	$1, (%rax,%rcx,4)
	addl	$-1, -12(%rbp)
.LBB2_8:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, -12(%rbp)
	jns	.LBB2_9
# %bb.10:
	movl	$0, -12(%rbp)
	cmpl	$33, -12(%rbp)
	jg	.LBB2_13
	.p2align	4, 0x90
.LBB2_12:                               # =>This Inner Loop Header: Depth=1
	movq	-56(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movzbl	(%rax,%rcx), %edx
	movslq	-44(%rbp), %rsi
	addq	%rcx, %rsi
	movb	%dl, (%rax,%rsi)
	movq	-80(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	addq	%rcx, %rdx
	movw	$0, (%rax,%rdx,2)
	addl	$1, -12(%rbp)
	cmpl	$33, -12(%rbp)
	jle	.LBB2_12
.LBB2_13:
	cmpl	$4, -104(%rbp)
	jl	.LBB2_15
# %bb.14:
	movq	stderr(%rip), %rdi
	movl	$.L.str.2, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB2_15:
	movl	$1, -12(%rbp)
	cmpl	$65536, -12(%rbp)               # imm = 0x10000
	jg	.LBB2_18
	.p2align	4, 0x90
.LBB2_17:                               # =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movl	-4(%rax,%rcx,4), %edx
	addl	%edx, (%rax,%rcx,4)
	addl	$1, -12(%rbp)
	cmpl	$65536, -12(%rbp)               # imm = 0x10000
	jle	.LBB2_17
.LBB2_18:
	movq	-56(%rbp), %rax
	movzbl	(%rax), %eax
	shll	$8, %eax
	movw	%ax, -18(%rbp)
	movl	-44(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -12(%rbp)
	cmpl	$3, -12(%rbp)
	jl	.LBB2_21
	.p2align	4, 0x90
.LBB2_20:                               # =>This Inner Loop Header: Depth=1
	movzbl	-17(%rbp), %eax
	movq	-56(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movzbl	(%rcx,%rdx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movw	%cx, -18(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax,%rcx,4), %edx
	addl	$-1, %edx
	movl	%edx, -16(%rbp)
	movl	%edx, (%rax,%rcx,4)
	movl	-12(%rbp), %eax
	movq	-72(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	movzbl	-17(%rbp), %eax
	movq	-56(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movzbl	-1(%rdx,%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movw	%cx, -18(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax,%rcx,4), %edx
	addl	$-1, %edx
	movl	%edx, -16(%rbp)
	movl	%edx, (%rax,%rcx,4)
	movl	-12(%rbp), %eax
	addl	$-1, %eax
	movq	-72(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	movzbl	-17(%rbp), %eax
	movq	-56(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movzbl	-2(%rdx,%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movw	%cx, -18(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax,%rcx,4), %edx
	addl	$-1, %edx
	movl	%edx, -16(%rbp)
	movl	%edx, (%rax,%rcx,4)
	movl	-12(%rbp), %eax
	addl	$-2, %eax
	movq	-72(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	movzbl	-17(%rbp), %eax
	movq	-56(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movzbl	-3(%rdx,%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movw	%cx, -18(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax,%rcx,4), %edx
	addl	$-1, %edx
	movl	%edx, -16(%rbp)
	movl	%edx, (%rax,%rcx,4)
	movl	-12(%rbp), %eax
	addl	$-3, %eax
	movq	-72(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$-4, -12(%rbp)
	cmpl	$3, -12(%rbp)
	jge	.LBB2_20
	jmp	.LBB2_21
	.p2align	4, 0x90
.LBB2_22:                               #   in Loop: Header=BB2_21 Depth=1
	movzbl	-17(%rbp), %eax
	movq	-56(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movzbl	(%rcx,%rdx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movw	%cx, -18(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax,%rcx,4), %edx
	addl	$-1, %edx
	movl	%edx, -16(%rbp)
	movl	%edx, (%rax,%rcx,4)
	movl	-12(%rbp), %eax
	movq	-72(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$-1, -12(%rbp)
.LBB2_21:                               # =>This Inner Loop Header: Depth=1
	cmpl	$0, -12(%rbp)
	jns	.LBB2_22
# %bb.23:
	movl	$0, -12(%rbp)
	cmpl	$255, -12(%rbp)
	jg	.LBB2_26
	.p2align	4, 0x90
.LBB2_25:                               # =>This Inner Loop Header: Depth=1
	movslq	-12(%rbp), %rax
	movb	$0, -384(%rbp,%rax)
	movl	%eax, -1408(%rbp,%rax,4)
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	cmpl	$255, -12(%rbp)
	jle	.LBB2_25
.LBB2_26:
	movl	$1, -60(%rbp)
	.p2align	4, 0x90
.LBB2_27:                               # =>This Inner Loop Header: Depth=1
	movl	-60(%rbp), %eax
	leal	(%rax,%rax,2), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	cmpl	$257, %eax                      # imm = 0x101
	jl	.LBB2_27
	jmp	.LBB2_28
	.p2align	4, 0x90
.LBB2_34:                               #   in Loop: Header=BB2_28 Depth=1
	cmpl	$1, -60(%rbp)
	je	.LBB2_35
.LBB2_28:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_29 Depth 2
                                        #       Child Loop BB2_31 Depth 3
	movslq	-60(%rbp), %rax
	imulq	$1431655766, %rax, %rax         # imm = 0x55555556
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$32, %rax
	addl	%ecx, %eax
	movl	%eax, -60(%rbp)
	movl	%eax, -12(%rbp)
	jmp	.LBB2_29
	.p2align	4, 0x90
.LBB2_33:                               #   in Loop: Header=BB2_29 Depth=2
	movl	-116(%rbp), %eax
	movslq	-16(%rbp), %rcx
	movl	%eax, -1408(%rbp,%rcx,4)
	addl	$1, -12(%rbp)
.LBB2_29:                               #   Parent Loop BB2_28 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_31 Depth 3
	cmpl	$255, -12(%rbp)
	jg	.LBB2_34
# %bb.30:                               #   in Loop: Header=BB2_29 Depth=2
	movslq	-12(%rbp), %rax
	movl	-1408(%rbp,%rax,4), %ecx
	movl	%ecx, -116(%rbp)
	movl	%eax, -16(%rbp)
	.p2align	4, 0x90
.LBB2_31:                               #   Parent Loop BB2_28 Depth=1
                                        #     Parent Loop BB2_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-40(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movslq	-60(%rbp), %rdx
	subq	%rdx, %rcx
	movl	-1408(%rbp,%rcx,4), %ecx
	shll	$8, %ecx
	leal	256(%rcx), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %edx
	movslq	%ecx, %rcx
	subl	(%rax,%rcx,4), %edx
	movl	-116(%rbp), %ecx
	shll	$8, %ecx
	leal	256(%rcx), %esi
	movslq	%esi, %rsi
	movl	(%rax,%rsi,4), %esi
	movslq	%ecx, %rcx
	subl	(%rax,%rcx,4), %esi
	cmpl	%esi, %edx
	jbe	.LBB2_33
# %bb.32:                               #   in Loop: Header=BB2_31 Depth=3
	movslq	-16(%rbp), %rax
	movslq	-60(%rbp), %rcx
	movq	%rax, %rdx
	subq	%rcx, %rdx
	movl	-1408(%rbp,%rdx,4), %edx
	movl	%edx, -1408(%rbp,%rax,4)
	subl	%ecx, %eax
	movl	%eax, -16(%rbp)
	addl	$-1, %ecx
	cmpl	%ecx, %eax
	jg	.LBB2_31
	jmp	.LBB2_33
.LBB2_35:
	movl	$0, -88(%rbp)
	movl	$0, -12(%rbp)
	movl	$-2097153, %ebx                 # imm = 0xFFDFFFFF
	jmp	.LBB2_36
	.p2align	4, 0x90
.LBB2_84:                               #   in Loop: Header=BB2_36 Depth=1
	addl	$1, -12(%rbp)
.LBB2_36:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_38 Depth 2
                                        #     Child Loop BB2_51 Depth 2
                                        #     Child Loop BB2_53 Depth 2
                                        #     Child Loop BB2_60 Depth 2
                                        #     Child Loop BB2_72 Depth 2
                                        #     Child Loop BB2_75 Depth 2
                                        #     Child Loop BB2_78 Depth 2
	cmpl	$255, -12(%rbp)
	jg	.LBB2_85
# %bb.37:                               #   in Loop: Header=BB2_36 Depth=1
	movslq	-12(%rbp), %rax
	movl	-1408(%rbp,%rax,4), %eax
	movl	%eax, -24(%rbp)
	movl	$0, -16(%rbp)
	jmp	.LBB2_38
.LBB2_44:                               #   in Loop: Header=BB2_38 Depth=2
	movq	-72(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movq	-80(%rbp), %rdx
	movl	-44(%rbp), %ecx
	movl	-100(%rbp), %r8d
	movl	-96(%rbp), %r9d
	pushq	16(%rbp)
	pushq	$2
	callq	mainQSort3
	addq	$16, %rsp
	movl	-96(%rbp), %eax
	subl	-100(%rbp), %eax
	movl	-88(%rbp), %ecx
	addl	%ecx, %eax
	addl	$1, %eax
	movl	%eax, -88(%rbp)
	movq	16(%rbp), %rax
	cmpl	$0, (%rax)
	js	.LBB2_87
.LBB2_45:                               #   in Loop: Header=BB2_38 Depth=2
	movq	-40(%rbp), %rax
	movslq	-120(%rbp), %rcx
	orl	$2097152, (%rax,%rcx,4)         # imm = 0x200000
.LBB2_46:                               #   in Loop: Header=BB2_38 Depth=2
	addl	$1, -16(%rbp)
.LBB2_38:                               #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$255, -16(%rbp)
	jg	.LBB2_47
# %bb.39:                               #   in Loop: Header=BB2_38 Depth=2
	movl	-16(%rbp), %eax
	cmpl	-24(%rbp), %eax
	je	.LBB2_46
# %bb.40:                               #   in Loop: Header=BB2_38 Depth=2
	movl	-24(%rbp), %eax
	shll	$8, %eax
	addl	-16(%rbp), %eax
	movl	%eax, -120(%rbp)
	movq	-40(%rbp), %rcx
	cltq
	testb	$32, 2(%rcx,%rax,4)
	jne	.LBB2_45
# %bb.41:                               #   in Loop: Header=BB2_38 Depth=2
	movq	-40(%rbp), %rax
	movslq	-120(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	andl	%ebx, %edx
	movl	%edx, -100(%rbp)
	movl	4(%rax,%rcx,4), %eax
	andl	%ebx, %eax
	addl	$-1, %eax
	movl	%eax, -96(%rbp)
	cmpl	%edx, %eax
	jle	.LBB2_45
# %bb.42:                               #   in Loop: Header=BB2_38 Depth=2
	cmpl	$4, -104(%rbp)
	jl	.LBB2_44
# %bb.43:                               #   in Loop: Header=BB2_38 Depth=2
	movq	stderr(%rip), %rdi
	movl	-24(%rbp), %edx
	movl	-16(%rbp), %ecx
	movl	-88(%rbp), %r8d
	movl	-96(%rbp), %r9d
	subl	-100(%rbp), %r9d
	addl	$1, %r9d
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB2_44
	.p2align	4, 0x90
.LBB2_47:                               #   in Loop: Header=BB2_36 Depth=1
	movslq	-24(%rbp), %rax
	cmpb	$0, -384(%rbp,%rax)
	je	.LBB2_49
# %bb.48:                               #   in Loop: Header=BB2_36 Depth=1
	movl	$1006, %edi                     # imm = 0x3EE
	callq	BZ2_bz__AssertH__fail
.LBB2_49:                               #   in Loop: Header=BB2_36 Depth=1
	movl	$0, -16(%rbp)
	cmpl	$255, -16(%rbp)
	jg	.LBB2_52
	.p2align	4, 0x90
.LBB2_51:                               #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-40(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	%ecx, %edx
	shll	$8, %edx
	movslq	-24(%rbp), %rsi
	movslq	%edx, %rdx
	addq	%rsi, %rdx
	movl	(%rax,%rdx,4), %esi
	andl	%ebx, %esi
	movl	%esi, -3456(%rbp,%rcx,4)
	movl	4(%rax,%rdx,4), %eax
	andl	%ebx, %eax
	addl	$-1, %eax
	movl	%eax, -2432(%rbp,%rcx,4)
	leal	1(%rcx), %eax
	movl	%eax, -16(%rbp)
	cmpl	$255, -16(%rbp)
	jle	.LBB2_51
.LBB2_52:                               #   in Loop: Header=BB2_36 Depth=1
	movq	-40(%rbp), %rax
	movl	-24(%rbp), %ecx
	shll	$8, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	andl	%ebx, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB2_53
	.p2align	4, 0x90
.LBB2_58:                               #   in Loop: Header=BB2_53 Depth=2
	addl	$1, -16(%rbp)
.LBB2_53:                               #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-16(%rbp), %eax
	movslq	-24(%rbp), %rcx
	cmpl	-3456(%rbp,%rcx,4), %eax
	jge	.LBB2_59
# %bb.54:                               #   in Loop: Header=BB2_53 Depth=2
	movq	-72(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	addl	$-1, %eax
	movl	%eax, -64(%rbp)
	jns	.LBB2_56
# %bb.55:                               #   in Loop: Header=BB2_53 Depth=2
	movl	-44(%rbp), %eax
	addl	%eax, -64(%rbp)
.LBB2_56:                               #   in Loop: Header=BB2_53 Depth=2
	movq	-56(%rbp), %rax
	movslq	-64(%rbp), %rcx
	movzbl	(%rax,%rcx), %eax
	movb	%al, -25(%rbp)
	cmpb	$0, -384(%rbp,%rax)
	jne	.LBB2_58
# %bb.57:                               #   in Loop: Header=BB2_53 Depth=2
	movl	-64(%rbp), %eax
	movq	-72(%rbp), %rcx
	movzbl	-25(%rbp), %edx
	movslq	-3456(%rbp,%rdx,4), %rsi
	leal	1(%rsi), %edi
	movl	%edi, -3456(%rbp,%rdx,4)
	movl	%eax, (%rcx,%rsi,4)
	jmp	.LBB2_58
	.p2align	4, 0x90
.LBB2_59:                               #   in Loop: Header=BB2_36 Depth=1
	movq	-40(%rbp), %rax
	movl	-24(%rbp), %ecx
	shll	$8, %ecx
	addl	$256, %ecx                      # imm = 0x100
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	andl	%ebx, %eax
	addl	$-1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB2_60
	.p2align	4, 0x90
.LBB2_65:                               #   in Loop: Header=BB2_60 Depth=2
	addl	$-1, -16(%rbp)
.LBB2_60:                               #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-16(%rbp), %eax
	movslq	-24(%rbp), %rcx
	cmpl	-2432(%rbp,%rcx,4), %eax
	jle	.LBB2_66
# %bb.61:                               #   in Loop: Header=BB2_60 Depth=2
	movq	-72(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	addl	$-1, %eax
	movl	%eax, -64(%rbp)
	jns	.LBB2_63
# %bb.62:                               #   in Loop: Header=BB2_60 Depth=2
	movl	-44(%rbp), %eax
	addl	%eax, -64(%rbp)
.LBB2_63:                               #   in Loop: Header=BB2_60 Depth=2
	movq	-56(%rbp), %rax
	movslq	-64(%rbp), %rcx
	movzbl	(%rax,%rcx), %eax
	movb	%al, -25(%rbp)
	cmpb	$0, -384(%rbp,%rax)
	jne	.LBB2_65
# %bb.64:                               #   in Loop: Header=BB2_60 Depth=2
	movl	-64(%rbp), %eax
	movq	-72(%rbp), %rcx
	movzbl	-25(%rbp), %edx
	movslq	-2432(%rbp,%rdx,4), %rsi
	leal	-1(%rsi), %edi
	movl	%edi, -2432(%rbp,%rdx,4)
	movl	%eax, (%rcx,%rsi,4)
	jmp	.LBB2_65
	.p2align	4, 0x90
.LBB2_66:                               #   in Loop: Header=BB2_36 Depth=1
	movslq	-24(%rbp), %rax
	movl	-3456(%rbp,%rax,4), %ecx
	addl	$-1, %ecx
	cmpl	-2432(%rbp,%rax,4), %ecx
	je	.LBB2_70
# %bb.67:                               #   in Loop: Header=BB2_36 Depth=1
	movslq	-24(%rbp), %rax
	cmpl	$0, -3456(%rbp,%rax,4)
	jne	.LBB2_69
# %bb.68:                               #   in Loop: Header=BB2_36 Depth=1
	movslq	-24(%rbp), %rax
	movl	-44(%rbp), %ecx
	addl	$-1, %ecx
	cmpl	%ecx, -2432(%rbp,%rax,4)
	je	.LBB2_70
.LBB2_69:                               #   in Loop: Header=BB2_36 Depth=1
	movl	$1007, %edi                     # imm = 0x3EF
	callq	BZ2_bz__AssertH__fail
.LBB2_70:                               #   in Loop: Header=BB2_36 Depth=1
	movl	$0, -16(%rbp)
	cmpl	$255, -16(%rbp)
	jg	.LBB2_73
	.p2align	4, 0x90
.LBB2_72:                               #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-40(%rbp), %rax
	movl	-16(%rbp), %ecx
	shll	$8, %ecx
	movslq	-24(%rbp), %rdx
	movslq	%ecx, %rcx
	addq	%rdx, %rcx
	orl	$2097152, (%rax,%rcx,4)         # imm = 0x200000
	addl	$1, -16(%rbp)
	cmpl	$255, -16(%rbp)
	jle	.LBB2_72
.LBB2_73:                               #   in Loop: Header=BB2_36 Depth=1
	movslq	-24(%rbp), %rax
	movb	$1, -384(%rbp,%rax)
	cmpl	$254, -12(%rbp)
	jg	.LBB2_84
# %bb.74:                               #   in Loop: Header=BB2_36 Depth=1
	movq	-40(%rbp), %rax
	movl	-24(%rbp), %ecx
	shll	$8, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %edx
	andl	%ebx, %edx
	movl	%edx, -124(%rbp)
	addl	$256, %ecx                      # imm = 0x100
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	andl	%ebx, %eax
	subl	%edx, %eax
	movl	%eax, -92(%rbp)
	movl	$0, -84(%rbp)
	.p2align	4, 0x90
.LBB2_75:                               #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-92(%rbp), %eax
	movzbl	-84(%rbp), %ecx
	sarl	%cl, %eax
	cmpl	$65535, %eax                    # imm = 0xFFFF
	jl	.LBB2_77
# %bb.76:                               #   in Loop: Header=BB2_75 Depth=2
	addl	$1, -84(%rbp)
	jmp	.LBB2_75
	.p2align	4, 0x90
.LBB2_77:                               #   in Loop: Header=BB2_36 Depth=1
	movl	-92(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB2_78
	.p2align	4, 0x90
.LBB2_81:                               #   in Loop: Header=BB2_78 Depth=2
	addl	$-1, -16(%rbp)
.LBB2_78:                               #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, -16(%rbp)
	js	.LBB2_82
# %bb.79:                               #   in Loop: Header=BB2_78 Depth=2
	movq	-72(%rbp), %rax
	movslq	-124(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	addq	%rdx, %rcx
	movslq	(%rax,%rcx,4), %rax
	movl	%eax, -112(%rbp)
	movzbl	-84(%rbp), %ecx
	sarl	%cl, %edx
	movw	%dx, -106(%rbp)
	movq	-80(%rbp), %rcx
	movw	%dx, (%rcx,%rax,2)
	cmpl	$33, -112(%rbp)
	jg	.LBB2_81
# %bb.80:                               #   in Loop: Header=BB2_78 Depth=2
	movzwl	-106(%rbp), %eax
	movq	-80(%rbp), %rcx
	movslq	-112(%rbp), %rdx
	movslq	-44(%rbp), %rsi
	addq	%rdx, %rsi
	movw	%ax, (%rcx,%rsi,2)
	jmp	.LBB2_81
	.p2align	4, 0x90
.LBB2_82:                               #   in Loop: Header=BB2_36 Depth=1
	movl	-92(%rbp), %eax
	addl	$-1, %eax
	movb	-84(%rbp), %cl
	sarl	%cl, %eax
	cmpl	$65536, %eax                    # imm = 0x10000
	jl	.LBB2_84
# %bb.83:                               #   in Loop: Header=BB2_36 Depth=1
	movl	$1002, %edi                     # imm = 0x3EA
	callq	BZ2_bz__AssertH__fail
	jmp	.LBB2_84
.LBB2_85:
	cmpl	$4, -104(%rbp)
	jl	.LBB2_87
# %bb.86:
	movq	stderr(%rip), %rdi
	movl	-44(%rbp), %edx
	movl	-88(%rbp), %ecx
	movl	%edx, %r8d
	subl	%ecx, %r8d
	movl	$.L.str.8, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB2_87:
	addq	$3448, %rsp                     # imm = 0xD78
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	mainSort, .Lfunc_end2-mainSort
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function mainQSort3
	.type	mainQSort3,@function
mainQSort3:                             # @mainQSort3
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$1392, %rsp                     # imm = 0x570
	movq	%rdi, -40(%rbp)
	movq	%rsi, -120(%rbp)
	movq	%rdx, -160(%rbp)
	movl	%ecx, -148(%rbp)
	movl	%r8d, -180(%rbp)
	movl	%r9d, -176(%rbp)
	movl	%r8d, -1392(%rbp)
	movl	%r9d, -992(%rbp)
	movl	16(%rbp), %eax
	movl	%eax, -592(%rbp)
	movl	$1, -12(%rbp)
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_6:                                #   in Loop: Header=BB3_1 Depth=1
	movq	-40(%rbp), %rdi
	movq	-120(%rbp), %rsi
	movq	-160(%rbp), %rdx
	movl	-148(%rbp), %ecx
	movl	-24(%rbp), %r8d
	movl	-20(%rbp), %r9d
	movl	-16(%rbp), %eax
	pushq	24(%rbp)
	pushq	%rax
	callq	mainSimpleSort
	addq	$16, %rsp
	movq	24(%rbp), %rax
	cmpl	$0, (%rax)
	js	.LBB3_7
.LBB3_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_9 Depth 2
                                        #       Child Loop BB3_14 Depth 3
                                        #     Child Loop BB3_27 Depth 2
                                        #     Child Loop BB3_33 Depth 2
	cmpl	$0, -12(%rbp)
	jle	.LBB3_7
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	cmpl	$98, -12(%rbp)
	jl	.LBB3_4
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	movl	$1001, %edi                     # imm = 0x3E9
	callq	BZ2_bz__AssertH__fail
.LBB3_4:                                #   in Loop: Header=BB3_1 Depth=1
	movslq	-12(%rbp), %rax
	leal	-1(%rax), %ecx
	movl	%ecx, -12(%rbp)
	movl	-1396(%rbp,%rax,4), %ecx
	movl	%ecx, -24(%rbp)
	movl	-996(%rbp,%rax,4), %edx
	movl	%edx, -20(%rbp)
	movl	-596(%rbp,%rax,4), %eax
	movl	%eax, -16(%rbp)
	subl	%ecx, %edx
	cmpl	$20, %edx
	jl	.LBB3_6
# %bb.5:                                #   in Loop: Header=BB3_1 Depth=1
	cmpl	$15, -16(%rbp)
	jge	.LBB3_6
# %bb.8:                                #   in Loop: Header=BB3_1 Depth=1
	movq	-120(%rbp), %r9
	movq	-40(%rbp), %rcx
	movslq	-24(%rbp), %r8
	movl	-16(%rbp), %edx
	movl	(%rcx,%r8,4), %esi
	addl	%edx, %esi
	movzbl	(%r9,%rsi), %edi
	movslq	-20(%rbp), %rax
	movl	(%rcx,%rax,4), %esi
	addl	%edx, %esi
	movzbl	(%r9,%rsi), %esi
	addl	%r8d, %eax
	sarl	%eax
	cltq
	addl	(%rcx,%rax,4), %edx
	movzbl	(%r9,%rdx), %edx
	callq	mmed3
	movzbl	%al, %eax
	movl	%eax, -108(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -32(%rbp)
	movl	%eax, -4(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	%eax, -8(%rbp)
	jmp	.LBB3_9
	.p2align	4, 0x90
.LBB3_11:                               #   in Loop: Header=BB3_9 Depth=2
	movq	-40(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -140(%rbp)
	movslq	-32(%rbp), %rdx
	movl	(%rax,%rdx,4), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-140(%rbp), %eax
	movq	-40(%rbp), %rcx
	movslq	-32(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$1, -32(%rbp)
	addl	$1, -4(%rbp)
.LBB3_9:                                #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_14 Depth 3
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.LBB3_14
# %bb.10:                               #   in Loop: Header=BB3_9 Depth=2
	movq	-120(%rbp), %rax
	movq	-40(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movl	(%rcx,%rdx,4), %ecx
	addl	-16(%rbp), %ecx
	movzbl	(%rax,%rcx), %eax
	subl	-108(%rbp), %eax
	movl	%eax, -56(%rbp)
	je	.LBB3_11
# %bb.12:                               #   in Loop: Header=BB3_9 Depth=2
	cmpl	$0, -56(%rbp)
	jg	.LBB3_14
# %bb.13:                               #   in Loop: Header=BB3_9 Depth=2
	addl	$1, -4(%rbp)
	jmp	.LBB3_9
	.p2align	4, 0x90
.LBB3_16:                               #   in Loop: Header=BB3_14 Depth=3
	movq	-40(%rbp), %rax
	movslq	-8(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -136(%rbp)
	movslq	-28(%rbp), %rdx
	movl	(%rax,%rdx,4), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-136(%rbp), %eax
	movq	-40(%rbp), %rcx
	movslq	-28(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$-1, -28(%rbp)
	addl	$-1, -8(%rbp)
.LBB3_14:                               #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.LBB3_19
# %bb.15:                               #   in Loop: Header=BB3_14 Depth=3
	movq	-120(%rbp), %rax
	movq	-40(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	movl	(%rcx,%rdx,4), %ecx
	addl	-16(%rbp), %ecx
	movzbl	(%rax,%rcx), %eax
	subl	-108(%rbp), %eax
	movl	%eax, -56(%rbp)
	je	.LBB3_16
# %bb.17:                               #   in Loop: Header=BB3_14 Depth=3
	cmpl	$0, -56(%rbp)
	js	.LBB3_19
# %bb.18:                               #   in Loop: Header=BB3_14 Depth=3
	addl	$-1, -8(%rbp)
	jmp	.LBB3_14
.LBB3_19:                               #   in Loop: Header=BB3_9 Depth=2
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.LBB3_20
# %bb.41:                               #   in Loop: Header=BB3_9 Depth=2
	movq	-40(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -132(%rbp)
	movslq	-8(%rbp), %rdx
	movl	(%rax,%rdx,4), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-132(%rbp), %eax
	movq	-40(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$1, -4(%rbp)
	addl	$-1, -8(%rbp)
	jmp	.LBB3_9
	.p2align	4, 0x90
.LBB3_20:                               #   in Loop: Header=BB3_1 Depth=1
	movl	-28(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jge	.LBB3_22
# %bb.21:                               #   in Loop: Header=BB3_1 Depth=1
	movl	-24(%rbp), %eax
	movslq	-12(%rbp), %rcx
	movl	%eax, -1392(%rbp,%rcx,4)
	movl	-20(%rbp), %eax
	movl	%eax, -992(%rbp,%rcx,4)
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -592(%rbp,%rcx,4)
	leal	1(%rcx), %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB3_1
.LBB3_22:                               #   in Loop: Header=BB3_1 Depth=1
	movl	-32(%rbp), %eax
	movl	-4(%rbp), %ecx
	subl	%eax, %ecx
	subl	-24(%rbp), %eax
	cmpl	%ecx, %eax
	jge	.LBB3_24
# %bb.23:                               #   in Loop: Header=BB3_1 Depth=1
	movl	-32(%rbp), %eax
	subl	-24(%rbp), %eax
	jmp	.LBB3_25
.LBB3_24:                               #   in Loop: Header=BB3_1 Depth=1
	movl	-4(%rbp), %eax
	subl	-32(%rbp), %eax
.LBB3_25:                               #   in Loop: Header=BB3_1 Depth=1
	movl	%eax, -56(%rbp)
	movl	-24(%rbp), %ecx
	movl	%ecx, -104(%rbp)
	movl	-4(%rbp), %ecx
	subl	%eax, %ecx
	movl	%ecx, -88(%rbp)
	movl	%eax, -100(%rbp)
	cmpl	$0, -100(%rbp)
	jle	.LBB3_28
	.p2align	4, 0x90
.LBB3_27:                               #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-40(%rbp), %rax
	movslq	-104(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -128(%rbp)
	movslq	-88(%rbp), %rdx
	movl	(%rax,%rdx,4), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-128(%rbp), %eax
	movq	-40(%rbp), %rcx
	movslq	-88(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$1, -104(%rbp)
	addl	$1, -88(%rbp)
	addl	$-1, -100(%rbp)
	cmpl	$0, -100(%rbp)
	jg	.LBB3_27
.LBB3_28:                               #   in Loop: Header=BB3_1 Depth=1
	movl	-20(%rbp), %eax
	movl	-28(%rbp), %ecx
	subl	%ecx, %eax
	subl	-8(%rbp), %ecx
	cmpl	%ecx, %eax
	jge	.LBB3_30
# %bb.29:                               #   in Loop: Header=BB3_1 Depth=1
	movl	-20(%rbp), %eax
	subl	-28(%rbp), %eax
	jmp	.LBB3_31
.LBB3_30:                               #   in Loop: Header=BB3_1 Depth=1
	movl	-28(%rbp), %eax
	subl	-8(%rbp), %eax
.LBB3_31:                               #   in Loop: Header=BB3_1 Depth=1
	movl	%eax, -144(%rbp)
	movl	-4(%rbp), %ecx
	movl	%ecx, -96(%rbp)
	movl	-20(%rbp), %ecx
	subl	%eax, %ecx
	addl	$1, %ecx
	movl	%ecx, -84(%rbp)
	movl	%eax, -92(%rbp)
	cmpl	$0, -92(%rbp)
	jle	.LBB3_34
	.p2align	4, 0x90
.LBB3_33:                               #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-40(%rbp), %rax
	movslq	-96(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -124(%rbp)
	movslq	-84(%rbp), %rdx
	movl	(%rax,%rdx,4), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-124(%rbp), %eax
	movq	-40(%rbp), %rcx
	movslq	-84(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$1, -96(%rbp)
	addl	$1, -84(%rbp)
	addl	$-1, -92(%rbp)
	cmpl	$0, -92(%rbp)
	jg	.LBB3_33
.LBB3_34:                               #   in Loop: Header=BB3_1 Depth=1
	movl	-24(%rbp), %r9d
	movl	-4(%rbp), %ecx
	addl	%r9d, %ecx
	subl	-32(%rbp), %ecx
	leal	-1(%rcx), %edx
	movl	-8(%rbp), %esi
	subl	-28(%rbp), %esi
	movl	%edx, -56(%rbp)
	movl	-20(%rbp), %edi
	leal	(%rdi,%rsi), %r8d
	addl	%edi, %esi
	addl	$1, %esi
	movl	%esi, -144(%rbp)
	movl	%r9d, -80(%rbp)
	movl	%edx, -68(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -52(%rbp)
	movl	%esi, -76(%rbp)
	movl	%edi, -64(%rbp)
	movl	%eax, -48(%rbp)
	movl	%ecx, -72(%rbp)
	movl	%r8d, -60(%rbp)
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	subl	%r9d, %edx
	subl	%esi, %edi
	cmpl	%edi, %edx
	jge	.LBB3_36
# %bb.35:                               #   in Loop: Header=BB3_1 Depth=1
	rolq	$32, -80(%rbp)
	rolq	$32, -68(%rbp)
	movl	-52(%rbp), %eax
	movl	-48(%rbp), %ecx
	movl	%eax, -172(%rbp)
	movl	%ecx, -52(%rbp)
	movl	%eax, -48(%rbp)
.LBB3_36:                               #   in Loop: Header=BB3_1 Depth=1
	movl	-64(%rbp), %eax
	subl	-76(%rbp), %eax
	movl	-60(%rbp), %ecx
	subl	-72(%rbp), %ecx
	cmpl	%ecx, %eax
	jge	.LBB3_38
# %bb.37:                               #   in Loop: Header=BB3_1 Depth=1
	rolq	$32, -76(%rbp)
	rolq	$32, -64(%rbp)
	movl	-48(%rbp), %eax
	movl	-44(%rbp), %ecx
	movl	%eax, -168(%rbp)
	movl	%ecx, -48(%rbp)
	movl	%eax, -44(%rbp)
.LBB3_38:                               #   in Loop: Header=BB3_1 Depth=1
	movl	-68(%rbp), %eax
	subl	-80(%rbp), %eax
	movl	-64(%rbp), %ecx
	subl	-76(%rbp), %ecx
	cmpl	%ecx, %eax
	jge	.LBB3_40
# %bb.39:                               #   in Loop: Header=BB3_1 Depth=1
	rolq	$32, -80(%rbp)
	rolq	$32, -68(%rbp)
	movl	-52(%rbp), %eax
	movl	-48(%rbp), %ecx
	movl	%eax, -164(%rbp)
	movl	%ecx, -52(%rbp)
	movl	%eax, -48(%rbp)
.LBB3_40:                               #   in Loop: Header=BB3_1 Depth=1
	movslq	-12(%rbp), %rax
	movl	-80(%rbp), %ecx
	movl	-76(%rbp), %edx
	movl	%ecx, -1392(%rbp,%rax,4)
	movl	-68(%rbp), %ecx
	movl	-64(%rbp), %esi
	movl	%ecx, -992(%rbp,%rax,4)
	movl	-52(%rbp), %ecx
	movl	%ecx, -592(%rbp,%rax,4)
	leal	1(%rax), %ecx
	movl	%ecx, -12(%rbp)
	movl	%edx, -1388(%rbp,%rax,4)
	movl	%esi, -988(%rbp,%rax,4)
	movl	-48(%rbp), %ecx
	movl	%ecx, -588(%rbp,%rax,4)
	leal	2(%rax), %ecx
	movl	%ecx, -12(%rbp)
	movl	-72(%rbp), %ecx
	movl	%ecx, -1384(%rbp,%rax,4)
	movl	-60(%rbp), %ecx
	movl	%ecx, -984(%rbp,%rax,4)
	movl	-44(%rbp), %ecx
	movl	%ecx, -584(%rbp,%rax,4)
	addl	$3, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB3_1
.LBB3_7:
	addq	$1392, %rsp                     # imm = 0x570
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	mainQSort3, .Lfunc_end3-mainQSort3
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function mainSimpleSort
	.type	mainSimpleSort,@function
mainSimpleSort:                         # @mainSimpleSort
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	%rdi, -32(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%ecx, -44(%rbp)
	movl	%r8d, -36(%rbp)
	movl	%r9d, -40(%rbp)
	subl	%r8d, %r9d
	addl	$1, %r9d
	movl	%r9d, -68(%rbp)
	cmpl	$2, %r9d
	jge	.LBB4_1
.LBB4_19:
	addq	$80, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB4_1:
	.cfi_def_cfa %rbp, 16
	movl	$0, -20(%rbp)
	.p2align	4, 0x90
.LBB4_2:                                # =>This Inner Loop Header: Depth=1
	movslq	-20(%rbp), %rax
	movl	incs(,%rax,4), %eax
	cmpl	-68(%rbp), %eax
	jge	.LBB4_4
# %bb.3:                                #   in Loop: Header=BB4_2 Depth=1
	addl	$1, -20(%rbp)
	jmp	.LBB4_2
	.p2align	4, 0x90
.LBB4_5:                                #   in Loop: Header=BB4_4 Depth=1
	movslq	-20(%rbp), %rax
	movl	incs(,%rax,4), %eax
	movl	%eax, -8(%rbp)
	addl	-36(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB4_6
	.p2align	4, 0x90
.LBB4_18:                               #   in Loop: Header=BB4_6 Depth=2
	movl	-16(%rbp), %eax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$1, -12(%rbp)
	movq	24(%rbp), %rax
	cmpl	$0, (%rax)
	js	.LBB4_19
.LBB4_6:                                #   Parent Loop BB4_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_8 Depth 3
                                        #       Child Loop BB4_12 Depth 3
                                        #       Child Loop BB4_16 Depth 3
	movl	-12(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jg	.LBB4_4
# %bb.7:                                #   in Loop: Header=BB4_6 Depth=2
	movq	-32(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -16(%rbp)
	movl	%ecx, -4(%rbp)
	.p2align	4, 0x90
.LBB4_8:                                #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	subq	%rdx, %rcx
	movl	16(%rbp), %esi
	movl	(%rax,%rcx,4), %edi
	addl	%esi, %edi
	addl	-16(%rbp), %esi
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movl	-44(%rbp), %r8d
	movq	24(%rbp), %r9
	callq	mainGtU
	testb	%al, %al
	je	.LBB4_10
# %bb.9:                                #   in Loop: Header=BB4_8 Depth=3
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	movq	%rcx, %rsi
	subq	%rdx, %rsi
	movl	(%rax,%rsi,4), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %ecx
	subl	%ecx, %eax
	movl	%eax, -4(%rbp)
	movl	-36(%rbp), %edx
	addl	%edx, %ecx
	addl	$-1, %ecx
	cmpl	%ecx, %eax
	jg	.LBB4_8
.LBB4_10:                               #   in Loop: Header=BB4_6 Depth=2
	movl	-16(%rbp), %eax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	cmpl	-40(%rbp), %eax
	jg	.LBB4_4
# %bb.11:                               #   in Loop: Header=BB4_6 Depth=2
	movq	-32(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -16(%rbp)
	movl	%ecx, -4(%rbp)
	.p2align	4, 0x90
.LBB4_12:                               #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	subq	%rdx, %rcx
	movl	16(%rbp), %esi
	movl	(%rax,%rcx,4), %edi
	addl	%esi, %edi
	addl	-16(%rbp), %esi
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movl	-44(%rbp), %r8d
	movq	24(%rbp), %r9
	callq	mainGtU
	testb	%al, %al
	je	.LBB4_14
# %bb.13:                               #   in Loop: Header=BB4_12 Depth=3
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	movq	%rcx, %rsi
	subq	%rdx, %rsi
	movl	(%rax,%rsi,4), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %ecx
	subl	%ecx, %eax
	movl	%eax, -4(%rbp)
	movl	-36(%rbp), %edx
	addl	%edx, %ecx
	addl	$-1, %ecx
	cmpl	%ecx, %eax
	jg	.LBB4_12
.LBB4_14:                               #   in Loop: Header=BB4_6 Depth=2
	movl	-16(%rbp), %eax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	cmpl	-40(%rbp), %eax
	jg	.LBB4_4
# %bb.15:                               #   in Loop: Header=BB4_6 Depth=2
	movq	-32(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -16(%rbp)
	movl	%ecx, -4(%rbp)
	.p2align	4, 0x90
.LBB4_16:                               #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	subq	%rdx, %rcx
	movl	16(%rbp), %esi
	movl	(%rax,%rcx,4), %edi
	addl	%esi, %edi
	addl	-16(%rbp), %esi
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movl	-44(%rbp), %r8d
	movq	24(%rbp), %r9
	callq	mainGtU
	testb	%al, %al
	je	.LBB4_18
# %bb.17:                               #   in Loop: Header=BB4_16 Depth=3
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	movq	%rcx, %rsi
	subq	%rdx, %rsi
	movl	(%rax,%rsi,4), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %ecx
	subl	%ecx, %eax
	movl	%eax, -4(%rbp)
	movl	-36(%rbp), %edx
	addl	%edx, %ecx
	addl	$-1, %ecx
	cmpl	%ecx, %eax
	jg	.LBB4_16
	jmp	.LBB4_18
	.p2align	4, 0x90
.LBB4_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_6 Depth 2
                                        #       Child Loop BB4_8 Depth 3
                                        #       Child Loop BB4_12 Depth 3
                                        #       Child Loop BB4_16 Depth 3
	addl	$-1, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jns	.LBB4_5
	jmp	.LBB4_19
.Lfunc_end4:
	.size	mainSimpleSort, .Lfunc_end4-mainSimpleSort
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function mmed3
	.type	mmed3,@function
mmed3:                                  # @mmed3
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	%dil, -2(%rbp)
	movb	%sil, -1(%rbp)
	movb	%dl, -3(%rbp)
	cmpl	%esi, %edi
	jle	.LBB5_2
# %bb.1:
	movb	-2(%rbp), %al
	movb	%al, -4(%rbp)
	movb	-1(%rbp), %cl
	movb	%cl, -2(%rbp)
	movb	%al, -1(%rbp)
.LBB5_2:
	movzbl	-1(%rbp), %eax
	movzbl	-3(%rbp), %ecx
	cmpl	%ecx, %eax
	jle	.LBB5_5
# %bb.3:
	movzbl	-3(%rbp), %eax
	movb	%al, -1(%rbp)
	movzbl	-2(%rbp), %ecx
	cmpl	%eax, %ecx
	jle	.LBB5_5
# %bb.4:
	movb	-2(%rbp), %al
	movb	%al, -1(%rbp)
.LBB5_5:
	movb	-1(%rbp), %al
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	mmed3, .Lfunc_end5-mmed3
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function mainGtU
	.type	mainGtU,@function
mainGtU:                                # @mainGtU
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -12(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -40(%rbp)
	movl	%r8d, -28(%rbp)
	movq	%r9, -56(%rbp)
	movl	%edi, %eax
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movl	%esi, %ecx
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.3:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.4:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.5:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.6:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.7:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.8:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.9:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.10:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.11:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.12:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.13:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	je	.LBB6_14
.LBB6_1:
	movzbl	-2(%rbp), %eax
	movzbl	-1(%rbp), %ecx
.LBB6_2:
	cmpl	%ecx, %eax
	setg	-3(%rbp)
.LBB6_38:
	movb	-3(%rbp), %al
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB6_14:
	.cfi_def_cfa %rbp, 16
	addl	$1, -12(%rbp)
	addl	$1, -8(%rbp)
	movl	-28(%rbp), %eax
	addl	$8, %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB6_15
.LBB6_36:                               #   in Loop: Header=BB6_15 Depth=1
	addl	$-8, -44(%rbp)
	movq	-56(%rbp), %rax
	addl	$-1, (%rax)
	cmpl	$0, -44(%rbp)
	js	.LBB6_37
.LBB6_15:                               # =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	movl	-12(%rbp), %ecx
	movzbl	(%rax,%rcx), %ecx
	movb	%cl, -2(%rbp)
	movl	-8(%rbp), %edx
	movzbl	(%rax,%rdx), %eax
	movb	%al, -1(%rbp)
	cmpl	%eax, %ecx
	jne	.LBB6_1
# %bb.16:                               #   in Loop: Header=BB6_15 Depth=1
	movq	-40(%rbp), %rax
	movl	-12(%rbp), %ecx
	movzwl	(%rax,%rcx,2), %ecx
	movw	%cx, -16(%rbp)
	movl	-8(%rbp), %edx
	movzwl	(%rax,%rdx,2), %eax
	movw	%ax, -14(%rbp)
	cmpl	%eax, %ecx
	jne	.LBB6_17
# %bb.18:                               #   in Loop: Header=BB6_15 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.19:                               #   in Loop: Header=BB6_15 Depth=1
	movq	-40(%rbp), %rax
	movl	-12(%rbp), %ecx
	movzwl	(%rax,%rcx,2), %ecx
	movw	%cx, -16(%rbp)
	movl	-8(%rbp), %edx
	movzwl	(%rax,%rdx,2), %eax
	movw	%ax, -14(%rbp)
	cmpl	%eax, %ecx
	jne	.LBB6_17
# %bb.20:                               #   in Loop: Header=BB6_15 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.21:                               #   in Loop: Header=BB6_15 Depth=1
	movq	-40(%rbp), %rax
	movl	-12(%rbp), %ecx
	movzwl	(%rax,%rcx,2), %ecx
	movw	%cx, -16(%rbp)
	movl	-8(%rbp), %edx
	movzwl	(%rax,%rdx,2), %eax
	movw	%ax, -14(%rbp)
	cmpl	%eax, %ecx
	jne	.LBB6_17
# %bb.22:                               #   in Loop: Header=BB6_15 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.23:                               #   in Loop: Header=BB6_15 Depth=1
	movq	-40(%rbp), %rax
	movl	-12(%rbp), %ecx
	movzwl	(%rax,%rcx,2), %ecx
	movw	%cx, -16(%rbp)
	movl	-8(%rbp), %edx
	movzwl	(%rax,%rdx,2), %eax
	movw	%ax, -14(%rbp)
	cmpl	%eax, %ecx
	jne	.LBB6_17
# %bb.24:                               #   in Loop: Header=BB6_15 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.25:                               #   in Loop: Header=BB6_15 Depth=1
	movq	-40(%rbp), %rax
	movl	-12(%rbp), %ecx
	movzwl	(%rax,%rcx,2), %ecx
	movw	%cx, -16(%rbp)
	movl	-8(%rbp), %edx
	movzwl	(%rax,%rdx,2), %eax
	movw	%ax, -14(%rbp)
	cmpl	%eax, %ecx
	jne	.LBB6_17
# %bb.26:                               #   in Loop: Header=BB6_15 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.27:                               #   in Loop: Header=BB6_15 Depth=1
	movq	-40(%rbp), %rax
	movl	-12(%rbp), %ecx
	movzwl	(%rax,%rcx,2), %ecx
	movw	%cx, -16(%rbp)
	movl	-8(%rbp), %edx
	movzwl	(%rax,%rdx,2), %eax
	movw	%ax, -14(%rbp)
	cmpl	%eax, %ecx
	jne	.LBB6_17
# %bb.28:                               #   in Loop: Header=BB6_15 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.29:                               #   in Loop: Header=BB6_15 Depth=1
	movq	-40(%rbp), %rax
	movl	-12(%rbp), %ecx
	movzwl	(%rax,%rcx,2), %ecx
	movw	%cx, -16(%rbp)
	movl	-8(%rbp), %edx
	movzwl	(%rax,%rdx,2), %eax
	movw	%ax, -14(%rbp)
	cmpl	%eax, %ecx
	jne	.LBB6_17
# %bb.30:                               #   in Loop: Header=BB6_15 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rdx
	movzbl	(%rdx,%rax), %eax
	movb	%al, -2(%rbp)
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, -1(%rbp)
	cmpl	%ecx, %eax
	jne	.LBB6_1
# %bb.31:                               #   in Loop: Header=BB6_15 Depth=1
	movq	-40(%rbp), %rax
	movl	-12(%rbp), %ecx
	movzwl	(%rax,%rcx,2), %ecx
	movw	%cx, -16(%rbp)
	movl	-8(%rbp), %edx
	movzwl	(%rax,%rdx,2), %eax
	movw	%ax, -14(%rbp)
	cmpl	%eax, %ecx
	jne	.LBB6_17
# %bb.32:                               #   in Loop: Header=BB6_15 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, -8(%rbp)
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	cmpl	-28(%rbp), %eax
	jb	.LBB6_34
# %bb.33:                               #   in Loop: Header=BB6_15 Depth=1
	movl	-28(%rbp), %eax
	subl	%eax, -12(%rbp)
.LBB6_34:                               #   in Loop: Header=BB6_15 Depth=1
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jb	.LBB6_36
# %bb.35:                               #   in Loop: Header=BB6_15 Depth=1
	movl	-28(%rbp), %eax
	subl	%eax, -8(%rbp)
	jmp	.LBB6_36
.LBB6_17:
	movzwl	-16(%rbp), %eax
	movzwl	-14(%rbp), %ecx
	jmp	.LBB6_2
.LBB6_37:
	movb	$0, -3(%rbp)
	jmp	.LBB6_38
.Lfunc_end6:
	.size	mainGtU, .Lfunc_end6-mainGtU
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function fallbackQSort3
	.type	fallbackQSort3,@function
fallbackQSort3:                         # @fallbackQSort3
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$936, %rsp                      # imm = 0x3A8
	.cfi_offset %rbx, -24
	movq	%rdi, -48(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -132(%rbp)
	movl	%ecx, -128(%rbp)
	movl	$0, -100(%rbp)
	movl	%edx, -944(%rbp)
	movl	%ecx, -544(%rbp)
	movl	$1, -28(%rbp)
	movl	$2863311531, %ebx               # imm = 0xAAAAAAAB
	jmp	.LBB7_1
	.p2align	4, 0x90
.LBB7_5:                                #   in Loop: Header=BB7_1 Depth=1
	movq	-48(%rbp), %rdi
	movq	-80(%rbp), %rsi
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %ecx
	callq	fallbackSimpleSort
.LBB7_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_12 Depth 2
                                        #       Child Loop BB7_17 Depth 3
                                        #     Child Loop BB7_29 Depth 2
                                        #     Child Loop BB7_35 Depth 2
	cmpl	$0, -28(%rbp)
	jle	.LBB7_40
# %bb.2:                                #   in Loop: Header=BB7_1 Depth=1
	cmpl	$99, -28(%rbp)
	jl	.LBB7_4
# %bb.3:                                #   in Loop: Header=BB7_1 Depth=1
	movl	$1004, %edi                     # imm = 0x3EC
	callq	BZ2_bz__AssertH__fail
.LBB7_4:                                #   in Loop: Header=BB7_1 Depth=1
	movslq	-28(%rbp), %rax
	leal	-1(%rax), %ecx
	movl	%ecx, -28(%rbp)
	movl	-948(%rbp,%rax,4), %ecx
	movl	%ecx, -24(%rbp)
	movl	-548(%rbp,%rax,4), %eax
	movl	%eax, -20(%rbp)
	subl	%ecx, %eax
	cmpl	$9, %eax
	jle	.LBB7_5
# %bb.6:                                #   in Loop: Header=BB7_1 Depth=1
	imull	$7621, -100(%rbp), %eax         # imm = 0x1DC5
	addl	$1, %eax
	andl	$32767, %eax                    # imm = 0x7FFF
	movl	%eax, -100(%rbp)
	movq	%rax, %rcx
	imulq	%rbx, %rcx
	shrq	$33, %rcx
	leal	(%rcx,%rcx,2), %ecx
	subl	%ecx, %eax
	movl	%eax, -124(%rbp)
	je	.LBB7_7
# %bb.8:                                #   in Loop: Header=BB7_1 Depth=1
	cmpl	$1, -124(%rbp)
	jne	.LBB7_10
# %bb.9:                                #   in Loop: Header=BB7_1 Depth=1
	movq	-80(%rbp), %rax
	movq	-48(%rbp), %rcx
	movl	-24(%rbp), %edx
	addl	-20(%rbp), %edx
	sarl	%edx
	movslq	%edx, %rdx
	jmp	.LBB7_11
.LBB7_7:                                #   in Loop: Header=BB7_1 Depth=1
	movq	-80(%rbp), %rax
	movq	-48(%rbp), %rcx
	movslq	-24(%rbp), %rdx
	jmp	.LBB7_11
.LBB7_10:                               #   in Loop: Header=BB7_1 Depth=1
	movq	-80(%rbp), %rax
	movq	-48(%rbp), %rcx
	movslq	-20(%rbp), %rdx
.LBB7_11:                               #   in Loop: Header=BB7_1 Depth=1
	movl	(%rcx,%rdx,4), %ecx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -56(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -36(%rbp)
	movl	%eax, -12(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -32(%rbp)
	movl	%eax, -16(%rbp)
	jmp	.LBB7_12
	.p2align	4, 0x90
.LBB7_14:                               #   in Loop: Header=BB7_12 Depth=2
	movq	-48(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -120(%rbp)
	movslq	-36(%rbp), %rdx
	movl	(%rax,%rdx,4), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-120(%rbp), %eax
	movq	-48(%rbp), %rcx
	movslq	-36(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$1, -36(%rbp)
	addl	$1, -12(%rbp)
.LBB7_12:                               #   Parent Loop BB7_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_17 Depth 3
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB7_17
# %bb.13:                               #   in Loop: Header=BB7_12 Depth=2
	movq	-80(%rbp), %rax
	movq	-48(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movl	(%rcx,%rdx,4), %ecx
	movl	(%rax,%rcx,4), %eax
	subl	-56(%rbp), %eax
	movl	%eax, -52(%rbp)
	je	.LBB7_14
# %bb.15:                               #   in Loop: Header=BB7_12 Depth=2
	cmpl	$0, -52(%rbp)
	jg	.LBB7_17
# %bb.16:                               #   in Loop: Header=BB7_12 Depth=2
	addl	$1, -12(%rbp)
	jmp	.LBB7_12
	.p2align	4, 0x90
.LBB7_19:                               #   in Loop: Header=BB7_17 Depth=3
	movq	-48(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -116(%rbp)
	movslq	-32(%rbp), %rdx
	movl	(%rax,%rdx,4), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-116(%rbp), %eax
	movq	-48(%rbp), %rcx
	movslq	-32(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$-1, -32(%rbp)
	addl	$-1, -16(%rbp)
.LBB7_17:                               #   Parent Loop BB7_1 Depth=1
                                        #     Parent Loop BB7_12 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB7_22
# %bb.18:                               #   in Loop: Header=BB7_17 Depth=3
	movq	-80(%rbp), %rax
	movq	-48(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	movl	(%rcx,%rdx,4), %ecx
	movl	(%rax,%rcx,4), %eax
	subl	-56(%rbp), %eax
	movl	%eax, -52(%rbp)
	je	.LBB7_19
# %bb.20:                               #   in Loop: Header=BB7_17 Depth=3
	cmpl	$0, -52(%rbp)
	js	.LBB7_22
# %bb.21:                               #   in Loop: Header=BB7_17 Depth=3
	addl	$-1, -16(%rbp)
	jmp	.LBB7_17
.LBB7_22:                               #   in Loop: Header=BB7_12 Depth=2
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB7_23
# %bb.41:                               #   in Loop: Header=BB7_12 Depth=2
	movq	-48(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -112(%rbp)
	movslq	-16(%rbp), %rdx
	movl	(%rax,%rdx,4), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-112(%rbp), %eax
	movq	-48(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$1, -12(%rbp)
	addl	$-1, -16(%rbp)
	jmp	.LBB7_12
	.p2align	4, 0x90
.LBB7_23:                               #   in Loop: Header=BB7_1 Depth=1
	movl	-32(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.LBB7_1
# %bb.24:                               #   in Loop: Header=BB7_1 Depth=1
	movl	-36(%rbp), %eax
	movl	-12(%rbp), %ecx
	subl	%eax, %ecx
	subl	-24(%rbp), %eax
	cmpl	%ecx, %eax
	jge	.LBB7_26
# %bb.25:                               #   in Loop: Header=BB7_1 Depth=1
	movl	-36(%rbp), %eax
	subl	-24(%rbp), %eax
	jmp	.LBB7_27
.LBB7_26:                               #   in Loop: Header=BB7_1 Depth=1
	movl	-12(%rbp), %eax
	subl	-36(%rbp), %eax
.LBB7_27:                               #   in Loop: Header=BB7_1 Depth=1
	movl	%eax, -52(%rbp)
	movl	-24(%rbp), %ecx
	movl	%ecx, -96(%rbp)
	movl	-12(%rbp), %ecx
	subl	%eax, %ecx
	movl	%ecx, -64(%rbp)
	movl	%eax, -92(%rbp)
	cmpl	$0, -92(%rbp)
	jle	.LBB7_30
	.p2align	4, 0x90
.LBB7_29:                               #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-48(%rbp), %rax
	movslq	-96(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -108(%rbp)
	movslq	-64(%rbp), %rdx
	movl	(%rax,%rdx,4), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-108(%rbp), %eax
	movq	-48(%rbp), %rcx
	movslq	-64(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$1, -96(%rbp)
	addl	$1, -64(%rbp)
	addl	$-1, -92(%rbp)
	cmpl	$0, -92(%rbp)
	jg	.LBB7_29
.LBB7_30:                               #   in Loop: Header=BB7_1 Depth=1
	movl	-20(%rbp), %eax
	movl	-32(%rbp), %ecx
	subl	%ecx, %eax
	subl	-16(%rbp), %ecx
	cmpl	%ecx, %eax
	jge	.LBB7_32
# %bb.31:                               #   in Loop: Header=BB7_1 Depth=1
	movl	-20(%rbp), %eax
	subl	-32(%rbp), %eax
	jmp	.LBB7_33
.LBB7_32:                               #   in Loop: Header=BB7_1 Depth=1
	movl	-32(%rbp), %eax
	subl	-16(%rbp), %eax
.LBB7_33:                               #   in Loop: Header=BB7_1 Depth=1
	movl	%eax, -68(%rbp)
	movl	-12(%rbp), %ecx
	movl	%ecx, -88(%rbp)
	movl	-20(%rbp), %ecx
	subl	%eax, %ecx
	addl	$1, %ecx
	movl	%ecx, -60(%rbp)
	movl	%eax, -84(%rbp)
	cmpl	$0, -84(%rbp)
	jle	.LBB7_36
	.p2align	4, 0x90
.LBB7_35:                               #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-48(%rbp), %rax
	movslq	-88(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -104(%rbp)
	movslq	-60(%rbp), %rdx
	movl	(%rax,%rdx,4), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-104(%rbp), %eax
	movq	-48(%rbp), %rcx
	movslq	-60(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$1, -88(%rbp)
	addl	$1, -60(%rbp)
	addl	$-1, -84(%rbp)
	cmpl	$0, -84(%rbp)
	jg	.LBB7_35
.LBB7_36:                               #   in Loop: Header=BB7_1 Depth=1
	movl	-12(%rbp), %eax
	movl	-24(%rbp), %ecx
	addl	%eax, %ecx
	movl	-36(%rbp), %edx
	notl	%edx
	addl	%edx, %ecx
	movl	%ecx, -52(%rbp)
	movl	-16(%rbp), %ecx
	subl	-32(%rbp), %ecx
	movl	-20(%rbp), %esi
	addl	%esi, %ecx
	addl	$1, %ecx
	movl	%ecx, -68(%rbp)
	addl	%eax, %edx
	subl	%ecx, %esi
	cmpl	%esi, %edx
	jle	.LBB7_39
# %bb.37:                               #   in Loop: Header=BB7_1 Depth=1
	movl	-24(%rbp), %eax
	movslq	-28(%rbp), %rcx
	movl	%eax, -944(%rbp,%rcx,4)
	movl	-52(%rbp), %eax
	movl	%eax, -544(%rbp,%rcx,4)
	movl	-68(%rbp), %eax
	movl	%eax, -940(%rbp,%rcx,4)
	movl	-20(%rbp), %eax
	jmp	.LBB7_38
.LBB7_39:                               #   in Loop: Header=BB7_1 Depth=1
	movl	-68(%rbp), %eax
	movslq	-28(%rbp), %rcx
	movl	%eax, -944(%rbp,%rcx,4)
	movl	-20(%rbp), %eax
	movl	%eax, -544(%rbp,%rcx,4)
	movl	-24(%rbp), %eax
	movl	%eax, -940(%rbp,%rcx,4)
	movl	-52(%rbp), %eax
.LBB7_38:                               #   in Loop: Header=BB7_1 Depth=1
	movl	%eax, -540(%rbp,%rcx,4)
	leal	2(%rcx), %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB7_1
.LBB7_40:
	addq	$936, %rsp                      # imm = 0x3A8
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end7:
	.size	fallbackQSort3, .Lfunc_end7-fallbackQSort3
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function fallbackSimpleSort
	.type	fallbackSimpleSort,@function
fallbackSimpleSort:                     # @fallbackSimpleSort
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, -12(%rbp)
	cmpl	%ecx, %edx
	jne	.LBB8_1
.LBB8_20:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB8_1:
	.cfi_def_cfa %rbp, 16
	movl	-12(%rbp), %eax
	subl	-36(%rbp), %eax
	cmpl	$4, %eax
	jl	.LBB8_11
# %bb.2:
	movl	-12(%rbp), %eax
	addl	$-4, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB8_3
	.p2align	4, 0x90
.LBB8_10:                               #   in Loop: Header=BB8_3 Depth=1
	movl	-32(%rbp), %eax
	movq	-24(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movl	%eax, -16(%rcx,%rdx,4)
	addl	$-1, -8(%rbp)
.LBB8_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_5 Depth 2
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.LBB8_11
# %bb.4:                                #   in Loop: Header=BB8_3 Depth=1
	movq	-24(%rbp), %rax
	movslq	-8(%rbp), %rcx
	movslq	(%rax,%rcx,4), %rax
	movl	%eax, -32(%rbp)
	movq	-48(%rbp), %rdx
	movl	(%rdx,%rax,4), %eax
	movl	%eax, -28(%rbp)
	leal	4(%rcx), %eax
	movl	%eax, -4(%rbp)
	.p2align	4, 0x90
.LBB8_5:                                #   Parent Loop BB8_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jg	.LBB8_6
# %bb.7:                                #   in Loop: Header=BB8_5 Depth=2
	movl	-28(%rbp), %eax
	movq	-48(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movslq	-4(%rbp), %rsi
	movl	(%rdx,%rsi,4), %edx
	cmpl	(%rcx,%rdx,4), %eax
	seta	%al
	testb	%al, %al
	jne	.LBB8_9
	jmp	.LBB8_10
	.p2align	4, 0x90
.LBB8_6:                                #   in Loop: Header=BB8_5 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	je	.LBB8_10
.LBB8_9:                                #   in Loop: Header=BB8_5 Depth=2
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -16(%rax,%rcx,4)
	addl	$4, -4(%rbp)
	jmp	.LBB8_5
.LBB8_11:
	movl	-12(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB8_12
	.p2align	4, 0x90
.LBB8_19:                               #   in Loop: Header=BB8_12 Depth=1
	movl	-32(%rbp), %eax
	movq	-24(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movl	%eax, -4(%rcx,%rdx,4)
	addl	$-1, -8(%rbp)
.LBB8_12:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_14 Depth 2
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.LBB8_20
# %bb.13:                               #   in Loop: Header=BB8_12 Depth=1
	movq	-24(%rbp), %rax
	movslq	-8(%rbp), %rcx
	movslq	(%rax,%rcx,4), %rax
	movl	%eax, -32(%rbp)
	movq	-48(%rbp), %rdx
	movl	(%rdx,%rax,4), %eax
	movl	%eax, -28(%rbp)
	leal	1(%rcx), %eax
	movl	%eax, -4(%rbp)
	.p2align	4, 0x90
.LBB8_14:                               #   Parent Loop BB8_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jg	.LBB8_15
# %bb.16:                               #   in Loop: Header=BB8_14 Depth=2
	movl	-28(%rbp), %eax
	movq	-48(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movslq	-4(%rbp), %rsi
	movl	(%rdx,%rsi,4), %edx
	cmpl	(%rcx,%rdx,4), %eax
	seta	%al
	testb	%al, %al
	jne	.LBB8_18
	jmp	.LBB8_19
	.p2align	4, 0x90
.LBB8_15:                               #   in Loop: Header=BB8_14 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	je	.LBB8_19
.LBB8_18:                               #   in Loop: Header=BB8_14 Depth=2
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -4(%rax,%rcx,4)
	addl	$1, -4(%rbp)
	jmp	.LBB8_14
.Lfunc_end8:
	.size	fallbackSimpleSort, .Lfunc_end8-fallbackSimpleSort
	.cfi_endproc
                                        # -- End function
	.globl	main1                           # -- Begin function main1
	.p2align	4, 0x90
	.type	main1,@function
main1:                                  # @main1
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset %rbx, -24
	movl	%edi, -60(%rbp)
	movq	%rsi, -72(%rbp)
	movq	$0, outputHandleJustInCase(%rip)
	movb	$0, smallMode(%rip)
	movb	$0, keepInputFiles(%rip)
	movb	$0, forceOverwrite(%rip)
	movb	$1, noisy(%rip)
	movl	$0, verbosity(%rip)
	movl	$9, blockSize100k(%rip)
	movb	$0, testFailsExist(%rip)
	movb	$0, unzFailsExist(%rip)
	movl	$0, numFileNames(%rip)
	movl	$0, numFilesProcessed(%rip)
	movl	$30, workFactor(%rip)
	movb	$0, deleteOutputOnInterrupt(%rip)
	movl	$0, exitValue(%rip)
	movl	$0, -28(%rbp)
	movl	$0, -44(%rbp)
	movl	$mySIGSEGVorSIGBUScatcher, %esi
	movl	$11, %edi
	callq	signal
	movl	$mySIGSEGVorSIGBUScatcher, %esi
	movl	$7, %edi
	callq	signal
	movl	$inName, %edi
	movl	$.L.str.6.15, %esi
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str.6.15, %esi
	callq	copyFileName
	movq	-72(%rbp), %rax
	movq	(%rax), %rsi
	movl	$progNameReally, %edi
	callq	copyFileName
	movq	$progNameReally, progName(%rip)
	movq	$progNameReally, -56(%rbp)
	jmp	.LBB9_2
	.p2align	4, 0x90
.LBB9_1:                                #   in Loop: Header=BB9_2 Depth=1
	addq	$1, -56(%rbp)
.LBB9_2:                                # =>This Inner Loop Header: Depth=1
	movq	-56(%rbp), %rax
	cmpb	$0, (%rax)
	je	.LBB9_5
# %bb.3:                                #   in Loop: Header=BB9_2 Depth=1
	movq	-56(%rbp), %rax
	cmpb	$47, (%rax)
	jne	.LBB9_1
# %bb.4:                                #   in Loop: Header=BB9_2 Depth=1
	movq	-56(%rbp), %rax
	addq	$1, %rax
	movq	%rax, progName(%rip)
	jmp	.LBB9_1
.LBB9_5:
	movq	$0, -40(%rbp)
	leaq	-40(%rbp), %rbx
	movl	$.L.str.7.16, %esi
	movq	%rbx, %rdi
	callq	addFlagsFromEnvVar
	movl	$.L.str.8.17, %esi
	movq	%rbx, %rdi
	callq	addFlagsFromEnvVar
	movl	$1, -44(%rbp)
	.p2align	4, 0x90
.LBB9_6:                                # =>This Inner Loop Header: Depth=1
	movl	-60(%rbp), %eax
	addl	$-1, %eax
	cmpl	%eax, -44(%rbp)
	jg	.LBB9_8
# %bb.7:                                #   in Loop: Header=BB9_6 Depth=1
	movq	-40(%rbp), %rdi
	movq	-72(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	callq	snocString
	movq	%rax, -40(%rbp)
	addl	$1, -44(%rbp)
	jmp	.LBB9_6
.LBB9_8:
	movl	$7, longestFileName(%rip)
	movl	$0, numFileNames(%rip)
	movb	$1, -9(%rbp)
	movq	-40(%rbp), %rax
	jmp	.LBB9_11
	.p2align	4, 0x90
.LBB9_9:                                #   in Loop: Header=BB9_11 Depth=1
	movb	$0, -9(%rbp)
.LBB9_10:                               #   in Loop: Header=BB9_11 Depth=1
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
.LBB9_11:                               # =>This Inner Loop Header: Depth=1
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.LBB9_17
# %bb.12:                               #   in Loop: Header=BB9_11 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.9.18, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_9
# %bb.13:                               #   in Loop: Header=BB9_11 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	cmpb	$45, (%rax)
	jne	.LBB9_15
# %bb.14:                               #   in Loop: Header=BB9_11 Depth=1
	cmpb	$0, -9(%rbp)
	jne	.LBB9_10
.LBB9_15:                               #   in Loop: Header=BB9_11 Depth=1
	addl	$1, numFileNames(%rip)
	movl	longestFileName(%rip), %ebx
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	callq	strlen
	cmpl	%eax, %ebx
	jge	.LBB9_10
# %bb.16:                               #   in Loop: Header=BB9_11 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	callq	strlen
	movl	%eax, longestFileName(%rip)
	jmp	.LBB9_10
.LBB9_17:
	cmpl	$0, numFileNames(%rip)
	je	.LBB9_19
# %bb.18:
	movl	$3, srcMode(%rip)
	jmp	.LBB9_20
.LBB9_19:
	movl	$1, srcMode(%rip)
.LBB9_20:
	movl	$1, opMode(%rip)
	movq	progName(%rip), %rdi
	movl	$.L.str.10, %esi
	callq	strstr
	testq	%rax, %rax
	jne	.LBB9_22
# %bb.21:
	movq	progName(%rip), %rdi
	movl	$.L.str.11, %esi
	callq	strstr
	testq	%rax, %rax
	je	.LBB9_23
.LBB9_22:
	movl	$2, opMode(%rip)
.LBB9_23:
	movq	progName(%rip), %rdi
	movl	$.L.str.12, %esi
	callq	strstr
	testq	%rax, %rax
	jne	.LBB9_27
# %bb.24:
	movq	progName(%rip), %rdi
	movl	$.L.str.13, %esi
	callq	strstr
	testq	%rax, %rax
	jne	.LBB9_27
# %bb.25:
	movq	progName(%rip), %rdi
	movl	$.L.str.14, %esi
	callq	strstr
	testq	%rax, %rax
	jne	.LBB9_27
# %bb.26:
	movq	progName(%rip), %rdi
	movl	$.L.str.15, %esi
	callq	strstr
	testq	%rax, %rax
	je	.LBB9_28
.LBB9_27:
	movl	$2, opMode(%rip)
	cmpl	$1, numFileNames(%rip)
	movl	$2, %eax
	sbbl	$0, %eax
	movl	%eax, srcMode(%rip)
.LBB9_28:
	movq	-40(%rbp), %rax
	jmp	.LBB9_30
	.p2align	4, 0x90
.LBB9_29:                               #   in Loop: Header=BB9_30 Depth=1
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
.LBB9_30:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_36 Depth 2
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.LBB9_57
# %bb.31:                               #   in Loop: Header=BB9_30 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.9.18, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_57
# %bb.32:                               #   in Loop: Header=BB9_30 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	cmpb	$45, (%rax)
	jne	.LBB9_29
# %bb.33:                               #   in Loop: Header=BB9_30 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	cmpb	$45, 1(%rax)
	je	.LBB9_29
# %bb.34:                               #   in Loop: Header=BB9_30 Depth=1
	movl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_35:                               #   in Loop: Header=BB9_36 Depth=2
	addl	$1, verbosity(%rip)
	addl	$1, -28(%rbp)
	.p2align	4, 0x90
.LBB9_36:                               #   Parent Loop BB9_30 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movslq	-28(%rbp), %rcx
	cmpb	$0, (%rax,%rcx)
	je	.LBB9_29
# %bb.37:                               #   in Loop: Header=BB9_36 Depth=2
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movslq	-28(%rbp), %rcx
	movsbl	(%rax,%rcx), %eax
	addl	$-49, %eax
	cmpl	$73, %eax
	ja	.LBB9_151
# %bb.38:                               #   in Loop: Header=BB9_36 Depth=2
	jmpq	*.LJTI9_0(,%rax,8)
.LBB9_39:                               #   in Loop: Header=BB9_36 Depth=2
	callq	license
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_40:                               #   in Loop: Header=BB9_36 Depth=2
	movl	$3, blockSize100k(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_41:                               #   in Loop: Header=BB9_36 Depth=2
	movl	$4, blockSize100k(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_42:                               #   in Loop: Header=BB9_36 Depth=2
	movl	$7, blockSize100k(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_43:                               #   in Loop: Header=BB9_36 Depth=2
	movl	$2, srcMode(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_44:                               #   in Loop: Header=BB9_36 Depth=2
	movl	$2, opMode(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_45:                               #   in Loop: Header=BB9_36 Depth=2
	movb	$1, forceOverwrite(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_46:                               #   in Loop: Header=BB9_36 Depth=2
	movl	$3, opMode(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_47:                               #   in Loop: Header=BB9_36 Depth=2
	movl	$1, opMode(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_48:                               #   in Loop: Header=BB9_36 Depth=2
	movl	$1, blockSize100k(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_49:                               #   in Loop: Header=BB9_36 Depth=2
	movl	$2, blockSize100k(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_50:                               #   in Loop: Header=BB9_36 Depth=2
	movl	$5, blockSize100k(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_51:                               #   in Loop: Header=BB9_36 Depth=2
	movl	$6, blockSize100k(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_52:                               #   in Loop: Header=BB9_36 Depth=2
	movl	$8, blockSize100k(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_53:                               #   in Loop: Header=BB9_36 Depth=2
	movl	$9, blockSize100k(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_54:                               #   in Loop: Header=BB9_36 Depth=2
	movb	$1, keepInputFiles(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_55:                               #   in Loop: Header=BB9_36 Depth=2
	movb	$0, noisy(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_56:                               #   in Loop: Header=BB9_36 Depth=2
	movb	$1, smallMode(%rip)
	addl	$1, -28(%rbp)
	jmp	.LBB9_36
.LBB9_57:
	movq	-40(%rbp), %rax
	jmp	.LBB9_60
	.p2align	4, 0x90
.LBB9_58:                               #   in Loop: Header=BB9_60 Depth=1
	movl	$2, srcMode(%rip)
.LBB9_59:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
.LBB9_60:                               # =>This Inner Loop Header: Depth=1
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.LBB9_94
# %bb.61:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.9.18, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_94
# %bb.62:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.17, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_58
# %bb.63:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.18, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_80
# %bb.64:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.19, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_81
# %bb.65:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.20, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_82
# %bb.66:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.21, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_83
# %bb.67:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.22, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_84
# %bb.68:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.23, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_85
# %bb.69:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.24, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_86
# %bb.70:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.25, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_88
# %bb.71:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.26, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_88
# %bb.72:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.27, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_90
# %bb.73:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.28, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_89
# %bb.74:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.29, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_89
# %bb.75:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.30, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_91
# %bb.76:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.31, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_92
# %bb.77:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.32, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_93
# %bb.78:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.33, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_150
# %bb.79:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.9.18, %esi
	movl	$2, %edx
	callq	strncmp
	testl	%eax, %eax
	jne	.LBB9_59
	jmp	.LBB9_151
	.p2align	4, 0x90
.LBB9_80:                               #   in Loop: Header=BB9_60 Depth=1
	movl	$2, opMode(%rip)
	jmp	.LBB9_59
.LBB9_81:                               #   in Loop: Header=BB9_60 Depth=1
	movl	$1, opMode(%rip)
	jmp	.LBB9_59
.LBB9_82:                               #   in Loop: Header=BB9_60 Depth=1
	movb	$1, forceOverwrite(%rip)
	jmp	.LBB9_59
.LBB9_83:                               #   in Loop: Header=BB9_60 Depth=1
	movl	$3, opMode(%rip)
	jmp	.LBB9_59
.LBB9_84:                               #   in Loop: Header=BB9_60 Depth=1
	movb	$1, keepInputFiles(%rip)
	jmp	.LBB9_59
.LBB9_85:                               #   in Loop: Header=BB9_60 Depth=1
	movb	$1, smallMode(%rip)
	jmp	.LBB9_59
.LBB9_88:                               #   in Loop: Header=BB9_60 Depth=1
	callq	license
	jmp	.LBB9_59
.LBB9_86:                               #   in Loop: Header=BB9_60 Depth=1
	movb	$0, noisy(%rip)
	jmp	.LBB9_59
.LBB9_89:                               #   in Loop: Header=BB9_60 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	callq	redundant
	jmp	.LBB9_59
.LBB9_90:                               #   in Loop: Header=BB9_60 Depth=1
	movl	$1, workFactor(%rip)
	jmp	.LBB9_59
.LBB9_91:                               #   in Loop: Header=BB9_60 Depth=1
	movl	$1, blockSize100k(%rip)
	jmp	.LBB9_59
.LBB9_92:                               #   in Loop: Header=BB9_60 Depth=1
	movl	$9, blockSize100k(%rip)
	jmp	.LBB9_59
.LBB9_93:                               #   in Loop: Header=BB9_60 Depth=1
	addl	$1, verbosity(%rip)
	jmp	.LBB9_59
.LBB9_94:
	cmpl	$5, verbosity(%rip)
	jl	.LBB9_96
# %bb.95:
	movl	$4, verbosity(%rip)
.LBB9_96:
	cmpl	$1, opMode(%rip)
	jne	.LBB9_100
# %bb.97:
	cmpb	$0, smallMode(%rip)
	je	.LBB9_100
# %bb.98:
	cmpl	$3, blockSize100k(%rip)
	jl	.LBB9_100
# %bb.99:
	movl	$2, blockSize100k(%rip)
.LBB9_100:
	cmpl	$3, opMode(%rip)
	jne	.LBB9_102
# %bb.101:
	cmpl	$2, srcMode(%rip)
	je	.LBB9_152
.LBB9_102:
	cmpl	$2, srcMode(%rip)
	jne	.LBB9_104
# %bb.103:
	cmpl	$0, numFileNames(%rip)
	je	.LBB9_117
.LBB9_104:
	cmpl	$1, opMode(%rip)
	je	.LBB9_105
.LBB9_118:
	movl	$0, blockSize100k(%rip)
	cmpl	$3, srcMode(%rip)
	je	.LBB9_119
.LBB9_106:
	cmpl	$1, opMode(%rip)
	jne	.LBB9_120
.LBB9_107:
	cmpl	$1, srcMode(%rip)
	jne	.LBB9_109
# %bb.108:
	xorl	%edi, %edi
	callq	compress
	jmp	.LBB9_128
.LBB9_109:
	movb	$1, -9(%rbp)
	movq	-40(%rbp), %rax
	jmp	.LBB9_112
	.p2align	4, 0x90
.LBB9_110:                              #   in Loop: Header=BB9_112 Depth=1
	addl	$1, numFilesProcessed(%rip)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	callq	compress
.LBB9_111:                              #   in Loop: Header=BB9_112 Depth=1
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
.LBB9_112:                              # =>This Inner Loop Header: Depth=1
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.LBB9_128
# %bb.113:                              #   in Loop: Header=BB9_112 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.9.18, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_116
# %bb.114:                              #   in Loop: Header=BB9_112 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	cmpb	$45, (%rax)
	jne	.LBB9_110
# %bb.115:                              #   in Loop: Header=BB9_112 Depth=1
	cmpb	$0, -9(%rbp)
	jne	.LBB9_111
	jmp	.LBB9_110
	.p2align	4, 0x90
.LBB9_116:                              #   in Loop: Header=BB9_112 Depth=1
	movb	$0, -9(%rbp)
	jmp	.LBB9_111
.LBB9_117:
	movl	$1, srcMode(%rip)
	cmpl	$1, opMode(%rip)
	jne	.LBB9_118
.LBB9_105:
	cmpl	$3, srcMode(%rip)
	jne	.LBB9_106
.LBB9_119:
	movl	$mySignalCatcher, %esi
	movl	$2, %edi
	callq	signal
	movl	$mySignalCatcher, %esi
	movl	$15, %edi
	callq	signal
	movl	$mySignalCatcher, %esi
	movl	$1, %edi
	callq	signal
	cmpl	$1, opMode(%rip)
	je	.LBB9_107
.LBB9_120:
	cmpl	$2, opMode(%rip)
	jne	.LBB9_124
# %bb.121:
	movb	$0, unzFailsExist(%rip)
	cmpl	$1, srcMode(%rip)
	jne	.LBB9_134
# %bb.122:
	xorl	%edi, %edi
	callq	uncompress
.LBB9_123:
	cmpb	$0, unzFailsExist(%rip)
	je	.LBB9_128
	jmp	.LBB9_154
.LBB9_124:
	movb	$0, testFailsExist(%rip)
	cmpl	$1, srcMode(%rip)
	jne	.LBB9_142
# %bb.125:
	xorl	%edi, %edi
	callq	testf
.LBB9_126:
	cmpb	$0, testFailsExist(%rip)
	je	.LBB9_128
# %bb.127:
	cmpb	$0, noisy(%rip)
	jne	.LBB9_153
.LBB9_128:
	movq	-40(%rbp), %rax
	jmp	.LBB9_130
	.p2align	4, 0x90
.LBB9_129:                              #   in Loop: Header=BB9_130 Depth=1
	movq	-24(%rbp), %rdi
	callq	free
	movq	-80(%rbp), %rax
.LBB9_130:                              # =>This Inner Loop Header: Depth=1
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.LBB9_133
# %bb.131:                              #   in Loop: Header=BB9_130 Depth=1
	movq	-24(%rbp), %rax
	movq	8(%rax), %rcx
	movq	%rcx, -80(%rbp)
	cmpq	$0, (%rax)
	je	.LBB9_129
# %bb.132:                              #   in Loop: Header=BB9_130 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	callq	free
	jmp	.LBB9_129
.LBB9_133:
	movl	exitValue(%rip), %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB9_134:
	.cfi_def_cfa %rbp, 16
	movb	$1, -9(%rbp)
	movq	-40(%rbp), %rax
	jmp	.LBB9_137
	.p2align	4, 0x90
.LBB9_135:                              #   in Loop: Header=BB9_137 Depth=1
	addl	$1, numFilesProcessed(%rip)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	callq	uncompress
.LBB9_136:                              #   in Loop: Header=BB9_137 Depth=1
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
.LBB9_137:                              # =>This Inner Loop Header: Depth=1
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.LBB9_123
# %bb.138:                              #   in Loop: Header=BB9_137 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.9.18, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_141
# %bb.139:                              #   in Loop: Header=BB9_137 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	cmpb	$45, (%rax)
	jne	.LBB9_135
# %bb.140:                              #   in Loop: Header=BB9_137 Depth=1
	cmpb	$0, -9(%rbp)
	jne	.LBB9_136
	jmp	.LBB9_135
	.p2align	4, 0x90
.LBB9_141:                              #   in Loop: Header=BB9_137 Depth=1
	movb	$0, -9(%rbp)
	jmp	.LBB9_136
.LBB9_142:
	movb	$1, -9(%rbp)
	movq	-40(%rbp), %rax
	jmp	.LBB9_145
	.p2align	4, 0x90
.LBB9_143:                              #   in Loop: Header=BB9_145 Depth=1
	addl	$1, numFilesProcessed(%rip)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	callq	testf
.LBB9_144:                              #   in Loop: Header=BB9_145 Depth=1
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
.LBB9_145:                              # =>This Inner Loop Header: Depth=1
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.LBB9_126
# %bb.146:                              #   in Loop: Header=BB9_145 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str.9.18, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_149
# %bb.147:                              #   in Loop: Header=BB9_145 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	cmpb	$45, (%rax)
	jne	.LBB9_143
# %bb.148:                              #   in Loop: Header=BB9_145 Depth=1
	cmpb	$0, -9(%rbp)
	jne	.LBB9_144
	jmp	.LBB9_143
	.p2align	4, 0x90
.LBB9_149:                              #   in Loop: Header=BB9_145 Depth=1
	movb	$0, -9(%rbp)
	jmp	.LBB9_144
.LBB9_150:
	movq	progName(%rip), %rdi
	callq	usage
	xorl	%edi, %edi
	callq	exit
.LBB9_151:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rcx
	movl	$.L.str.16, %esi
	xorl	%eax, %eax
	callq	fprintf
	movq	progName(%rip), %rdi
	callq	usage
	movl	$1, %edi
	callq	exit
.LBB9_152:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.34, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	$1, %edi
	callq	exit
.LBB9_153:
	movq	stderr(%rip), %rdi
	movl	$.L.str.35, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB9_154:
	movl	$2, %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
.Lfunc_end9:
	.size	main1, .Lfunc_end9-main1
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI9_0:
	.quad	.LBB9_48
	.quad	.LBB9_49
	.quad	.LBB9_40
	.quad	.LBB9_41
	.quad	.LBB9_50
	.quad	.LBB9_51
	.quad	.LBB9_42
	.quad	.LBB9_52
	.quad	.LBB9_53
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_39
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_39
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_43
	.quad	.LBB9_44
	.quad	.LBB9_151
	.quad	.LBB9_45
	.quad	.LBB9_151
	.quad	.LBB9_150
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_54
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_55
	.quad	.LBB9_151
	.quad	.LBB9_56
	.quad	.LBB9_46
	.quad	.LBB9_151
	.quad	.LBB9_35
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_151
	.quad	.LBB9_47
                                        # -- End function
	.text
	.p2align	4, 0x90                         # -- Begin function mySIGSEGVorSIGBUScatcher
	.type	mySIGSEGVorSIGBUScatcher,@function
mySIGSEGVorSIGBUScatcher:               # @mySIGSEGVorSIGBUScatcher
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$1, opMode(%rip)
	jne	.LBB10_2
# %bb.1:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.36, %esi
	jmp	.LBB10_3
.LBB10_2:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.37, %esi
.LBB10_3:
	xorl	%eax, %eax
	callq	fprintf
	callq	showFileNames
	cmpl	$1, opMode(%rip)
	jne	.LBB10_5
# %bb.4:
	movl	$3, %edi
	callq	cleanUpAndFail
.LBB10_5:
	callq	cadvise
	movl	$2, %edi
	callq	cleanUpAndFail
.Lfunc_end10:
	.size	mySIGSEGVorSIGBUScatcher, .Lfunc_end10-mySIGSEGVorSIGBUScatcher
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function copyFileName
	.type	copyFileName,@function
copyFileName:                           # @copyFileName
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -8(%rbp)
	movq	%rsi, %rdi
	callq	strlen
	cmpq	$1025, %rax                     # imm = 0x401
	jae	.LBB11_2
# %bb.1:
	movq	-16(%rbp), %rdi
	movq	-8(%rbp), %rsi
	movl	$1024, %edx                     # imm = 0x400
	callq	strncpy
	movq	-16(%rbp), %rax
	movb	$0, 1024(%rax)
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB11_2:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rdi
	movq	-8(%rbp), %rdx
	movl	$.L.str.47, %esi
	movl	$1024, %ecx                     # imm = 0x400
	xorl	%eax, %eax
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
.Lfunc_end11:
	.size	copyFileName, .Lfunc_end11-copyFileName
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function addFlagsFromEnvVar
	.type	addFlagsFromEnvVar,@function
addFlagsFromEnvVar:                     # @addFlagsFromEnvVar
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -32(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rsi, %rdi
	callq	getenv
	movq	%rax, -40(%rbp)
	testq	%rax, %rax
	je	.LBB12_18
# %bb.1:
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.LBB12_2
	.p2align	4, 0x90
.LBB12_17:                              #   in Loop: Header=BB12_2 Depth=1
	movslq	-20(%rbp), %rax
	movb	$0, tmpName(%rax)
	movq	-32(%rbp), %rax
	movq	(%rax), %rdi
	movl	$tmpName, %esi
	callq	snocString
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
.LBB12_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB12_4 Depth 2
                                        #     Child Loop BB12_6 Depth 2
                                        #     Child Loop BB12_15 Depth 2
	movq	-16(%rbp), %rax
	movslq	-4(%rbp), %rcx
	cmpb	$0, (%rax,%rcx)
	je	.LBB12_18
# %bb.3:                                #   in Loop: Header=BB12_2 Depth=1
	movslq	-4(%rbp), %rax
	addq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	.p2align	4, 0x90
.LBB12_4:                               #   Parent Loop BB12_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movsbq	(%rcx), %rcx
	movzwl	(%rax,%rcx,2), %eax
	testl	$8192, %eax                     # imm = 0x2000
	je	.LBB12_6
# %bb.5:                                #   in Loop: Header=BB12_4 Depth=2
	addq	$1, -16(%rbp)
	jmp	.LBB12_4
	.p2align	4, 0x90
.LBB12_6:                               #   Parent Loop BB12_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-16(%rbp), %rax
	movslq	-4(%rbp), %rcx
	cmpb	$0, (%rax,%rcx)
	je	.LBB12_7
# %bb.8:                                #   in Loop: Header=BB12_6 Depth=2
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movsbq	(%rcx,%rdx), %rcx
	movzwl	(%rax,%rcx,2), %eax
	testl	$8192, %eax                     # imm = 0x2000
	sete	%al
	testb	%al, %al
	jne	.LBB12_10
	jmp	.LBB12_11
	.p2align	4, 0x90
.LBB12_7:                               #   in Loop: Header=BB12_6 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	je	.LBB12_11
.LBB12_10:                              #   in Loop: Header=BB12_6 Depth=2
	addl	$1, -4(%rbp)
	jmp	.LBB12_6
	.p2align	4, 0x90
.LBB12_11:                              #   in Loop: Header=BB12_2 Depth=1
	cmpl	$0, -4(%rbp)
	jle	.LBB12_2
# %bb.12:                               #   in Loop: Header=BB12_2 Depth=1
	movl	-4(%rbp), %eax
	movl	%eax, -20(%rbp)
	cmpl	$1025, %eax                     # imm = 0x401
	jl	.LBB12_14
# %bb.13:                               #   in Loop: Header=BB12_2 Depth=1
	movl	$1024, -20(%rbp)                # imm = 0x400
.LBB12_14:                              #   in Loop: Header=BB12_2 Depth=1
	movl	$0, -24(%rbp)
	.p2align	4, 0x90
.LBB12_15:                              #   Parent Loop BB12_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB12_17
# %bb.16:                               #   in Loop: Header=BB12_15 Depth=2
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movzbl	(%rax,%rcx), %eax
	movb	%al, tmpName(%rcx)
	leal	1(%rcx), %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB12_15
.LBB12_18:
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end12:
	.size	addFlagsFromEnvVar, .Lfunc_end12-addFlagsFromEnvVar
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function snocString
	.type	snocString,@function
snocString:                             # @snocString
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -32(%rbp)
	movq	%rsi, -24(%rbp)
	testq	%rdi, %rdi
	je	.LBB13_1
# %bb.2:
	movq	-32(%rbp), %rax
	.p2align	4, 0x90
.LBB13_3:                               # =>This Inner Loop Header: Depth=1
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	.LBB13_5
# %bb.4:                                #   in Loop: Header=BB13_3 Depth=1
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.LBB13_3
.LBB13_5:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdi
	movq	-24(%rbp), %rsi
	callq	snocString
	movq	-8(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movq	-32(%rbp), %rax
	jmp	.LBB13_6
.LBB13_1:
	callq	mkCell
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rdi
	callq	strlen
	leal	5(%rax), %edi
	callq	myMalloc
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	movq	-24(%rbp), %rsi
	callq	strcpy
	movq	-16(%rbp), %rax
.LBB13_6:
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end13:
	.size	snocString, .Lfunc_end13-snocString
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function license
	.type	license,@function
license:                                # @license
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	stderr(%rip), %rbx
	callq	BZ2_bzlibVersion
	movl	$.L.str.49, %esi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	fprintf
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end14:
	.size	license, .Lfunc_end14-license
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function usage
	.type	usage,@function
usage:                                  # @usage
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, -16(%rbp)
	movq	stderr(%rip), %rbx
	callq	BZ2_bzlibVersion
	movq	-16(%rbp), %rcx
	movl	$.L.str.50, %esi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	fprintf
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end15:
	.size	usage, .Lfunc_end15-usage
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function redundant
	.type	redundant,@function
redundant:                              # @redundant
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, %rcx
	movq	%rdi, -8(%rbp)
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.51, %esi
	xorl	%eax, %eax
	callq	fprintf
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end16:
	.size	redundant, .Lfunc_end16-redundant
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function mySignalCatcher
	.type	mySignalCatcher,@function
mySignalCatcher:                        # @mySignalCatcher
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.52, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	$1, %edi
	callq	cleanUpAndFail
.Lfunc_end17:
	.size	mySignalCatcher, .Lfunc_end17-mySignalCatcher
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function compress
	.type	compress,@function
compress:                               # @compress
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$192, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, -48(%rbp)
	movb	$0, deleteOutputOnInterrupt(%rip)
	testq	%rdi, %rdi
	jne	.LBB18_2
# %bb.1:
	cmpl	$1, srcMode(%rip)
	jne	.LBB18_69
.LBB18_2:
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB18_6
# %bb.3:
	cmpl	$2, %eax
	je	.LBB18_7
# %bb.4:
	cmpl	$1, %eax
	jne	.LBB18_9
# %bb.5:
	movl	$inName, %edi
	movl	$.L.str.54, %esi
	jmp	.LBB18_8
.LBB18_6:
	movq	-48(%rbp), %rsi
	movl	$inName, %edi
	callq	copyFileName
	movq	-48(%rbp), %rsi
	movl	$outName, %edi
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str.9, %esi
	callq	strcat
.LBB18_9:
	cmpl	$1, srcMode(%rip)
	jne	.LBB18_10
	jmp	.LBB18_16
.LBB18_7:
	movq	-48(%rbp), %rsi
	movl	$inName, %edi
.LBB18_8:
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str.55, %esi
	callq	copyFileName
	cmpl	$1, srcMode(%rip)
	je	.LBB18_16
.LBB18_10:
	movl	$inName, %edi
	callq	containsDubiousChars
	testb	%al, %al
	je	.LBB18_16
# %bb.11:
	cmpb	$0, noisy(%rip)
	je	.LBB18_15
# %bb.12:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.56, %esi
	jmp	.LBB18_13
.LBB18_16:
	cmpl	$1, srcMode(%rip)
	je	.LBB18_19
# %bb.17:
	movl	$inName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB18_18
.LBB18_19:
	movl	$0, -28(%rbp)
	cmpl	$3, -28(%rbp)
	jg	.LBB18_26
	.p2align	4, 0x90
.LBB18_21:                              # =>This Inner Loop Header: Depth=1
	movslq	-28(%rbp), %rax
	movq	zSuffix(,%rax,8), %rsi
	movl	$inName, %edi
	callq	hasSuffix
	testb	%al, %al
	jne	.LBB18_22
# %bb.25:                               #   in Loop: Header=BB18_21 Depth=1
	addl	$1, -28(%rbp)
	cmpl	$3, -28(%rbp)
	jle	.LBB18_21
.LBB18_26:
	cmpl	$3, srcMode(%rip)
	je	.LBB18_28
# %bb.27:
	cmpl	$2, srcMode(%rip)
	jne	.LBB18_30
.LBB18_28:
	leaq	-200(%rbp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	$61440, %eax                    # imm = 0xF000
	andl	-176(%rbp), %eax
	cmpl	$16384, %eax                    # imm = 0x4000
	jne	.LBB18_30
# %bb.29:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.59, %esi
.LBB18_13:
	movl	$inName, %ecx
.LBB18_14:
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB18_15
.LBB18_22:
	cmpb	$0, noisy(%rip)
	je	.LBB18_15
# %bb.23:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movslq	-28(%rbp), %rax
	movq	zSuffix(,%rax,8), %r8
	movl	$.L.str.58, %esi
	movl	$inName, %ecx
	jmp	.LBB18_24
.LBB18_30:
	cmpl	$3, srcMode(%rip)
	jne	.LBB18_35
# %bb.31:
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB18_32
.LBB18_35:
	cmpl	$3, srcMode(%rip)
	jne	.LBB18_39
# %bb.36:
	movl	$outName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB18_39
# %bb.37:
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB18_70
# %bb.38:
	movl	$outName, %edi
	callq	remove
.LBB18_39:
	cmpl	$3, srcMode(%rip)
	jne	.LBB18_43
# %bb.40:
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB18_41
.LBB18_43:
	cmpl	$3, srcMode(%rip)
	jne	.LBB18_45
# %bb.44:
	movl	$inName, %edi
	callq	saveInputFileMetaInfo
.LBB18_45:
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB18_61
# %bb.46:
	cmpl	$2, %eax
	je	.LBB18_50
# %bb.47:
	cmpl	$1, %eax
	jne	.LBB18_66
# %bb.48:
	movq	stdin(%rip), %rax
	movq	%rax, -24(%rbp)
	movq	stdout(%rip), %rdi
	movq	%rdi, -40(%rbp)
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	je	.LBB18_55
# %bb.49:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.64, %esi
	xorl	%eax, %eax
	callq	fprintf
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rcx
	movl	$.L.str.65, %esi
	movq	%rcx, %rdx
	jmp	.LBB18_14
.LBB18_61:
	movl	$inName, %edi
	movl	$.L.str.66, %esi
	callq	fopen
	movq	%rax, -24(%rbp)
	movl	$outName, %edi
	movl	$.L.str.67, %esi
	callq	fopen_output_safely
	movq	%rax, -40(%rbp)
	testq	%rax, %rax
	je	.LBB18_62
# %bb.63:
	cmpq	$0, -24(%rbp)
	jne	.LBB18_55
# %bb.64:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.57, %esi
	movl	$inName, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movq	%rax, %r8
	xorl	%eax, %eax
	callq	fprintf
	cmpq	$0, -40(%rbp)
	je	.LBB18_15
# %bb.65:
	movq	-40(%rbp), %rdi
	callq	fclose
	jmp	.LBB18_15
.LBB18_50:
	movl	$inName, %edi
	movl	$.L.str.66, %esi
	callq	fopen
	movq	%rax, -24(%rbp)
	movq	stdout(%rip), %rdi
	movq	%rdi, -40(%rbp)
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	je	.LBB18_54
# %bb.51:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.64, %esi
	xorl	%eax, %eax
	callq	fprintf
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rcx
	movl	$.L.str.65, %esi
	movq	%rcx, %rdx
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB18_52
.LBB18_32:
	movl	$inName, %edi
	callq	notAStandardFile
	testb	%al, %al
	je	.LBB18_35
# %bb.33:
	cmpb	$0, noisy(%rip)
	je	.LBB18_15
# %bb.34:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.60, %esi
	jmp	.LBB18_13
.LBB18_41:
	movl	$inName, %edi
	callq	countHardLinks
	movl	%eax, -52(%rbp)
	testl	%eax, %eax
	jle	.LBB18_43
# %bb.42:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	-52(%rbp), %r8d
	cmpl	$1, %r8d
	movl	$.L.str.63, %eax
	movl	$.L.str.4.13, %r9d
	cmovgq	%rax, %r9
	movl	$.L.str.62, %esi
	movl	$inName, %ecx
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB18_15
.LBB18_70:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.61, %esi
	movl	$outName, %ecx
	jmp	.LBB18_14
.LBB18_62:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.68, %esi
	movl	$outName, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movq	%rax, %r8
	xorl	%eax, %eax
	callq	fprintf
.LBB18_52:
	cmpq	$0, -24(%rbp)
	je	.LBB18_15
# %bb.53:
	movq	-24(%rbp), %rdi
	callq	fclose
	jmp	.LBB18_15
.LBB18_54:
	cmpq	$0, -24(%rbp)
	je	.LBB18_18
.LBB18_55:
	cmpl	$0, verbosity(%rip)
	jle	.LBB18_57
# %bb.56:
	movq	stderr(%rip), %rdi
	movl	$.L.str.70, %esi
	movl	$inName, %edx
	xorl	%eax, %eax
	callq	fprintf
	movl	$inName, %edi
	callq	pad
	movq	stderr(%rip), %rdi
	callq	fflush
.LBB18_57:
	movq	-40(%rbp), %rsi
	movq	%rsi, outputHandleJustInCase(%rip)
	movb	$1, deleteOutputOnInterrupt(%rip)
	movq	-24(%rbp), %rdi
	callq	compressStream
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$3, srcMode(%rip)
	jne	.LBB18_67
# %bb.58:
	movl	$outName, %edi
	callq	applySavedTimeInfoToOutputFile
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpb	$0, keepInputFiles(%rip)
	jne	.LBB18_67
# %bb.59:
	movl	$inName, %edi
	callq	remove
	movl	%eax, -56(%rbp)
	testl	%eax, %eax
	jne	.LBB18_60
.LBB18_67:
	movb	$0, deleteOutputOnInterrupt(%rip)
	jmp	.LBB18_68
.LBB18_18:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.57, %esi
	movl	$inName, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movq	%rax, %r8
.LBB18_24:
	xorl	%eax, %eax
	callq	fprintf
.LBB18_15:
	movl	$1, %edi
	callq	setExit
.LBB18_68:
	addq	$192, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB18_69:
	.cfi_def_cfa %rbp, 16
	movl	$.L.str.53, %edi
	callq	panic
.LBB18_66:
	movl	$.L.str.69, %edi
	callq	panic
.LBB18_60:
	callq	ioError
.Lfunc_end18:
	.size	compress, .Lfunc_end18-compress
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function uncompress
	.type	uncompress,@function
uncompress:                             # @uncompress
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$208, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, -56(%rbp)
	movb	$0, deleteOutputOnInterrupt(%rip)
	testq	%rdi, %rdi
	jne	.LBB19_2
# %bb.1:
	cmpl	$1, srcMode(%rip)
	jne	.LBB19_78
.LBB19_2:
	movb	$0, -17(%rbp)
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB19_6
# %bb.3:
	cmpl	$2, %eax
	je	.LBB19_11
# %bb.4:
	cmpl	$1, %eax
	jne	.LBB19_13
# %bb.5:
	movl	$inName, %edi
	movl	$.L.str.54, %esi
	jmp	.LBB19_12
.LBB19_6:
	movq	-56(%rbp), %rsi
	movl	$inName, %edi
	callq	copyFileName
	movq	-56(%rbp), %rsi
	movl	$outName, %edi
	callq	copyFileName
	movl	$0, -36(%rbp)
	cmpl	$3, -36(%rbp)
	jg	.LBB19_10
	.p2align	4, 0x90
.LBB19_8:                               # =>This Inner Loop Header: Depth=1
	movslq	-36(%rbp), %rax
	movq	zSuffix(,%rax,8), %rsi
	movq	unzSuffix(,%rax,8), %rdx
	movl	$outName, %edi
	callq	mapSuffix
	testb	%al, %al
	jne	.LBB19_13
# %bb.9:                                #   in Loop: Header=BB19_8 Depth=1
	addl	$1, -36(%rbp)
	cmpl	$3, -36(%rbp)
	jle	.LBB19_8
.LBB19_10:
	movb	$1, -17(%rbp)
	movl	$outName, %edi
	movl	$.L.str.80, %esi
	callq	strcat
.LBB19_13:
	cmpl	$1, srcMode(%rip)
	jne	.LBB19_14
	jmp	.LBB19_20
.LBB19_11:
	movq	-56(%rbp), %rsi
	movl	$inName, %edi
.LBB19_12:
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str.55, %esi
	callq	copyFileName
	cmpl	$1, srcMode(%rip)
	je	.LBB19_20
.LBB19_14:
	movl	$inName, %edi
	callq	containsDubiousChars
	testb	%al, %al
	je	.LBB19_20
# %bb.15:
	cmpb	$0, noisy(%rip)
	je	.LBB19_19
# %bb.16:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.56, %esi
	jmp	.LBB19_17
.LBB19_20:
	cmpl	$1, srcMode(%rip)
	je	.LBB19_23
# %bb.21:
	movl	$inName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB19_22
.LBB19_23:
	cmpl	$3, srcMode(%rip)
	je	.LBB19_25
# %bb.24:
	cmpl	$2, srcMode(%rip)
	jne	.LBB19_27
.LBB19_25:
	leaq	-216(%rbp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	$61440, %eax                    # imm = 0xF000
	andl	-192(%rbp), %eax
	cmpl	$16384, %eax                    # imm = 0x4000
	jne	.LBB19_27
# %bb.26:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.59, %esi
.LBB19_17:
	movl	$inName, %ecx
.LBB19_18:
	xorl	%eax, %eax
	callq	fprintf
.LBB19_19:
	movl	$1, %edi
	callq	setExit
.LBB19_77:
	addq	$208, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB19_27:
	.cfi_def_cfa %rbp, 16
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_32
# %bb.28:
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB19_29
.LBB19_32:
	cmpb	$0, -17(%rbp)
	je	.LBB19_35
# %bb.33:
	cmpb	$0, noisy(%rip)
	je	.LBB19_35
# %bb.34:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.81, %esi
	movl	$inName, %ecx
	movl	$outName, %r8d
	xorl	%eax, %eax
	callq	fprintf
.LBB19_35:
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_39
# %bb.36:
	movl	$outName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB19_39
# %bb.37:
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB19_79
# %bb.38:
	movl	$outName, %edi
	callq	remove
.LBB19_39:
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_43
# %bb.40:
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB19_41
.LBB19_43:
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_45
# %bb.44:
	movl	$inName, %edi
	callq	saveInputFileMetaInfo
.LBB19_45:
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB19_54
# %bb.46:
	cmpl	$2, %eax
	je	.LBB19_50
# %bb.47:
	cmpl	$1, %eax
	jne	.LBB19_59
# %bb.48:
	movq	stdin(%rip), %rdi
	movq	%rdi, -32(%rbp)
	movq	stdout(%rip), %rax
	movq	%rax, -48(%rbp)
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	je	.LBB19_60
# %bb.49:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.82, %esi
	xorl	%eax, %eax
	callq	fprintf
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rcx
	movl	$.L.str.65, %esi
	movq	%rcx, %rdx
	jmp	.LBB19_18
.LBB19_22:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.57, %esi
	movl	$inName, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movq	%rax, %r8
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB19_19
.LBB19_54:
	movl	$inName, %edi
	movl	$.L.str.66, %esi
	callq	fopen
	movq	%rax, -32(%rbp)
	movl	$outName, %edi
	movl	$.L.str.67, %esi
	callq	fopen_output_safely
	movq	%rax, -48(%rbp)
	testq	%rax, %rax
	je	.LBB19_55
# %bb.56:
	cmpq	$0, -32(%rbp)
	jne	.LBB19_60
# %bb.57:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.57, %esi
	movl	$inName, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movq	%rax, %r8
	xorl	%eax, %eax
	callq	fprintf
	cmpq	$0, -48(%rbp)
	je	.LBB19_19
# %bb.58:
	movq	-48(%rbp), %rdi
	callq	fclose
	jmp	.LBB19_19
.LBB19_50:
	movl	$inName, %edi
	movl	$.L.str.66, %esi
	callq	fopen
	movq	%rax, -32(%rbp)
	movq	stdout(%rip), %rcx
	movq	%rcx, -48(%rbp)
	testq	%rax, %rax
	je	.LBB19_51
.LBB19_60:
	cmpl	$0, verbosity(%rip)
	jle	.LBB19_62
# %bb.61:
	movq	stderr(%rip), %rdi
	movl	$.L.str.70, %esi
	movl	$inName, %edx
	xorl	%eax, %eax
	callq	fprintf
	movl	$inName, %edi
	callq	pad
	movq	stderr(%rip), %rdi
	callq	fflush
.LBB19_62:
	movq	-48(%rbp), %rsi
	movq	%rsi, outputHandleJustInCase(%rip)
	movb	$1, deleteOutputOnInterrupt(%rip)
	movq	-32(%rbp), %rdi
	callq	uncompressStream
	movb	%al, -18(%rbp)
	movq	$0, outputHandleJustInCase(%rip)
	testb	%al, %al
	je	.LBB19_68
# %bb.63:
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_70
# %bb.64:
	movl	$outName, %edi
	callq	applySavedTimeInfoToOutputFile
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpb	$0, keepInputFiles(%rip)
	jne	.LBB19_70
# %bb.65:
	movl	$inName, %edi
	callq	remove
	movl	%eax, -68(%rbp)
	jmp	.LBB19_66
.LBB19_29:
	movl	$inName, %edi
	callq	notAStandardFile
	testb	%al, %al
	je	.LBB19_32
# %bb.30:
	cmpb	$0, noisy(%rip)
	je	.LBB19_19
# %bb.31:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.60, %esi
	jmp	.LBB19_17
.LBB19_41:
	movl	$inName, %edi
	callq	countHardLinks
	movl	%eax, -60(%rbp)
	testl	%eax, %eax
	jle	.LBB19_43
# %bb.42:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	-60(%rbp), %r8d
	cmpl	$1, %r8d
	movl	$.L.str.63, %eax
	movl	$.L.str.4.13, %r9d
	cmovgq	%rax, %r9
	movl	$.L.str.62, %esi
	movl	$inName, %ecx
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB19_19
.LBB19_68:
	movb	$1, unzFailsExist(%rip)
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_70
# %bb.69:
	movl	$outName, %edi
	callq	remove
	movl	%eax, -64(%rbp)
.LBB19_66:
	testl	%eax, %eax
	jne	.LBB19_67
.LBB19_70:
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpb	$0, -18(%rbp)
	je	.LBB19_74
# %bb.71:
	cmpl	$0, verbosity(%rip)
	jle	.LBB19_77
# %bb.72:
	movq	stderr(%rip), %rdi
	movl	$.L.str.85, %esi
	jmp	.LBB19_73
.LBB19_74:
	movl	$2, %edi
	callq	setExit
	cmpl	$0, verbosity(%rip)
	jle	.LBB19_76
# %bb.75:
	movq	stderr(%rip), %rdi
	movl	$.L.str.86, %esi
.LBB19_73:
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB19_77
.LBB19_79:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.61, %esi
	movl	$outName, %ecx
	jmp	.LBB19_18
.LBB19_55:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.68, %esi
	movl	$outName, %ecx
	jmp	.LBB19_52
.LBB19_51:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.83, %esi
	movl	$inName, %ecx
.LBB19_52:
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movq	%rax, %r8
	xorl	%eax, %eax
	callq	fprintf
	cmpq	$0, -32(%rbp)
	je	.LBB19_19
# %bb.53:
	movq	-32(%rbp), %rdi
	callq	fclose
	jmp	.LBB19_19
.LBB19_76:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.87, %esi
	movl	$inName, %ecx
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB19_77
.LBB19_78:
	movl	$.L.str.79, %edi
	callq	panic
.LBB19_59:
	movl	$.L.str.84, %edi
	callq	panic
.LBB19_67:
	callq	ioError
.Lfunc_end19:
	.size	uncompress, .Lfunc_end19-uncompress
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function setExit
	.type	setExit,@function
setExit:                                # @setExit
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	cmpl	exitValue(%rip), %edi
	jle	.LBB20_2
# %bb.1:
	movl	-4(%rbp), %eax
	movl	%eax, exitValue(%rip)
.LBB20_2:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end20:
	.size	setExit, .Lfunc_end20-setExit
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function testf
	.type	testf,@function
testf:                                  # @testf
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$176, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, -40(%rbp)
	movb	$0, deleteOutputOnInterrupt(%rip)
	testq	%rdi, %rdi
	jne	.LBB21_2
# %bb.1:
	cmpl	$1, srcMode(%rip)
	jne	.LBB21_38
.LBB21_2:
	movl	$outName, %edi
	movl	$.L.str.6.15, %esi
	callq	copyFileName
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB21_6
# %bb.3:
	cmpl	$2, %eax
	je	.LBB21_6
# %bb.4:
	cmpl	$1, %eax
	jne	.LBB21_8
# %bb.5:
	movl	$inName, %edi
	movl	$.L.str.54, %esi
	jmp	.LBB21_7
.LBB21_6:
	movq	-40(%rbp), %rsi
	movl	$inName, %edi
.LBB21_7:
	callq	copyFileName
.LBB21_8:
	cmpl	$1, srcMode(%rip)
	je	.LBB21_15
# %bb.9:
	movl	$inName, %edi
	callq	containsDubiousChars
	testb	%al, %al
	je	.LBB21_15
# %bb.10:
	cmpb	$0, noisy(%rip)
	je	.LBB21_14
# %bb.11:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.56, %esi
	jmp	.LBB21_12
.LBB21_15:
	cmpl	$1, srcMode(%rip)
	je	.LBB21_19
# %bb.16:
	movl	$inName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB21_17
.LBB21_19:
	cmpl	$1, srcMode(%rip)
	je	.LBB21_22
# %bb.20:
	leaq	-184(%rbp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	$61440, %eax                    # imm = 0xF000
	andl	-160(%rbp), %eax
	cmpl	$16384, %eax                    # imm = 0x4000
	jne	.LBB21_22
# %bb.21:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.59, %esi
.LBB21_12:
	movl	$inName, %ecx
	jmp	.LBB21_13
.LBB21_22:
	movl	srcMode(%rip), %eax
	leal	-2(%rax), %ecx
	cmpl	$2, %ecx
	jae	.LBB21_23
# %bb.26:
	movl	$inName, %edi
	movl	$.L.str.66, %esi
	callq	fopen
	movq	%rax, -32(%rbp)
	testq	%rax, %rax
	je	.LBB21_27
# %bb.30:
	cmpl	$0, verbosity(%rip)
	jle	.LBB21_32
.LBB21_31:
	movq	stderr(%rip), %rdi
	movl	$.L.str.70, %esi
	movl	$inName, %edx
	xorl	%eax, %eax
	callq	fprintf
	movl	$inName, %edi
	callq	pad
	movq	stderr(%rip), %rdi
	callq	fflush
.LBB21_32:
	movq	$0, outputHandleJustInCase(%rip)
	movq	-32(%rbp), %rdi
	callq	testStream
	movb	%al, -17(%rbp)
	testb	%al, %al
	je	.LBB21_35
# %bb.33:
	cmpl	$0, verbosity(%rip)
	jle	.LBB21_35
# %bb.34:
	movq	stderr(%rip), %rdi
	movl	$.L.str.97, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB21_35:
	cmpb	$0, -17(%rbp)
	jne	.LBB21_37
# %bb.36:
	movb	$1, testFailsExist(%rip)
	jmp	.LBB21_37
.LBB21_23:
	cmpl	$1, %eax
	jne	.LBB21_28
# %bb.24:
	movq	stdin(%rip), %rdi
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	je	.LBB21_29
# %bb.25:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.82, %esi
	xorl	%eax, %eax
	callq	fprintf
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rcx
	movl	$.L.str.65, %esi
	movq	%rcx, %rdx
.LBB21_13:
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB21_14
.LBB21_17:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.95, %esi
	jmp	.LBB21_18
.LBB21_27:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.83, %esi
.LBB21_18:
	movl	$inName, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movq	%rax, %r8
	xorl	%eax, %eax
	callq	fprintf
.LBB21_14:
	movl	$1, %edi
	callq	setExit
.LBB21_37:
	addq	$176, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB21_29:
	.cfi_def_cfa %rbp, 16
	movq	stdin(%rip), %rax
	movq	%rax, -32(%rbp)
	cmpl	$0, verbosity(%rip)
	jg	.LBB21_31
	jmp	.LBB21_32
.LBB21_38:
	movl	$.L.str.94, %edi
	callq	panic
.LBB21_28:
	movl	$.L.str.96, %edi
	callq	panic
.Lfunc_end21:
	.size	testf, .Lfunc_end21-testf
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function panic
	.type	panic,@function
panic:                                  # @panic
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, %rcx
	movq	%rdi, -8(%rbp)
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.71, %esi
	xorl	%eax, %eax
	callq	fprintf
	callq	showFileNames
	movl	$3, %edi
	callq	cleanUpAndFail
.Lfunc_end22:
	.size	panic, .Lfunc_end22-panic
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function containsDubiousChars
	.type	containsDubiousChars,@function
containsDubiousChars:                   # @containsDubiousChars
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end23:
	.size	containsDubiousChars, .Lfunc_end23-containsDubiousChars
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function fileExists
	.type	fileExists,@function
fileExists:                             # @fileExists
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$.L.str.66, %esi
	callq	fopen
	movq	%rax, -16(%rbp)
	testq	%rax, %rax
	setne	-1(%rbp)
	je	.LBB24_2
# %bb.1:
	movq	-16(%rbp), %rdi
	callq	fclose
.LBB24_2:
	movb	-1(%rbp), %al
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end24:
	.size	fileExists, .Lfunc_end24-fileExists
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function pad
	.type	pad,@function
pad:                                    # @pad
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, -32(%rbp)
	callq	strlen
	cmpl	longestFileName(%rip), %eax
	jl	.LBB25_1
.LBB25_4:
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB25_1:
	.cfi_def_cfa %rbp, 16
	movl	$1, -20(%rbp)
	.p2align	4, 0x90
.LBB25_2:                               # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %r14d
	movl	longestFileName(%rip), %ebx
	movq	-32(%rbp), %rdi
	callq	strlen
	subl	%eax, %ebx
	cmpl	%ebx, %r14d
	jg	.LBB25_4
# %bb.3:                                #   in Loop: Header=BB25_2 Depth=1
	movq	stderr(%rip), %rdi
	movl	$.L.str.72, %esi
	xorl	%eax, %eax
	callq	fprintf
	addl	$1, -20(%rbp)
	jmp	.LBB25_2
.Lfunc_end25:
	.size	pad, .Lfunc_end25-pad
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function testStream
	.type	testStream,@function
testStream:                             # @testStream
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$10088, %rsp                    # imm = 0x2768
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, -64(%rbp)
	movq	$0, -72(%rbp)
	movl	$0, -52(%rbp)
	movl	$0, -76(%rbp)
	callq	ferror
	testl	%eax, %eax
	jne	.LBB26_24
# %bb.1:
	leaq	-48(%rbp), %rbx
	leaq	-5120(%rbp), %r14
	leaq	-10128(%rbp), %r15
	leaq	-96(%rbp), %r12
	leaq	-52(%rbp), %r13
.LBB26_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB26_5 Depth 2
                                        #     Child Loop BB26_14 Depth 2
	movq	-64(%rbp), %rsi
	movl	verbosity(%rip), %edx
	movzbl	smallMode(%rip), %ecx
	movl	-52(%rbp), %r9d
	movq	%rbx, %rdi
	movq	%r14, %r8
	callq	BZ2_bzReadOpen
	movq	%rax, -72(%rbp)
	testq	%rax, %rax
	je	.LBB26_7
# %bb.3:                                #   in Loop: Header=BB26_2 Depth=1
	cmpl	$0, -48(%rbp)
	jne	.LBB26_7
# %bb.4:                                #   in Loop: Header=BB26_2 Depth=1
	addl	$1, -76(%rbp)
	.p2align	4, 0x90
.LBB26_5:                               #   Parent Loop BB26_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, -48(%rbp)
	jne	.LBB26_11
# %bb.6:                                #   in Loop: Header=BB26_5 Depth=2
	movq	-72(%rbp), %rsi
	movq	%rbx, %rdi
	movq	%r15, %rdx
	movl	$5000, %ecx                     # imm = 0x1388
	callq	BZ2_bzRead
	movl	%eax, -100(%rbp)
	cmpl	$-5, -48(%rbp)
	jne	.LBB26_5
	jmp	.LBB26_7
	.p2align	4, 0x90
.LBB26_11:                              #   in Loop: Header=BB26_2 Depth=1
	cmpl	$4, -48(%rbp)
	jne	.LBB26_7
# %bb.12:                               #   in Loop: Header=BB26_2 Depth=1
	movq	-72(%rbp), %rsi
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movq	%r13, %rcx
	callq	BZ2_bzReadGetUnused
	cmpl	$0, -48(%rbp)
	jne	.LBB26_38
# %bb.13:                               #   in Loop: Header=BB26_2 Depth=1
	movq	-96(%rbp), %rax
	movq	%rax, -88(%rbp)
	movl	$0, -56(%rbp)
	.p2align	4, 0x90
.LBB26_14:                              #   Parent Loop BB26_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-56(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jge	.LBB26_16
# %bb.15:                               #   in Loop: Header=BB26_14 Depth=2
	movq	-88(%rbp), %rax
	movslq	-56(%rbp), %rcx
	movzbl	(%rax,%rcx), %eax
	movb	%al, -5120(%rbp,%rcx)
	leal	1(%rcx), %eax
	movl	%eax, -56(%rbp)
	jmp	.LBB26_14
	.p2align	4, 0x90
.LBB26_16:                              #   in Loop: Header=BB26_2 Depth=1
	movq	-72(%rbp), %rsi
	movq	%rbx, %rdi
	callq	BZ2_bzReadClose
	cmpl	$0, -48(%rbp)
	jne	.LBB26_38
# %bb.17:                               #   in Loop: Header=BB26_2 Depth=1
	cmpl	$0, -52(%rbp)
	jne	.LBB26_2
# %bb.18:                               #   in Loop: Header=BB26_2 Depth=1
	movq	-64(%rbp), %rdi
	callq	myfeof
	testb	%al, %al
	je	.LBB26_2
# %bb.19:
	movq	-64(%rbp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB26_24
# %bb.20:
	movq	-64(%rbp), %rdi
	callq	fclose
	movl	%eax, -104(%rbp)
	cmpl	$-1, %eax
	je	.LBB26_24
# %bb.21:
	cmpl	$2, verbosity(%rip)
	jl	.LBB26_36
# %bb.22:
	movq	stderr(%rip), %rdi
	movl	$.L.str.89, %esi
	jmp	.LBB26_35
.LBB26_7:
	movq	-72(%rbp), %rsi
	leaq	-108(%rbp), %rdi
	callq	BZ2_bzReadClose
	cmpl	$0, verbosity(%rip)
	jne	.LBB26_9
# %bb.8:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.99, %esi
	movl	$inName, %ecx
	xorl	%eax, %eax
	callq	fprintf
.LBB26_9:
	movl	-48(%rbp), %eax
	addl	$9, %eax
	cmpl	$6, %eax
	ja	.LBB26_39
# %bb.10:
	jmpq	*.LJTI26_0(,%rax,8)
.LBB26_28:
	movq	stderr(%rip), %rdi
	movl	$.L.str.101, %esi
	jmp	.LBB26_26
.LBB26_29:
	movq	-64(%rbp), %rax
	cmpq	stdin(%rip), %rax
	je	.LBB26_31
# %bb.30:
	movq	-64(%rbp), %rdi
	callq	fclose
.LBB26_31:
	cmpl	$1, -76(%rbp)
	jne	.LBB26_33
# %bb.32:
	movq	stderr(%rip), %rdi
	movl	$.L.str.102, %esi
	jmp	.LBB26_26
.LBB26_25:
	movq	stderr(%rip), %rdi
	movl	$.L.str.100, %esi
.LBB26_26:
	xorl	%eax, %eax
	callq	fprintf
	movb	$0, -41(%rbp)
.LBB26_37:
	movb	-41(%rbp), %al
	addq	$10088, %rsp                    # imm = 0x2768
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB26_33:
	.cfi_def_cfa %rbp, 16
	cmpb	$0, noisy(%rip)
	je	.LBB26_36
# %bb.34:
	movq	stderr(%rip), %rdi
	movl	$.L.str.103, %esi
.LBB26_35:
	xorl	%eax, %eax
	callq	fprintf
.LBB26_36:
	movb	$1, -41(%rbp)
	jmp	.LBB26_37
.LBB26_38:
	movl	$.L.str.98, %edi
	callq	panic
.LBB26_24:
	callq	ioError
.LBB26_23:
	callq	configError
.LBB26_39:
	movl	$.L.str.104, %edi
	callq	panic
.LBB26_27:
	callq	outOfMemory
.Lfunc_end26:
	.size	testStream, .Lfunc_end26-testStream
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI26_0:
	.quad	.LBB26_23
	.quad	.LBB26_39
	.quad	.LBB26_28
	.quad	.LBB26_24
	.quad	.LBB26_29
	.quad	.LBB26_25
	.quad	.LBB26_27
                                        # -- End function
	.text
	.p2align	4, 0x90                         # -- Begin function myfeof
	.type	myfeof,@function
myfeof:                                 # @myfeof
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	callq	fgetc
	movl	%eax, -8(%rbp)
	cmpl	$-1, %eax
	je	.LBB27_1
# %bb.2:
	movl	-8(%rbp), %edi
	movq	-16(%rbp), %rsi
	callq	ungetc
	movb	$0, -1(%rbp)
	jmp	.LBB27_3
.LBB27_1:
	movb	$1, -1(%rbp)
.LBB27_3:
	movb	-1(%rbp), %al
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end27:
	.size	myfeof, .Lfunc_end27-myfeof
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function configError
	.type	configError,@function
configError:                            # @configError
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	stderr(%rip), %rdi
	movl	$.L.str.77, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	$3, %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
.Lfunc_end28:
	.size	configError, .Lfunc_end28-configError
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function ioError
	.type	ioError,@function
ioError:                                # @ioError
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.78, %esi
	xorl	%eax, %eax
	callq	fprintf
	movq	progName(%rip), %rdi
	callq	perror
	callq	showFileNames
	movl	$1, %edi
	callq	cleanUpAndFail
.Lfunc_end29:
	.size	ioError, .Lfunc_end29-ioError
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function outOfMemory
	.type	outOfMemory,@function
outOfMemory:                            # @outOfMemory
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.48, %esi
	xorl	%eax, %eax
	callq	fprintf
	callq	showFileNames
	movl	$1, %edi
	callq	cleanUpAndFail
.Lfunc_end30:
	.size	outOfMemory, .Lfunc_end30-outOfMemory
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function showFileNames
	.type	showFileNames,@function
showFileNames:                          # @showFileNames
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	cmpb	$0, noisy(%rip)
	je	.LBB31_2
# %bb.1:
	movq	stderr(%rip), %rdi
	movl	$.L.str.38, %esi
	movl	$inName, %edx
	movl	$outName, %ecx
	xorl	%eax, %eax
	callq	fprintf
.LBB31_2:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end31:
	.size	showFileNames, .Lfunc_end31-showFileNames
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function cleanUpAndFail
	.type	cleanUpAndFail,@function
cleanUpAndFail:                         # @cleanUpAndFail
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$160, %rsp
	movl	%edi, -8(%rbp)
	cmpl	$3, srcMode(%rip)
	jne	.LBB32_12
# %bb.1:
	cmpl	$3, opMode(%rip)
	je	.LBB32_12
# %bb.2:
	cmpb	$0, deleteOutputOnInterrupt(%rip)
	je	.LBB32_12
# %bb.3:
	leaq	-152(%rbp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	%eax, -4(%rbp)
	testl	%eax, %eax
	jne	.LBB32_10
# %bb.4:
	cmpb	$0, noisy(%rip)
	je	.LBB32_6
# %bb.5:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.39, %esi
	movl	$outName, %ecx
	xorl	%eax, %eax
	callq	fprintf
.LBB32_6:
	cmpq	$0, outputHandleJustInCase(%rip)
	je	.LBB32_8
# %bb.7:
	movq	outputHandleJustInCase(%rip), %rdi
	callq	fclose
.LBB32_8:
	movl	$outName, %edi
	callq	remove
	movl	%eax, -4(%rbp)
	testl	%eax, %eax
	je	.LBB32_12
# %bb.9:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.40, %esi
	jmp	.LBB32_11
.LBB32_10:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.41, %esi
	xorl	%eax, %eax
	callq	fprintf
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.42, %esi
	xorl	%eax, %eax
	callq	fprintf
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.43, %esi
	movl	$outName, %ecx
	xorl	%eax, %eax
	callq	fprintf
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.44, %esi
.LBB32_11:
	xorl	%eax, %eax
	callq	fprintf
.LBB32_12:
	cmpb	$0, noisy(%rip)
	je	.LBB32_16
# %bb.13:
	cmpl	$0, numFileNames(%rip)
	jle	.LBB32_16
# %bb.14:
	movl	numFilesProcessed(%rip), %eax
	cmpl	numFileNames(%rip), %eax
	jge	.LBB32_16
# %bb.15:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rcx
	movl	numFileNames(%rip), %r8d
	movl	%r8d, %r9d
	subl	numFilesProcessed(%rip), %r9d
	movl	$.L.str.45, %esi
	movq	%rcx, %rdx
	xorl	%eax, %eax
	callq	fprintf
.LBB32_16:
	movl	-8(%rbp), %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
.Lfunc_end32:
	.size	cleanUpAndFail, .Lfunc_end32-cleanUpAndFail
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function mapSuffix
	.type	mapSuffix,@function
mapSuffix:                              # @mapSuffix
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, -32(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -40(%rbp)
	callq	hasSuffix
	testb	%al, %al
	je	.LBB33_1
# %bb.2:
	movq	-32(%rbp), %r14
	movq	%r14, %rdi
	callq	strlen
	movq	%rax, %rbx
	movq	-48(%rbp), %rdi
	callq	strlen
	subq	%rax, %rbx
	movb	$0, (%r14,%rbx)
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rsi
	callq	strcat
	movb	$1, -17(%rbp)
	jmp	.LBB33_3
.LBB33_1:
	movb	$0, -17(%rbp)
.LBB33_3:
	movb	-17(%rbp), %al
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end33:
	.size	mapSuffix, .Lfunc_end33-mapSuffix
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function notAStandardFile
	.type	notAStandardFile,@function
notAStandardFile:                       # @notAStandardFile
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$160, %rsp
	movq	%rdi, -16(%rbp)
	leaq	-160(%rbp), %rsi
	callq	lstat
	movl	%eax, -8(%rbp)
	testl	%eax, %eax
	jne	.LBB34_3
# %bb.1:
	movl	$61440, %eax                    # imm = 0xF000
	andl	-136(%rbp), %eax
	cmpl	$32768, %eax                    # imm = 0x8000
	jne	.LBB34_3
# %bb.2:
	movb	$0, -1(%rbp)
	jmp	.LBB34_4
.LBB34_3:
	movb	$1, -1(%rbp)
.LBB34_4:
	movb	-1(%rbp), %al
	addq	$160, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end34:
	.size	notAStandardFile, .Lfunc_end34-notAStandardFile
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function countHardLinks
	.type	countHardLinks,@function
countHardLinks:                         # @countHardLinks
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$160, %rsp
	movq	%rdi, -16(%rbp)
	leaq	-160(%rbp), %rsi
	callq	lstat
	movl	%eax, -8(%rbp)
	testl	%eax, %eax
	je	.LBB35_2
# %bb.1:
	movl	$0, -4(%rbp)
	jmp	.LBB35_3
.LBB35_2:
	movl	-144(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -4(%rbp)
.LBB35_3:
	movl	-4(%rbp), %eax
	addq	$160, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end35:
	.size	countHardLinks, .Lfunc_end35-countHardLinks
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function saveInputFileMetaInfo
	.type	saveInputFileMetaInfo,@function
saveInputFileMetaInfo:                  # @saveInputFileMetaInfo
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movl	$fileMetaInfo, %esi
	callq	stat
	movl	%eax, -4(%rbp)
	testl	%eax, %eax
	jne	.LBB36_2
# %bb.1:
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB36_2:
	.cfi_def_cfa %rbp, 16
	callq	ioError
.Lfunc_end36:
	.size	saveInputFileMetaInfo, .Lfunc_end36-saveInputFileMetaInfo
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function fopen_output_safely
	.type	fopen_output_safely,@function
fopen_output_safely:                    # @fopen_output_safely
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$193, %esi
	movl	$384, %edx                      # imm = 0x180
	xorl	%eax, %eax
	callq	open
	movl	%eax, -4(%rbp)
	cmpl	$-1, %eax
	je	.LBB37_1
# %bb.2:
	movl	-4(%rbp), %edi
	movq	-32(%rbp), %rsi
	callq	fdopen
	movq	%rax, -24(%rbp)
	testq	%rax, %rax
	jne	.LBB37_4
# %bb.3:
	movl	-4(%rbp), %edi
	callq	close
.LBB37_4:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.LBB37_5
.LBB37_1:
	movq	$0, -16(%rbp)
.LBB37_5:
	movq	-16(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end37:
	.size	fopen_output_safely, .Lfunc_end37-fopen_output_safely
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function uncompressStream
	.type	uncompressStream,@function
uncompressStream:                       # @uncompressStream
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$10104, %rsp                    # imm = 0x2778
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, -64(%rbp)
	movq	%rsi, -56(%rbp)
	movq	$0, -88(%rbp)
	movl	$0, -72(%rbp)
	movl	$0, -92(%rbp)
	movq	%rsi, %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB38_20
# %bb.1:
	movq	-64(%rbp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB38_20
# %bb.2:
	leaq	-48(%rbp), %r15
	leaq	-5136(%rbp), %r14
	leaq	-10144(%rbp), %rbx
	leaq	-120(%rbp), %r12
	leaq	-72(%rbp), %r13
.LBB38_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB38_6 Depth 2
                                        #     Child Loop BB38_24 Depth 2
	movq	-64(%rbp), %rsi
	movl	verbosity(%rip), %edx
	movzbl	smallMode(%rip), %ecx
	movl	-72(%rbp), %r9d
	movq	%r15, %rdi
	movq	%r14, %r8
	callq	BZ2_bzReadOpen
	movq	%rax, -88(%rbp)
	testq	%rax, %rax
	je	.LBB38_40
# %bb.4:                                #   in Loop: Header=BB38_3 Depth=1
	cmpl	$0, -48(%rbp)
	jne	.LBB38_40
# %bb.5:                                #   in Loop: Header=BB38_3 Depth=1
	addl	$1, -92(%rbp)
	jmp	.LBB38_6
	.p2align	4, 0x90
.LBB38_19:                              #   in Loop: Header=BB38_6 Depth=2
	movq	-56(%rbp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB38_20
.LBB38_6:                               #   Parent Loop BB38_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, -48(%rbp)
	jne	.LBB38_21
# %bb.7:                                #   in Loop: Header=BB38_6 Depth=2
	movq	-88(%rbp), %rsi
	movq	%r15, %rdi
	movq	%rbx, %rdx
	movl	$5000, %ecx                     # imm = 0x1388
	callq	BZ2_bzRead
	movl	%eax, -68(%rbp)
	cmpl	$-5, -48(%rbp)
	je	.LBB38_8
# %bb.15:                               #   in Loop: Header=BB38_6 Depth=2
	cmpl	$0, -48(%rbp)
	je	.LBB38_17
# %bb.16:                               #   in Loop: Header=BB38_6 Depth=2
	cmpl	$4, -48(%rbp)
	jne	.LBB38_19
.LBB38_17:                              #   in Loop: Header=BB38_6 Depth=2
	cmpl	$0, -68(%rbp)
	jle	.LBB38_19
# %bb.18:                               #   in Loop: Header=BB38_6 Depth=2
	movslq	-68(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	fwrite
	jmp	.LBB38_19
	.p2align	4, 0x90
.LBB38_21:                              #   in Loop: Header=BB38_3 Depth=1
	cmpl	$4, -48(%rbp)
	jne	.LBB38_40
# %bb.22:                               #   in Loop: Header=BB38_3 Depth=1
	movq	-88(%rbp), %rsi
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r13, %rcx
	callq	BZ2_bzReadGetUnused
	cmpl	$0, -48(%rbp)
	jne	.LBB38_57
# %bb.23:                               #   in Loop: Header=BB38_3 Depth=1
	movq	-120(%rbp), %rax
	movq	%rax, -112(%rbp)
	movl	$0, -76(%rbp)
	.p2align	4, 0x90
.LBB38_24:                              #   Parent Loop BB38_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-76(%rbp), %eax
	cmpl	-72(%rbp), %eax
	jge	.LBB38_26
# %bb.25:                               #   in Loop: Header=BB38_24 Depth=2
	movq	-112(%rbp), %rax
	movslq	-76(%rbp), %rcx
	movzbl	(%rax,%rcx), %eax
	movb	%al, -5136(%rbp,%rcx)
	leal	1(%rcx), %eax
	movl	%eax, -76(%rbp)
	jmp	.LBB38_24
	.p2align	4, 0x90
.LBB38_26:                              #   in Loop: Header=BB38_3 Depth=1
	movq	-88(%rbp), %rsi
	movq	%r15, %rdi
	callq	BZ2_bzReadClose
	cmpl	$0, -48(%rbp)
	jne	.LBB38_57
# %bb.27:                               #   in Loop: Header=BB38_3 Depth=1
	cmpl	$0, -72(%rbp)
	jne	.LBB38_3
# %bb.28:                               #   in Loop: Header=BB38_3 Depth=1
	movq	-64(%rbp), %rdi
	callq	myfeof
	testb	%al, %al
	je	.LBB38_3
.LBB38_29:
	movq	-64(%rbp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB38_20
# %bb.30:
	movq	-56(%rbp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB38_33
# %bb.31:
	movq	-56(%rbp), %rdi
	callq	fileno
	movl	%eax, -100(%rbp)
	testl	%eax, %eax
	js	.LBB38_20
# %bb.32:
	movl	-100(%rbp), %edi
	callq	applySavedFileAttrToOutputFile
.LBB38_33:
	movq	-64(%rbp), %rdi
	callq	fclose
	movl	%eax, -96(%rbp)
	cmpl	$-1, %eax
	je	.LBB38_20
# %bb.34:
	movq	-56(%rbp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB38_20
# %bb.35:
	movq	-56(%rbp), %rdi
	callq	fflush
	movl	%eax, -96(%rbp)
	testl	%eax, %eax
	jne	.LBB38_20
# %bb.36:
	movq	-56(%rbp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB38_38
# %bb.37:
	movq	-56(%rbp), %rdi
	callq	fclose
	movl	%eax, -96(%rbp)
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$-1, %eax
	je	.LBB38_20
.LBB38_38:
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$2, verbosity(%rip)
	jl	.LBB38_55
# %bb.39:
	movq	stderr(%rip), %rdi
	movl	$.L.str.89, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB38_55
.LBB38_8:
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB38_40
# %bb.9:
	movq	-64(%rbp), %rdi
	callq	rewind
	leaq	-10144(%rbp), %rbx
	jmp	.LBB38_10
	.p2align	4, 0x90
.LBB38_14:                              #   in Loop: Header=BB38_10 Depth=1
	movq	-56(%rbp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB38_20
.LBB38_10:                              # =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rdi
	callq	myfeof
	testb	%al, %al
	jne	.LBB38_29
# %bb.11:                               #   in Loop: Header=BB38_10 Depth=1
	movq	-64(%rbp), %rcx
	movl	$1, %esi
	movl	$5000, %edx                     # imm = 0x1388
	movq	%rbx, %rdi
	callq	fread
	movl	%eax, -68(%rbp)
	movq	-64(%rbp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB38_20
# %bb.12:                               #   in Loop: Header=BB38_10 Depth=1
	cmpl	$0, -68(%rbp)
	jle	.LBB38_14
# %bb.13:                               #   in Loop: Header=BB38_10 Depth=1
	movslq	-68(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	fwrite
	jmp	.LBB38_14
.LBB38_40:
	movq	-88(%rbp), %rsi
	leaq	-124(%rbp), %rdi
	callq	BZ2_bzReadClose
	movl	-48(%rbp), %eax
	cmpl	$-5, %eax
	jne	.LBB38_41
# %bb.47:
	movq	-64(%rbp), %rax
	cmpq	stdin(%rip), %rax
	je	.LBB38_49
# %bb.48:
	movq	-64(%rbp), %rdi
	callq	fclose
.LBB38_49:
	movq	-56(%rbp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB38_51
# %bb.50:
	movq	-56(%rbp), %rdi
	callq	fclose
.LBB38_51:
	cmpl	$1, -92(%rbp)
	jne	.LBB38_53
# %bb.52:
	movb	$0, -41(%rbp)
	jmp	.LBB38_56
.LBB38_53:
	cmpb	$0, noisy(%rip)
	je	.LBB38_55
# %bb.54:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.90, %esi
	movl	$inName, %ecx
	xorl	%eax, %eax
	callq	fprintf
.LBB38_55:
	movb	$1, -41(%rbp)
.LBB38_56:
	movb	-41(%rbp), %al
	addq	$10104, %rsp                    # imm = 0x2778
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB38_41:
	.cfi_def_cfa %rbp, 16
	addl	$9, %eax
	cmpl	$6, %eax
	ja	.LBB38_58
# %bb.42:
	jmpq	*.LJTI38_0(,%rax,8)
.LBB38_43:
	callq	configError
.LBB38_20:
	callq	ioError
.LBB38_57:
	movl	$.L.str.88, %edi
	callq	panic
.LBB38_58:
	movl	$.L.str.91, %edi
	callq	panic
.LBB38_46:
	callq	compressedStreamEOF
.LBB38_44:
	callq	crcError
.LBB38_45:
	callq	outOfMemory
.Lfunc_end38:
	.size	uncompressStream, .Lfunc_end38-uncompressStream
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI38_0:
	.quad	.LBB38_43
	.quad	.LBB38_58
	.quad	.LBB38_46
	.quad	.LBB38_20
	.quad	.LBB38_58
	.quad	.LBB38_44
	.quad	.LBB38_45
                                        # -- End function
	.text
	.p2align	4, 0x90                         # -- Begin function applySavedTimeInfoToOutputFile
	.type	applySavedTimeInfoToOutputFile,@function
applySavedTimeInfoToOutputFile:         # @applySavedTimeInfoToOutputFile
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -32(%rbp)
	movq	fileMetaInfo+72(%rip), %rax
	movq	%rax, -24(%rbp)
	movq	fileMetaInfo+88(%rip), %rax
	movq	%rax, -16(%rbp)
	leaq	-24(%rbp), %rsi
	callq	utime
	movl	%eax, -4(%rbp)
	testl	%eax, %eax
	jne	.LBB39_2
# %bb.1:
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB39_2:
	.cfi_def_cfa %rbp, 16
	callq	ioError
.Lfunc_end39:
	.size	applySavedTimeInfoToOutputFile, .Lfunc_end39-applySavedTimeInfoToOutputFile
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function applySavedFileAttrToOutputFile
	.type	applySavedFileAttrToOutputFile,@function
applySavedFileAttrToOutputFile:         # @applySavedFileAttrToOutputFile
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	fileMetaInfo+24(%rip), %esi
	callq	fchmod
	movl	%eax, -8(%rbp)
	testl	%eax, %eax
	jne	.LBB40_2
# %bb.1:
	movl	-4(%rbp), %edi
	movl	fileMetaInfo+28(%rip), %esi
	movl	fileMetaInfo+32(%rip), %edx
	callq	fchown
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB40_2:
	.cfi_def_cfa %rbp, 16
	callq	ioError
.Lfunc_end40:
	.size	applySavedFileAttrToOutputFile, .Lfunc_end40-applySavedFileAttrToOutputFile
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function crcError
	.type	crcError,@function
crcError:                               # @crcError
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.92, %esi
	xorl	%eax, %eax
	callq	fprintf
	callq	showFileNames
	callq	cadvise
	movl	$2, %edi
	callq	cleanUpAndFail
.Lfunc_end41:
	.size	crcError, .Lfunc_end41-crcError
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function compressedStreamEOF
	.type	compressedStreamEOF,@function
compressedStreamEOF:                    # @compressedStreamEOF
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	cmpb	$0, noisy(%rip)
	je	.LBB42_2
# %bb.1:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.93, %esi
	xorl	%eax, %eax
	callq	fprintf
	movq	progName(%rip), %rdi
	callq	perror
	callq	showFileNames
	callq	cadvise
.LBB42_2:
	movl	$2, %edi
	callq	cleanUpAndFail
.Lfunc_end42:
	.size	compressedStreamEOF, .Lfunc_end42-compressedStreamEOF
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function cadvise
	.type	cadvise,@function
cadvise:                                # @cadvise
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	cmpb	$0, noisy(%rip)
	je	.LBB43_2
# %bb.1:
	movq	stderr(%rip), %rdi
	movl	$.L.str.46, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB43_2:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end43:
	.size	cadvise, .Lfunc_end43-cadvise
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function hasSuffix
	.type	hasSuffix,@function
hasSuffix:                              # @hasSuffix
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -32(%rbp)
	movq	%rsi, -24(%rbp)
	callq	strlen
	movl	%eax, -8(%rbp)
	movq	-24(%rbp), %rdi
	callq	strlen
	movl	%eax, -12(%rbp)
	cmpl	%eax, -8(%rbp)
	jl	.LBB44_3
# %bb.1:
	movslq	-8(%rbp), %rdi
	addq	-32(%rbp), %rdi
	movslq	-12(%rbp), %rax
	subq	%rax, %rdi
	movq	-24(%rbp), %rsi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB44_2
.LBB44_3:
	movb	$0, -1(%rbp)
	jmp	.LBB44_4
.LBB44_2:
	movb	$1, -1(%rbp)
.LBB44_4:
	movb	-1(%rbp), %al
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end44:
	.size	hasSuffix, .Lfunc_end44-hasSuffix
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function compressStream
.LCPI45_0:
	.quad	0x4020000000000000              # double 8
.LCPI45_1:
	.quad	0x3ff0000000000000              # double 1
.LCPI45_2:
	.quad	0x4059000000000000              # double 100
	.text
	.p2align	4, 0x90
	.type	compressStream,@function
compressStream:                         # @compressStream
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$5192, %rsp                     # imm = 0x1448
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -40(%rbp)
	movq	$0, -80(%rbp)
	callq	ferror
	testl	%eax, %eax
	jne	.LBB45_30
# %bb.1:
	movq	-40(%rbp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB45_30
# %bb.2:
	movq	-40(%rbp), %rsi
	movl	blockSize100k(%rip), %edx
	movl	verbosity(%rip), %ecx
	movl	workFactor(%rip), %r8d
	leaq	-28(%rbp), %rdi
	callq	BZ2_bzWriteOpen
	movq	%rax, -80(%rbp)
	cmpl	$0, -28(%rbp)
	jne	.LBB45_23
# %bb.3:
	cmpl	$2, verbosity(%rip)
	jl	.LBB45_5
# %bb.4:
	movq	stderr(%rip), %rdi
	movl	$.L.str.73, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB45_5:
	leaq	-5200(%rbp), %rbx
	leaq	-28(%rbp), %r14
	jmp	.LBB45_6
	.p2align	4, 0x90
.LBB45_22:                              #   in Loop: Header=BB45_6 Depth=1
	cmpl	$0, -28(%rbp)
	jne	.LBB45_23
.LBB45_6:                               # =>This Inner Loop Header: Depth=1
	movq	-56(%rbp), %rdi
	callq	myfeof
	testb	%al, %al
	jne	.LBB45_7
# %bb.19:                               #   in Loop: Header=BB45_6 Depth=1
	movq	-56(%rbp), %rcx
	movl	$1, %esi
	movl	$5000, %edx                     # imm = 0x1388
	movq	%rbx, %rdi
	callq	fread
	movl	%eax, -72(%rbp)
	movq	-56(%rbp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB45_30
# %bb.20:                               #   in Loop: Header=BB45_6 Depth=1
	cmpl	$0, -72(%rbp)
	jle	.LBB45_22
# %bb.21:                               #   in Loop: Header=BB45_6 Depth=1
	movq	-80(%rbp), %rsi
	movl	-72(%rbp), %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	callq	BZ2_bzWrite
	jmp	.LBB45_22
.LBB45_7:
	movq	-80(%rbp), %rsi
	leaq	-64(%rbp), %rax
	movq	%rax, (%rsp)
	leaq	-28(%rbp), %rdi
	leaq	-48(%rbp), %rcx
	leaq	-44(%rbp), %r8
	leaq	-68(%rbp), %r9
	xorl	%edx, %edx
	callq	BZ2_bzWriteClose64
	cmpl	$0, -28(%rbp)
	jne	.LBB45_23
# %bb.8:
	movq	-40(%rbp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB45_30
# %bb.9:
	movq	-40(%rbp), %rdi
	callq	fflush
	movl	%eax, -60(%rbp)
	cmpl	$-1, %eax
	je	.LBB45_30
# %bb.10:
	movq	-40(%rbp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB45_13
# %bb.11:
	movq	-40(%rbp), %rdi
	callq	fileno
	movl	%eax, -84(%rbp)
	testl	%eax, %eax
	js	.LBB45_30
# %bb.12:
	movl	-84(%rbp), %edi
	callq	applySavedFileAttrToOutputFile
	movq	-40(%rbp), %rdi
	callq	fclose
	movl	%eax, -60(%rbp)
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$-1, %eax
	je	.LBB45_30
.LBB45_13:
	movq	$0, outputHandleJustInCase(%rip)
	movq	-56(%rbp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB45_30
# %bb.14:
	movq	-56(%rbp), %rdi
	callq	fclose
	movl	%eax, -60(%rbp)
	cmpl	$-1, %eax
	je	.LBB45_30
# %bb.15:
	cmpl	$0, verbosity(%rip)
	jle	.LBB45_28
# %bb.16:
	cmpl	$0, -48(%rbp)
	jne	.LBB45_27
# %bb.17:
	cmpl	$0, -44(%rbp)
	je	.LBB45_18
.LBB45_27:
	movl	-48(%rbp), %esi
	movl	-44(%rbp), %edx
	leaq	-128(%rbp), %r15
	movq	%r15, %rdi
	callq	uInt64_from_UInt32s
	movl	-68(%rbp), %esi
	movl	-64(%rbp), %edx
	leaq	-120(%rbp), %rbx
	movq	%rbx, %rdi
	callq	uInt64_from_UInt32s
	movq	%r15, %rdi
	callq	uInt64_to_double
	movsd	%xmm0, -104(%rbp)
	movq	%rbx, %rdi
	callq	uInt64_to_double
	movsd	%xmm0, -96(%rbp)
	leaq	-192(%rbp), %r14
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	uInt64_toAscii
	leaq	-160(%rbp), %r15
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	uInt64_toAscii
	movq	stderr(%rip), %rdi
	movsd	-104(%rbp), %xmm2               # xmm2 = mem[0],zero
	movsd	-96(%rbp), %xmm3                # xmm3 = mem[0],zero
	movapd	%xmm2, %xmm0
	divsd	%xmm3, %xmm0
	movsd	.LCPI45_0(%rip), %xmm1          # xmm1 = mem[0],zero
	mulsd	%xmm3, %xmm1
	divsd	%xmm2, %xmm1
	divsd	%xmm2, %xmm3
	movsd	.LCPI45_1(%rip), %xmm2          # xmm2 = mem[0],zero
	subsd	%xmm3, %xmm2
	mulsd	.LCPI45_2(%rip), %xmm2
	movl	$.L.str.75, %esi
	movq	%r14, %rdx
	movq	%r15, %rcx
	movb	$3, %al
	callq	fprintf
.LBB45_28:
	addq	$5192, %rsp                     # imm = 0x1448
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB45_18:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rdi
	movl	$.L.str.74, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB45_28
.LBB45_23:
	movq	-80(%rbp), %rsi
	leaq	-64(%rbp), %rax
	movq	%rax, (%rsp)
	leaq	-108(%rbp), %rdi
	leaq	-48(%rbp), %rcx
	leaq	-44(%rbp), %r8
	leaq	-68(%rbp), %r9
	movl	$1, %edx
	callq	BZ2_bzWriteClose64
	movl	-28(%rbp), %eax
	cmpl	$-3, %eax
	je	.LBB45_29
# %bb.24:
	cmpl	$-6, %eax
	je	.LBB45_30
# %bb.25:
	cmpl	$-9, %eax
	jne	.LBB45_31
# %bb.26:
	callq	configError
.LBB45_30:
	callq	ioError
.LBB45_29:
	callq	outOfMemory
.LBB45_31:
	movl	$.L.str.76, %edi
	callq	panic
.Lfunc_end45:
	.size	compressStream, .Lfunc_end45-compressStream
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function uInt64_from_UInt32s
	.type	uInt64_from_UInt32s,@function
uInt64_from_UInt32s:                    # @uInt64_from_UInt32s
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -4(%rbp)
	movb	-1(%rbp), %al
	movb	%al, 7(%rdi)
	movb	-2(%rbp), %al
	movq	-16(%rbp), %rcx
	movb	%al, 6(%rcx)
	movb	-3(%rbp), %al
	movq	-16(%rbp), %rcx
	movb	%al, 5(%rcx)
	movb	-4(%rbp), %al
	movq	-16(%rbp), %rcx
	movb	%al, 4(%rcx)
	movb	-5(%rbp), %al
	movq	-16(%rbp), %rcx
	movb	%al, 3(%rcx)
	movb	-6(%rbp), %al
	movq	-16(%rbp), %rcx
	movb	%al, 2(%rcx)
	movb	-7(%rbp), %al
	movq	-16(%rbp), %rcx
	movb	%al, 1(%rcx)
	movb	-8(%rbp), %al
	movq	-16(%rbp), %rcx
	movb	%al, (%rcx)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end46:
	.size	uInt64_from_UInt32s, .Lfunc_end46-uInt64_from_UInt32s
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function uInt64_to_double
.LCPI47_0:
	.quad	0x4070000000000000              # double 256
	.text
	.p2align	4, 0x90
	.type	uInt64_to_double,@function
uInt64_to_double:                       # @uInt64_to_double
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -32(%rbp)
	movabsq	$4607182418800017408, %rax      # imm = 0x3FF0000000000000
	movq	%rax, -24(%rbp)
	movq	$0, -16(%rbp)
	movl	$0, -4(%rbp)
	movsd	.LCPI47_0(%rip), %xmm0          # xmm0 = mem[0],zero
	cmpl	$7, -4(%rbp)
	jg	.LBB47_3
	.p2align	4, 0x90
.LBB47_2:                               # =>This Inner Loop Header: Depth=1
	movsd	-24(%rbp), %xmm1                # xmm1 = mem[0],zero
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzbl	(%rax,%rcx), %eax
	xorps	%xmm2, %xmm2
	cvtsi2sd	%eax, %xmm2
	mulsd	%xmm1, %xmm2
	addsd	-16(%rbp), %xmm2
	movsd	%xmm2, -16(%rbp)
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, -24(%rbp)
	leal	1(%rcx), %eax
	movl	%eax, -4(%rbp)
	cmpl	$7, -4(%rbp)
	jle	.LBB47_2
.LBB47_3:
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end47:
	.size	uInt64_to_double, .Lfunc_end47-uInt64_to_double
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function uInt64_toAscii
	.type	uInt64_toAscii,@function
uInt64_toAscii:                         # @uInt64_toAscii
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset %rbx, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$0, -12(%rbp)
	movq	(%rsi), %rax
	movq	%rax, -32(%rbp)
	leaq	-32(%rbp), %rbx
	.p2align	4, 0x90
.LBB48_1:                               # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	uInt64_qrm10
	movl	%eax, -36(%rbp)
	addb	$48, %al
	movslq	-12(%rbp), %rcx
	movb	%al, -80(%rbp,%rcx)
	addl	$1, -12(%rbp)
	movq	%rbx, %rdi
	callq	uInt64_isZero
	testb	%al, %al
	je	.LBB48_1
# %bb.2:
	movq	-24(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movb	$0, (%rax,%rcx)
	movl	$0, -16(%rbp)
	leaq	-80(%rbp), %rax
	.p2align	4, 0x90
.LBB48_3:                               # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %ecx
	cmpl	-12(%rbp), %ecx
	jge	.LBB48_5
# %bb.4:                                #   in Loop: Header=BB48_3 Depth=1
	movslq	-12(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	subq	%rdx, %rcx
	movzbl	-1(%rcx,%rax), %ecx
	movq	-24(%rbp), %rsi
	movb	%cl, (%rsi,%rdx)
	addl	$1, -16(%rbp)
	jmp	.LBB48_3
.LBB48_5:
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end48:
	.size	uInt64_toAscii, .Lfunc_end48-uInt64_toAscii
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function uInt64_qrm10
	.type	uInt64_qrm10,@function
uInt64_qrm10:                           # @uInt64_qrm10
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -24(%rbp)
	movl	$0, -8(%rbp)
	movl	$7, -4(%rbp)
	movl	$3435973837, %eax               # imm = 0xCCCCCCCD
	cmpl	$0, -4(%rbp)
	js	.LBB49_3
	.p2align	4, 0x90
.LBB49_2:                               # =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %ecx
	shll	$8, %ecx
	movq	-24(%rbp), %rdx
	movslq	-4(%rbp), %rsi
	movzbl	(%rdx,%rsi), %edi
	orl	%ecx, %edi
	movl	%edi, -12(%rbp)
	imulq	%rax, %rdi
	shrq	$35, %rdi
	movb	%dil, (%rdx,%rsi)
	movl	-12(%rbp), %ecx
	movq	%rcx, %rdx
	imulq	%rax, %rdx
	shrq	$35, %rdx
	addl	%edx, %edx
	leal	(%rdx,%rdx,4), %edx
	subl	%edx, %ecx
	movl	%ecx, -8(%rbp)
	addl	$-1, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jns	.LBB49_2
.LBB49_3:
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end49:
	.size	uInt64_qrm10, .Lfunc_end49-uInt64_qrm10
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function uInt64_isZero
	.type	uInt64_isZero,@function
uInt64_isZero:                          # @uInt64_isZero
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movl	$0, -8(%rbp)
	cmpl	$7, -8(%rbp)
	jg	.LBB50_5
	.p2align	4, 0x90
.LBB50_2:                               # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movslq	-8(%rbp), %rcx
	cmpb	$0, (%rax,%rcx)
	jne	.LBB50_3
# %bb.4:                                #   in Loop: Header=BB50_2 Depth=1
	addl	$1, -8(%rbp)
	cmpl	$7, -8(%rbp)
	jle	.LBB50_2
.LBB50_5:
	movb	$1, -1(%rbp)
	jmp	.LBB50_6
.LBB50_3:
	movb	$0, -1(%rbp)
.LBB50_6:
	movb	-1(%rbp), %al
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end50:
	.size	uInt64_isZero, .Lfunc_end50-uInt64_isZero
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function mkCell
	.type	mkCell,@function
mkCell:                                 # @mkCell
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$16, %edi
	callq	myMalloc
	movq	%rax, -8(%rbp)
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end51:
	.size	mkCell, .Lfunc_end51-mkCell
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function myMalloc
	.type	myMalloc,@function
myMalloc:                               # @myMalloc
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -12(%rbp)
	movslq	%edi, %rdi
	callq	malloc
	movq	%rax, -8(%rbp)
	testq	%rax, %rax
	je	.LBB52_2
# %bb.1:
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB52_2:
	.cfi_def_cfa %rbp, 16
	callq	outOfMemory
.Lfunc_end52:
	.size	myMalloc, .Lfunc_end52-myMalloc
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bz__AssertH__fail           # -- Begin function BZ2_bz__AssertH__fail
	.p2align	4, 0x90
	.type	BZ2_bz__AssertH__fail,@function
BZ2_bz__AssertH__fail:                  # @BZ2_bz__AssertH__fail
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	%edi, %ebx
	movl	%edi, -20(%rbp)
	movq	stderr(%rip), %r14
	callq	BZ2_bzlibVersion
	movl	$.L.str.105, %esi
	movq	%r14, %rdi
	movl	%ebx, %edx
	movq	%rax, %rcx
	xorl	%eax, %eax
	callq	fprintf
	cmpl	$1007, -20(%rbp)                # imm = 0x3EF
	jne	.LBB53_2
# %bb.1:
	movq	stderr(%rip), %rdi
	movl	$.L.str.1.106, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB53_2:
	movl	$3, %edi
	callq	exit
.Lfunc_end53:
	.size	BZ2_bz__AssertH__fail, .Lfunc_end53-BZ2_bz__AssertH__fail
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzlibVersion                # -- Begin function BZ2_bzlibVersion
	.p2align	4, 0x90
	.type	BZ2_bzlibVersion,@function
BZ2_bzlibVersion:                       # @BZ2_bzlibVersion
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$.L.str.5.107, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end54:
	.size	BZ2_bzlibVersion, .Lfunc_end54-BZ2_bzlibVersion
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzCompressInit              # -- Begin function BZ2_bzCompressInit
	.p2align	4, 0x90
	.type	BZ2_bzCompressInit,@function
BZ2_bzCompressInit:                     # @BZ2_bzCompressInit
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, -20(%rbp)
	callq	bz_config_ok
	testl	%eax, %eax
	je	.LBB55_7
# %bb.1:
	cmpq	$0, -16(%rbp)
	je	.LBB55_6
# %bb.2:
	cmpl	$0, -24(%rbp)
	jle	.LBB55_6
# %bb.3:
	cmpl	$9, -24(%rbp)
	jg	.LBB55_6
# %bb.4:
	cmpl	$0, -20(%rbp)
	js	.LBB55_6
# %bb.5:
	cmpl	$251, -20(%rbp)
	jl	.LBB55_9
.LBB55_6:
	movl	$-2, -28(%rbp)
	jmp	.LBB55_8
.LBB55_7:
	movl	$-9, -28(%rbp)
.LBB55_8:
	movl	-28(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB55_9:
	.cfi_def_cfa %rbp, 16
	cmpl	$0, -20(%rbp)
	jne	.LBB55_11
# %bb.10:
	movl	$30, -20(%rbp)
.LBB55_11:
	movq	-16(%rbp), %rax
	cmpq	$0, 56(%rax)
	jne	.LBB55_13
# %bb.12:
	movq	-16(%rbp), %rax
	movq	$default_bzalloc, 56(%rax)
.LBB55_13:
	movq	-16(%rbp), %rax
	cmpq	$0, 64(%rax)
	jne	.LBB55_15
# %bb.14:
	movq	-16(%rbp), %rax
	movq	$default_bzfree, 64(%rax)
.LBB55_15:
	movq	-16(%rbp), %rax
	movq	72(%rax), %rdi
	movl	$55768, %esi                    # imm = 0xD9D8
	movl	$1, %edx
	callq	*56(%rax)
	movq	%rax, -8(%rbp)
	testq	%rax, %rax
	je	.LBB55_29
# %bb.16:
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 32(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 40(%rax)
	imull	$100000, -24(%rbp), %esi        # imm = 0x186A0
	movl	%esi, -32(%rbp)
	movq	-16(%rbp), %rax
	movq	72(%rax), %rdi
	shll	$2, %esi
	movl	$1, %edx
	callq	*56(%rax)
	movq	-8(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-16(%rbp), %rax
	movq	72(%rax), %rdi
	movl	-32(%rbp), %ecx
	leal	136(,%rcx,4), %esi
	movl	$1, %edx
	callq	*56(%rax)
	movq	-8(%rbp), %rcx
	movq	%rax, 32(%rcx)
	movq	-16(%rbp), %rax
	movq	72(%rax), %rdi
	movl	$262148, %esi                   # imm = 0x40004
	movl	$1, %edx
	callq	*56(%rax)
	movq	-8(%rbp), %rcx
	movq	%rax, 40(%rcx)
	movq	-8(%rbp), %rax
	cmpq	$0, 24(%rax)
	je	.LBB55_20
# %bb.17:
	movq	-8(%rbp), %rax
	cmpq	$0, 32(%rax)
	je	.LBB55_20
# %bb.18:
	movq	-8(%rbp), %rax
	cmpq	$0, 40(%rax)
	je	.LBB55_20
# %bb.19:
	movq	-8(%rbp), %rax
	movl	$0, 660(%rax)
	movq	-8(%rbp), %rax
	movl	$2, 12(%rax)
	movq	-8(%rbp), %rax
	movl	$2, 8(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 652(%rax)
	movl	-24(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 664(%rcx)
	imull	$100000, -24(%rbp), %eax        # imm = 0x186A0
	addl	$-19, %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 112(%rcx)
	movl	-36(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 656(%rcx)
	movl	-20(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 88(%rcx)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, 64(%rax)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rcx
	movq	%rcx, 72(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 80(%rax)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rcx
	movq	%rcx, 56(%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, 48(%rcx)
	movq	-16(%rbp), %rax
	movl	$0, 12(%rax)
	movq	-16(%rbp), %rax
	movl	$0, 16(%rax)
	movq	-16(%rbp), %rax
	movl	$0, 36(%rax)
	movq	-16(%rbp), %rax
	movl	$0, 40(%rax)
	movq	-8(%rbp), %rdi
	callq	init_RL
	movq	-8(%rbp), %rdi
	callq	prepare_new_block
	movl	$0, -28(%rbp)
	jmp	.LBB55_8
.LBB55_20:
	movq	-8(%rbp), %rax
	cmpq	$0, 24(%rax)
	je	.LBB55_22
# %bb.21:
	movq	-16(%rbp), %rax
	movq	72(%rax), %rdi
	movq	-8(%rbp), %rcx
	movq	24(%rcx), %rsi
	callq	*64(%rax)
.LBB55_22:
	movq	-8(%rbp), %rax
	cmpq	$0, 32(%rax)
	je	.LBB55_24
# %bb.23:
	movq	-16(%rbp), %rax
	movq	72(%rax), %rdi
	movq	-8(%rbp), %rcx
	movq	32(%rcx), %rsi
	callq	*64(%rax)
.LBB55_24:
	movq	-8(%rbp), %rax
	cmpq	$0, 40(%rax)
	je	.LBB55_26
# %bb.25:
	movq	-16(%rbp), %rax
	movq	72(%rax), %rdi
	movq	-8(%rbp), %rcx
	movq	40(%rcx), %rsi
	callq	*64(%rax)
.LBB55_26:
	cmpq	$0, -8(%rbp)
	je	.LBB55_29
# %bb.27:
	movq	-16(%rbp), %rax
	movq	72(%rax), %rdi
	movq	-8(%rbp), %rsi
	callq	*64(%rax)
.LBB55_29:
	movl	$-3, -28(%rbp)
	jmp	.LBB55_8
.Lfunc_end55:
	.size	BZ2_bzCompressInit, .Lfunc_end55-BZ2_bzCompressInit
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function bz_config_ok
	.type	bz_config_ok,@function
bz_config_ok:                           # @bz_config_ok
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end56:
	.size	bz_config_ok, .Lfunc_end56-bz_config_ok
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function default_bzalloc
	.type	default_bzalloc,@function
default_bzalloc:                        # @default_bzalloc
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -4(%rbp)
	movslq	%esi, %rax
	movslq	%edx, %rdi
	imulq	%rax, %rdi
	callq	malloc
	movq	%rax, -16(%rbp)
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end57:
	.size	default_bzalloc, .Lfunc_end57-default_bzalloc
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function default_bzfree
	.type	default_bzfree,@function
default_bzfree:                         # @default_bzfree
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -8(%rbp)
	testq	%rsi, %rsi
	je	.LBB58_2
# %bb.1:
	movq	-8(%rbp), %rdi
	callq	free
.LBB58_2:
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end58:
	.size	default_bzfree, .Lfunc_end58-default_bzfree
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function init_RL
	.type	init_RL,@function
init_RL:                                # @init_RL
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	$256, 92(%rdi)                  # imm = 0x100
	movq	-8(%rbp), %rax
	movl	$0, 96(%rax)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end59:
	.size	init_RL, .Lfunc_end59-init_RL
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function prepare_new_block
	.type	prepare_new_block,@function
prepare_new_block:                      # @prepare_new_block
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movl	$0, 108(%rdi)
	movq	-16(%rbp), %rax
	movl	$0, 116(%rax)
	movq	-16(%rbp), %rax
	movl	$0, 120(%rax)
	movq	-16(%rbp), %rax
	movl	$-1, 648(%rax)
	movl	$0, -4(%rbp)
	cmpl	$255, -4(%rbp)
	jg	.LBB60_3
	.p2align	4, 0x90
.LBB60_2:                               # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movb	$0, 128(%rax,%rcx)
	addl	$1, -4(%rbp)
	cmpl	$255, -4(%rbp)
	jle	.LBB60_2
.LBB60_3:
	movq	-16(%rbp), %rax
	addl	$1, 660(%rax)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end60:
	.size	prepare_new_block, .Lfunc_end60-prepare_new_block
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzCompress                  # -- Begin function BZ2_bzCompress
	.p2align	4, 0x90
	.type	BZ2_bzCompress,@function
BZ2_bzCompress:                         # @BZ2_bzCompress
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -32(%rbp)
	movl	%esi, -20(%rbp)
	testq	%rdi, %rdi
	je	.LBB61_11
# %bb.1:
	movq	-32(%rbp), %rax
	movq	48(%rax), %rax
	movq	%rax, -16(%rbp)
	testq	%rax, %rax
	je	.LBB61_11
# %bb.2:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	-32(%rbp), %rax
	je	.LBB61_5
.LBB61_11:
	movl	$-2, -4(%rbp)
.LBB61_12:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
	.p2align	4, 0x90
.LBB61_4:                               #   in Loop: Header=BB61_5 Depth=1
	.cfi_def_cfa %rbp, 16
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 16(%rcx)
	movq	-16(%rbp), %rax
	movl	$3, 8(%rax)
.LBB61_5:                               # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$2, %eax
	jne	.LBB61_13
# %bb.6:                                #   in Loop: Header=BB61_5 Depth=1
	cmpl	$0, -20(%rbp)
	je	.LBB61_22
# %bb.7:                                #   in Loop: Header=BB61_5 Depth=1
	cmpl	$1, -20(%rbp)
	je	.LBB61_4
# %bb.8:                                #   in Loop: Header=BB61_5 Depth=1
	cmpl	$2, -20(%rbp)
	jne	.LBB61_11
# %bb.9:                                #   in Loop: Header=BB61_5 Depth=1
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 16(%rcx)
	movq	-16(%rbp), %rax
	movl	$4, 8(%rax)
	jmp	.LBB61_5
.LBB61_13:
	cmpl	$4, %eax
	je	.LBB61_17
# %bb.14:
	cmpl	$3, %eax
	je	.LBB61_19
# %bb.15:
	cmpl	$1, %eax
	je	.LBB61_16
# %bb.21:
	movl	$0, -4(%rbp)
	jmp	.LBB61_12
.LBB61_17:
	cmpl	$2, -20(%rbp)
	jne	.LBB61_16
# %bb.23:
	movq	-16(%rbp), %rax
	movl	16(%rax), %ecx
	movq	(%rax), %rax
	cmpl	8(%rax), %ecx
	jne	.LBB61_16
# %bb.28:
	movq	-32(%rbp), %rdi
	callq	handle_compress
	movb	%al, -5(%rbp)
	testb	%al, %al
	je	.LBB61_16
# %bb.29:
	movq	-16(%rbp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB61_32
# %bb.30:
	movq	-16(%rbp), %rdi
	callq	isempty_RL
	testb	%al, %al
	je	.LBB61_32
# %bb.31:
	movq	-16(%rbp), %rax
	movl	120(%rax), %ecx
	cmpl	116(%rax), %ecx
	jge	.LBB61_39
.LBB61_32:
	movl	$3, -4(%rbp)
	jmp	.LBB61_12
.LBB61_19:
	cmpl	$1, -20(%rbp)
	jne	.LBB61_16
# %bb.25:
	movq	-16(%rbp), %rax
	movl	16(%rax), %ecx
	movq	(%rax), %rax
	cmpl	8(%rax), %ecx
	je	.LBB61_33
.LBB61_16:
	movl	$-1, -4(%rbp)
	jmp	.LBB61_12
.LBB61_22:
	movq	-32(%rbp), %rdi
	callq	handle_compress
	movb	%al, -5(%rbp)
	xorl	%ecx, %ecx
	testb	%al, %al
	setne	%cl
	leal	(%rcx,%rcx,2), %eax
	addl	$-2, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB61_12
.LBB61_33:
	movq	-32(%rbp), %rdi
	callq	handle_compress
	movb	%al, -5(%rbp)
	movq	-16(%rbp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB61_36
# %bb.34:
	movq	-16(%rbp), %rdi
	callq	isempty_RL
	testb	%al, %al
	je	.LBB61_36
# %bb.35:
	movq	-16(%rbp), %rax
	movl	120(%rax), %ecx
	cmpl	116(%rax), %ecx
	jge	.LBB61_38
.LBB61_36:
	movl	$2, -4(%rbp)
	jmp	.LBB61_12
.LBB61_38:
	movq	-16(%rbp), %rax
	movl	$2, 8(%rax)
	movl	$1, -4(%rbp)
	jmp	.LBB61_12
.LBB61_39:
	movq	-16(%rbp), %rax
	movl	$1, 8(%rax)
	movl	$4, -4(%rbp)
	jmp	.LBB61_12
.Lfunc_end61:
	.size	BZ2_bzCompress, .Lfunc_end61-BZ2_bzCompress
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function handle_compress
	.type	handle_compress,@function
handle_compress:                        # @handle_compress
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movb	$0, -2(%rbp)
	movb	$0, -1(%rbp)
	movq	48(%rdi), %rax
	movq	%rax, -16(%rbp)
	jmp	.LBB62_1
.LBB62_16:                              #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB62_17
	.p2align	4, 0x90
.LBB62_1:                               # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	cmpl	$1, 12(%rax)
	jne	.LBB62_9
# %bb.2:                                #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rdi
	callq	copy_output_until_stop
	movzbl	%al, %eax
	movzbl	-1(%rbp), %ecx
	orl	%eax, %ecx
	movb	%cl, -1(%rbp)
	movq	-16(%rbp), %rax
	movl	120(%rax), %ecx
	cmpl	116(%rax), %ecx
	jl	.LBB62_17
# %bb.3:                                #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$4, 8(%rax)
	jne	.LBB62_6
# %bb.4:                                #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB62_6
# %bb.5:                                #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rdi
	callq	isempty_RL
	testb	%al, %al
	jne	.LBB62_17
	.p2align	4, 0x90
.LBB62_6:                               #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rdi
	callq	prepare_new_block
	movq	-16(%rbp), %rax
	movl	$2, 12(%rax)
	movq	-16(%rbp), %rax
	cmpl	$3, 8(%rax)
	jne	.LBB62_9
# %bb.7:                                #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB62_9
# %bb.8:                                #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rdi
	callq	isempty_RL
	testb	%al, %al
	jne	.LBB62_17
	.p2align	4, 0x90
.LBB62_9:                               #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$2, 12(%rax)
	jne	.LBB62_1
# %bb.10:                               #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rdi
	callq	copy_input_until_stop
	movzbl	%al, %eax
	movzbl	-2(%rbp), %ecx
	orl	%eax, %ecx
	movb	%cl, -2(%rbp)
	movq	-16(%rbp), %rax
	cmpl	$2, 8(%rax)
	je	.LBB62_13
# %bb.11:                               #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$0, 16(%rax)
	je	.LBB62_12
.LBB62_13:                              #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rax
	movl	108(%rax), %ecx
	cmpl	112(%rax), %ecx
	jl	.LBB62_16
# %bb.14:                               #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rdi
	xorl	%esi, %esi
	jmp	.LBB62_15
.LBB62_12:                              #   in Loop: Header=BB62_1 Depth=1
	movq	-16(%rbp), %rdi
	callq	flush_RL
	movq	-16(%rbp), %rdi
	xorl	%esi, %esi
	cmpl	$4, 8(%rdi)
	sete	%sil
.LBB62_15:                              #   in Loop: Header=BB62_1 Depth=1
	callq	BZ2_compressBlock
	movq	-16(%rbp), %rax
	movl	$1, 12(%rax)
	jmp	.LBB62_1
.LBB62_17:
	movb	$1, %al
	cmpb	$0, -2(%rbp)
	jne	.LBB62_19
# %bb.18:
	cmpb	$0, -1(%rbp)
	setne	%al
.LBB62_19:
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end62:
	.size	handle_compress, .Lfunc_end62-handle_compress
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function isempty_RL
	.type	isempty_RL,@function
isempty_RL:                             # @isempty_RL
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	cmpl	$255, 92(%rdi)
	ja	.LBB63_3
# %bb.1:
	movq	-16(%rbp), %rax
	cmpl	$0, 96(%rax)
	jle	.LBB63_3
# %bb.2:
	movb	$0, -1(%rbp)
	jmp	.LBB63_4
.LBB63_3:
	movb	$1, -1(%rbp)
.LBB63_4:
	movb	-1(%rbp), %al
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end63:
	.size	isempty_RL, .Lfunc_end63-isempty_RL
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function copy_output_until_stop
	.type	copy_output_until_stop,@function
copy_output_until_stop:                 # @copy_output_until_stop
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movb	$0, -1(%rbp)
	.p2align	4, 0x90
.LBB64_1:                               # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 32(%rax)
	je	.LBB64_5
# %bb.2:                                #   in Loop: Header=BB64_1 Depth=1
	movq	-16(%rbp), %rax
	movl	120(%rax), %ecx
	cmpl	116(%rax), %ecx
	jge	.LBB64_5
# %bb.3:                                #   in Loop: Header=BB64_1 Depth=1
	movb	$1, -1(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rcx
	movq	80(%rax), %rdx
	movslq	120(%rax), %rax
	movzbl	(%rdx,%rax), %eax
	movq	24(%rcx), %rcx
	movb	%al, (%rcx)
	movq	-16(%rbp), %rax
	addl	$1, 120(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 32(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, 24(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 36(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 36(%rax)
	jne	.LBB64_1
# %bb.4:                                #   in Loop: Header=BB64_1 Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 40(%rax)
	jmp	.LBB64_1
.LBB64_5:
	movb	-1(%rbp), %al
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end64:
	.size	copy_output_until_stop, .Lfunc_end64-copy_output_until_stop
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function copy_input_until_stop
	.type	copy_input_until_stop,@function
copy_input_until_stop:                  # @copy_input_until_stop
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movb	$0, -9(%rbp)
	cmpl	$2, 8(%rdi)
	jne	.LBB65_14
	.p2align	4, 0x90
.LBB65_1:                               # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movl	108(%rax), %ecx
	cmpl	112(%rax), %ecx
	jge	.LBB65_29
# %bb.2:                                #   in Loop: Header=BB65_1 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB65_29
# %bb.3:                                #   in Loop: Header=BB65_1 Depth=1
	movb	$1, -9(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rcx
	movq	(%rcx), %rcx
	movzbl	(%rcx), %ecx
	movl	%ecx, -20(%rbp)
	cmpl	92(%rax), %ecx
	je	.LBB65_6
# %bb.4:                                #   in Loop: Header=BB65_1 Depth=1
	movq	-8(%rbp), %rax
	cmpl	$1, 96(%rax)
	jne	.LBB65_6
# %bb.5:                                #   in Loop: Header=BB65_1 Depth=1
	movq	-8(%rbp), %rax
	movzbl	92(%rax), %ecx
	movb	%cl, -11(%rbp)
	movl	648(%rax), %edx
	movl	%edx, %esi
	shll	$8, %esi
	shrl	$24, %edx
	xorl	%ecx, %edx
	xorl	BZ2_crc32Table(,%rdx,4), %esi
	movl	%esi, 648(%rax)
	movq	-8(%rbp), %rax
	movl	92(%rax), %ecx
	movb	$1, 128(%rax,%rcx)
	movzbl	-11(%rbp), %eax
	movq	-8(%rbp), %rcx
	movq	64(%rcx), %rdx
	movslq	108(%rcx), %rcx
	movb	%al, (%rdx,%rcx)
	movq	-8(%rbp), %rax
	addl	$1, 108(%rax)
	movl	-20(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 92(%rcx)
	jmp	.LBB65_12
	.p2align	4, 0x90
.LBB65_6:                               #   in Loop: Header=BB65_1 Depth=1
	movl	-20(%rbp), %eax
	movq	-8(%rbp), %rcx
	cmpl	92(%rcx), %eax
	jne	.LBB65_8
# %bb.7:                                #   in Loop: Header=BB65_1 Depth=1
	movq	-8(%rbp), %rax
	cmpl	$255, 96(%rax)
	jne	.LBB65_11
.LBB65_8:                               #   in Loop: Header=BB65_1 Depth=1
	movq	-8(%rbp), %rax
	cmpl	$255, 92(%rax)
	ja	.LBB65_10
# %bb.9:                                #   in Loop: Header=BB65_1 Depth=1
	movq	-8(%rbp), %rdi
	callq	add_pair_to_block
.LBB65_10:                              #   in Loop: Header=BB65_1 Depth=1
	movl	-20(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 92(%rcx)
	movq	-8(%rbp), %rax
	movl	$1, 96(%rax)
	jmp	.LBB65_12
.LBB65_11:                              #   in Loop: Header=BB65_1 Depth=1
	movq	-8(%rbp), %rax
	addl	$1, 96(%rax)
	.p2align	4, 0x90
.LBB65_12:                              #   in Loop: Header=BB65_1 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB65_1
# %bb.13:                               #   in Loop: Header=BB65_1 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB65_1
	.p2align	4, 0x90
.LBB65_28:                              #   in Loop: Header=BB65_14 Depth=1
	movq	-8(%rbp), %rax
	addl	$-1, 16(%rax)
.LBB65_14:                              # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movl	108(%rax), %ecx
	cmpl	112(%rax), %ecx
	jge	.LBB65_29
# %bb.15:                               #   in Loop: Header=BB65_14 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB65_29
# %bb.16:                               #   in Loop: Header=BB65_14 Depth=1
	movq	-8(%rbp), %rax
	cmpl	$0, 16(%rax)
	je	.LBB65_29
# %bb.17:                               #   in Loop: Header=BB65_14 Depth=1
	movb	$1, -9(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rcx
	movq	(%rcx), %rcx
	movzbl	(%rcx), %ecx
	movl	%ecx, -16(%rbp)
	cmpl	92(%rax), %ecx
	je	.LBB65_20
# %bb.18:                               #   in Loop: Header=BB65_14 Depth=1
	movq	-8(%rbp), %rax
	cmpl	$1, 96(%rax)
	jne	.LBB65_20
# %bb.19:                               #   in Loop: Header=BB65_14 Depth=1
	movq	-8(%rbp), %rax
	movzbl	92(%rax), %ecx
	movb	%cl, -10(%rbp)
	movl	648(%rax), %edx
	movl	%edx, %esi
	shll	$8, %esi
	shrl	$24, %edx
	xorl	%ecx, %edx
	xorl	BZ2_crc32Table(,%rdx,4), %esi
	movl	%esi, 648(%rax)
	movq	-8(%rbp), %rax
	movl	92(%rax), %ecx
	movb	$1, 128(%rax,%rcx)
	movzbl	-10(%rbp), %eax
	movq	-8(%rbp), %rcx
	movq	64(%rcx), %rdx
	movslq	108(%rcx), %rcx
	movb	%al, (%rdx,%rcx)
	movq	-8(%rbp), %rax
	addl	$1, 108(%rax)
	movl	-16(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 92(%rcx)
	jmp	.LBB65_26
	.p2align	4, 0x90
.LBB65_20:                              #   in Loop: Header=BB65_14 Depth=1
	movl	-16(%rbp), %eax
	movq	-8(%rbp), %rcx
	cmpl	92(%rcx), %eax
	jne	.LBB65_22
# %bb.21:                               #   in Loop: Header=BB65_14 Depth=1
	movq	-8(%rbp), %rax
	cmpl	$255, 96(%rax)
	jne	.LBB65_25
.LBB65_22:                              #   in Loop: Header=BB65_14 Depth=1
	movq	-8(%rbp), %rax
	cmpl	$255, 92(%rax)
	ja	.LBB65_24
# %bb.23:                               #   in Loop: Header=BB65_14 Depth=1
	movq	-8(%rbp), %rdi
	callq	add_pair_to_block
.LBB65_24:                              #   in Loop: Header=BB65_14 Depth=1
	movl	-16(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 92(%rcx)
	movq	-8(%rbp), %rax
	movl	$1, 96(%rax)
	jmp	.LBB65_26
.LBB65_25:                              #   in Loop: Header=BB65_14 Depth=1
	movq	-8(%rbp), %rax
	addl	$1, 96(%rax)
	.p2align	4, 0x90
.LBB65_26:                              #   in Loop: Header=BB65_14 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB65_28
# %bb.27:                               #   in Loop: Header=BB65_14 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB65_28
.LBB65_29:
	movb	-9(%rbp), %al
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end65:
	.size	copy_input_until_stop, .Lfunc_end65-copy_input_until_stop
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function flush_RL
	.type	flush_RL,@function
flush_RL:                               # @flush_RL
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpl	$255, 92(%rdi)
	ja	.LBB66_2
# %bb.1:
	movq	-8(%rbp), %rdi
	callq	add_pair_to_block
.LBB66_2:
	movq	-8(%rbp), %rdi
	callq	init_RL
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end66:
	.size	flush_RL, .Lfunc_end66-flush_RL
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function add_pair_to_block
	.type	add_pair_to_block,@function
add_pair_to_block:                      # @add_pair_to_block
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movb	92(%rdi), %al
	movb	%al, -1(%rbp)
	movl	$0, -20(%rbp)
	.p2align	4, 0x90
.LBB67_1:                               # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	96(%rcx), %eax
	jge	.LBB67_3
# %bb.2:                                #   in Loop: Header=BB67_1 Depth=1
	movq	-16(%rbp), %rax
	movl	648(%rax), %ecx
	movl	%ecx, %edx
	shll	$8, %edx
	shrl	$24, %ecx
	movzbl	-1(%rbp), %esi
	xorl	%ecx, %esi
	xorl	BZ2_crc32Table(,%rsi,4), %edx
	movl	%edx, 648(%rax)
	addl	$1, -20(%rbp)
	jmp	.LBB67_1
.LBB67_3:
	movq	-16(%rbp), %rax
	movl	92(%rax), %ecx
	movb	$1, 128(%rax,%rcx)
	movq	-16(%rbp), %rax
	movl	96(%rax), %eax
	cmpl	$3, %eax
	je	.LBB67_7
# %bb.4:
	cmpl	$2, %eax
	je	.LBB67_8
# %bb.5:
	cmpl	$1, %eax
	je	.LBB67_6
# %bb.9:
	movq	-16(%rbp), %rax
	movslq	96(%rax), %rcx
	movb	$1, 124(%rcx,%rax)
	movb	-1(%rbp), %al
	movq	-16(%rbp), %rcx
	movq	64(%rcx), %rdx
	movslq	108(%rcx), %rcx
	movb	%al, (%rdx,%rcx)
	movq	-16(%rbp), %rax
	addl	$1, 108(%rax)
	movb	-1(%rbp), %al
	movq	-16(%rbp), %rcx
	movq	64(%rcx), %rdx
	movslq	108(%rcx), %rcx
	movb	%al, (%rdx,%rcx)
	movq	-16(%rbp), %rax
	addl	$1, 108(%rax)
	movb	-1(%rbp), %al
	movq	-16(%rbp), %rcx
	movq	64(%rcx), %rdx
	movslq	108(%rcx), %rcx
	movb	%al, (%rdx,%rcx)
	movq	-16(%rbp), %rax
	addl	$1, 108(%rax)
	movb	-1(%rbp), %al
	movq	-16(%rbp), %rcx
	movq	64(%rcx), %rdx
	movslq	108(%rcx), %rcx
	movb	%al, (%rdx,%rcx)
	movq	-16(%rbp), %rax
	addl	$1, 108(%rax)
	movq	-16(%rbp), %rax
	movb	96(%rax), %cl
	addb	$-4, %cl
	movq	64(%rax), %rdx
	movslq	108(%rax), %rax
	movb	%cl, (%rdx,%rax)
	jmp	.LBB67_10
.LBB67_7:
	movb	-1(%rbp), %al
	movq	-16(%rbp), %rcx
	movq	64(%rcx), %rdx
	movslq	108(%rcx), %rcx
	movb	%al, (%rdx,%rcx)
	movq	-16(%rbp), %rax
	addl	$1, 108(%rax)
.LBB67_8:
	movb	-1(%rbp), %al
	movq	-16(%rbp), %rcx
	movq	64(%rcx), %rdx
	movslq	108(%rcx), %rcx
	movb	%al, (%rdx,%rcx)
	movq	-16(%rbp), %rax
	addl	$1, 108(%rax)
.LBB67_6:
	movb	-1(%rbp), %al
	movq	-16(%rbp), %rcx
	movq	64(%rcx), %rdx
	movslq	108(%rcx), %rcx
	movb	%al, (%rdx,%rcx)
.LBB67_10:
	movq	-16(%rbp), %rax
	addl	$1, 108(%rax)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end67:
	.size	add_pair_to_block, .Lfunc_end67-add_pair_to_block
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzCompressEnd               # -- Begin function BZ2_bzCompressEnd
	.p2align	4, 0x90
	.type	BZ2_bzCompressEnd,@function
BZ2_bzCompressEnd:                      # @BZ2_bzCompressEnd
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	testq	%rdi, %rdi
	je	.LBB68_4
# %bb.1:
	movq	-24(%rbp), %rax
	movq	48(%rax), %rax
	movq	%rax, -16(%rbp)
	testq	%rax, %rax
	je	.LBB68_4
# %bb.2:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	-24(%rbp), %rax
	je	.LBB68_6
.LBB68_4:
	movl	$-2, -4(%rbp)
.LBB68_13:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB68_6:
	.cfi_def_cfa %rbp, 16
	movq	-16(%rbp), %rax
	cmpq	$0, 24(%rax)
	je	.LBB68_8
# %bb.7:
	movq	-24(%rbp), %rax
	movq	72(%rax), %rdi
	movq	-16(%rbp), %rcx
	movq	24(%rcx), %rsi
	callq	*64(%rax)
.LBB68_8:
	movq	-16(%rbp), %rax
	cmpq	$0, 32(%rax)
	je	.LBB68_10
# %bb.9:
	movq	-24(%rbp), %rax
	movq	72(%rax), %rdi
	movq	-16(%rbp), %rcx
	movq	32(%rcx), %rsi
	callq	*64(%rax)
.LBB68_10:
	movq	-16(%rbp), %rax
	cmpq	$0, 40(%rax)
	je	.LBB68_12
# %bb.11:
	movq	-24(%rbp), %rax
	movq	72(%rax), %rdi
	movq	-16(%rbp), %rcx
	movq	40(%rcx), %rsi
	callq	*64(%rax)
.LBB68_12:
	movq	-24(%rbp), %rax
	movq	48(%rax), %rsi
	movq	72(%rax), %rdi
	callq	*64(%rax)
	movq	-24(%rbp), %rax
	movq	$0, 48(%rax)
	movl	$0, -4(%rbp)
	jmp	.LBB68_13
.Lfunc_end68:
	.size	BZ2_bzCompressEnd, .Lfunc_end68-BZ2_bzCompressEnd
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzDecompressInit            # -- Begin function BZ2_bzDecompressInit
	.p2align	4, 0x90
	.type	BZ2_bzDecompressInit,@function
BZ2_bzDecompressInit:                   # @BZ2_bzDecompressInit
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -32(%rbp)
	movl	%edx, -28(%rbp)
	callq	bz_config_ok
	testl	%eax, %eax
	je	.LBB69_5
# %bb.1:
	cmpq	$0, -24(%rbp)
	je	.LBB69_9
# %bb.2:
	cmpl	$0, -28(%rbp)
	je	.LBB69_6
# %bb.3:
	cmpl	$1, -28(%rbp)
	jne	.LBB69_9
.LBB69_6:
	cmpl	$0, -32(%rbp)
	js	.LBB69_9
# %bb.7:
	cmpl	$5, -32(%rbp)
	jl	.LBB69_11
.LBB69_9:
	movl	$-2, -4(%rbp)
	jmp	.LBB69_10
.LBB69_5:
	movl	$-9, -4(%rbp)
.LBB69_10:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB69_11:
	.cfi_def_cfa %rbp, 16
	movq	-24(%rbp), %rax
	cmpq	$0, 56(%rax)
	jne	.LBB69_13
# %bb.12:
	movq	-24(%rbp), %rax
	movq	$default_bzalloc, 56(%rax)
.LBB69_13:
	movq	-24(%rbp), %rax
	cmpq	$0, 64(%rax)
	jne	.LBB69_15
# %bb.14:
	movq	-24(%rbp), %rax
	movq	$default_bzfree, 64(%rax)
.LBB69_15:
	movq	-24(%rbp), %rax
	movq	72(%rax), %rdi
	movl	$64144, %esi                    # imm = 0xFA90
	movl	$1, %edx
	callq	*56(%rax)
	movq	%rax, -16(%rbp)
	testq	%rax, %rax
	je	.LBB69_17
# %bb.16:
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 48(%rcx)
	movq	-16(%rbp), %rax
	movl	$10, 8(%rax)
	movq	-16(%rbp), %rax
	movl	$0, 36(%rax)
	movq	-16(%rbp), %rax
	movl	$0, 32(%rax)
	movq	-16(%rbp), %rax
	movl	$0, 3188(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 12(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 16(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 36(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 40(%rax)
	movb	-28(%rbp), %al
	movq	-16(%rbp), %rcx
	movb	%al, 44(%rcx)
	movq	-16(%rbp), %rax
	movq	$0, 3168(%rax)
	movq	-16(%rbp), %rax
	movq	$0, 3160(%rax)
	movq	-16(%rbp), %rax
	movq	$0, 3152(%rax)
	movq	-16(%rbp), %rax
	movl	$0, 48(%rax)
	movl	-32(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 52(%rcx)
	movl	$0, -4(%rbp)
	jmp	.LBB69_10
.LBB69_17:
	movl	$-3, -4(%rbp)
	jmp	.LBB69_10
.Lfunc_end69:
	.size	BZ2_bzDecompressInit, .Lfunc_end69-BZ2_bzDecompressInit
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_indexIntoF                  # -- Begin function BZ2_indexIntoF
	.p2align	4, 0x90
	.type	BZ2_indexIntoF,@function
BZ2_indexIntoF:                         # @BZ2_indexIntoF
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movl	$0, -4(%rbp)
	movl	$256, -8(%rbp)                  # imm = 0x100
	jmp	.LBB70_1
	.p2align	4, 0x90
.LBB70_3:                               #   in Loop: Header=BB70_1 Depth=1
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
.LBB70_4:                               #   in Loop: Header=BB70_1 Depth=1
	movl	-8(%rbp), %eax
	subl	-4(%rbp), %eax
	cmpl	$1, %eax
	je	.LBB70_5
.LBB70_1:                               # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	sarl	%eax
	movl	%eax, -12(%rbp)
	movl	-16(%rbp), %ecx
	movq	-24(%rbp), %rdx
	cltq
	cmpl	(%rdx,%rax,4), %ecx
	jl	.LBB70_3
# %bb.2:                                #   in Loop: Header=BB70_1 Depth=1
	movl	-12(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB70_4
.LBB70_5:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end70:
	.size	BZ2_indexIntoF, .Lfunc_end70-BZ2_indexIntoF
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzDecompress                # -- Begin function BZ2_bzDecompress
	.p2align	4, 0x90
	.type	BZ2_bzDecompress,@function
BZ2_bzDecompress:                       # @BZ2_bzDecompress
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -32(%rbp)
	testq	%rdi, %rdi
	je	.LBB71_23
# %bb.1:
	movq	-32(%rbp), %rax
	movq	48(%rax), %rax
	movq	%rax, -16(%rbp)
	testq	%rax, %rax
	je	.LBB71_23
# %bb.2:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	-32(%rbp), %rax
	je	.LBB71_20
.LBB71_23:
	movl	$-2, -20(%rbp)
.LBB71_24:
	movl	-20(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
	.p2align	4, 0x90
.LBB71_4:                               #   in Loop: Header=BB71_20 Depth=1
	.cfi_def_cfa %rbp, 16
	movq	-16(%rbp), %rax
	cmpl	$2, 8(%rax)
	jne	.LBB71_17
# %bb.5:                                #   in Loop: Header=BB71_20 Depth=1
	movq	-16(%rbp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB71_7
# %bb.6:                                #   in Loop: Header=BB71_20 Depth=1
	movq	-16(%rbp), %rdi
	callq	unRLE_obuf_to_output_SMALL
	jmp	.LBB71_8
.LBB71_7:                               #   in Loop: Header=BB71_20 Depth=1
	movq	-16(%rbp), %rdi
	callq	unRLE_obuf_to_output_FAST
.LBB71_8:                               #   in Loop: Header=BB71_20 Depth=1
	movb	%al, -1(%rbp)
	cmpb	$0, -1(%rbp)
	jne	.LBB71_26
# %bb.9:                                #   in Loop: Header=BB71_20 Depth=1
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	jne	.LBB71_25
# %bb.10:                               #   in Loop: Header=BB71_20 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB71_25
# %bb.11:                               #   in Loop: Header=BB71_20 Depth=1
	movq	-16(%rbp), %rax
	notl	3184(%rax)
	movq	-16(%rbp), %rax
	cmpl	$3, 52(%rax)
	jl	.LBB71_13
# %bb.12:                               #   in Loop: Header=BB71_20 Depth=1
	movq	stderr(%rip), %rdi
	movq	-16(%rbp), %rax
	movl	3176(%rax), %edx
	movl	3184(%rax), %ecx
	movl	$.L.str.2.108, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB71_13:                              #   in Loop: Header=BB71_20 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$2, 52(%rax)
	jl	.LBB71_15
# %bb.14:                               #   in Loop: Header=BB71_20 Depth=1
	movq	stderr(%rip), %rdi
	movl	$.L.str.3.109, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB71_15:                              #   in Loop: Header=BB71_20 Depth=1
	movq	-16(%rbp), %rax
	movl	3184(%rax), %ecx
	cmpl	3176(%rax), %ecx
	jne	.LBB71_26
# %bb.16:                               #   in Loop: Header=BB71_20 Depth=1
	movq	-16(%rbp), %rax
	roll	3188(%rax)
	movq	-16(%rbp), %rax
	movl	3184(%rax), %ecx
	xorl	%ecx, 3188(%rax)
	movq	-16(%rbp), %rax
	movl	$14, 8(%rax)
.LBB71_17:                              #   in Loop: Header=BB71_20 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$10, 8(%rax)
	jl	.LBB71_20
# %bb.18:                               #   in Loop: Header=BB71_20 Depth=1
	movq	-16(%rbp), %rdi
	callq	BZ2_decompress
	movl	%eax, -24(%rbp)
	cmpl	$4, %eax
	je	.LBB71_28
# %bb.19:                               #   in Loop: Header=BB71_20 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$2, 8(%rax)
	jne	.LBB71_32
.LBB71_20:                              # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	cmpl	$1, 8(%rax)
	jne	.LBB71_4
# %bb.21:
	movl	$-1, -20(%rbp)
	jmp	.LBB71_24
.LBB71_25:
	movl	$0, -20(%rbp)
	jmp	.LBB71_24
.LBB71_28:
	movq	-16(%rbp), %rax
	cmpl	$3, 52(%rax)
	jl	.LBB71_30
# %bb.29:
	movq	stderr(%rip), %rdi
	movq	-16(%rbp), %rax
	movl	3180(%rax), %edx
	movl	3188(%rax), %ecx
	movl	$.L.str.4.110, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB71_30:
	movq	-16(%rbp), %rax
	movl	3188(%rax), %ecx
	cmpl	3180(%rax), %ecx
	je	.LBB71_32
.LBB71_26:
	movl	$-4, -20(%rbp)
	jmp	.LBB71_24
.LBB71_32:
	movl	-24(%rbp), %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB71_24
.Lfunc_end71:
	.size	BZ2_bzDecompress, .Lfunc_end71-BZ2_bzDecompress
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function unRLE_obuf_to_output_SMALL
	.type	unRLE_obuf_to_output_SMALL,@function
unRLE_obuf_to_output_SMALL:             # @unRLE_obuf_to_output_SMALL
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	cmpb	$0, 20(%rdi)
	je	.LBB72_32
	.p2align	4, 0x90
.LBB72_1:                               # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 32(%rax)
	je	.LBB72_45
# %bb.2:                                #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$0, 16(%rax)
	je	.LBB72_5
# %bb.3:                                #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movzbl	12(%rax), %ecx
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movb	%cl, (%rax)
	movq	-16(%rbp), %rax
	movl	3184(%rax), %ecx
	movl	%ecx, %edx
	shll	$8, %edx
	shrl	$24, %ecx
	movzbl	12(%rax), %esi
	xorl	%ecx, %esi
	xorl	BZ2_crc32Table(,%rsi,4), %edx
	movl	%edx, 3184(%rax)
	movq	-16(%rbp), %rax
	addl	$-1, 16(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, 24(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 32(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 36(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 36(%rax)
	jne	.LBB72_1
# %bb.4:                                #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 40(%rax)
	jmp	.LBB72_1
.LBB72_5:                               #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	je	.LBB72_45
# %bb.6:                                #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	jg	.LBB72_47
# %bb.7:                                #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$1, 16(%rax)
	movq	-16(%rbp), %rax
	movzbl	64(%rax), %ecx
	movb	%cl, 12(%rax)
	movq	-16(%rbp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi                     # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, -1(%rbp)
	movq	-16(%rbp), %rax
	movl	60(%rax), %edx
	movq	3168(%rax), %rsi
	leal	(,%rdx,4), %ecx
	movq	%rdx, %rdi
	shrq	%rdi
	movzbl	(%rsi,%rdi), %esi
	movq	3160(%rax), %rdi
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %esi
	movzwl	(%rdi,%rdx,2), %ecx
	andl	$15, %esi
	shll	$16, %esi
	orl	%ecx, %esi
	movl	%esi, 60(%rax)
	movq	-16(%rbp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB72_10
# %bb.8:                                #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 28(%rax)
	movq	-16(%rbp), %rax
	cmpl	$512, 28(%rax)                  # imm = 0x200
	jne	.LBB72_10
# %bb.9:                                #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$0, 28(%rax)
.LBB72_10:                              #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	addl	$-1, 24(%rax)
	movq	-16(%rbp), %rax
	xorl	%ecx, %ecx
	cmpl	$1, 24(%rax)
	sete	%cl
	movzbl	-1(%rbp), %edx
	xorl	%ecx, %edx
	movb	%dl, -1(%rbp)
	addl	$1, 1092(%rax)
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	je	.LBB72_1
# %bb.11:                               #   in Loop: Header=BB72_1 Depth=1
	movzbl	-1(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	64(%rcx), %eax
	je	.LBB72_13
.LBB72_12:                              #   in Loop: Header=BB72_1 Depth=1
	movzbl	-1(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 64(%rcx)
	jmp	.LBB72_1
.LBB72_13:                              #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$2, 16(%rax)
	movq	-16(%rbp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi                     # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, -1(%rbp)
	movq	-16(%rbp), %rax
	movl	60(%rax), %edx
	movq	3168(%rax), %rsi
	leal	(,%rdx,4), %ecx
	movq	%rdx, %rdi
	shrq	%rdi
	movzbl	(%rsi,%rdi), %esi
	movq	3160(%rax), %rdi
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %esi
	movzwl	(%rdi,%rdx,2), %ecx
	andl	$15, %esi
	shll	$16, %esi
	orl	%ecx, %esi
	movl	%esi, 60(%rax)
	movq	-16(%rbp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB72_16
# %bb.14:                               #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 28(%rax)
	movq	-16(%rbp), %rax
	cmpl	$512, 28(%rax)                  # imm = 0x200
	jne	.LBB72_16
# %bb.15:                               #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$0, 28(%rax)
.LBB72_16:                              #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	addl	$-1, 24(%rax)
	movq	-16(%rbp), %rax
	xorl	%ecx, %ecx
	cmpl	$1, 24(%rax)
	sete	%cl
	movzbl	-1(%rbp), %edx
	xorl	%ecx, %edx
	movb	%dl, -1(%rbp)
	addl	$1, 1092(%rax)
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	je	.LBB72_1
# %bb.17:                               #   in Loop: Header=BB72_1 Depth=1
	movzbl	-1(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	64(%rcx), %eax
	jne	.LBB72_12
# %bb.18:                               #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$3, 16(%rax)
	movq	-16(%rbp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi                     # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, -1(%rbp)
	movq	-16(%rbp), %rax
	movl	60(%rax), %edx
	movq	3168(%rax), %rsi
	leal	(,%rdx,4), %ecx
	movq	%rdx, %rdi
	shrq	%rdi
	movzbl	(%rsi,%rdi), %esi
	movq	3160(%rax), %rdi
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %esi
	movzwl	(%rdi,%rdx,2), %ecx
	andl	$15, %esi
	shll	$16, %esi
	orl	%ecx, %esi
	movl	%esi, 60(%rax)
	movq	-16(%rbp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB72_21
# %bb.19:                               #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 28(%rax)
	movq	-16(%rbp), %rax
	cmpl	$512, 28(%rax)                  # imm = 0x200
	jne	.LBB72_21
# %bb.20:                               #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$0, 28(%rax)
.LBB72_21:                              #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	addl	$-1, 24(%rax)
	movq	-16(%rbp), %rax
	xorl	%ecx, %ecx
	cmpl	$1, 24(%rax)
	sete	%cl
	movzbl	-1(%rbp), %edx
	xorl	%ecx, %edx
	movb	%dl, -1(%rbp)
	addl	$1, 1092(%rax)
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	je	.LBB72_1
# %bb.22:                               #   in Loop: Header=BB72_1 Depth=1
	movzbl	-1(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	64(%rcx), %eax
	jne	.LBB72_12
# %bb.23:                               #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi                     # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, -1(%rbp)
	movq	-16(%rbp), %rax
	movl	60(%rax), %edx
	movq	3168(%rax), %rsi
	leal	(,%rdx,4), %ecx
	movq	%rdx, %rdi
	shrq	%rdi
	movzbl	(%rsi,%rdi), %esi
	movq	3160(%rax), %rdi
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %esi
	movzwl	(%rdi,%rdx,2), %ecx
	andl	$15, %esi
	shll	$16, %esi
	orl	%ecx, %esi
	movl	%esi, 60(%rax)
	movq	-16(%rbp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB72_26
# %bb.24:                               #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 28(%rax)
	movq	-16(%rbp), %rax
	cmpl	$512, 28(%rax)                  # imm = 0x200
	jne	.LBB72_26
# %bb.25:                               #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$0, 28(%rax)
.LBB72_26:                              #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	addl	$-1, 24(%rax)
	movq	-16(%rbp), %rax
	xorl	%ecx, %ecx
	cmpl	$1, 24(%rax)
	sete	%cl
	movzbl	-1(%rbp), %edx
	xorl	%ecx, %edx
	movb	%dl, -1(%rbp)
	addl	$1, 1092(%rax)
	movzbl	-1(%rbp), %eax
	addl	$4, %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 16(%rcx)
	movq	-16(%rbp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi                     # imm = 0x448
	callq	BZ2_indexIntoF
	movq	-16(%rbp), %rcx
	movl	%eax, 64(%rcx)
	movq	-16(%rbp), %rax
	movl	60(%rax), %edx
	movq	3168(%rax), %rsi
	leal	(,%rdx,4), %ecx
	movq	%rdx, %rdi
	shrq	%rdi
	movzbl	(%rsi,%rdi), %esi
	movq	3160(%rax), %rdi
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %esi
	movzwl	(%rdi,%rdx,2), %ecx
	andl	$15, %esi
	shll	$16, %esi
	orl	%ecx, %esi
	movl	%esi, 60(%rax)
	movq	-16(%rbp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB72_29
# %bb.27:                               #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 28(%rax)
	movq	-16(%rbp), %rax
	cmpl	$512, 28(%rax)                  # imm = 0x200
	jne	.LBB72_29
# %bb.28:                               #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$0, 28(%rax)
.LBB72_29:                              #   in Loop: Header=BB72_1 Depth=1
	movq	-16(%rbp), %rax
	addl	$-1, 24(%rax)
	movq	-16(%rbp), %rax
	xorl	%ecx, %ecx
	cmpl	$1, 24(%rax)
	sete	%cl
	xorl	%ecx, 64(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 1092(%rax)
	jmp	.LBB72_1
.LBB72_31:                              #   in Loop: Header=BB72_32 Depth=1
	movzbl	-1(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 64(%rcx)
	.p2align	4, 0x90
.LBB72_32:                              # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 32(%rax)
	je	.LBB72_45
# %bb.33:                               #   in Loop: Header=BB72_32 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$0, 16(%rax)
	je	.LBB72_36
# %bb.34:                               #   in Loop: Header=BB72_32 Depth=1
	movq	-16(%rbp), %rax
	movzbl	12(%rax), %ecx
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movb	%cl, (%rax)
	movq	-16(%rbp), %rax
	movl	3184(%rax), %ecx
	movl	%ecx, %edx
	shll	$8, %edx
	shrl	$24, %ecx
	movzbl	12(%rax), %esi
	xorl	%ecx, %esi
	xorl	BZ2_crc32Table(,%rsi,4), %edx
	movl	%edx, 3184(%rax)
	movq	-16(%rbp), %rax
	addl	$-1, 16(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, 24(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 32(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 36(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 36(%rax)
	jne	.LBB72_32
# %bb.35:                               #   in Loop: Header=BB72_32 Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 40(%rax)
	jmp	.LBB72_32
.LBB72_36:                              #   in Loop: Header=BB72_32 Depth=1
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	je	.LBB72_45
# %bb.37:                               #   in Loop: Header=BB72_32 Depth=1
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	jg	.LBB72_47
# %bb.38:                               #   in Loop: Header=BB72_32 Depth=1
	movq	-16(%rbp), %rax
	movl	$1, 16(%rax)
	movq	-16(%rbp), %rax
	movzbl	64(%rax), %ecx
	movb	%cl, 12(%rax)
	movq	-16(%rbp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi                     # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, -1(%rbp)
	movq	-16(%rbp), %rax
	movq	3160(%rax), %rcx
	movl	60(%rax), %edx
	movzwl	(%rcx,%rdx,2), %esi
	movq	3168(%rax), %rdi
	leal	(,%rdx,4), %ecx
	shrq	%rdx
	movzbl	(%rdi,%rdx), %edx
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %edx
	andl	$15, %edx
	shll	$16, %edx
	orl	%esi, %edx
	movl	%edx, 60(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 1092(%rax)
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	je	.LBB72_32
# %bb.39:                               #   in Loop: Header=BB72_32 Depth=1
	movzbl	-1(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	64(%rcx), %eax
	jne	.LBB72_31
# %bb.40:                               #   in Loop: Header=BB72_32 Depth=1
	movq	-16(%rbp), %rax
	movl	$2, 16(%rax)
	movq	-16(%rbp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi                     # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, -1(%rbp)
	movq	-16(%rbp), %rax
	movq	3160(%rax), %rcx
	movl	60(%rax), %edx
	movzwl	(%rcx,%rdx,2), %esi
	movq	3168(%rax), %rdi
	leal	(,%rdx,4), %ecx
	shrq	%rdx
	movzbl	(%rdi,%rdx), %edx
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %edx
	andl	$15, %edx
	shll	$16, %edx
	orl	%esi, %edx
	movl	%edx, 60(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 1092(%rax)
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	je	.LBB72_32
# %bb.41:                               #   in Loop: Header=BB72_32 Depth=1
	movzbl	-1(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	64(%rcx), %eax
	jne	.LBB72_31
# %bb.42:                               #   in Loop: Header=BB72_32 Depth=1
	movq	-16(%rbp), %rax
	movl	$3, 16(%rax)
	movq	-16(%rbp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi                     # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, -1(%rbp)
	movq	-16(%rbp), %rax
	movq	3160(%rax), %rcx
	movl	60(%rax), %edx
	movzwl	(%rcx,%rdx,2), %esi
	movq	3168(%rax), %rdi
	leal	(,%rdx,4), %ecx
	shrq	%rdx
	movzbl	(%rdi,%rdx), %edx
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %edx
	andl	$15, %edx
	shll	$16, %edx
	orl	%esi, %edx
	movl	%edx, 60(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 1092(%rax)
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	je	.LBB72_32
# %bb.43:                               #   in Loop: Header=BB72_32 Depth=1
	movzbl	-1(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	64(%rcx), %eax
	jne	.LBB72_31
# %bb.44:                               #   in Loop: Header=BB72_32 Depth=1
	movq	-16(%rbp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi                     # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, -1(%rbp)
	movq	-16(%rbp), %rax
	movq	3160(%rax), %rcx
	movl	60(%rax), %edx
	movzwl	(%rcx,%rdx,2), %esi
	movq	3168(%rax), %rdi
	leal	(,%rdx,4), %ecx
	shrq	%rdx
	movzbl	(%rdi,%rdx), %edx
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %edx
	andl	$15, %edx
	shll	$16, %edx
	orl	%esi, %edx
	movl	%edx, 60(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 1092(%rax)
	movzbl	-1(%rbp), %eax
	addl	$4, %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 16(%rcx)
	movq	-16(%rbp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi                     # imm = 0x448
	callq	BZ2_indexIntoF
	movq	-16(%rbp), %rcx
	movl	%eax, 64(%rcx)
	movq	-16(%rbp), %rax
	movq	3160(%rax), %rcx
	movl	60(%rax), %edx
	movzwl	(%rcx,%rdx,2), %esi
	movq	3168(%rax), %rdi
	leal	(,%rdx,4), %ecx
	shrq	%rdx
	movzbl	(%rdi,%rdx), %edx
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %edx
	andl	$15, %edx
	shll	$16, %edx
	orl	%esi, %edx
	movl	%edx, 60(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 1092(%rax)
	jmp	.LBB72_32
.LBB72_45:
	movb	$0, -17(%rbp)
.LBB72_46:
	movb	-17(%rbp), %al
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB72_47:
	.cfi_def_cfa %rbp, 16
	movb	$1, -17(%rbp)
	jmp	.LBB72_46
.Lfunc_end72:
	.size	unRLE_obuf_to_output_SMALL, .Lfunc_end72-unRLE_obuf_to_output_SMALL
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function unRLE_obuf_to_output_FAST
	.type	unRLE_obuf_to_output_FAST,@function
unRLE_obuf_to_output_FAST:              # @unRLE_obuf_to_output_FAST
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	cmpb	$0, 20(%rdi)
	je	.LBB73_30
	.p2align	4, 0x90
.LBB73_1:                               # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 32(%rax)
	je	.LBB73_46
# %bb.2:                                #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$0, 16(%rax)
	je	.LBB73_3
# %bb.11:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movzbl	12(%rax), %ecx
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movb	%cl, (%rax)
	movq	-16(%rbp), %rax
	movl	3184(%rax), %ecx
	movl	%ecx, %edx
	shll	$8, %edx
	shrl	$24, %ecx
	movzbl	12(%rax), %esi
	xorl	%ecx, %esi
	xorl	BZ2_crc32Table(,%rsi,4), %edx
	movl	%edx, 3184(%rax)
	movq	-16(%rbp), %rax
	addl	$-1, 16(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, 24(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 32(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 36(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 36(%rax)
	jne	.LBB73_1
# %bb.12:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 40(%rax)
	jmp	.LBB73_1
.LBB73_3:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	je	.LBB73_46
# %bb.4:                                #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	jg	.LBB73_39
# %bb.5:                                #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$1, 16(%rax)
	movq	-16(%rbp), %rax
	movzbl	64(%rax), %ecx
	movb	%cl, 12(%rax)
	movq	-16(%rbp), %rax
	movq	3152(%rax), %rcx
	movl	60(%rax), %edx
	movl	(%rcx,%rdx,4), %ecx
	movl	%ecx, 60(%rax)
	movq	-16(%rbp), %rax
	movzbl	60(%rax), %ecx
	movb	%cl, -1(%rbp)
	shrl	$8, 60(%rax)
	movq	-16(%rbp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB73_8
# %bb.6:                                #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 28(%rax)
	movq	-16(%rbp), %rax
	cmpl	$512, 28(%rax)                  # imm = 0x200
	jne	.LBB73_8
# %bb.7:                                #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$0, 28(%rax)
.LBB73_8:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	addl	$-1, 24(%rax)
	movq	-16(%rbp), %rax
	xorl	%ecx, %ecx
	cmpl	$1, 24(%rax)
	sete	%cl
	movzbl	-1(%rbp), %edx
	xorl	%ecx, %edx
	movb	%dl, -1(%rbp)
	addl	$1, 1092(%rax)
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	je	.LBB73_1
# %bb.9:                                #   in Loop: Header=BB73_1 Depth=1
	movzbl	-1(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	64(%rcx), %eax
	je	.LBB73_13
.LBB73_10:                              #   in Loop: Header=BB73_1 Depth=1
	movzbl	-1(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 64(%rcx)
	jmp	.LBB73_1
.LBB73_13:                              #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$2, 16(%rax)
	movq	-16(%rbp), %rax
	movq	3152(%rax), %rcx
	movl	60(%rax), %edx
	movl	(%rcx,%rdx,4), %ecx
	movl	%ecx, 60(%rax)
	movq	-16(%rbp), %rax
	movzbl	60(%rax), %ecx
	movb	%cl, -1(%rbp)
	shrl	$8, 60(%rax)
	movq	-16(%rbp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB73_16
# %bb.14:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 28(%rax)
	movq	-16(%rbp), %rax
	cmpl	$512, 28(%rax)                  # imm = 0x200
	jne	.LBB73_16
# %bb.15:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$0, 28(%rax)
.LBB73_16:                              #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	addl	$-1, 24(%rax)
	movq	-16(%rbp), %rax
	xorl	%ecx, %ecx
	cmpl	$1, 24(%rax)
	sete	%cl
	movzbl	-1(%rbp), %edx
	xorl	%ecx, %edx
	movb	%dl, -1(%rbp)
	addl	$1, 1092(%rax)
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	je	.LBB73_1
# %bb.17:                               #   in Loop: Header=BB73_1 Depth=1
	movzbl	-1(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	64(%rcx), %eax
	jne	.LBB73_10
# %bb.18:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$3, 16(%rax)
	movq	-16(%rbp), %rax
	movq	3152(%rax), %rcx
	movl	60(%rax), %edx
	movl	(%rcx,%rdx,4), %ecx
	movl	%ecx, 60(%rax)
	movq	-16(%rbp), %rax
	movzbl	60(%rax), %ecx
	movb	%cl, -1(%rbp)
	shrl	$8, 60(%rax)
	movq	-16(%rbp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB73_21
# %bb.19:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 28(%rax)
	movq	-16(%rbp), %rax
	cmpl	$512, 28(%rax)                  # imm = 0x200
	jne	.LBB73_21
# %bb.20:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$0, 28(%rax)
.LBB73_21:                              #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	addl	$-1, 24(%rax)
	movq	-16(%rbp), %rax
	xorl	%ecx, %ecx
	cmpl	$1, 24(%rax)
	sete	%cl
	movzbl	-1(%rbp), %edx
	xorl	%ecx, %edx
	movb	%dl, -1(%rbp)
	addl	$1, 1092(%rax)
	movq	-16(%rbp), %rax
	movl	64080(%rax), %ecx
	addl	$1, %ecx
	cmpl	%ecx, 1092(%rax)
	je	.LBB73_1
# %bb.22:                               #   in Loop: Header=BB73_1 Depth=1
	movzbl	-1(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	64(%rcx), %eax
	jne	.LBB73_10
# %bb.23:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movq	3152(%rax), %rcx
	movl	60(%rax), %edx
	movl	(%rcx,%rdx,4), %ecx
	movl	%ecx, 60(%rax)
	movq	-16(%rbp), %rax
	movzbl	60(%rax), %ecx
	movb	%cl, -1(%rbp)
	shrl	$8, 60(%rax)
	movq	-16(%rbp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB73_26
# %bb.24:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 28(%rax)
	movq	-16(%rbp), %rax
	cmpl	$512, 28(%rax)                  # imm = 0x200
	jne	.LBB73_26
# %bb.25:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$0, 28(%rax)
.LBB73_26:                              #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	addl	$-1, 24(%rax)
	movq	-16(%rbp), %rax
	xorl	%ecx, %ecx
	cmpl	$1, 24(%rax)
	sete	%cl
	movzbl	-1(%rbp), %edx
	xorl	%ecx, %edx
	movb	%dl, -1(%rbp)
	addl	$1, 1092(%rax)
	movzbl	-1(%rbp), %eax
	addl	$4, %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 16(%rcx)
	movq	-16(%rbp), %rax
	movq	3152(%rax), %rcx
	movl	60(%rax), %edx
	movl	(%rcx,%rdx,4), %ecx
	movl	%ecx, 60(%rax)
	movq	-16(%rbp), %rax
	movzbl	60(%rax), %ecx
	movl	%ecx, 64(%rax)
	movq	-16(%rbp), %rax
	shrl	$8, 60(%rax)
	movq	-16(%rbp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB73_29
# %bb.27:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 28(%rax)
	movq	-16(%rbp), %rax
	cmpl	$512, 28(%rax)                  # imm = 0x200
	jne	.LBB73_29
# %bb.28:                               #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	movl	$0, 28(%rax)
.LBB73_29:                              #   in Loop: Header=BB73_1 Depth=1
	movq	-16(%rbp), %rax
	addl	$-1, 24(%rax)
	movq	-16(%rbp), %rax
	xorl	%ecx, %ecx
	cmpl	$1, 24(%rax)
	sete	%cl
	xorl	%ecx, 64(%rax)
	movq	-16(%rbp), %rax
	addl	$1, 1092(%rax)
	jmp	.LBB73_1
.LBB73_30:
	movq	-16(%rbp), %rax
	movl	3184(%rax), %ecx
	movl	%ecx, -48(%rbp)
	movb	12(%rax), %cl
	movb	%cl, -17(%rbp)
	movl	16(%rax), %ecx
	movl	%ecx, -32(%rbp)
	movl	1092(%rax), %ecx
	movl	%ecx, -24(%rbp)
	movl	64(%rax), %ecx
	movl	%ecx, -36(%rbp)
	movq	3152(%rax), %rcx
	movq	%rcx, -64(%rbp)
	movl	60(%rax), %ecx
	movl	%ecx, -28(%rbp)
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	movl	%eax, -40(%rbp)
	movl	%eax, -72(%rbp)
	movq	-16(%rbp), %rax
	movl	64080(%rax), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
.LBB73_31:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB73_33 Depth 2
	cmpl	$0, -32(%rbp)
	jle	.LBB73_38
	.p2align	4, 0x90
# %bb.32:                               #   in Loop: Header=BB73_31 Depth=1
	cmpl	$0, -40(%rbp)
	je	.LBB73_43
.LBB73_33:                              #   Parent Loop BB73_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$1, -32(%rbp)
	je	.LBB73_35
# %bb.34:                               #   in Loop: Header=BB73_33 Depth=2
	movzbl	-17(%rbp), %eax
	movq	-56(%rbp), %rcx
	movb	%al, (%rcx)
	movl	-48(%rbp), %eax
	movl	%eax, %ecx
	shll	$8, %ecx
	shrl	$24, %eax
	movzbl	-17(%rbp), %edx
	xorl	%eax, %edx
	xorl	BZ2_crc32Table(,%rdx,4), %ecx
	addl	$-1, -32(%rbp)
	addq	$1, -56(%rbp)
	movl	%ecx, -48(%rbp)
	addl	$-1, -40(%rbp)
	cmpl	$0, -40(%rbp)
	jne	.LBB73_33
	jmp	.LBB73_43
	.p2align	4, 0x90
.LBB73_35:                              #   in Loop: Header=BB73_31 Depth=1
	cmpl	$0, -40(%rbp)
	je	.LBB73_36
# %bb.37:                               #   in Loop: Header=BB73_31 Depth=1
	movb	-17(%rbp), %al
	movq	-56(%rbp), %rcx
	movb	%al, (%rcx)
	movl	-48(%rbp), %eax
	movl	%eax, %ecx
	shll	$8, %ecx
	shrl	$24, %eax
	movzbl	-17(%rbp), %edx
	xorl	%eax, %edx
	xorl	BZ2_crc32Table(,%rdx,4), %ecx
	addq	$1, -56(%rbp)
	movl	%ecx, -48(%rbp)
	addl	$-1, -40(%rbp)
.LBB73_38:                              #   in Loop: Header=BB73_31 Depth=1
	movl	-24(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jg	.LBB73_39
# %bb.41:                               #   in Loop: Header=BB73_31 Depth=1
	movl	-24(%rbp), %eax
	cmpl	-44(%rbp), %eax
	je	.LBB73_42
# %bb.47:                               #   in Loop: Header=BB73_31 Depth=1
	movl	-36(%rbp), %eax
	movb	%al, -17(%rbp)
	movq	-64(%rbp), %rcx
	movl	-28(%rbp), %edx
	movl	(%rcx,%rdx,4), %ecx
	movzbl	%cl, %edx
	movb	%dl, -1(%rbp)
	shrl	$8, %ecx
	movl	%ecx, -28(%rbp)
	addl	$1, -24(%rbp)
	cmpl	%eax, %edx
	je	.LBB73_49
# %bb.48:                               #   in Loop: Header=BB73_31 Depth=1
	movzbl	-1(%rbp), %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB73_35
	.p2align	4, 0x90
.LBB73_49:                              #   in Loop: Header=BB73_31 Depth=1
	movl	-24(%rbp), %eax
	cmpl	-44(%rbp), %eax
	je	.LBB73_35
# %bb.50:                               #   in Loop: Header=BB73_31 Depth=1
	movl	$2, -32(%rbp)
	movq	-64(%rbp), %rax
	movl	-28(%rbp), %ecx
	movl	(%rax,%rcx,4), %eax
	movb	%al, -1(%rbp)
	shrl	$8, %eax
	movl	%eax, -28(%rbp)
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	cmpl	-44(%rbp), %eax
	je	.LBB73_31
# %bb.51:                               #   in Loop: Header=BB73_31 Depth=1
	movzbl	-1(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jne	.LBB73_52
# %bb.53:                               #   in Loop: Header=BB73_31 Depth=1
	movl	$3, -32(%rbp)
	movq	-64(%rbp), %rax
	movl	-28(%rbp), %ecx
	movl	(%rax,%rcx,4), %eax
	movb	%al, -1(%rbp)
	shrl	$8, %eax
	movl	%eax, -28(%rbp)
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	cmpl	-44(%rbp), %eax
	je	.LBB73_31
# %bb.54:                               #   in Loop: Header=BB73_31 Depth=1
	movzbl	-1(%rbp), %eax
	cmpl	-36(%rbp), %eax
	je	.LBB73_55
.LBB73_52:                              #   in Loop: Header=BB73_31 Depth=1
	movzbl	-1(%rbp), %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB73_31
.LBB73_55:                              #   in Loop: Header=BB73_31 Depth=1
	movq	-64(%rbp), %rax
	movl	-28(%rbp), %ecx
	movl	(%rax,%rcx,4), %ecx
	movzbl	%cl, %edx
	movb	%dl, -1(%rbp)
	shrl	$8, %ecx
	movl	%ecx, -28(%rbp)
	movl	-24(%rbp), %esi
	leal	1(%rsi), %edi
	movl	%edi, -24(%rbp)
	addl	$4, %edx
	movl	%edx, -32(%rbp)
	movl	(%rax,%rcx,4), %eax
	movzbl	%al, %ecx
	movl	%ecx, -36(%rbp)
	shrl	$8, %eax
	movl	%eax, -28(%rbp)
	addl	$2, %esi
	movl	%esi, -24(%rbp)
	jmp	.LBB73_31
.LBB73_39:
	movb	$1, -18(%rbp)
	jmp	.LBB73_40
.LBB73_36:
	movl	$1, -32(%rbp)
	jmp	.LBB73_43
.LBB73_42:
	movl	$0, -32(%rbp)
.LBB73_43:
	movq	-16(%rbp), %rax
	movq	(%rax), %rcx
	movl	36(%rcx), %ecx
	movl	%ecx, -68(%rbp)
	movl	-72(%rbp), %ecx
	subl	-40(%rbp), %ecx
	movq	(%rax), %rax
	addl	%ecx, 36(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movl	36(%rax), %eax
	cmpl	-68(%rbp), %eax
	jae	.LBB73_45
# %bb.44:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 40(%rax)
.LBB73_45:
	movl	-48(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 3184(%rcx)
	movb	-17(%rbp), %al
	movq	-16(%rbp), %rcx
	movb	%al, 12(%rcx)
	movl	-32(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 16(%rcx)
	movl	-24(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 1092(%rcx)
	movl	-36(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 64(%rcx)
	movq	-64(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, 3152(%rcx)
	movl	-28(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 60(%rcx)
	movq	-56(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	%rax, 24(%rcx)
	movl	-40(%rbp), %eax
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rcx
	movl	%eax, 32(%rcx)
.LBB73_46:
	movb	$0, -18(%rbp)
.LBB73_40:
	movb	-18(%rbp), %al
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end73:
	.size	unRLE_obuf_to_output_FAST, .Lfunc_end73-unRLE_obuf_to_output_FAST
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzDecompressEnd             # -- Begin function BZ2_bzDecompressEnd
	.p2align	4, 0x90
	.type	BZ2_bzDecompressEnd,@function
BZ2_bzDecompressEnd:                    # @BZ2_bzDecompressEnd
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	testq	%rdi, %rdi
	je	.LBB74_4
# %bb.1:
	movq	-24(%rbp), %rax
	movq	48(%rax), %rax
	movq	%rax, -16(%rbp)
	testq	%rax, %rax
	je	.LBB74_4
# %bb.2:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	-24(%rbp), %rax
	je	.LBB74_6
.LBB74_4:
	movl	$-2, -4(%rbp)
.LBB74_13:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB74_6:
	.cfi_def_cfa %rbp, 16
	movq	-16(%rbp), %rax
	cmpq	$0, 3152(%rax)
	je	.LBB74_8
# %bb.7:
	movq	-24(%rbp), %rax
	movq	72(%rax), %rdi
	movq	-16(%rbp), %rcx
	movq	3152(%rcx), %rsi
	callq	*64(%rax)
.LBB74_8:
	movq	-16(%rbp), %rax
	cmpq	$0, 3160(%rax)
	je	.LBB74_10
# %bb.9:
	movq	-24(%rbp), %rax
	movq	72(%rax), %rdi
	movq	-16(%rbp), %rcx
	movq	3160(%rcx), %rsi
	callq	*64(%rax)
.LBB74_10:
	movq	-16(%rbp), %rax
	cmpq	$0, 3168(%rax)
	je	.LBB74_12
# %bb.11:
	movq	-24(%rbp), %rax
	movq	72(%rax), %rdi
	movq	-16(%rbp), %rcx
	movq	3168(%rcx), %rsi
	callq	*64(%rax)
.LBB74_12:
	movq	-24(%rbp), %rax
	movq	48(%rax), %rsi
	movq	72(%rax), %rdi
	callq	*64(%rax)
	movq	-24(%rbp), %rax
	movq	$0, 48(%rax)
	movl	$0, -4(%rbp)
	jmp	.LBB74_13
.Lfunc_end74:
	.size	BZ2_bzDecompressEnd, .Lfunc_end74-BZ2_bzDecompressEnd
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzWriteOpen                 # -- Begin function BZ2_bzWriteOpen
	.p2align	4, 0x90
	.type	BZ2_bzWriteOpen,@function
BZ2_bzWriteOpen:                        # @BZ2_bzWriteOpen
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -56(%rbp)
	movl	%edx, -28(%rbp)
	movl	%ecx, -24(%rbp)
	movl	%r8d, -20(%rbp)
	movq	$0, -8(%rbp)
	testq	%rdi, %rdi
	je	.LBB75_2
# %bb.1:
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
.LBB75_2:
	cmpq	$0, -8(%rbp)
	je	.LBB75_4
# %bb.3:
	movq	-8(%rbp), %rax
	movl	$0, 5096(%rax)
.LBB75_4:
	cmpq	$0, -56(%rbp)
	je	.LBB75_11
# %bb.5:
	cmpl	$0, -28(%rbp)
	jle	.LBB75_11
# %bb.6:
	cmpl	$9, -28(%rbp)
	jg	.LBB75_11
# %bb.7:
	cmpl	$0, -20(%rbp)
	js	.LBB75_11
# %bb.8:
	cmpl	$250, -20(%rbp)
	jg	.LBB75_11
# %bb.9:
	cmpl	$0, -24(%rbp)
	js	.LBB75_11
# %bb.10:
	cmpl	$5, -24(%rbp)
	jl	.LBB75_17
.LBB75_11:
	cmpq	$0, -16(%rbp)
	je	.LBB75_13
# %bb.12:
	movq	-16(%rbp), %rax
	movl	$-2, (%rax)
.LBB75_13:
	cmpq	$0, -8(%rbp)
	je	.LBB75_15
# %bb.14:
	movq	-8(%rbp), %rax
	movl	$-2, 5096(%rax)
.LBB75_15:
	movq	$0, -40(%rbp)
.LBB75_16:
	movq	-40(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB75_17:
	.cfi_def_cfa %rbp, 16
	movq	-56(%rbp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB75_23
# %bb.18:
	cmpq	$0, -16(%rbp)
	je	.LBB75_20
# %bb.19:
	movq	-16(%rbp), %rax
	movl	$-6, (%rax)
.LBB75_20:
	cmpq	$0, -8(%rbp)
	je	.LBB75_15
# %bb.21:
	movq	-8(%rbp), %rax
	movl	$-6, 5096(%rax)
	jmp	.LBB75_15
.LBB75_23:
	movl	$5104, %edi                     # imm = 0x13F0
	callq	malloc
	movq	%rax, -8(%rbp)
	testq	%rax, %rax
	je	.LBB75_36
# %bb.24:
	cmpq	$0, -16(%rbp)
	je	.LBB75_26
# %bb.25:
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
.LBB75_26:
	cmpq	$0, -8(%rbp)
	je	.LBB75_28
# %bb.27:
	movq	-8(%rbp), %rax
	movl	$0, 5096(%rax)
.LBB75_28:
	movq	-8(%rbp), %rax
	movb	$0, 5100(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 5008(%rax)
	movq	-56(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movb	$1, 5012(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 5072(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 5080(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 5088(%rax)
	cmpl	$0, -20(%rbp)
	jne	.LBB75_30
# %bb.29:
	movl	$30, -20(%rbp)
.LBB75_30:
	movl	$5016, %edi                     # imm = 0x1398
	addq	-8(%rbp), %rdi
	movl	-28(%rbp), %esi
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %ecx
	callq	BZ2_bzCompressInit
	movl	%eax, -44(%rbp)
	testl	%eax, %eax
	je	.LBB75_41
# %bb.31:
	cmpq	$0, -16(%rbp)
	je	.LBB75_33
# %bb.32:
	movl	-44(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, (%rcx)
.LBB75_33:
	cmpq	$0, -8(%rbp)
	je	.LBB75_35
# %bb.34:
	movl	-44(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 5096(%rcx)
.LBB75_35:
	movq	-8(%rbp), %rdi
	callq	free
	jmp	.LBB75_15
.LBB75_36:
	cmpq	$0, -16(%rbp)
	je	.LBB75_38
# %bb.37:
	movq	-16(%rbp), %rax
	movl	$-3, (%rax)
.LBB75_38:
	cmpq	$0, -8(%rbp)
	je	.LBB75_15
# %bb.39:
	movq	-8(%rbp), %rax
	movl	$-3, 5096(%rax)
	jmp	.LBB75_15
.LBB75_41:
	movq	-8(%rbp), %rax
	movl	$0, 5024(%rax)
	movq	-8(%rbp), %rax
	movb	$1, 5100(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.LBB75_16
.Lfunc_end75:
	.size	BZ2_bzWriteOpen, .Lfunc_end75-BZ2_bzWriteOpen
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzWrite                     # -- Begin function BZ2_bzWrite
	.p2align	4, 0x90
	.type	BZ2_bzWrite,@function
BZ2_bzWrite:                            # @BZ2_bzWrite
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -48(%rbp)
	movl	%ecx, -28(%rbp)
	movq	%rsi, -16(%rbp)
	testq	%rdi, %rdi
	je	.LBB76_2
# %bb.1:
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
.LBB76_2:
	cmpq	$0, -16(%rbp)
	je	.LBB76_4
# %bb.3:
	movq	-16(%rbp), %rax
	movl	$0, 5096(%rax)
.LBB76_4:
	cmpq	$0, -16(%rbp)
	je	.LBB76_7
# %bb.5:
	cmpq	$0, -48(%rbp)
	je	.LBB76_7
# %bb.6:
	cmpl	$0, -28(%rbp)
	js	.LBB76_7
# %bb.11:
	movq	-16(%rbp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB76_12
# %bb.16:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB76_21
.LBB76_17:
	cmpq	$0, -24(%rbp)
	je	.LBB76_19
# %bb.18:
	movq	-24(%rbp), %rax
	movl	$-6, (%rax)
.LBB76_19:
	cmpq	$0, -16(%rbp)
	je	.LBB76_36
# %bb.20:
	movq	-16(%rbp), %rax
	movl	$-6, 5096(%rax)
	jmp	.LBB76_36
.LBB76_7:
	cmpq	$0, -24(%rbp)
	je	.LBB76_9
# %bb.8:
	movq	-24(%rbp), %rax
	movl	$-2, (%rax)
.LBB76_9:
	cmpq	$0, -16(%rbp)
	je	.LBB76_36
# %bb.10:
	movq	-16(%rbp), %rax
	movl	$-2, 5096(%rax)
.LBB76_36:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB76_12:
	.cfi_def_cfa %rbp, 16
	cmpq	$0, -24(%rbp)
	je	.LBB76_14
# %bb.13:
	movq	-24(%rbp), %rax
	movl	$-1, (%rax)
.LBB76_14:
	cmpq	$0, -16(%rbp)
	je	.LBB76_36
# %bb.15:
	movq	-16(%rbp), %rax
	movl	$-1, 5096(%rax)
	jmp	.LBB76_36
.LBB76_21:
	cmpl	$0, -28(%rbp)
	je	.LBB76_32
# %bb.22:
	movl	-28(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 5024(%rcx)
	movq	-48(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, 5016(%rcx)
	movl	$5016, %ebx                     # imm = 0x1398
	jmp	.LBB76_23
	.p2align	4, 0x90
.LBB76_31:                              #   in Loop: Header=BB76_23 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$0, 5024(%rax)
	je	.LBB76_32
.LBB76_23:                              # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movl	$5000, 5048(%rax)               # imm = 0x1388
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rcx
	movq	%rcx, 5040(%rax)
	movq	-16(%rbp), %rdi
	addq	%rbx, %rdi
	xorl	%esi, %esi
	callq	BZ2_bzCompress
	movl	%eax, -32(%rbp)
	cmpl	$1, %eax
	jne	.LBB76_24
# %bb.28:                               #   in Loop: Header=BB76_23 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$4999, 5048(%rax)               # imm = 0x1387
	ja	.LBB76_31
# %bb.29:                               #   in Loop: Header=BB76_23 Depth=1
	movq	-16(%rbp), %rdi
	movl	$5000, %eax                     # imm = 0x1388
	subl	5048(%rdi), %eax
	movl	%eax, -36(%rbp)
	movslq	%eax, %rdx
	movq	(%rdi), %rcx
	addq	$8, %rdi
	movl	$1, %esi
	callq	fwrite
	movl	%eax, -52(%rbp)
	cmpl	%eax, -36(%rbp)
	jne	.LBB76_17
# %bb.30:                               #   in Loop: Header=BB76_23 Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB76_31
	jmp	.LBB76_17
.LBB76_32:
	cmpq	$0, -24(%rbp)
	je	.LBB76_34
# %bb.33:
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
.LBB76_34:
	cmpq	$0, -16(%rbp)
	je	.LBB76_36
# %bb.35:
	movq	-16(%rbp), %rax
	movl	$0, 5096(%rax)
	jmp	.LBB76_36
.LBB76_24:
	cmpq	$0, -24(%rbp)
	je	.LBB76_26
# %bb.25:
	movl	-32(%rbp), %eax
	movq	-24(%rbp), %rcx
	movl	%eax, (%rcx)
.LBB76_26:
	cmpq	$0, -16(%rbp)
	je	.LBB76_36
# %bb.27:
	movl	-32(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 5096(%rcx)
	jmp	.LBB76_36
.Lfunc_end76:
	.size	BZ2_bzWrite, .Lfunc_end76-BZ2_bzWrite
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzWriteClose                # -- Begin function BZ2_bzWriteClose
	.p2align	4, 0x90
	.type	BZ2_bzWriteClose,@function
BZ2_bzWriteClose:                       # @BZ2_bzWriteClose
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%r8, %r9
	movq	%rdi, -40(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -4(%rbp)
	movq	%rcx, -24(%rbp)
	movq	%r8, -16(%rbp)
	movq	$0, (%rsp)
	xorl	%r8d, %r8d
	callq	BZ2_bzWriteClose64
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end77:
	.size	BZ2_bzWriteClose, .Lfunc_end77-BZ2_bzWriteClose
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzWriteClose64              # -- Begin function BZ2_bzWriteClose64
	.p2align	4, 0x90
	.type	BZ2_bzWriteClose64,@function
BZ2_bzWriteClose64:                     # @BZ2_bzWriteClose64
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset %rbx, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -72(%rbp)
	movl	%edx, -32(%rbp)
	movq	%rcx, -56(%rbp)
	movq	%r8, -48(%rbp)
	movq	%r9, -40(%rbp)
	movq	%rsi, -16(%rbp)
	testq	%rsi, %rsi
	je	.LBB78_1
# %bb.5:
	movq	-16(%rbp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB78_6
# %bb.10:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB78_15
.LBB78_11:
	cmpq	$0, -24(%rbp)
	je	.LBB78_13
# %bb.12:
	movq	-24(%rbp), %rax
	movl	$-6, (%rax)
.LBB78_13:
	cmpq	$0, -16(%rbp)
	je	.LBB78_52
# %bb.14:
	movq	-16(%rbp), %rax
	movl	$-6, 5096(%rax)
	jmp	.LBB78_52
.LBB78_1:
	cmpq	$0, -24(%rbp)
	je	.LBB78_3
# %bb.2:
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
.LBB78_3:
	cmpq	$0, -16(%rbp)
	je	.LBB78_52
# %bb.4:
	movq	-16(%rbp), %rax
	movl	$0, 5096(%rax)
	jmp	.LBB78_52
.LBB78_6:
	cmpq	$0, -24(%rbp)
	je	.LBB78_8
# %bb.7:
	movq	-24(%rbp), %rax
	movl	$-1, (%rax)
.LBB78_8:
	cmpq	$0, -16(%rbp)
	je	.LBB78_52
# %bb.9:
	movq	-16(%rbp), %rax
	movl	$-1, 5096(%rax)
	jmp	.LBB78_52
.LBB78_15:
	cmpq	$0, -56(%rbp)
	je	.LBB78_17
# %bb.16:
	movq	-56(%rbp), %rax
	movl	$0, (%rax)
.LBB78_17:
	cmpq	$0, -48(%rbp)
	je	.LBB78_19
# %bb.18:
	movq	-48(%rbp), %rax
	movl	$0, (%rax)
.LBB78_19:
	cmpq	$0, -40(%rbp)
	je	.LBB78_21
# %bb.20:
	movq	-40(%rbp), %rax
	movl	$0, (%rax)
.LBB78_21:
	cmpq	$0, 16(%rbp)
	je	.LBB78_23
# %bb.22:
	movq	16(%rbp), %rax
	movl	$0, (%rax)
.LBB78_23:
	cmpl	$0, -32(%rbp)
	jne	.LBB78_36
# %bb.24:
	movq	-16(%rbp), %rax
	cmpl	$0, 5096(%rax)
	je	.LBB78_25
.LBB78_36:
	cmpl	$0, -32(%rbp)
	jne	.LBB78_39
# %bb.37:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB78_38
.LBB78_39:
	cmpq	$0, -56(%rbp)
	je	.LBB78_41
# %bb.40:
	movq	-16(%rbp), %rax
	movl	5028(%rax), %eax
	movq	-56(%rbp), %rcx
	movl	%eax, (%rcx)
.LBB78_41:
	cmpq	$0, -48(%rbp)
	je	.LBB78_43
# %bb.42:
	movq	-16(%rbp), %rax
	movl	5032(%rax), %eax
	movq	-48(%rbp), %rcx
	movl	%eax, (%rcx)
.LBB78_43:
	cmpq	$0, -40(%rbp)
	je	.LBB78_45
# %bb.44:
	movq	-16(%rbp), %rax
	movl	5052(%rax), %eax
	movq	-40(%rbp), %rcx
	movl	%eax, (%rcx)
.LBB78_45:
	cmpq	$0, 16(%rbp)
	je	.LBB78_47
# %bb.46:
	movq	-16(%rbp), %rax
	movl	5056(%rax), %eax
	movq	16(%rbp), %rcx
	movl	%eax, (%rcx)
.LBB78_47:
	cmpq	$0, -24(%rbp)
	je	.LBB78_49
# %bb.48:
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
.LBB78_49:
	cmpq	$0, -16(%rbp)
	je	.LBB78_51
# %bb.50:
	movq	-16(%rbp), %rax
	movl	$0, 5096(%rax)
.LBB78_51:
	movl	$5016, %edi                     # imm = 0x1398
	addq	-16(%rbp), %rdi
	callq	BZ2_bzCompressEnd
	movq	-16(%rbp), %rdi
	callq	free
.LBB78_52:
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB78_25:
	.cfi_def_cfa %rbp, 16
	movl	$5016, %ebx                     # imm = 0x1398
	jmp	.LBB78_26
	.p2align	4, 0x90
.LBB78_35:                              #   in Loop: Header=BB78_26 Depth=1
	cmpl	$4, -28(%rbp)
	je	.LBB78_36
.LBB78_26:                              # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movl	$5000, 5048(%rax)               # imm = 0x1388
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rcx
	movq	%rcx, 5040(%rax)
	movq	-16(%rbp), %rdi
	addq	%rbx, %rdi
	movl	$2, %esi
	callq	BZ2_bzCompress
	movl	%eax, -28(%rbp)
	cmpl	$3, %eax
	je	.LBB78_32
# %bb.27:                               #   in Loop: Header=BB78_26 Depth=1
	cmpl	$4, -28(%rbp)
	jne	.LBB78_28
.LBB78_32:                              #   in Loop: Header=BB78_26 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$4999, 5048(%rax)               # imm = 0x1387
	ja	.LBB78_35
# %bb.33:                               #   in Loop: Header=BB78_26 Depth=1
	movq	-16(%rbp), %rdi
	movl	$5000, %eax                     # imm = 0x1388
	subl	5048(%rdi), %eax
	movl	%eax, -60(%rbp)
	movslq	%eax, %rdx
	movq	(%rdi), %rcx
	addq	$8, %rdi
	movl	$1, %esi
	callq	fwrite
	movl	%eax, -64(%rbp)
	cmpl	%eax, -60(%rbp)
	jne	.LBB78_11
# %bb.34:                               #   in Loop: Header=BB78_26 Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB78_35
	jmp	.LBB78_11
.LBB78_38:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	fflush
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB78_11
	jmp	.LBB78_39
.LBB78_28:
	cmpq	$0, -24(%rbp)
	je	.LBB78_30
# %bb.29:
	movl	-28(%rbp), %eax
	movq	-24(%rbp), %rcx
	movl	%eax, (%rcx)
.LBB78_30:
	cmpq	$0, -16(%rbp)
	je	.LBB78_52
# %bb.31:
	movl	-28(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 5096(%rcx)
	jmp	.LBB78_52
.Lfunc_end78:
	.size	BZ2_bzWriteClose64, .Lfunc_end78-BZ2_bzWriteClose64
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzReadOpen                  # -- Begin function BZ2_bzReadOpen
	.p2align	4, 0x90
	.type	BZ2_bzReadOpen,@function
BZ2_bzReadOpen:                         # @BZ2_bzReadOpen
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -28(%rbp)
	movl	%ecx, -24(%rbp)
	movq	%r8, -56(%rbp)
	movl	%r9d, -20(%rbp)
	movq	$0, -8(%rbp)
	testq	%rdi, %rdi
	je	.LBB79_2
# %bb.1:
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
.LBB79_2:
	cmpq	$0, -8(%rbp)
	je	.LBB79_4
# %bb.3:
	movq	-8(%rbp), %rax
	movl	$0, 5096(%rax)
.LBB79_4:
	cmpq	$0, -64(%rbp)
	je	.LBB79_9
# %bb.5:
	cmpl	$0, -24(%rbp)
	je	.LBB79_7
# %bb.6:
	cmpl	$1, -24(%rbp)
	jne	.LBB79_9
.LBB79_7:
	cmpl	$0, -28(%rbp)
	js	.LBB79_9
# %bb.8:
	cmpl	$4, -28(%rbp)
	jle	.LBB79_15
.LBB79_9:
	cmpq	$0, -16(%rbp)
	je	.LBB79_11
# %bb.10:
	movq	-16(%rbp), %rax
	movl	$-2, (%rax)
.LBB79_11:
	cmpq	$0, -8(%rbp)
	je	.LBB79_13
# %bb.12:
	movq	-8(%rbp), %rax
	movl	$-2, 5096(%rax)
.LBB79_13:
	movq	$0, -40(%rbp)
.LBB79_14:
	movq	-40(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB79_15:
	.cfi_def_cfa %rbp, 16
	cmpq	$0, -56(%rbp)
	je	.LBB79_25
.LBB79_16:
	cmpq	$0, -56(%rbp)
	je	.LBB79_19
# %bb.17:
	cmpl	$0, -20(%rbp)
	js	.LBB79_9
# %bb.18:
	cmpl	$5001, -20(%rbp)                # imm = 0x1389
	jge	.LBB79_9
.LBB79_19:
	movq	-64(%rbp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB79_26
# %bb.20:
	cmpq	$0, -16(%rbp)
	je	.LBB79_22
# %bb.21:
	movq	-16(%rbp), %rax
	movl	$-6, (%rax)
.LBB79_22:
	cmpq	$0, -8(%rbp)
	je	.LBB79_13
# %bb.23:
	movq	-8(%rbp), %rax
	movl	$-6, 5096(%rax)
	jmp	.LBB79_13
.LBB79_25:
	cmpl	$0, -20(%rbp)
	jne	.LBB79_9
	jmp	.LBB79_16
.LBB79_26:
	movl	$5104, %edi                     # imm = 0x13F0
	callq	malloc
	movq	%rax, -8(%rbp)
	testq	%rax, %rax
	je	.LBB79_39
# %bb.27:
	cmpq	$0, -16(%rbp)
	je	.LBB79_29
# %bb.28:
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
.LBB79_29:
	cmpq	$0, -8(%rbp)
	je	.LBB79_31
# %bb.30:
	movq	-8(%rbp), %rax
	movl	$0, 5096(%rax)
.LBB79_31:
	movq	-8(%rbp), %rax
	movb	$0, 5100(%rax)
	movq	-64(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movl	$0, 5008(%rax)
	movq	-8(%rbp), %rax
	movb	$0, 5012(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 5072(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 5080(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 5088(%rax)
	cmpl	$0, -20(%rbp)
	jle	.LBB79_33
	.p2align	4, 0x90
.LBB79_32:                              # =>This Inner Loop Header: Depth=1
	movq	-56(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-8(%rbp), %rcx
	movslq	5008(%rcx), %rdx
	movb	%al, 8(%rcx,%rdx)
	movq	-8(%rbp), %rax
	addl	$1, 5008(%rax)
	addq	$1, -56(%rbp)
	addl	$-1, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jg	.LBB79_32
.LBB79_33:
	movl	$5016, %edi                     # imm = 0x1398
	addq	-8(%rbp), %rdi
	movl	-28(%rbp), %esi
	movl	-24(%rbp), %edx
	callq	BZ2_bzDecompressInit
	movl	%eax, -44(%rbp)
	testl	%eax, %eax
	je	.LBB79_44
# %bb.34:
	cmpq	$0, -16(%rbp)
	je	.LBB79_36
# %bb.35:
	movl	-44(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, (%rcx)
.LBB79_36:
	cmpq	$0, -8(%rbp)
	je	.LBB79_38
# %bb.37:
	movl	-44(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 5096(%rcx)
.LBB79_38:
	movq	-8(%rbp), %rdi
	callq	free
	jmp	.LBB79_13
.LBB79_39:
	cmpq	$0, -16(%rbp)
	je	.LBB79_41
# %bb.40:
	movq	-16(%rbp), %rax
	movl	$-3, (%rax)
.LBB79_41:
	cmpq	$0, -8(%rbp)
	je	.LBB79_13
# %bb.42:
	movq	-8(%rbp), %rax
	movl	$-3, 5096(%rax)
	jmp	.LBB79_13
.LBB79_44:
	movq	-8(%rbp), %rax
	movl	5008(%rax), %ecx
	movl	%ecx, 5024(%rax)
	movq	-8(%rbp), %rax
	leaq	8(%rax), %rcx
	movq	%rcx, 5016(%rax)
	movq	-8(%rbp), %rax
	movb	$1, 5100(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.LBB79_14
.Lfunc_end79:
	.size	BZ2_bzReadOpen, .Lfunc_end79-BZ2_bzReadOpen
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzReadClose                 # -- Begin function BZ2_bzReadClose
	.p2align	4, 0x90
	.type	BZ2_bzReadClose,@function
BZ2_bzReadClose:                        # @BZ2_bzReadClose
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rsi, -8(%rbp)
	testq	%rdi, %rdi
	je	.LBB80_2
# %bb.1:
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
.LBB80_2:
	cmpq	$0, -8(%rbp)
	je	.LBB80_4
# %bb.3:
	movq	-8(%rbp), %rax
	movl	$0, 5096(%rax)
.LBB80_4:
	cmpq	$0, -8(%rbp)
	je	.LBB80_5
# %bb.9:
	movq	-8(%rbp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB80_14
# %bb.10:
	cmpq	$0, -16(%rbp)
	je	.LBB80_12
# %bb.11:
	movq	-16(%rbp), %rax
	movl	$-1, (%rax)
.LBB80_12:
	cmpq	$0, -8(%rbp)
	je	.LBB80_17
# %bb.13:
	movq	-8(%rbp), %rax
	movl	$-1, 5096(%rax)
	jmp	.LBB80_17
.LBB80_5:
	cmpq	$0, -16(%rbp)
	je	.LBB80_7
# %bb.6:
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
.LBB80_7:
	cmpq	$0, -8(%rbp)
	je	.LBB80_17
# %bb.8:
	movq	-8(%rbp), %rax
	movl	$0, 5096(%rax)
	jmp	.LBB80_17
.LBB80_14:
	movq	-8(%rbp), %rax
	cmpb	$0, 5100(%rax)
	je	.LBB80_16
# %bb.15:
	movl	$5016, %edi                     # imm = 0x1398
	addq	-8(%rbp), %rdi
	callq	BZ2_bzDecompressEnd
.LBB80_16:
	movq	-8(%rbp), %rdi
	callq	free
.LBB80_17:
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end80:
	.size	BZ2_bzReadClose, .Lfunc_end80-BZ2_bzReadClose
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzRead                      # -- Begin function BZ2_bzRead
	.p2align	4, 0x90
	.type	BZ2_bzRead,@function
BZ2_bzRead:                             # @BZ2_bzRead
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -56(%rbp)
	movq	%rdx, -48(%rbp)
	movl	%ecx, -36(%rbp)
	movq	%rsi, -16(%rbp)
	testq	%rdi, %rdi
	je	.LBB81_2
# %bb.1:
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
.LBB81_2:
	cmpq	$0, -16(%rbp)
	je	.LBB81_4
# %bb.3:
	movq	-16(%rbp), %rax
	movl	$0, 5096(%rax)
.LBB81_4:
	cmpq	$0, -16(%rbp)
	je	.LBB81_12
# %bb.5:
	cmpq	$0, -48(%rbp)
	je	.LBB81_12
# %bb.6:
	cmpl	$0, -36(%rbp)
	js	.LBB81_12
# %bb.7:
	movq	-16(%rbp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB81_18
# %bb.8:
	cmpq	$0, -24(%rbp)
	je	.LBB81_10
# %bb.9:
	movq	-24(%rbp), %rax
	movl	$-1, (%rax)
.LBB81_10:
	cmpq	$0, -16(%rbp)
	je	.LBB81_16
# %bb.11:
	movq	-16(%rbp), %rax
	movl	$-1, 5096(%rax)
	jmp	.LBB81_16
.LBB81_12:
	cmpq	$0, -24(%rbp)
	je	.LBB81_14
# %bb.13:
	movq	-24(%rbp), %rax
	movl	$-2, (%rax)
.LBB81_14:
	cmpq	$0, -16(%rbp)
	je	.LBB81_16
# %bb.15:
	movq	-16(%rbp), %rax
	movl	$-2, 5096(%rax)
.LBB81_16:
	movl	$0, -28(%rbp)
.LBB81_17:
	movl	-28(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB81_18:
	.cfi_def_cfa %rbp, 16
	cmpl	$0, -36(%rbp)
	je	.LBB81_42
# %bb.19:
	movl	-36(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 5048(%rcx)
	movq	-48(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, 5040(%rcx)
	movl	$5016, %ebx                     # imm = 0x1398
	.p2align	4, 0x90
.LBB81_20:                              # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB81_46
# %bb.21:                               #   in Loop: Header=BB81_20 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$0, 5024(%rax)
	jne	.LBB81_25
# %bb.22:                               #   in Loop: Header=BB81_20 Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	myfeof.123
	testb	%al, %al
	jne	.LBB81_25
# %bb.23:                               #   in Loop: Header=BB81_20 Depth=1
	movq	-16(%rbp), %rdi
	movq	(%rdi), %rcx
	addq	$8, %rdi
	movl	$1, %esi
	movl	$5000, %edx                     # imm = 0x1388
	callq	fread
	movl	%eax, -40(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB81_46
# %bb.24:                               #   in Loop: Header=BB81_20 Depth=1
	movl	-40(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 5008(%rcx)
	movq	-16(%rbp), %rax
	movl	5008(%rax), %ecx
	movl	%ecx, 5024(%rax)
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rcx
	movq	%rcx, 5016(%rax)
	.p2align	4, 0x90
.LBB81_25:                              #   in Loop: Header=BB81_20 Depth=1
	movq	-16(%rbp), %rdi
	addq	%rbx, %rdi
	callq	BZ2_bzDecompress
	movl	%eax, -32(%rbp)
	testl	%eax, %eax
	je	.LBB81_27
# %bb.26:                               #   in Loop: Header=BB81_20 Depth=1
	cmpl	$4, -32(%rbp)
	jne	.LBB81_56
.LBB81_27:                              #   in Loop: Header=BB81_20 Depth=1
	cmpl	$0, -32(%rbp)
	je	.LBB81_35
.LBB81_28:                              #   in Loop: Header=BB81_20 Depth=1
	cmpl	$4, -32(%rbp)
	je	.LBB81_50
# %bb.29:                               #   in Loop: Header=BB81_20 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$0, 5048(%rax)
	jne	.LBB81_20
	jmp	.LBB81_30
.LBB81_35:                              #   in Loop: Header=BB81_20 Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	myfeof.123
	testb	%al, %al
	je	.LBB81_28
# %bb.36:                               #   in Loop: Header=BB81_20 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$0, 5024(%rax)
	jne	.LBB81_28
# %bb.37:                               #   in Loop: Header=BB81_20 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$0, 5048(%rax)
	je	.LBB81_28
# %bb.38:
	cmpq	$0, -24(%rbp)
	je	.LBB81_40
# %bb.39:
	movq	-24(%rbp), %rax
	movl	$-7, (%rax)
.LBB81_40:
	cmpq	$0, -16(%rbp)
	je	.LBB81_16
# %bb.41:
	movq	-16(%rbp), %rax
	movl	$-7, 5096(%rax)
	jmp	.LBB81_16
.LBB81_42:
	cmpq	$0, -24(%rbp)
	je	.LBB81_44
# %bb.43:
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
.LBB81_44:
	cmpq	$0, -16(%rbp)
	je	.LBB81_16
# %bb.45:
	movq	-16(%rbp), %rax
	movl	$0, 5096(%rax)
	jmp	.LBB81_16
.LBB81_46:
	cmpq	$0, -24(%rbp)
	je	.LBB81_48
# %bb.47:
	movq	-24(%rbp), %rax
	movl	$-6, (%rax)
.LBB81_48:
	cmpq	$0, -16(%rbp)
	je	.LBB81_16
# %bb.49:
	movq	-16(%rbp), %rax
	movl	$-6, 5096(%rax)
	jmp	.LBB81_16
.LBB81_50:
	cmpq	$0, -24(%rbp)
	je	.LBB81_52
# %bb.51:
	movq	-24(%rbp), %rax
	movl	$4, (%rax)
.LBB81_52:
	cmpq	$0, -16(%rbp)
	je	.LBB81_54
# %bb.53:
	movq	-16(%rbp), %rax
	movl	$4, 5096(%rax)
.LBB81_54:
	movl	-36(%rbp), %eax
	movq	-16(%rbp), %rcx
	subl	5048(%rcx), %eax
	jmp	.LBB81_55
.LBB81_30:
	cmpq	$0, -24(%rbp)
	je	.LBB81_32
# %bb.31:
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
.LBB81_32:
	cmpq	$0, -16(%rbp)
	je	.LBB81_34
# %bb.33:
	movq	-16(%rbp), %rax
	movl	$0, 5096(%rax)
.LBB81_34:
	movl	-36(%rbp), %eax
.LBB81_55:
	movl	%eax, -28(%rbp)
	jmp	.LBB81_17
.LBB81_56:
	cmpq	$0, -24(%rbp)
	je	.LBB81_58
# %bb.57:
	movl	-32(%rbp), %eax
	movq	-24(%rbp), %rcx
	movl	%eax, (%rcx)
.LBB81_58:
	cmpq	$0, -16(%rbp)
	je	.LBB81_16
# %bb.59:
	movl	-32(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 5096(%rcx)
	jmp	.LBB81_16
.Lfunc_end81:
	.size	BZ2_bzRead, .Lfunc_end81-BZ2_bzRead
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function myfeof.123
	.type	myfeof.123,@function
myfeof.123:                             # @myfeof.123
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	callq	fgetc
	movl	%eax, -8(%rbp)
	cmpl	$-1, %eax
	je	.LBB82_1
# %bb.2:
	movl	-8(%rbp), %edi
	movq	-16(%rbp), %rsi
	callq	ungetc
	movb	$0, -1(%rbp)
	jmp	.LBB82_3
.LBB82_1:
	movb	$1, -1(%rbp)
.LBB82_3:
	movb	-1(%rbp), %al
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end82:
	.size	myfeof.123, .Lfunc_end82-myfeof.123
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzReadGetUnused             # -- Begin function BZ2_bzReadGetUnused
	.p2align	4, 0x90
	.type	BZ2_bzReadGetUnused,@function
BZ2_bzReadGetUnused:                    # @BZ2_bzReadGetUnused
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -40(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%rcx, -24(%rbp)
	movq	%rsi, -8(%rbp)
	testq	%rsi, %rsi
	je	.LBB83_13
# %bb.1:
	movq	-8(%rbp), %rax
	cmpl	$4, 5096(%rax)
	je	.LBB83_6
# %bb.2:
	cmpq	$0, -16(%rbp)
	je	.LBB83_4
# %bb.3:
	movq	-16(%rbp), %rax
	movl	$-1, (%rax)
.LBB83_4:
	cmpq	$0, -8(%rbp)
	je	.LBB83_17
# %bb.5:
	movq	-8(%rbp), %rax
	movl	$-1, 5096(%rax)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB83_6:
	.cfi_def_cfa %rbp, 16
	cmpq	$0, -32(%rbp)
	je	.LBB83_13
# %bb.7:
	cmpq	$0, -24(%rbp)
	je	.LBB83_13
# %bb.8:
	cmpq	$0, -16(%rbp)
	je	.LBB83_10
# %bb.9:
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
.LBB83_10:
	cmpq	$0, -8(%rbp)
	je	.LBB83_12
# %bb.11:
	movq	-8(%rbp), %rax
	movl	$0, 5096(%rax)
.LBB83_12:
	movq	-8(%rbp), %rax
	movl	5024(%rax), %eax
	movq	-24(%rbp), %rcx
	movl	%eax, (%rcx)
	movq	-8(%rbp), %rax
	movq	5016(%rax), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
.LBB83_17:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB83_13:
	.cfi_def_cfa %rbp, 16
	cmpq	$0, -16(%rbp)
	je	.LBB83_15
# %bb.14:
	movq	-16(%rbp), %rax
	movl	$-2, (%rax)
.LBB83_15:
	cmpq	$0, -8(%rbp)
	je	.LBB83_17
# %bb.16:
	movq	-8(%rbp), %rax
	movl	$-2, 5096(%rax)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end83:
	.size	BZ2_bzReadGetUnused, .Lfunc_end83-BZ2_bzReadGetUnused
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzBuffToBuffCompress        # -- Begin function BZ2_bzBuffToBuffCompress
	.p2align	4, 0x90
	.type	BZ2_bzBuffToBuffCompress,@function
BZ2_bzBuffToBuffCompress:               # @BZ2_bzBuffToBuffCompress
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movq	%rdi, -48(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -40(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r8d, -16(%rbp)
	movl	%r9d, -12(%rbp)
	testq	%rdi, %rdi
	je	.LBB84_9
# %bb.1:
	cmpq	$0, -24(%rbp)
	je	.LBB84_9
# %bb.2:
	cmpq	$0, -40(%rbp)
	je	.LBB84_9
# %bb.3:
	cmpl	$0, -16(%rbp)
	jle	.LBB84_9
# %bb.4:
	cmpl	$9, -16(%rbp)
	jg	.LBB84_9
# %bb.5:
	cmpl	$0, -12(%rbp)
	js	.LBB84_9
# %bb.6:
	cmpl	$4, -12(%rbp)
	jg	.LBB84_9
# %bb.7:
	cmpl	$0, 16(%rbp)
	js	.LBB84_9
# %bb.8:
	cmpl	$251, 16(%rbp)
	jl	.LBB84_10
.LBB84_9:
	movl	$-2, -4(%rbp)
.LBB84_19:
	movl	-4(%rbp), %eax
	addq	$128, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB84_10:
	.cfi_def_cfa %rbp, 16
	cmpl	$0, 16(%rbp)
	jne	.LBB84_12
# %bb.11:
	movl	$30, 16(%rbp)
.LBB84_12:
	xorps	%xmm0, %xmm0
	movups	%xmm0, -72(%rbp)
	movq	$0, -56(%rbp)
	movl	-16(%rbp), %esi
	movl	-12(%rbp), %edx
	movl	16(%rbp), %ecx
	leaq	-128(%rbp), %rdi
	callq	BZ2_bzCompressInit
	movl	%eax, -8(%rbp)
	testl	%eax, %eax
	je	.LBB84_14
.LBB84_13:
	movl	-8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB84_19
.LBB84_14:
	movq	-40(%rbp), %rax
	movq	%rax, -128(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -104(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -120(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -96(%rbp)
	leaq	-128(%rbp), %rdi
	movl	$2, %esi
	callq	BZ2_bzCompress
	movl	%eax, -8(%rbp)
	cmpl	$3, %eax
	jne	.LBB84_16
# %bb.15:
	leaq	-128(%rbp), %rdi
	callq	BZ2_bzCompressEnd
	movl	$-8, -4(%rbp)
	jmp	.LBB84_19
.LBB84_16:
	cmpl	$4, -8(%rbp)
	je	.LBB84_18
# %bb.17:
	leaq	-128(%rbp), %rdi
	callq	BZ2_bzCompressEnd
	jmp	.LBB84_13
.LBB84_18:
	movl	-96(%rbp), %eax
	movq	-24(%rbp), %rcx
	subl	%eax, (%rcx)
	leaq	-128(%rbp), %rdi
	callq	BZ2_bzCompressEnd
	movl	$0, -4(%rbp)
	jmp	.LBB84_19
.Lfunc_end84:
	.size	BZ2_bzBuffToBuffCompress, .Lfunc_end84-BZ2_bzBuffToBuffCompress
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzBuffToBuffDecompress      # -- Begin function BZ2_bzBuffToBuffDecompress
	.p2align	4, 0x90
	.type	BZ2_bzBuffToBuffDecompress,@function
BZ2_bzBuffToBuffDecompress:             # @BZ2_bzBuffToBuffDecompress
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movq	%rdi, -48(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -40(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r8d, -16(%rbp)
	movl	%r9d, -12(%rbp)
	testq	%rdi, %rdi
	je	.LBB85_7
# %bb.1:
	cmpq	$0, -24(%rbp)
	je	.LBB85_7
# %bb.2:
	cmpq	$0, -40(%rbp)
	je	.LBB85_7
# %bb.3:
	cmpl	$0, -16(%rbp)
	je	.LBB85_5
# %bb.4:
	cmpl	$1, -16(%rbp)
	jne	.LBB85_7
.LBB85_5:
	cmpl	$0, -12(%rbp)
	js	.LBB85_7
# %bb.6:
	cmpl	$5, -12(%rbp)
	jl	.LBB85_8
.LBB85_7:
	movl	$-2, -4(%rbp)
.LBB85_17:
	movl	-4(%rbp), %eax
	addq	$128, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB85_8:
	.cfi_def_cfa %rbp, 16
	xorps	%xmm0, %xmm0
	movups	%xmm0, -72(%rbp)
	movq	$0, -56(%rbp)
	movl	-12(%rbp), %esi
	movl	-16(%rbp), %edx
	leaq	-128(%rbp), %rdi
	callq	BZ2_bzDecompressInit
	movl	%eax, -8(%rbp)
	testl	%eax, %eax
	je	.LBB85_10
.LBB85_9:
	movl	-8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB85_17
.LBB85_10:
	movq	-40(%rbp), %rax
	movq	%rax, -128(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -104(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -120(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -96(%rbp)
	leaq	-128(%rbp), %rdi
	callq	BZ2_bzDecompress
	movl	%eax, -8(%rbp)
	testl	%eax, %eax
	je	.LBB85_11
# %bb.13:
	cmpl	$4, -8(%rbp)
	je	.LBB85_15
# %bb.14:
	leaq	-128(%rbp), %rdi
	callq	BZ2_bzDecompressEnd
	jmp	.LBB85_9
.LBB85_11:
	cmpl	$0, -96(%rbp)
	je	.LBB85_16
# %bb.12:
	leaq	-128(%rbp), %rdi
	callq	BZ2_bzDecompressEnd
	movl	$-7, -4(%rbp)
	jmp	.LBB85_17
.LBB85_15:
	movl	-96(%rbp), %eax
	movq	-24(%rbp), %rcx
	subl	%eax, (%rcx)
	leaq	-128(%rbp), %rdi
	callq	BZ2_bzDecompressEnd
	movl	$0, -4(%rbp)
	jmp	.LBB85_17
.LBB85_16:
	leaq	-128(%rbp), %rdi
	callq	BZ2_bzDecompressEnd
	movl	$-8, -4(%rbp)
	jmp	.LBB85_17
.Lfunc_end85:
	.size	BZ2_bzBuffToBuffDecompress, .Lfunc_end85-BZ2_bzBuffToBuffDecompress
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzopen                      # -- Begin function BZ2_bzopen
	.p2align	4, 0x90
	.type	BZ2_bzopen,@function
BZ2_bzopen:                             # @BZ2_bzopen
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rsi, %rdx
	movq	%rdi, -16(%rbp)
	movq	%rsi, -8(%rbp)
	movl	$-1, %esi
	xorl	%ecx, %ecx
	callq	bzopen_or_bzdopen
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end86:
	.size	BZ2_bzopen, .Lfunc_end86-BZ2_bzopen
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function bzopen_or_bzdopen
	.type	bzopen_or_bzdopen,@function
bzopen_or_bzdopen:                      # @bzopen_or_bzdopen
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$5096, %rsp                     # imm = 0x13E8
	.cfi_offset %rbx, -24
	movq	%rdi, -80(%rbp)
	movl	%esi, -100(%rbp)
	movq	%rdx, -32(%rbp)
	movl	%ecx, -96(%rbp)
	movl	$9, -12(%rbp)
	movl	$0, -16(%rbp)
	movq	$0, -72(%rbp)
	movw	$0, -64(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -48(%rbp)
	movl	$0, -40(%rbp)
	movl	$30, -88(%rbp)
	movl	$0, -36(%rbp)
	movl	$0, -84(%rbp)
	testq	%rdx, %rdx
	jne	.LBB87_3
	jmp	.LBB87_32
	.p2align	4, 0x90
.LBB87_2:                               #   in Loop: Header=BB87_3 Depth=1
	addq	$1, -32(%rbp)
.LBB87_3:                               # =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	cmpb	$0, (%rax)
	je	.LBB87_12
# %bb.4:                                #   in Loop: Header=BB87_3 Depth=1
	movq	-32(%rbp), %rax
	movsbl	(%rax), %eax
	cmpl	$119, %eax
	je	.LBB87_8
# %bb.5:                                #   in Loop: Header=BB87_3 Depth=1
	cmpl	$115, %eax
	je	.LBB87_9
# %bb.6:                                #   in Loop: Header=BB87_3 Depth=1
	cmpl	$114, %eax
	jne	.LBB87_10
# %bb.7:                                #   in Loop: Header=BB87_3 Depth=1
	movl	$0, -16(%rbp)
	addq	$1, -32(%rbp)
	jmp	.LBB87_3
	.p2align	4, 0x90
.LBB87_8:                               #   in Loop: Header=BB87_3 Depth=1
	movl	$1, -16(%rbp)
	addq	$1, -32(%rbp)
	jmp	.LBB87_3
	.p2align	4, 0x90
.LBB87_9:                               #   in Loop: Header=BB87_3 Depth=1
	movl	$1, -36(%rbp)
	addq	$1, -32(%rbp)
	jmp	.LBB87_3
	.p2align	4, 0x90
.LBB87_10:                              #   in Loop: Header=BB87_3 Depth=1
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movq	-32(%rbp), %rcx
	movsbq	(%rcx), %rcx
	movzwl	(%rax,%rcx,2), %eax
	testl	$2048, %eax                     # imm = 0x800
	je	.LBB87_2
# %bb.11:                               #   in Loop: Header=BB87_3 Depth=1
	movq	-32(%rbp), %rax
	movsbl	(%rax), %eax
	addl	$-48, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB87_2
.LBB87_12:
	cmpl	$0, -16(%rbp)
	movl	$.L.str.6.126, %eax
	movl	$.L.str.7.127, %esi
	cmovneq	%rax, %rsi
	leaq	-72(%rbp), %rbx
	movq	%rbx, %rdi
	callq	strcat
	movl	$.L.str.8.128, %esi
	movq	%rbx, %rdi
	callq	strcat
	cmpl	$0, -96(%rbp)
	je	.LBB87_20
# %bb.13:
	movl	-100(%rbp), %edi
	leaq	-72(%rbp), %rsi
	callq	fdopen
.LBB87_14:
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.LBB87_32
# %bb.15:
	cmpl	$0, -16(%rbp)
	je	.LBB87_24
# %bb.16:
	cmpl	$0, -12(%rbp)
	jle	.LBB87_34
# %bb.17:
	cmpl	$10, -12(%rbp)
	jl	.LBB87_19
.LBB87_18:
	movl	$9, -12(%rbp)
.LBB87_19:
	movq	-24(%rbp), %rsi
	movl	-12(%rbp), %edx
	movl	-40(%rbp), %ecx
	movl	-88(%rbp), %r8d
	leaq	-92(%rbp), %rdi
	callq	BZ2_bzWriteOpen
	jmp	.LBB87_25
.LBB87_20:
	cmpq	$0, -80(%rbp)
	je	.LBB87_27
# %bb.21:
	movq	-80(%rbp), %rdi
	movl	$.L.str.9.129, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB87_27
# %bb.22:
	movq	-80(%rbp), %rdi
	leaq	-72(%rbp), %rsi
	callq	fopen
	jmp	.LBB87_14
.LBB87_24:
	movq	-24(%rbp), %rsi
	movl	-40(%rbp), %edx
	movl	-36(%rbp), %ecx
	movl	-84(%rbp), %r9d
	leaq	-92(%rbp), %rdi
	leaq	-5104(%rbp), %r8
	callq	BZ2_bzReadOpen
.LBB87_25:
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	je	.LBB87_29
# %bb.26:
	movq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
	jmp	.LBB87_33
.LBB87_27:
	cmpl	$0, -16(%rbp)
	je	.LBB87_35
# %bb.28:
	movq	stdout(%rip), %rax
	jmp	.LBB87_14
.LBB87_29:
	movq	-24(%rbp), %rax
	cmpq	stdin(%rip), %rax
	je	.LBB87_32
# %bb.30:
	movq	-24(%rbp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB87_32
# %bb.31:
	movq	-24(%rbp), %rdi
	callq	fclose
.LBB87_32:
	movq	$0, -56(%rbp)
.LBB87_33:
	movq	-56(%rbp), %rax
	addq	$5096, %rsp                     # imm = 0x13E8
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB87_34:
	.cfi_def_cfa %rbp, 16
	movl	$1, -12(%rbp)
	cmpl	$10, -12(%rbp)
	jge	.LBB87_18
	jmp	.LBB87_19
.LBB87_35:
	movq	stdin(%rip), %rax
	jmp	.LBB87_14
.Lfunc_end87:
	.size	bzopen_or_bzdopen, .Lfunc_end87-bzopen_or_bzdopen
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzdopen                     # -- Begin function BZ2_bzdopen
	.p2align	4, 0x90
	.type	BZ2_bzdopen,@function
BZ2_bzdopen:                            # @BZ2_bzdopen
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rsi, %rdx
	movl	%edi, %esi
	movl	%edi, -4(%rbp)
	movq	%rdx, -16(%rbp)
	xorl	%edi, %edi
	movl	$1, %ecx
	callq	bzopen_or_bzdopen
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end88:
	.size	BZ2_bzdopen, .Lfunc_end88-BZ2_bzdopen
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzread                      # -- Begin function BZ2_bzread
	.p2align	4, 0x90
	.type	BZ2_bzread,@function
BZ2_bzread:                             # @BZ2_bzread
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -32(%rbp)
	movq	%rsi, -24(%rbp)
	movl	%edx, -16(%rbp)
	cmpl	$4, 5096(%rdi)
	jne	.LBB89_2
# %bb.1:
	movl	$0, -4(%rbp)
	jmp	.LBB89_6
.LBB89_2:
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rdx
	movl	-16(%rbp), %ecx
	leaq	-8(%rbp), %rdi
	callq	BZ2_bzRead
	movl	%eax, -12(%rbp)
	cmpl	$0, -8(%rbp)
	je	.LBB89_4
# %bb.3:
	cmpl	$4, -8(%rbp)
	jne	.LBB89_5
.LBB89_4:
	movl	-12(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB89_6
.LBB89_5:
	movl	$-1, -4(%rbp)
.LBB89_6:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end89:
	.size	BZ2_bzread, .Lfunc_end89-BZ2_bzread
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzwrite                     # -- Begin function BZ2_bzwrite
	.p2align	4, 0x90
	.type	BZ2_bzwrite,@function
BZ2_bzwrite:                            # @BZ2_bzwrite
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edx, %ecx
	movq	%rsi, %rdx
	movq	%rdi, %rsi
	movq	%rdi, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -12(%rbp)
	leaq	-8(%rbp), %rdi
	callq	BZ2_bzWrite
	cmpl	$0, -8(%rbp)
	je	.LBB90_1
# %bb.2:
	movl	$-1, -4(%rbp)
	jmp	.LBB90_3
.LBB90_1:
	movl	-12(%rbp), %eax
	movl	%eax, -4(%rbp)
.LBB90_3:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end90:
	.size	BZ2_bzwrite, .Lfunc_end90-BZ2_bzwrite
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzflush                     # -- Begin function BZ2_bzflush
	.p2align	4, 0x90
	.type	BZ2_bzflush,@function
BZ2_bzflush:                            # @BZ2_bzflush
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end91:
	.size	BZ2_bzflush, .Lfunc_end91-BZ2_bzflush
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzclose                     # -- Begin function BZ2_bzclose
	.p2align	4, 0x90
	.type	BZ2_bzclose,@function
BZ2_bzclose:                            # @BZ2_bzclose
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	testq	%rdi, %rdi
	je	.LBB92_8
# %bb.1:
	movq	-16(%rbp), %rax
	movq	(%rax), %rcx
	movq	%rcx, -24(%rbp)
	cmpb	$0, 5012(%rax)
	je	.LBB92_4
# %bb.2:
	movq	-16(%rbp), %rsi
	leaq	-4(%rbp), %rdi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	callq	BZ2_bzWriteClose
	cmpl	$0, -4(%rbp)
	je	.LBB92_5
# %bb.3:
	movq	-16(%rbp), %rsi
	xorl	%edi, %edi
	movl	$1, %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	callq	BZ2_bzWriteClose
	jmp	.LBB92_5
.LBB92_4:
	movq	-16(%rbp), %rsi
	leaq	-4(%rbp), %rdi
	callq	BZ2_bzReadClose
.LBB92_5:
	movq	-24(%rbp), %rax
	cmpq	stdin(%rip), %rax
	je	.LBB92_8
# %bb.6:
	movq	-24(%rbp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB92_8
# %bb.7:
	movq	-24(%rbp), %rdi
	callq	fclose
.LBB92_8:
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end92:
	.size	BZ2_bzclose, .Lfunc_end92-BZ2_bzclose
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bzerror                     # -- Begin function BZ2_bzerror
	.p2align	4, 0x90
	.type	BZ2_bzerror,@function
BZ2_bzerror:                            # @BZ2_bzerror
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -16(%rbp)
	movl	5096(%rdi), %eax
	movl	%eax, -4(%rbp)
	testl	%eax, %eax
	jle	.LBB93_2
# %bb.1:
	movl	$0, -4(%rbp)
.LBB93_2:
	movl	-4(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, (%rcx)
	movslq	-4(%rbp), %rax
	shlq	$3, %rax
	movl	$bzerrorstrings, %ecx
	subq	%rax, %rcx
	movq	(%rcx), %rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end93:
	.size	BZ2_bzerror, .Lfunc_end93-BZ2_bzerror
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_bsInitWrite                 # -- Begin function BZ2_bsInitWrite
	.p2align	4, 0x90
	.type	BZ2_bsInitWrite,@function
BZ2_bsInitWrite:                        # @BZ2_bsInitWrite
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	$0, 644(%rdi)
	movq	-8(%rbp), %rax
	movl	$0, 640(%rax)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end94:
	.size	BZ2_bsInitWrite, .Lfunc_end94-BZ2_bsInitWrite
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_compressBlock               # -- Begin function BZ2_compressBlock
	.p2align	4, 0x90
	.type	BZ2_compressBlock,@function
BZ2_compressBlock:                      # @BZ2_compressBlock
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movb	%sil, -9(%rbp)
	cmpl	$0, 108(%rdi)
	jle	.LBB95_6
# %bb.1:
	movq	-8(%rbp), %rax
	notl	648(%rax)
	movq	-8(%rbp), %rax
	roll	652(%rax)
	movq	-8(%rbp), %rax
	movl	648(%rax), %ecx
	xorl	%ecx, 652(%rax)
	movq	-8(%rbp), %rax
	cmpl	$2, 660(%rax)
	jl	.LBB95_3
# %bb.2:
	movq	-8(%rbp), %rax
	movl	$0, 116(%rax)
.LBB95_3:
	movq	-8(%rbp), %rax
	cmpl	$2, 656(%rax)
	jl	.LBB95_5
# %bb.4:
	movq	stderr(%rip), %rdi
	movq	-8(%rbp), %rax
	movl	660(%rax), %edx
	movl	648(%rax), %ecx
	movl	652(%rax), %r8d
	movl	108(%rax), %r9d
	movl	$.L.str.143, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB95_5:
	movq	-8(%rbp), %rdi
	callq	BZ2_blockSort
.LBB95_6:
	movq	-8(%rbp), %rax
	movslq	108(%rax), %rcx
	addq	32(%rax), %rcx
	movq	%rcx, 80(%rax)
	movq	-8(%rbp), %rax
	cmpl	$1, 660(%rax)
	jne	.LBB95_8
# %bb.7:
	movq	-8(%rbp), %rdi
	callq	BZ2_bsInitWrite
	movq	-8(%rbp), %rdi
	movl	$66, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	$90, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	$104, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	664(%rdi), %eax
	addl	$48, %eax
	movzbl	%al, %esi
	callq	bsPutUChar
.LBB95_8:
	movq	-8(%rbp), %rax
	cmpl	$0, 108(%rax)
	jle	.LBB95_10
# %bb.9:
	movq	-8(%rbp), %rdi
	movl	$49, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	$65, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	$89, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	$38, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	$83, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	$89, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	648(%rdi), %esi
	callq	bsPutUInt32
	movq	-8(%rbp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	movq	-8(%rbp), %rdi
	movl	48(%rdi), %edx
	movl	$24, %esi
	callq	bsW
	movq	-8(%rbp), %rdi
	callq	generateMTFValues
	movq	-8(%rbp), %rdi
	callq	sendMTFValues
.LBB95_10:
	cmpb	$0, -9(%rbp)
	je	.LBB95_14
# %bb.11:
	movq	-8(%rbp), %rdi
	movl	$23, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	$114, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	$69, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	$56, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	$80, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	$144, %esi
	callq	bsPutUChar
	movq	-8(%rbp), %rdi
	movl	652(%rdi), %esi
	callq	bsPutUInt32
	movq	-8(%rbp), %rax
	cmpl	$2, 656(%rax)
	jl	.LBB95_13
# %bb.12:
	movq	stderr(%rip), %rdi
	movq	-8(%rbp), %rax
	movl	652(%rax), %edx
	movl	$.L.str.1.144, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB95_13:
	movq	-8(%rbp), %rdi
	callq	bsFinishWrite
.LBB95_14:
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end95:
	.size	BZ2_compressBlock, .Lfunc_end95-BZ2_compressBlock
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function bsPutUChar
	.type	bsPutUChar,@function
bsPutUChar:                             # @bsPutUChar
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%esi, %edx
	movq	%rdi, -16(%rbp)
	movb	%dl, -1(%rbp)
	movl	$8, %esi
	callq	bsW
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end96:
	.size	bsPutUChar, .Lfunc_end96-bsPutUChar
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function bsPutUInt32
	.type	bsPutUInt32,@function
bsPutUInt32:                            # @bsPutUInt32
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -4(%rbp)
	movzbl	-1(%rbp), %edx
	movl	$8, %esi
	callq	bsW
	movq	-16(%rbp), %rdi
	movzbl	-2(%rbp), %edx
	movl	$8, %esi
	callq	bsW
	movq	-16(%rbp), %rdi
	movzbl	-3(%rbp), %edx
	movl	$8, %esi
	callq	bsW
	movq	-16(%rbp), %rdi
	movzbl	-4(%rbp), %edx
	movl	$8, %esi
	callq	bsW
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end97:
	.size	bsPutUInt32, .Lfunc_end97-bsPutUInt32
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function bsW
	.type	bsW,@function
bsW:                                    # @bsW
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	.p2align	4, 0x90
.LBB98_1:                               # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 644(%rax)
	jl	.LBB98_3
# %bb.2:                                #   in Loop: Header=BB98_1 Depth=1
	movq	-8(%rbp), %rax
	movzbl	643(%rax), %ecx
	movq	80(%rax), %rdx
	movslq	116(%rax), %rax
	movb	%cl, (%rdx,%rax)
	movq	-8(%rbp), %rax
	addl	$1, 116(%rax)
	movq	-8(%rbp), %rax
	shll	$8, 640(%rax)
	movq	-8(%rbp), %rax
	addl	$-8, 644(%rax)
	jmp	.LBB98_1
.LBB98_3:
	movl	-16(%rbp), %eax
	movq	-8(%rbp), %rdx
	movl	644(%rdx), %ecx
	addl	-12(%rbp), %ecx
	negb	%cl
                                        # kill: def $cl killed $cl killed $ecx
	shll	%cl, %eax
	orl	%eax, 640(%rdx)
	movl	-12(%rbp), %eax
	movq	-8(%rbp), %rcx
	addl	%eax, 644(%rcx)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end98:
	.size	bsW, .Lfunc_end98-bsW
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function generateMTFValues
	.type	generateMTFValues,@function
generateMTFValues:                      # @generateMTFValues
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$336, %rsp                      # imm = 0x150
	movq	%rdi, -32(%rbp)
	movq	56(%rdi), %rax
	movq	%rax, -80(%rbp)
	movq	64(%rdi), %rax
	movq	%rax, -72(%rbp)
	movq	72(%rdi), %rax
	movq	%rax, -56(%rbp)
	callq	makeMaps_e
	movq	-32(%rbp), %rax
	movl	124(%rax), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	movl	$0, -16(%rbp)
	.p2align	4, 0x90
.LBB99_1:                               # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jg	.LBB99_3
# %bb.2:                                #   in Loop: Header=BB99_1 Depth=1
	movq	-32(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	$0, 672(%rax,%rcx,4)
	addl	$1, -16(%rbp)
	jmp	.LBB99_1
.LBB99_3:
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -16(%rbp)
	.p2align	4, 0x90
.LBB99_4:                               # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	movq	-32(%rbp), %rcx
	cmpl	124(%rcx), %eax
	jge	.LBB99_6
# %bb.5:                                #   in Loop: Header=BB99_4 Depth=1
	movslq	-16(%rbp), %rax
	movb	%al, -336(%rbp,%rax)
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB99_4
.LBB99_6:
	movl	$0, -16(%rbp)
	leaq	-335(%rbp), %r8
	leaq	-336(%rbp), %r9
	jmp	.LBB99_7
	.p2align	4, 0x90
.LBB99_11:                              #   in Loop: Header=BB99_7 Depth=1
	addl	$1, -8(%rbp)
	addl	$1, -16(%rbp)
.LBB99_7:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_20 Depth 2
	movl	-16(%rbp), %edx
	movq	-32(%rbp), %rsi
	cmpl	108(%rsi), %edx
	jge	.LBB99_23
# %bb.8:                                #   in Loop: Header=BB99_7 Depth=1
	movq	-80(%rbp), %rdx
	movslq	-16(%rbp), %rsi
	movl	(%rdx,%rsi,4), %edx
	addl	$-1, %edx
	movl	%edx, -36(%rbp)
	jns	.LBB99_10
# %bb.9:                                #   in Loop: Header=BB99_7 Depth=1
	movq	-32(%rbp), %rdx
	movl	108(%rdx), %edx
	addl	%edx, -36(%rbp)
.LBB99_10:                              #   in Loop: Header=BB99_7 Depth=1
	movq	-32(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movslq	-36(%rbp), %rdi
	movzbl	(%rsi,%rdi), %esi
	movzbl	384(%rdx,%rsi), %edx
	movb	%dl, -18(%rbp)
	movzbl	-336(%rbp), %esi
	cmpl	%edx, %esi
	je	.LBB99_11
# %bb.12:                               #   in Loop: Header=BB99_7 Depth=1
	cmpl	$0, -8(%rbp)
	jle	.LBB99_19
# %bb.13:                               #   in Loop: Header=BB99_7 Depth=1
	addl	$-1, -8(%rbp)
	testb	$1, -8(%rbp)
	je	.LBB99_16
	.p2align	4, 0x90
.LBB99_15:                              #   in Loop: Header=BB99_7 Depth=1
	movq	-56(%rbp), %rdx
	movslq	-12(%rbp), %rsi
	movw	$1, (%rdx,%rsi,2)
	addl	$1, -12(%rbp)
	movq	-32(%rbp), %rdx
	addl	$1, 676(%rdx)
	cmpl	$1, -8(%rbp)
	jg	.LBB99_31
	jmp	.LBB99_18
	.p2align	4, 0x90
.LBB99_16:                              #   in Loop: Header=BB99_7 Depth=1
	movq	-56(%rbp), %rdx
	movslq	-12(%rbp), %rsi
	movw	$0, (%rdx,%rsi,2)
	addl	$1, -12(%rbp)
	movq	-32(%rbp), %rdx
	addl	$1, 672(%rdx)
	cmpl	$1, -8(%rbp)
	jle	.LBB99_18
.LBB99_31:                              #   in Loop: Header=BB99_7 Depth=1
	movl	-8(%rbp), %edx
	movl	%edx, %esi
	addl	$-2, %esi
	shrl	$31, %esi
	addl	%esi, %edx
	addl	$-2, %edx
	sarl	%edx
	movl	%edx, -8(%rbp)
	testb	$1, -8(%rbp)
	je	.LBB99_16
	jmp	.LBB99_15
	.p2align	4, 0x90
.LBB99_18:                              #   in Loop: Header=BB99_7 Depth=1
	movl	$0, -8(%rbp)
.LBB99_19:                              #   in Loop: Header=BB99_7 Depth=1
	movb	-336(%rbp), %dl
	movb	-335(%rbp), %al
	movb	%al, -1(%rbp)
	movb	%dl, -335(%rbp)
	movq	%r8, -64(%rbp)
	movb	-18(%rbp), %al
	movb	%al, -17(%rbp)
	.p2align	4, 0x90
.LBB99_20:                              #   Parent Loop BB99_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	-17(%rbp), %eax
	movzbl	-1(%rbp), %edx
	cmpl	%edx, %eax
	je	.LBB99_22
# %bb.21:                               #   in Loop: Header=BB99_20 Depth=2
	movq	-64(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -64(%rbp)
	movzbl	-1(%rbp), %edx
	movb	%dl, -41(%rbp)
	movzbl	1(%rax), %ecx
	movb	%cl, -1(%rbp)
	movb	%dl, 1(%rax)
	jmp	.LBB99_20
	.p2align	4, 0x90
.LBB99_22:                              #   in Loop: Header=BB99_7 Depth=1
	movb	-1(%rbp), %al
	movb	%al, -336(%rbp)
	movl	-64(%rbp), %eax
	subl	%r9d, %eax
	movl	%eax, -36(%rbp)
	addl	$1, %eax
	movq	-56(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movw	%ax, (%rcx,%rdx,2)
	addl	$1, -12(%rbp)
	movq	-32(%rbp), %rax
	movslq	-36(%rbp), %rcx
	addl	$1, 676(%rax,%rcx,4)
	addl	$1, -16(%rbp)
	jmp	.LBB99_7
.LBB99_23:
	cmpl	$0, -8(%rbp)
	jle	.LBB99_30
# %bb.24:
	addl	$-1, -8(%rbp)
	testb	$1, -8(%rbp)
	je	.LBB99_27
	.p2align	4, 0x90
.LBB99_26:
	movq	-56(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movw	$1, (%rax,%rcx,2)
	addl	$1, -12(%rbp)
	movq	-32(%rbp), %rax
	addl	$1, 676(%rax)
	cmpl	$1, -8(%rbp)
	jg	.LBB99_32
	jmp	.LBB99_29
	.p2align	4, 0x90
.LBB99_27:
	movq	-56(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movw	$0, (%rax,%rcx,2)
	addl	$1, -12(%rbp)
	movq	-32(%rbp), %rax
	addl	$1, 672(%rax)
	cmpl	$1, -8(%rbp)
	jle	.LBB99_29
.LBB99_32:
	movl	-8(%rbp), %eax
	movl	%eax, %ecx
	addl	$-2, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	addl	$-2, %eax
	sarl	%eax
	movl	%eax, -8(%rbp)
	testb	$1, -8(%rbp)
	je	.LBB99_27
	jmp	.LBB99_26
.LBB99_29:
	movl	$0, -8(%rbp)
.LBB99_30:
	movzwl	-40(%rbp), %eax
	movq	-56(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movw	%ax, (%rcx,%rdx,2)
	addl	$1, -12(%rbp)
	movq	-32(%rbp), %rax
	movslq	-40(%rbp), %rcx
	addl	$1, 672(%rax,%rcx,4)
	movl	-12(%rbp), %eax
	movq	-32(%rbp), %rcx
	movl	%eax, 668(%rcx)
	addq	$336, %rsp                      # imm = 0x150
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end99:
	.size	generateMTFValues, .Lfunc_end99-generateMTFValues
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function sendMTFValues
.LCPI100_0:
	.quad	0x4059000000000000              # double 100
	.text
	.p2align	4, 0x90
	.type	sendMTFValues,@function
sendMTFValues:                          # @sendMTFValues
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$224, %rsp
	movq	%rdi, -16(%rbp)
	movq	72(%rdi), %rax
	movq	%rax, -32(%rbp)
	cmpl	$3, 656(%rdi)
	jl	.LBB100_2
# %bb.1:
	movq	stderr(%rip), %rdi
	movq	-16(%rbp), %rax
	movl	668(%rax), %ecx
	movl	108(%rax), %edx
	movl	124(%rax), %r8d
	movl	$.L.str.2.145, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB100_2:
	movq	-16(%rbp), %rax
	movl	124(%rax), %eax
	addl	$2, %eax
	movl	%eax, -100(%rbp)
	movl	$0, -56(%rbp)
	jmp	.LBB100_3
	.p2align	4, 0x90
.LBB100_7:                              #   in Loop: Header=BB100_3 Depth=1
	addl	$1, -56(%rbp)
.LBB100_3:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB100_5 Depth 2
	cmpl	$5, -56(%rbp)
	jg	.LBB100_8
# %bb.4:                                #   in Loop: Header=BB100_3 Depth=1
	movl	$0, -84(%rbp)
	.p2align	4, 0x90
.LBB100_5:                              #   Parent Loop BB100_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-84(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jge	.LBB100_7
# %bb.6:                                #   in Loop: Header=BB100_5 Depth=2
	movslq	-56(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	addq	-16(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movb	$15, 37708(%rcx,%rax)
	addl	$1, -84(%rbp)
	jmp	.LBB100_5
.LBB100_8:
	movq	-16(%rbp), %rax
	cmpl	$0, 668(%rax)
	jg	.LBB100_10
# %bb.9:
	movl	$3001, %edi                     # imm = 0xBB9
	callq	BZ2_bz__AssertH__fail
.LBB100_10:
	movq	-16(%rbp), %rax
	cmpl	$199, 668(%rax)
	jg	.LBB100_12
# %bb.11:
	movl	$2, -76(%rbp)
	jmp	.LBB100_19
.LBB100_12:
	movq	-16(%rbp), %rax
	cmpl	$599, 668(%rax)                 # imm = 0x257
	jg	.LBB100_14
# %bb.13:
	movl	$3, -76(%rbp)
	jmp	.LBB100_19
.LBB100_14:
	movq	-16(%rbp), %rax
	cmpl	$1199, 668(%rax)                # imm = 0x4AF
	jg	.LBB100_16
# %bb.15:
	movl	$4, -76(%rbp)
	jmp	.LBB100_19
.LBB100_16:
	movq	-16(%rbp), %rax
	cmpl	$2399, 668(%rax)                # imm = 0x95F
	jg	.LBB100_18
# %bb.17:
	movl	$5, -76(%rbp)
	jmp	.LBB100_19
.LBB100_18:
	movl	$6, -76(%rbp)
.LBB100_19:
	movl	-76(%rbp), %eax
	movl	%eax, -96(%rbp)
	movq	-16(%rbp), %rax
	movl	668(%rax), %eax
	movl	%eax, -160(%rbp)
	movl	$0, -4(%rbp)
	jmp	.LBB100_20
	.p2align	4, 0x90
.LBB100_40:                             #   in Loop: Header=BB100_20 Depth=1
	addl	$-1, -96(%rbp)
	movl	-80(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movl	-116(%rbp), %eax
	subl	%eax, -160(%rbp)
.LBB100_20:                             # =>This Loop Header: Depth=1
                                        #     Child Loop BB100_22 Depth 2
                                        #     Child Loop BB100_35 Depth 2
	cmpl	$0, -96(%rbp)
	jle	.LBB100_41
# %bb.21:                               #   in Loop: Header=BB100_20 Depth=1
	movl	-160(%rbp), %eax
	cltd
	idivl	-96(%rbp)
	movl	%eax, -176(%rbp)
	movl	-4(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -80(%rbp)
	movl	$0, -116(%rbp)
	.p2align	4, 0x90
.LBB100_22:                             #   Parent Loop BB100_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-116(%rbp), %eax
	cmpl	-176(%rbp), %eax
	jge	.LBB100_23
# %bb.24:                               #   in Loop: Header=BB100_22 Depth=2
	movl	-100(%rbp), %eax
	addl	$-1, %eax
	cmpl	%eax, -80(%rbp)
	setl	%al
	testb	%al, %al
	jne	.LBB100_26
	jmp	.LBB100_27
	.p2align	4, 0x90
.LBB100_23:                             #   in Loop: Header=BB100_22 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	je	.LBB100_27
.LBB100_26:                             #   in Loop: Header=BB100_22 Depth=2
	movslq	-80(%rbp), %rax
	leal	1(%rax), %ecx
	movl	%ecx, -80(%rbp)
	movq	-16(%rbp), %rcx
	movl	676(%rcx,%rax,4), %eax
	addl	%eax, -116(%rbp)
	jmp	.LBB100_22
	.p2align	4, 0x90
.LBB100_27:                             #   in Loop: Header=BB100_20 Depth=1
	movl	-80(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jle	.LBB100_32
# %bb.28:                               #   in Loop: Header=BB100_20 Depth=1
	movl	-96(%rbp), %eax
	cmpl	-76(%rbp), %eax
	je	.LBB100_32
# %bb.29:                               #   in Loop: Header=BB100_20 Depth=1
	cmpl	$1, -96(%rbp)
	je	.LBB100_32
# %bb.30:                               #   in Loop: Header=BB100_20 Depth=1
	movl	-76(%rbp), %eax
	subl	-96(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	subl	%ecx, %eax
	cmpl	$1, %eax
	jne	.LBB100_32
# %bb.31:                               #   in Loop: Header=BB100_20 Depth=1
	movq	-16(%rbp), %rax
	movslq	-80(%rbp), %rcx
	movl	672(%rax,%rcx,4), %eax
	subl	%eax, -116(%rbp)
	leal	-1(%rcx), %eax
	movl	%eax, -80(%rbp)
	.p2align	4, 0x90
.LBB100_32:                             #   in Loop: Header=BB100_20 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$3, 656(%rax)
	jl	.LBB100_34
# %bb.33:                               #   in Loop: Header=BB100_20 Depth=1
	movq	stderr(%rip), %rdi
	movl	-96(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	-80(%rbp), %r8d
	movl	-116(%rbp), %r9d
	xorps	%xmm0, %xmm0
	cvtsi2ss	%r9d, %xmm0
	movq	-16(%rbp), %rax
	xorps	%xmm1, %xmm1
	cvtsi2ssl	668(%rax), %xmm1
	cvtss2sd	%xmm0, %xmm0
	mulsd	.LCPI100_0(%rip), %xmm0
	cvtss2sd	%xmm1, %xmm1
	divsd	%xmm1, %xmm0
	movl	$.L.str.3.146, %esi
	movb	$1, %al
	callq	fprintf
.LBB100_34:                             #   in Loop: Header=BB100_20 Depth=1
	movl	$0, -84(%rbp)
	jmp	.LBB100_35
	.p2align	4, 0x90
.LBB100_39:                             #   in Loop: Header=BB100_35 Depth=2
	movslq	-96(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	addq	-16(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movb	$15, 37450(%rcx,%rax)
	addl	$1, -84(%rbp)
.LBB100_35:                             #   Parent Loop BB100_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-84(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jge	.LBB100_40
# %bb.36:                               #   in Loop: Header=BB100_35 Depth=2
	movl	-84(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.LBB100_39
# %bb.37:                               #   in Loop: Header=BB100_35 Depth=2
	movl	-84(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jg	.LBB100_39
# %bb.38:                               #   in Loop: Header=BB100_35 Depth=2
	movslq	-96(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	addq	-16(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movb	$0, 37450(%rcx,%rax)
	addl	$1, -84(%rbp)
	jmp	.LBB100_35
.LBB100_41:
	movl	$0, -136(%rbp)
	jmp	.LBB100_42
	.p2align	4, 0x90
.LBB100_92:                             #   in Loop: Header=BB100_42 Depth=1
	addl	$1, -136(%rbp)
.LBB100_42:                             # =>This Loop Header: Depth=1
                                        #     Child Loop BB100_44 Depth 2
                                        #     Child Loop BB100_47 Depth 2
                                        #       Child Loop BB100_49 Depth 3
                                        #     Child Loop BB100_54 Depth 2
                                        #     Child Loop BB100_57 Depth 2
                                        #       Child Loop BB100_65 Depth 3
                                        #       Child Loop BB100_76 Depth 3
                                        #         Child Loop BB100_78 Depth 4
                                        #       Child Loop BB100_71 Depth 3
                                        #       Child Loop BB100_86 Depth 3
                                        #     Child Loop BB100_60 Depth 2
                                        #     Child Loop BB100_90 Depth 2
	cmpl	$3, -136(%rbp)
	jg	.LBB100_93
# %bb.43:                               #   in Loop: Header=BB100_42 Depth=1
	movl	$0, -56(%rbp)
	.p2align	4, 0x90
.LBB100_44:                             #   Parent Loop BB100_42 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-56(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB100_46
# %bb.45:                               #   in Loop: Header=BB100_44 Depth=2
	movslq	-56(%rbp), %rax
	movl	$0, -224(%rbp,%rax,4)
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	.LBB100_44
	.p2align	4, 0x90
.LBB100_46:                             #   in Loop: Header=BB100_42 Depth=1
	movl	$0, -56(%rbp)
	jmp	.LBB100_47
	.p2align	4, 0x90
.LBB100_51:                             #   in Loop: Header=BB100_47 Depth=2
	addl	$1, -56(%rbp)
.LBB100_47:                             #   Parent Loop BB100_42 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB100_49 Depth 3
	movl	-56(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB100_52
# %bb.48:                               #   in Loop: Header=BB100_47 Depth=2
	movl	$0, -84(%rbp)
	.p2align	4, 0x90
.LBB100_49:                             #   Parent Loop BB100_42 Depth=1
                                        #     Parent Loop BB100_47 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-84(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jge	.LBB100_51
# %bb.50:                               #   in Loop: Header=BB100_49 Depth=3
	movslq	-56(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movl	$0, 45448(%rax,%rcx,4)
	addl	$1, -84(%rbp)
	jmp	.LBB100_49
	.p2align	4, 0x90
.LBB100_52:                             #   in Loop: Header=BB100_42 Depth=1
	cmpl	$6, -76(%rbp)
	jne	.LBB100_56
# %bb.53:                               #   in Loop: Header=BB100_42 Depth=1
	movl	$0, -84(%rbp)
	.p2align	4, 0x90
.LBB100_54:                             #   Parent Loop BB100_42 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-84(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jge	.LBB100_56
# %bb.55:                               #   in Loop: Header=BB100_54 Depth=2
	movq	-16(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movzbl	37966(%rax,%rcx), %edx
	shll	$16, %edx
	movzbl	37708(%rax,%rcx), %esi
	orl	%edx, %esi
	shlq	$4, %rcx
	movl	%esi, 51640(%rax,%rcx)
	movq	-16(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movzbl	38482(%rax,%rcx), %edx
	shll	$16, %edx
	movzbl	38224(%rax,%rcx), %esi
	orl	%edx, %esi
	shlq	$4, %rcx
	movl	%esi, 51644(%rax,%rcx)
	movq	-16(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movzbl	38998(%rax,%rcx), %edx
	shll	$16, %edx
	movzbl	38740(%rax,%rcx), %esi
	orl	%edx, %esi
	shlq	$4, %rcx
	movl	%esi, 51648(%rax,%rcx)
	addl	$1, -84(%rbp)
	jmp	.LBB100_54
	.p2align	4, 0x90
.LBB100_56:                             #   in Loop: Header=BB100_42 Depth=1
	movl	$0, -104(%rbp)
	movl	$0, -164(%rbp)
	movl	$0, -4(%rbp)
	jmp	.LBB100_57
	.p2align	4, 0x90
.LBB100_83:                             #   in Loop: Header=BB100_57 Depth=2
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	2(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	4(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	6(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	8(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	10(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	12(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	14(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	16(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	18(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	20(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	22(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	24(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	26(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	28(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	30(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	32(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	34(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	36(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	38(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	40(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	42(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	44(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	46(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	48(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	50(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	52(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	54(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	56(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	58(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	60(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	62(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	64(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	66(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	68(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	70(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	72(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	74(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	76(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	78(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	80(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	82(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	84(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	86(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	88(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	90(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	92(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	94(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	96(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzwl	98(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
.LBB100_84:                             #   in Loop: Header=BB100_57 Depth=2
	movl	-80(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
.LBB100_57:                             #   Parent Loop BB100_42 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB100_65 Depth 3
                                        #       Child Loop BB100_76 Depth 3
                                        #         Child Loop BB100_78 Depth 4
                                        #       Child Loop BB100_71 Depth 3
                                        #       Child Loop BB100_86 Depth 3
	movl	-4(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	668(%rcx), %eax
	jge	.LBB100_58
# %bb.62:                               #   in Loop: Header=BB100_57 Depth=2
	movl	-4(%rbp), %eax
	addl	$49, %eax
	movl	%eax, -80(%rbp)
	movq	-16(%rbp), %rcx
	cmpl	668(%rcx), %eax
	jl	.LBB100_64
# %bb.63:                               #   in Loop: Header=BB100_57 Depth=2
	movq	-16(%rbp), %rax
	movl	668(%rax), %eax
	addl	$-1, %eax
	movl	%eax, -80(%rbp)
.LBB100_64:                             #   in Loop: Header=BB100_57 Depth=2
	movl	$0, -56(%rbp)
	.p2align	4, 0x90
.LBB100_65:                             #   Parent Loop BB100_42 Depth=1
                                        #     Parent Loop BB100_57 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-56(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB100_67
# %bb.66:                               #   in Loop: Header=BB100_65 Depth=3
	movslq	-56(%rbp), %rax
	movw	$0, -156(%rbp,%rax,2)
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	.LBB100_65
	.p2align	4, 0x90
.LBB100_67:                             #   in Loop: Header=BB100_57 Depth=2
	cmpl	$6, -76(%rbp)
	jne	.LBB100_75
# %bb.68:                               #   in Loop: Header=BB100_57 Depth=2
	movl	-80(%rbp), %eax
	subl	-4(%rbp), %eax
	cmpl	$49, %eax
	jne	.LBB100_75
# %bb.69:                               #   in Loop: Header=BB100_57 Depth=2
	movl	$0, -44(%rbp)
	movl	$0, -48(%rbp)
	movl	$0, -52(%rbp)
	movq	-32(%rbp), %r8
	movslq	-4(%rbp), %rdi
	movzwl	(%r8,%rdi,2), %eax
	movw	%ax, -20(%rbp)
	movq	-16(%rbp), %rsi
	shlq	$4, %rax
	movl	51640(%rsi,%rax), %edx
	movl	%edx, -52(%rbp)
	movl	51644(%rsi,%rax), %ecx
	movl	%ecx, -48(%rbp)
	movl	51648(%rsi,%rax), %eax
	movl	%eax, -44(%rbp)
	movzwl	2(%r8,%rdi,2), %edi
	movw	%di, -20(%rbp)
	shlq	$4, %rdi
	addl	51640(%rsi,%rdi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rsi
	addl	51644(%rsi,%rdi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rsi
	addl	51648(%rsi,%rdi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	4(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	6(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	8(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	10(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	12(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	14(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	16(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	18(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	20(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	22(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	24(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	26(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	28(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	30(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	32(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	34(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	36(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	38(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	40(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	42(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	44(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	46(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	48(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	50(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	52(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	54(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	56(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	58(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	60(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	62(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	64(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	66(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	68(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	70(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	72(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	74(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	76(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	78(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	80(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	82(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	84(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	86(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	88(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	90(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	92(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	94(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	96(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movq	-32(%rbp), %rsi
	movslq	-4(%rbp), %rdi
	movzwl	98(%rsi,%rdi,2), %esi
	movw	%si, -20(%rbp)
	movq	-16(%rbp), %rdi
	shlq	$4, %rsi
	addl	51640(%rdi,%rsi), %edx
	movl	%edx, -52(%rbp)
	movq	-16(%rbp), %rdi
	addl	51644(%rdi,%rsi), %ecx
	movl	%ecx, -48(%rbp)
	movq	-16(%rbp), %rdi
	addl	51648(%rdi,%rsi), %eax
	movl	%eax, -44(%rbp)
	movw	%dx, -156(%rbp)
	movzwl	-50(%rbp), %edx
	movw	%dx, -154(%rbp)
	movw	%cx, -152(%rbp)
	movzwl	-46(%rbp), %ecx
	movw	%cx, -150(%rbp)
	movw	%ax, -148(%rbp)
	movzwl	-42(%rbp), %eax
	movw	%ax, -146(%rbp)
.LBB100_70:                             #   in Loop: Header=BB100_57 Depth=2
	movl	$999999999, -140(%rbp)          # imm = 0x3B9AC9FF
	movl	$-1, -36(%rbp)
	movl	$0, -56(%rbp)
	jmp	.LBB100_71
	.p2align	4, 0x90
.LBB100_74:                             #   in Loop: Header=BB100_71 Depth=3
	addl	$1, -56(%rbp)
.LBB100_71:                             #   Parent Loop BB100_42 Depth=1
                                        #     Parent Loop BB100_57 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-56(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB100_81
# %bb.72:                               #   in Loop: Header=BB100_71 Depth=3
	movslq	-56(%rbp), %rax
	movzwl	-156(%rbp,%rax,2), %eax
	cmpl	-140(%rbp), %eax
	jge	.LBB100_74
# %bb.73:                               #   in Loop: Header=BB100_71 Depth=3
	movslq	-56(%rbp), %rax
	movzwl	-156(%rbp,%rax,2), %ecx
	movl	%ecx, -140(%rbp)
	movl	%eax, -36(%rbp)
	jmp	.LBB100_74
	.p2align	4, 0x90
.LBB100_81:                             #   in Loop: Header=BB100_57 Depth=2
	movl	-140(%rbp), %eax
	addl	%eax, -164(%rbp)
	movslq	-36(%rbp), %rax
	addl	$1, -224(%rbp,%rax,4)
	movb	-36(%rbp), %al
	movq	-16(%rbp), %rcx
	movslq	-104(%rbp), %rdx
	movb	%al, 1704(%rcx,%rdx)
	addl	$1, -104(%rbp)
	cmpl	$6, -76(%rbp)
	jne	.LBB100_85
# %bb.82:                               #   in Loop: Header=BB100_57 Depth=2
	movl	-80(%rbp), %eax
	subl	-4(%rbp), %eax
	cmpl	$49, %eax
	je	.LBB100_83
.LBB100_85:                             #   in Loop: Header=BB100_57 Depth=2
	movl	-4(%rbp), %eax
	movl	%eax, -40(%rbp)
	.p2align	4, 0x90
.LBB100_86:                             #   Parent Loop BB100_42 Depth=1
                                        #     Parent Loop BB100_57 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-40(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jg	.LBB100_84
# %bb.87:                               #   in Loop: Header=BB100_86 Depth=3
	movslq	-36(%rbp), %rax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	-40(%rbp), %rdx
	movzwl	(%rcx,%rdx,2), %ecx
	addl	$1, 45448(%rax,%rcx,4)
	addl	$1, -40(%rbp)
	jmp	.LBB100_86
	.p2align	4, 0x90
.LBB100_75:                             #   in Loop: Header=BB100_57 Depth=2
	movl	-4(%rbp), %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB100_76
	.p2align	4, 0x90
.LBB100_80:                             #   in Loop: Header=BB100_76 Depth=3
	addl	$1, -40(%rbp)
.LBB100_76:                             #   Parent Loop BB100_42 Depth=1
                                        #     Parent Loop BB100_57 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB100_78 Depth 4
	movl	-40(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jg	.LBB100_70
# %bb.77:                               #   in Loop: Header=BB100_76 Depth=3
	movq	-32(%rbp), %rax
	movslq	-40(%rbp), %rcx
	movzwl	(%rax,%rcx,2), %eax
	movw	%ax, -142(%rbp)
	movl	$0, -56(%rbp)
	.p2align	4, 0x90
.LBB100_78:                             #   Parent Loop BB100_42 Depth=1
                                        #     Parent Loop BB100_57 Depth=2
                                        #       Parent Loop BB100_76 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	-56(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB100_80
# %bb.79:                               #   in Loop: Header=BB100_78 Depth=4
	movslq	-56(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rcx
	addq	-16(%rbp), %rcx
	movzwl	-142(%rbp), %edx
	movzbl	37708(%rdx,%rcx), %ecx
	movzwl	-156(%rbp,%rax,2), %edx
	addl	%ecx, %edx
	movw	%dx, -156(%rbp,%rax,2)
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	.LBB100_78
	.p2align	4, 0x90
.LBB100_58:                             #   in Loop: Header=BB100_42 Depth=1
	movq	-16(%rbp), %rax
	cmpl	$2, 656(%rax)
	jle	.LBB100_89
# %bb.59:                               #   in Loop: Header=BB100_42 Depth=1
	movq	stderr(%rip), %rdi
	movl	-136(%rbp), %edx
	addl	$1, %edx
	movl	-164(%rbp), %eax
	leal	7(%rax), %ecx
	testl	%eax, %eax
	cmovnsl	%eax, %ecx
	sarl	$3, %ecx
	movl	$.L.str.4.147, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	$0, -56(%rbp)
	.p2align	4, 0x90
.LBB100_60:                             #   Parent Loop BB100_42 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-56(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB100_88
# %bb.61:                               #   in Loop: Header=BB100_60 Depth=2
	movq	stderr(%rip), %rdi
	movslq	-56(%rbp), %rax
	movl	-224(%rbp,%rax,4), %edx
	movl	$.L.str.5.148, %esi
	xorl	%eax, %eax
	callq	fprintf
	addl	$1, -56(%rbp)
	jmp	.LBB100_60
	.p2align	4, 0x90
.LBB100_88:                             #   in Loop: Header=BB100_42 Depth=1
	movq	stderr(%rip), %rdi
	movl	$.L.str.6.149, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB100_89:                             #   in Loop: Header=BB100_42 Depth=1
	movl	$0, -56(%rbp)
	.p2align	4, 0x90
.LBB100_90:                             #   Parent Loop BB100_42 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-56(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB100_92
# %bb.91:                               #   in Loop: Header=BB100_90 Depth=2
	movq	-16(%rbp), %rax
	movslq	-56(%rbp), %rcx
	movq	%rcx, %rdx
	shlq	$8, %rdx
	leaq	(%rdx,%rcx,2), %rdx
	leaq	(%rax,%rdx), %rdi
	addq	$37708, %rdi                    # imm = 0x934C
	movq	%rcx, %rdx
	shlq	$10, %rdx
	leaq	(%rdx,%rcx,8), %rcx
	leaq	(%rax,%rcx), %rsi
	addq	$45448, %rsi                    # imm = 0xB188
	movl	-100(%rbp), %edx
	movl	$17, %ecx
	callq	BZ2_hbMakeCodeLengths
	addl	$1, -56(%rbp)
	jmp	.LBB100_90
.LBB100_93:
	cmpl	$8, -76(%rbp)
	jl	.LBB100_95
# %bb.94:
	movl	$3002, %edi                     # imm = 0xBBA
	callq	BZ2_bz__AssertH__fail
.LBB100_95:
	cmpl	$32767, -104(%rbp)              # imm = 0x7FFF
	jg	.LBB100_97
# %bb.96:
	cmpl	$18003, -104(%rbp)              # imm = 0x4653
	jl	.LBB100_98
.LBB100_97:
	movl	$3003, %edi                     # imm = 0xBBB
	callq	BZ2_bz__AssertH__fail
.LBB100_98:
	movl	$0, -40(%rbp)
	.p2align	4, 0x90
.LBB100_99:                             # =>This Inner Loop Header: Depth=1
	movl	-40(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB100_101
# %bb.100:                              #   in Loop: Header=BB100_99 Depth=1
	movslq	-40(%rbp), %rax
	movb	%al, -170(%rbp,%rax)
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB100_99
.LBB100_101:
	movl	$0, -40(%rbp)
	leaq	-170(%rbp), %rsi
	jmp	.LBB100_102
	.p2align	4, 0x90
.LBB100_106:                            #   in Loop: Header=BB100_102 Depth=1
	movb	-85(%rbp), %al
	movb	%al, -170(%rbp)
	movb	-92(%rbp), %al
	movq	-16(%rbp), %rcx
	movslq	-40(%rbp), %rdx
	movb	%al, 19706(%rcx,%rdx)
	addl	$1, -40(%rbp)
.LBB100_102:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB100_104 Depth 2
	movl	-40(%rbp), %ecx
	cmpl	-104(%rbp), %ecx
	jge	.LBB100_107
# %bb.103:                              #   in Loop: Header=BB100_102 Depth=1
	movq	-16(%rbp), %rcx
	movslq	-40(%rbp), %rdx
	movb	1704(%rcx,%rdx), %cl
	movb	%cl, -109(%rbp)
	movl	$0, -92(%rbp)
	movb	-170(%rbp), %cl
	movb	%cl, -85(%rbp)
	.p2align	4, 0x90
.LBB100_104:                            #   Parent Loop BB100_102 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	-109(%rbp), %ecx
	movzbl	-85(%rbp), %edx
	cmpl	%edx, %ecx
	je	.LBB100_106
# %bb.105:                              #   in Loop: Header=BB100_104 Depth=2
	movslq	-92(%rbp), %rcx
	leal	1(%rcx), %edx
	movl	%edx, -92(%rbp)
	movzbl	-85(%rbp), %edx
	movb	%dl, -143(%rbp)
	movzbl	1(%rcx,%rsi), %eax
	movb	%al, -85(%rbp)
	movb	%dl, 1(%rcx,%rsi)
	jmp	.LBB100_104
.LBB100_107:
	movl	$0, -56(%rbp)
	jmp	.LBB100_108
	.p2align	4, 0x90
.LBB100_118:                            #   in Loop: Header=BB100_108 Depth=1
	cmpl	$0, -132(%rbp)
	jle	.LBB100_119
.LBB100_120:                            #   in Loop: Header=BB100_108 Depth=1
	movq	-16(%rbp), %rax
	movslq	-56(%rbp), %rcx
	movq	%rcx, %rdx
	shlq	$10, %rdx
	leaq	(%rdx,%rcx,8), %rdx
	leaq	(%rax,%rdx), %rdi
	addq	$39256, %rdi                    # imm = 0x9958
	movq	%rcx, %rdx
	shlq	$8, %rdx
	leaq	(%rdx,%rcx,2), %rcx
	leaq	(%rax,%rcx), %rsi
	addq	$37708, %rsi                    # imm = 0x934C
	movl	-132(%rbp), %edx
	movl	-128(%rbp), %ecx
	movl	-100(%rbp), %r8d
	callq	BZ2_hbAssignCodes
	addl	$1, -56(%rbp)
.LBB100_108:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB100_110 Depth 2
	movl	-56(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB100_121
# %bb.109:                              #   in Loop: Header=BB100_108 Depth=1
	movl	$32, -132(%rbp)
	movl	$0, -128(%rbp)
	movl	$0, -40(%rbp)
	jmp	.LBB100_110
	.p2align	4, 0x90
.LBB100_115:                            #   in Loop: Header=BB100_110 Depth=2
	addl	$1, -40(%rbp)
.LBB100_110:                            #   Parent Loop BB100_108 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-40(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jge	.LBB100_116
# %bb.111:                              #   in Loop: Header=BB100_110 Depth=2
	movslq	-56(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	addq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	cmpl	-128(%rbp), %eax
	jle	.LBB100_113
# %bb.112:                              #   in Loop: Header=BB100_110 Depth=2
	movslq	-56(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	addq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	movl	%eax, -128(%rbp)
.LBB100_113:                            #   in Loop: Header=BB100_110 Depth=2
	movslq	-56(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	addq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	cmpl	-132(%rbp), %eax
	jge	.LBB100_115
# %bb.114:                              #   in Loop: Header=BB100_110 Depth=2
	movslq	-56(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	addq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	movl	%eax, -132(%rbp)
	jmp	.LBB100_115
	.p2align	4, 0x90
.LBB100_116:                            #   in Loop: Header=BB100_108 Depth=1
	cmpl	$18, -128(%rbp)
	jl	.LBB100_118
# %bb.117:                              #   in Loop: Header=BB100_108 Depth=1
	movl	$3004, %edi                     # imm = 0xBBC
	callq	BZ2_bz__AssertH__fail
	jmp	.LBB100_118
	.p2align	4, 0x90
.LBB100_119:                            #   in Loop: Header=BB100_108 Depth=1
	movl	$3005, %edi                     # imm = 0xBBD
	callq	BZ2_bz__AssertH__fail
	jmp	.LBB100_120
.LBB100_121:
	movl	$0, -40(%rbp)
	jmp	.LBB100_122
	.p2align	4, 0x90
.LBB100_128:                            #   in Loop: Header=BB100_122 Depth=1
	addl	$1, -40(%rbp)
.LBB100_122:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB100_124 Depth 2
	cmpl	$15, -40(%rbp)
	jg	.LBB100_129
# %bb.123:                              #   in Loop: Header=BB100_122 Depth=1
	movslq	-40(%rbp), %rax
	movb	$0, -192(%rbp,%rax)
	movl	$0, -92(%rbp)
	jmp	.LBB100_124
	.p2align	4, 0x90
.LBB100_127:                            #   in Loop: Header=BB100_124 Depth=2
	addl	$1, -92(%rbp)
.LBB100_124:                            #   Parent Loop BB100_122 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$15, -92(%rbp)
	jg	.LBB100_128
# %bb.125:                              #   in Loop: Header=BB100_124 Depth=2
	movq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	shlq	$4, %rcx
	movslq	-92(%rbp), %rdx
	addq	%rcx, %rdx
	cmpb	$0, 128(%rax,%rdx)
	je	.LBB100_127
# %bb.126:                              #   in Loop: Header=BB100_124 Depth=2
	movslq	-40(%rbp), %rax
	movb	$1, -192(%rbp,%rax)
	jmp	.LBB100_127
.LBB100_129:
	movq	-16(%rbp), %rax
	movl	116(%rax), %eax
	movl	%eax, -108(%rbp)
	movl	$0, -40(%rbp)
	jmp	.LBB100_130
	.p2align	4, 0x90
.LBB100_132:                            #   in Loop: Header=BB100_130 Depth=1
	movq	-16(%rbp), %rdi
	movl	$1, %esi
	movl	$1, %edx
.LBB100_133:                            #   in Loop: Header=BB100_130 Depth=1
	callq	bsW
	addl	$1, -40(%rbp)
.LBB100_130:                            # =>This Inner Loop Header: Depth=1
	cmpl	$15, -40(%rbp)
	jg	.LBB100_135
# %bb.131:                              #   in Loop: Header=BB100_130 Depth=1
	movslq	-40(%rbp), %rax
	cmpb	$0, -192(%rbp,%rax)
	jne	.LBB100_132
# %bb.134:                              #   in Loop: Header=BB100_130 Depth=1
	movq	-16(%rbp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	jmp	.LBB100_133
.LBB100_135:
	movl	$0, -40(%rbp)
	jmp	.LBB100_136
	.p2align	4, 0x90
.LBB100_144:                            #   in Loop: Header=BB100_136 Depth=1
	addl	$1, -40(%rbp)
.LBB100_136:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB100_139 Depth 2
	cmpl	$15, -40(%rbp)
	jg	.LBB100_145
# %bb.137:                              #   in Loop: Header=BB100_136 Depth=1
	movslq	-40(%rbp), %rax
	cmpb	$0, -192(%rbp,%rax)
	je	.LBB100_144
# %bb.138:                              #   in Loop: Header=BB100_136 Depth=1
	movl	$0, -92(%rbp)
	jmp	.LBB100_139
	.p2align	4, 0x90
.LBB100_141:                            #   in Loop: Header=BB100_139 Depth=2
	movq	-16(%rbp), %rdi
	movl	$1, %esi
	movl	$1, %edx
.LBB100_142:                            #   in Loop: Header=BB100_139 Depth=2
	callq	bsW
	addl	$1, -92(%rbp)
.LBB100_139:                            #   Parent Loop BB100_136 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$15, -92(%rbp)
	jg	.LBB100_144
# %bb.140:                              #   in Loop: Header=BB100_139 Depth=2
	movq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	shlq	$4, %rcx
	movslq	-92(%rbp), %rdx
	addq	%rcx, %rdx
	cmpb	$0, 128(%rax,%rdx)
	jne	.LBB100_141
# %bb.143:                              #   in Loop: Header=BB100_139 Depth=2
	movq	-16(%rbp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	jmp	.LBB100_142
.LBB100_145:
	movq	-16(%rbp), %rax
	cmpl	$3, 656(%rax)
	jl	.LBB100_147
# %bb.146:
	movq	stderr(%rip), %rdi
	movq	-16(%rbp), %rax
	movl	116(%rax), %edx
	subl	-108(%rbp), %edx
	movl	$.L.str.7.150, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB100_147:
	movq	-16(%rbp), %rdi
	movl	116(%rdi), %eax
	movl	%eax, -108(%rbp)
	movl	-76(%rbp), %edx
	movl	$3, %esi
	callq	bsW
	movq	-16(%rbp), %rdi
	movl	-104(%rbp), %edx
	movl	$15, %esi
	callq	bsW
	movl	$0, -40(%rbp)
	jmp	.LBB100_148
	.p2align	4, 0x90
.LBB100_152:                            #   in Loop: Header=BB100_148 Depth=1
	movq	-16(%rbp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	addl	$1, -40(%rbp)
.LBB100_148:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB100_150 Depth 2
	movl	-40(%rbp), %eax
	cmpl	-104(%rbp), %eax
	jge	.LBB100_153
# %bb.149:                              #   in Loop: Header=BB100_148 Depth=1
	movl	$0, -92(%rbp)
	.p2align	4, 0x90
.LBB100_150:                            #   Parent Loop BB100_148 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	movzbl	19706(%rax,%rcx), %eax
	cmpl	%eax, -92(%rbp)
	jge	.LBB100_152
# %bb.151:                              #   in Loop: Header=BB100_150 Depth=2
	movq	-16(%rbp), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	bsW
	addl	$1, -92(%rbp)
	jmp	.LBB100_150
.LBB100_153:
	movq	-16(%rbp), %rax
	cmpl	$3, 656(%rax)
	jl	.LBB100_155
# %bb.154:
	movq	stderr(%rip), %rdi
	movq	-16(%rbp), %rax
	movl	116(%rax), %edx
	subl	-108(%rbp), %edx
	movl	$.L.str.8.151, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB100_155:
	movq	-16(%rbp), %rax
	movl	116(%rax), %eax
	movl	%eax, -108(%rbp)
	movl	$0, -56(%rbp)
	jmp	.LBB100_156
	.p2align	4, 0x90
.LBB100_164:                            #   in Loop: Header=BB100_156 Depth=1
	addl	$1, -56(%rbp)
.LBB100_156:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB100_158 Depth 2
                                        #       Child Loop BB100_159 Depth 3
                                        #       Child Loop BB100_161 Depth 3
	movl	-56(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	.LBB100_165
# %bb.157:                              #   in Loop: Header=BB100_156 Depth=1
	movq	-16(%rbp), %rdi
	movslq	-56(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	movzbl	37708(%rdi,%rax), %edx
	movl	%edx, -124(%rbp)
	movl	$5, %esi
	callq	bsW
	movl	$0, -40(%rbp)
	.p2align	4, 0x90
.LBB100_158:                            #   Parent Loop BB100_156 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB100_159 Depth 3
                                        #       Child Loop BB100_161 Depth 3
	movl	-40(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jge	.LBB100_164
	.p2align	4, 0x90
.LBB100_159:                            #   Parent Loop BB100_156 Depth=1
                                        #     Parent Loop BB100_158 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	-56(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	addq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	cmpl	%eax, -124(%rbp)
	jge	.LBB100_161
# %bb.160:                              #   in Loop: Header=BB100_159 Depth=3
	movq	-16(%rbp), %rdi
	movl	$2, %esi
	movl	$2, %edx
	callq	bsW
	addl	$1, -124(%rbp)
	jmp	.LBB100_159
	.p2align	4, 0x90
.LBB100_162:                            #   in Loop: Header=BB100_161 Depth=3
	movq	-16(%rbp), %rdi
	movl	$2, %esi
	movl	$3, %edx
	callq	bsW
	addl	$-1, -124(%rbp)
.LBB100_161:                            #   Parent Loop BB100_156 Depth=1
                                        #     Parent Loop BB100_158 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	-56(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	addq	-16(%rbp), %rax
	movslq	-40(%rbp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	cmpl	%eax, -124(%rbp)
	jg	.LBB100_162
# %bb.163:                              #   in Loop: Header=BB100_158 Depth=2
	movq	-16(%rbp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	addl	$1, -40(%rbp)
	jmp	.LBB100_158
.LBB100_165:
	movq	-16(%rbp), %rax
	cmpl	$3, 656(%rax)
	jl	.LBB100_167
# %bb.166:
	movq	stderr(%rip), %rdi
	movq	-16(%rbp), %rax
	movl	116(%rax), %edx
	subl	-108(%rbp), %edx
	movl	$.L.str.9.152, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB100_167:
	movq	-16(%rbp), %rax
	movl	116(%rax), %eax
	movl	%eax, -108(%rbp)
	movl	$0, -120(%rbp)
	movl	$0, -4(%rbp)
	jmp	.LBB100_168
	.p2align	4, 0x90
.LBB100_180:                            #   in Loop: Header=BB100_168 Depth=1
	movq	-16(%rbp), %rdi
	movslq	-120(%rbp), %rax
	movzbl	1704(%rdi,%rax), %ecx
	movq	%rcx, %rdx
	shlq	$8, %rdx
	leaq	(%rdx,%rcx,2), %rcx
	leaq	(%rdi,%rcx), %rdx
	addq	%rdi, %rcx
	addq	$37708, %rcx                    # imm = 0x934C
	movq	%rcx, -72(%rbp)
	movzbl	1704(%rdi,%rax), %eax
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	leaq	(%rdi,%rax), %rcx
	addq	%rdi, %rax
	addq	$39256, %rax                    # imm = 0x9958
	movq	%rax, -64(%rbp)
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rsi
	movzwl	(%rax,%rsi,2), %eax
	movw	%ax, -18(%rbp)
	movzbl	37708(%rax,%rdx), %esi
	movl	39256(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	2(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	4(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	6(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	8(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	10(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	12(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	14(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	16(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	18(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	20(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	22(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	24(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	26(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	28(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	30(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	32(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	34(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	36(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	38(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	40(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	42(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	44(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	46(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	48(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	50(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	52(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	54(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	56(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	58(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	60(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	62(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	64(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	66(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	68(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	70(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	72(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	74(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	76(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	78(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	80(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	82(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	84(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	86(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	88(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	90(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	92(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	94(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	96(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzwl	98(%rax,%rcx,2), %eax
	movw	%ax, -18(%rbp)
	movq	-16(%rbp), %rdi
	movq	-72(%rbp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	-64(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	callq	bsW
.LBB100_181:                            #   in Loop: Header=BB100_168 Depth=1
	movl	-80(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	addl	$1, -120(%rbp)
.LBB100_168:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB100_183 Depth 2
	movl	-4(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	668(%rcx), %eax
	jge	.LBB100_169
# %bb.174:                              #   in Loop: Header=BB100_168 Depth=1
	movl	-4(%rbp), %eax
	addl	$49, %eax
	movl	%eax, -80(%rbp)
	movq	-16(%rbp), %rcx
	cmpl	668(%rcx), %eax
	jl	.LBB100_176
# %bb.175:                              #   in Loop: Header=BB100_168 Depth=1
	movq	-16(%rbp), %rax
	movl	668(%rax), %eax
	addl	$-1, %eax
	movl	%eax, -80(%rbp)
.LBB100_176:                            #   in Loop: Header=BB100_168 Depth=1
	movq	-16(%rbp), %rax
	movslq	-120(%rbp), %rcx
	movzbl	1704(%rax,%rcx), %eax
	cmpl	-76(%rbp), %eax
	jl	.LBB100_178
# %bb.177:                              #   in Loop: Header=BB100_168 Depth=1
	movl	$3006, %edi                     # imm = 0xBBE
	callq	BZ2_bz__AssertH__fail
.LBB100_178:                            #   in Loop: Header=BB100_168 Depth=1
	cmpl	$6, -76(%rbp)
	jne	.LBB100_182
# %bb.179:                              #   in Loop: Header=BB100_168 Depth=1
	movl	-80(%rbp), %eax
	subl	-4(%rbp), %eax
	cmpl	$49, %eax
	je	.LBB100_180
.LBB100_182:                            #   in Loop: Header=BB100_168 Depth=1
	movl	-4(%rbp), %eax
	movl	%eax, -40(%rbp)
	.p2align	4, 0x90
.LBB100_183:                            #   Parent Loop BB100_168 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-40(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jg	.LBB100_181
# %bb.184:                              #   in Loop: Header=BB100_183 Depth=2
	movq	-16(%rbp), %rdi
	movslq	-120(%rbp), %rax
	movzbl	1704(%rdi,%rax), %eax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rcx
	addq	%rdi, %rcx
	movq	-32(%rbp), %rdx
	movslq	-40(%rbp), %rsi
	movzwl	(%rdx,%rsi,2), %edx
	movzbl	37708(%rdx,%rcx), %esi
	movq	%rax, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rax,8), %rax
	addq	%rdi, %rax
	movl	39256(%rax,%rdx,4), %edx
	callq	bsW
	addl	$1, -40(%rbp)
	jmp	.LBB100_183
.LBB100_169:
	movl	-120(%rbp), %eax
	cmpl	-104(%rbp), %eax
	je	.LBB100_171
# %bb.170:
	movl	$3007, %edi                     # imm = 0xBBF
	callq	BZ2_bz__AssertH__fail
.LBB100_171:
	movq	-16(%rbp), %rax
	cmpl	$3, 656(%rax)
	jl	.LBB100_173
# %bb.172:
	movq	stderr(%rip), %rdi
	movq	-16(%rbp), %rax
	movl	116(%rax), %edx
	subl	-108(%rbp), %edx
	movl	$.L.str.10.153, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB100_173:
	addq	$224, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end100:
	.size	sendMTFValues, .Lfunc_end100-sendMTFValues
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function bsFinishWrite
	.type	bsFinishWrite,@function
bsFinishWrite:                          # @bsFinishWrite
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	.p2align	4, 0x90
.LBB101_1:                              # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$0, 644(%rax)
	jle	.LBB101_3
# %bb.2:                                #   in Loop: Header=BB101_1 Depth=1
	movq	-8(%rbp), %rax
	movzbl	643(%rax), %ecx
	movq	80(%rax), %rdx
	movslq	116(%rax), %rax
	movb	%cl, (%rdx,%rax)
	movq	-8(%rbp), %rax
	addl	$1, 116(%rax)
	movq	-8(%rbp), %rax
	shll	$8, 640(%rax)
	movq	-8(%rbp), %rax
	addl	$-8, 644(%rax)
	jmp	.LBB101_1
.LBB101_3:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end101:
	.size	bsFinishWrite, .Lfunc_end101-bsFinishWrite
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function makeMaps_e
	.type	makeMaps_e,@function
makeMaps_e:                             # @makeMaps_e
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movl	$0, 124(%rdi)
	movl	$0, -4(%rbp)
	jmp	.LBB102_1
	.p2align	4, 0x90
.LBB102_4:                              #   in Loop: Header=BB102_1 Depth=1
	addl	$1, -4(%rbp)
.LBB102_1:                              # =>This Inner Loop Header: Depth=1
	cmpl	$255, -4(%rbp)
	jg	.LBB102_5
# %bb.2:                                #   in Loop: Header=BB102_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-4(%rbp), %rcx
	cmpb	$0, 128(%rax,%rcx)
	je	.LBB102_4
# %bb.3:                                #   in Loop: Header=BB102_1 Depth=1
	movq	-16(%rbp), %rax
	movzbl	124(%rax), %ecx
	movslq	-4(%rbp), %rdx
	movb	%cl, 384(%rax,%rdx)
	movq	-16(%rbp), %rax
	addl	$1, 124(%rax)
	jmp	.LBB102_4
.LBB102_5:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end102:
	.size	makeMaps_e, .Lfunc_end102-makeMaps_e
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_decompress                  # -- Begin function BZ2_decompress
	.p2align	4, 0x90
	.type	BZ2_decompress,@function
BZ2_decompress:                         # @BZ2_decompress
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$384, %rsp                      # imm = 0x180
	movq	%rdi, -8(%rbp)
	movq	(%rdi), %rax
	movq	%rax, -200(%rbp)
	cmpl	$10, 8(%rdi)
	jne	.LBB103_2
# %bb.1:
	movq	-8(%rbp), %rax
	movl	$0, 64036(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64040(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64044(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64048(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64052(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64056(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64060(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64064(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64068(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64072(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64076(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64080(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64084(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64088(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64092(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64096(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64100(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64104(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64108(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64112(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 64116(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 64120(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 64128(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 64136(%rax)
.LBB103_2:
	movq	-8(%rbp), %rax
	movl	64036(%rax), %ecx
	movl	%ecx, -20(%rbp)
	movl	64040(%rax), %ecx
	movl	%ecx, -40(%rbp)
	movl	64044(%rax), %ecx
	movl	%ecx, -44(%rbp)
	movl	64048(%rax), %ecx
	movl	%ecx, -112(%rbp)
	movl	64052(%rax), %ecx
	movl	%ecx, -84(%rbp)
	movl	64056(%rax), %ecx
	movl	%ecx, -80(%rbp)
	movl	64060(%rax), %ecx
	movl	%ecx, -176(%rbp)
	movl	64064(%rax), %ecx
	movl	%ecx, -56(%rbp)
	movl	64068(%rax), %eax
	movl	%eax, -52(%rbp)
	movq	-8(%rbp), %rax
	movl	64072(%rax), %eax
	movl	%eax, -48(%rbp)
	movq	-8(%rbp), %rax
	movl	64076(%rax), %eax
	movl	%eax, -108(%rbp)
	movq	-8(%rbp), %rax
	movl	64080(%rax), %eax
	movl	%eax, -36(%rbp)
	movq	-8(%rbp), %rax
	movl	64084(%rax), %eax
	movl	%eax, -60(%rbp)
	movq	-8(%rbp), %rax
	movl	64088(%rax), %eax
	movl	%eax, -104(%rbp)
	movq	-8(%rbp), %rax
	movl	64092(%rax), %eax
	movl	%eax, -76(%rbp)
	movq	-8(%rbp), %rax
	movl	64096(%rax), %eax
	movl	%eax, -372(%rbp)
	movq	-8(%rbp), %rax
	movl	64100(%rax), %eax
	movl	%eax, -28(%rbp)
	movq	-8(%rbp), %rax
	movl	64104(%rax), %eax
	movl	%eax, -32(%rbp)
	movq	-8(%rbp), %rax
	movl	64108(%rax), %eax
	movl	%eax, -128(%rbp)
	movq	-8(%rbp), %rax
	movl	64112(%rax), %eax
	movl	%eax, -124(%rbp)
	movq	-8(%rbp), %rax
	movl	64116(%rax), %eax
	movl	%eax, -72(%rbp)
	movq	-8(%rbp), %rax
	movq	64120(%rax), %rax
	movq	%rax, -152(%rbp)
	movq	-8(%rbp), %rax
	movq	64128(%rax), %rax
	movq	%rax, -96(%rbp)
	movq	-8(%rbp), %rax
	movq	64136(%rax), %rax
	movq	%rax, -144(%rbp)
	movl	$0, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	addl	$-10, %eax
	cmpl	$40, %eax
	ja	.LBB103_9
# %bb.3:
	jmpq	*.LJTI103_0(,%rax,8)
.LBB103_4:
	movq	-8(%rbp), %rax
	movl	$10, 8(%rax)
	.p2align	4, 0x90
.LBB103_5:                              # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_10
# %bb.6:                                #   in Loop: Header=BB103_5 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.7:                                #   in Loop: Header=BB103_5 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_5
# %bb.8:                                #   in Loop: Header=BB103_5 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_5
.LBB103_9:
	movl	$4001, %edi                     # imm = 0xFA1
	callq	BZ2_bz__AssertH__fail
	movl	$4002, %edi                     # imm = 0xFA2
	callq	BZ2_bz__AssertH__fail
	jmp	.LBB103_389
.LBB103_10:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -368(%rbp)
	addl	$-8, 36(%rax)
	movb	-368(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$66, %al
	jne	.LBB103_11
.LBB103_12:
	movq	-8(%rbp), %rax
	movl	$11, 8(%rax)
	.p2align	4, 0x90
.LBB103_13:                             # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_17
# %bb.14:                               #   in Loop: Header=BB103_13 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.15:                               #   in Loop: Header=BB103_13 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_13
# %bb.16:                               #   in Loop: Header=BB103_13 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_13
.LBB103_17:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -364(%rbp)
	addl	$-8, 36(%rax)
	movb	-364(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$90, %al
	jne	.LBB103_11
.LBB103_18:
	movq	-8(%rbp), %rax
	movl	$12, 8(%rax)
	.p2align	4, 0x90
.LBB103_19:                             # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_23
# %bb.20:                               #   in Loop: Header=BB103_19 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.21:                               #   in Loop: Header=BB103_19 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_19
# %bb.22:                               #   in Loop: Header=BB103_19 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_19
.LBB103_23:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -360(%rbp)
	addl	$-8, 36(%rax)
	movb	-360(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$104, %al
	jne	.LBB103_11
.LBB103_24:
	movq	-8(%rbp), %rax
	movl	$13, 8(%rax)
	.p2align	4, 0x90
.LBB103_25:                             # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_29
# %bb.26:                               #   in Loop: Header=BB103_25 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.27:                               #   in Loop: Header=BB103_25 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_25
# %bb.28:                               #   in Loop: Header=BB103_25 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_25
.LBB103_29:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -356(%rbp)
	addl	$-8, 36(%rax)
	movl	-356(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 40(%rcx)
	movq	-8(%rbp), %rax
	cmpl	$49, 40(%rax)
	jl	.LBB103_11
# %bb.30:
	movq	-8(%rbp), %rax
	cmpl	$58, 40(%rax)
	jl	.LBB103_31
.LBB103_11:
	movl	$-5, -16(%rbp)
	jmp	.LBB103_389
.LBB103_31:
	movq	-8(%rbp), %rax
	addl	$-48, 40(%rax)
	movq	-8(%rbp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB103_35
# %bb.32:
	movq	-200(%rbp), %rax
	movq	72(%rax), %rdi
	movq	-8(%rbp), %rcx
	imull	$200000, 40(%rcx), %esi         # imm = 0x30D40
	movl	$1, %edx
	callq	*56(%rax)
	movq	-8(%rbp), %rcx
	movq	%rax, 3160(%rcx)
	movq	-200(%rbp), %rax
	movq	72(%rax), %rdi
	movq	-8(%rbp), %rcx
	imull	$100000, 40(%rcx), %esi         # imm = 0x186A0
	sarl	%esi
	movl	$1, %edx
	callq	*56(%rax)
	movq	-8(%rbp), %rcx
	movq	%rax, 3168(%rcx)
	movq	-8(%rbp), %rax
	cmpq	$0, 3160(%rax)
	je	.LBB103_34
# %bb.33:
	movq	-8(%rbp), %rax
	cmpq	$0, 3168(%rax)
	je	.LBB103_34
.LBB103_36:
	movq	-8(%rbp), %rax
	movl	$14, 8(%rax)
	.p2align	4, 0x90
.LBB103_37:                             # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_41
# %bb.38:                               #   in Loop: Header=BB103_37 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.39:                               #   in Loop: Header=BB103_37 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_37
# %bb.40:                               #   in Loop: Header=BB103_37 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_37
.LBB103_41:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -352(%rbp)
	addl	$-8, 36(%rax)
	movb	-352(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$23, %al
	jne	.LBB103_97
.LBB103_42:
	movq	-8(%rbp), %rax
	movl	$42, 8(%rax)
	.p2align	4, 0x90
.LBB103_43:                             # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_47
# %bb.44:                               #   in Loop: Header=BB103_43 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.45:                               #   in Loop: Header=BB103_43 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_43
# %bb.46:                               #   in Loop: Header=BB103_43 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_43
.LBB103_47:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -236(%rbp)
	addl	$-8, 36(%rax)
	movb	-236(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$114, %al
	jne	.LBB103_98
.LBB103_48:
	movq	-8(%rbp), %rax
	movl	$43, 8(%rax)
	.p2align	4, 0x90
.LBB103_49:                             # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_53
# %bb.50:                               #   in Loop: Header=BB103_49 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.51:                               #   in Loop: Header=BB103_49 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_49
# %bb.52:                               #   in Loop: Header=BB103_49 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_49
.LBB103_53:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -232(%rbp)
	addl	$-8, 36(%rax)
	movb	-232(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$69, %al
	jne	.LBB103_98
.LBB103_54:
	movq	-8(%rbp), %rax
	movl	$44, 8(%rax)
	.p2align	4, 0x90
.LBB103_55:                             # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_59
# %bb.56:                               #   in Loop: Header=BB103_55 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.57:                               #   in Loop: Header=BB103_55 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_55
# %bb.58:                               #   in Loop: Header=BB103_55 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_55
.LBB103_59:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -228(%rbp)
	addl	$-8, 36(%rax)
	movb	-228(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$56, %al
	jne	.LBB103_98
.LBB103_60:
	movq	-8(%rbp), %rax
	movl	$45, 8(%rax)
	.p2align	4, 0x90
.LBB103_61:                             # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_65
# %bb.62:                               #   in Loop: Header=BB103_61 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.63:                               #   in Loop: Header=BB103_61 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_61
# %bb.64:                               #   in Loop: Header=BB103_61 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_61
.LBB103_65:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -224(%rbp)
	addl	$-8, 36(%rax)
	movb	-224(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$80, %al
	jne	.LBB103_98
.LBB103_66:
	movq	-8(%rbp), %rax
	movl	$46, 8(%rax)
	.p2align	4, 0x90
.LBB103_67:                             # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_71
# %bb.68:                               #   in Loop: Header=BB103_67 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.69:                               #   in Loop: Header=BB103_67 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_67
# %bb.70:                               #   in Loop: Header=BB103_67 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_67
.LBB103_71:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -220(%rbp)
	addl	$-8, 36(%rax)
	movb	-220(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$-112, %al
	jne	.LBB103_98
# %bb.72:
	movq	-8(%rbp), %rax
	movl	$0, 3180(%rax)
.LBB103_73:
	movq	-8(%rbp), %rax
	movl	$47, 8(%rax)
	.p2align	4, 0x90
.LBB103_74:                             # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_78
# %bb.75:                               #   in Loop: Header=BB103_74 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.76:                               #   in Loop: Header=BB103_74 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_74
# %bb.77:                               #   in Loop: Header=BB103_74 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_74
.LBB103_78:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -216(%rbp)
	addl	$-8, 36(%rax)
	movzbl	-216(%rbp), %eax
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rcx
	movl	3180(%rcx), %edx
	shll	$8, %edx
	orl	%eax, %edx
	movl	%edx, 3180(%rcx)
.LBB103_79:
	movq	-8(%rbp), %rax
	movl	$48, 8(%rax)
	.p2align	4, 0x90
.LBB103_80:                             # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_84
# %bb.81:                               #   in Loop: Header=BB103_80 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.82:                               #   in Loop: Header=BB103_80 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_80
# %bb.83:                               #   in Loop: Header=BB103_80 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_80
.LBB103_84:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -212(%rbp)
	addl	$-8, 36(%rax)
	movzbl	-212(%rbp), %eax
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rcx
	movl	3180(%rcx), %edx
	shll	$8, %edx
	orl	%eax, %edx
	movl	%edx, 3180(%rcx)
.LBB103_85:
	movq	-8(%rbp), %rax
	movl	$49, 8(%rax)
	.p2align	4, 0x90
.LBB103_86:                             # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_90
# %bb.87:                               #   in Loop: Header=BB103_86 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.88:                               #   in Loop: Header=BB103_86 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_86
# %bb.89:                               #   in Loop: Header=BB103_86 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_86
.LBB103_90:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -208(%rbp)
	addl	$-8, 36(%rax)
	movzbl	-208(%rbp), %eax
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rcx
	movl	3180(%rcx), %edx
	shll	$8, %edx
	orl	%eax, %edx
	movl	%edx, 3180(%rcx)
.LBB103_91:
	movq	-8(%rbp), %rax
	movl	$50, 8(%rax)
	.p2align	4, 0x90
.LBB103_92:                             # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_96
# %bb.93:                               #   in Loop: Header=BB103_92 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.94:                               #   in Loop: Header=BB103_92 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_92
# %bb.95:                               #   in Loop: Header=BB103_92 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_92
.LBB103_96:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -204(%rbp)
	addl	$-8, 36(%rax)
	movzbl	-204(%rbp), %eax
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rcx
	movl	3180(%rcx), %edx
	shll	$8, %edx
	orl	%eax, %edx
	movl	%edx, 3180(%rcx)
	movq	-8(%rbp), %rax
	movl	$1, 8(%rax)
	movl	$4, -16(%rbp)
	jmp	.LBB103_389
.LBB103_97:
	cmpb	$49, -9(%rbp)
	jne	.LBB103_98
.LBB103_99:
	movq	-8(%rbp), %rax
	movl	$15, 8(%rax)
	.p2align	4, 0x90
.LBB103_100:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_104
# %bb.101:                              #   in Loop: Header=BB103_100 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.102:                              #   in Loop: Header=BB103_100 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_100
# %bb.103:                              #   in Loop: Header=BB103_100 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_100
.LBB103_104:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -348(%rbp)
	addl	$-8, 36(%rax)
	movb	-348(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$65, %al
	jne	.LBB103_98
.LBB103_105:
	movq	-8(%rbp), %rax
	movl	$16, 8(%rax)
	.p2align	4, 0x90
.LBB103_106:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_110
# %bb.107:                              #   in Loop: Header=BB103_106 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.108:                              #   in Loop: Header=BB103_106 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_106
# %bb.109:                              #   in Loop: Header=BB103_106 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_106
.LBB103_110:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -344(%rbp)
	addl	$-8, 36(%rax)
	movb	-344(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$89, %al
	jne	.LBB103_98
.LBB103_111:
	movq	-8(%rbp), %rax
	movl	$17, 8(%rax)
	.p2align	4, 0x90
.LBB103_112:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_116
# %bb.113:                              #   in Loop: Header=BB103_112 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.114:                              #   in Loop: Header=BB103_112 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_112
# %bb.115:                              #   in Loop: Header=BB103_112 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_112
.LBB103_116:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -340(%rbp)
	addl	$-8, 36(%rax)
	movb	-340(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$38, %al
	jne	.LBB103_98
.LBB103_117:
	movq	-8(%rbp), %rax
	movl	$18, 8(%rax)
	.p2align	4, 0x90
.LBB103_118:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_122
# %bb.119:                              #   in Loop: Header=BB103_118 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.120:                              #   in Loop: Header=BB103_118 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_118
# %bb.121:                              #   in Loop: Header=BB103_118 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_118
.LBB103_122:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -336(%rbp)
	addl	$-8, 36(%rax)
	movb	-336(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$83, %al
	jne	.LBB103_98
.LBB103_123:
	movq	-8(%rbp), %rax
	movl	$19, 8(%rax)
	.p2align	4, 0x90
.LBB103_124:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_128
# %bb.125:                              #   in Loop: Header=BB103_124 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.126:                              #   in Loop: Header=BB103_124 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_124
# %bb.127:                              #   in Loop: Header=BB103_124 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_124
.LBB103_128:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -332(%rbp)
	addl	$-8, 36(%rax)
	movb	-332(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$89, %al
	jne	.LBB103_98
# %bb.129:
	movq	-8(%rbp), %rax
	addl	$1, 48(%rax)
	movq	-8(%rbp), %rax
	cmpl	$2, 52(%rax)
	jl	.LBB103_131
# %bb.130:
	movq	stderr(%rip), %rdi
	movq	-8(%rbp), %rax
	movl	48(%rax), %edx
	movl	$.L.str.158, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB103_131:
	movq	-8(%rbp), %rax
	movl	$0, 3176(%rax)
.LBB103_132:
	movq	-8(%rbp), %rax
	movl	$20, 8(%rax)
	.p2align	4, 0x90
.LBB103_133:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_137
# %bb.134:                              #   in Loop: Header=BB103_133 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.135:                              #   in Loop: Header=BB103_133 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_133
# %bb.136:                              #   in Loop: Header=BB103_133 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_133
.LBB103_137:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -328(%rbp)
	addl	$-8, 36(%rax)
	movzbl	-328(%rbp), %eax
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rcx
	movl	3176(%rcx), %edx
	shll	$8, %edx
	orl	%eax, %edx
	movl	%edx, 3176(%rcx)
.LBB103_138:
	movq	-8(%rbp), %rax
	movl	$21, 8(%rax)
	.p2align	4, 0x90
.LBB103_139:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_143
# %bb.140:                              #   in Loop: Header=BB103_139 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.141:                              #   in Loop: Header=BB103_139 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_139
# %bb.142:                              #   in Loop: Header=BB103_139 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_139
.LBB103_143:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -324(%rbp)
	addl	$-8, 36(%rax)
	movzbl	-324(%rbp), %eax
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rcx
	movl	3176(%rcx), %edx
	shll	$8, %edx
	orl	%eax, %edx
	movl	%edx, 3176(%rcx)
.LBB103_144:
	movq	-8(%rbp), %rax
	movl	$22, 8(%rax)
	.p2align	4, 0x90
.LBB103_145:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_149
# %bb.146:                              #   in Loop: Header=BB103_145 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.147:                              #   in Loop: Header=BB103_145 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_145
# %bb.148:                              #   in Loop: Header=BB103_145 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_145
.LBB103_149:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -320(%rbp)
	addl	$-8, 36(%rax)
	movzbl	-320(%rbp), %eax
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rcx
	movl	3176(%rcx), %edx
	shll	$8, %edx
	orl	%eax, %edx
	movl	%edx, 3176(%rcx)
.LBB103_150:
	movq	-8(%rbp), %rax
	movl	$23, 8(%rax)
	.p2align	4, 0x90
.LBB103_151:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_155
# %bb.152:                              #   in Loop: Header=BB103_151 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.153:                              #   in Loop: Header=BB103_151 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_151
# %bb.154:                              #   in Loop: Header=BB103_151 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_151
.LBB103_155:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -316(%rbp)
	addl	$-8, 36(%rax)
	movzbl	-316(%rbp), %eax
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rcx
	movl	3176(%rcx), %edx
	shll	$8, %edx
	orl	%eax, %edx
	movl	%edx, 3176(%rcx)
.LBB103_156:
	movq	-8(%rbp), %rax
	movl	$24, 8(%rax)
	.p2align	4, 0x90
.LBB103_157:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB103_161
# %bb.158:                              #   in Loop: Header=BB103_157 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.159:                              #   in Loop: Header=BB103_157 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_157
# %bb.160:                              #   in Loop: Header=BB103_157 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_157
.LBB103_161:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-1, %cl
	shrl	%cl, %edx
	andl	$1, %edx
	movl	%edx, -312(%rbp)
	addl	$-1, 36(%rax)
	movb	-312(%rbp), %al
	movq	-8(%rbp), %rcx
	movb	%al, 20(%rcx)
	movq	-8(%rbp), %rax
	movl	$0, 56(%rax)
.LBB103_162:
	movq	-8(%rbp), %rax
	movl	$25, 8(%rax)
	.p2align	4, 0x90
.LBB103_163:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_167
# %bb.164:                              #   in Loop: Header=BB103_163 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.165:                              #   in Loop: Header=BB103_163 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_163
# %bb.166:                              #   in Loop: Header=BB103_163 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_163
.LBB103_167:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -308(%rbp)
	addl	$-8, 36(%rax)
	movzbl	-308(%rbp), %eax
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rcx
	movl	56(%rcx), %edx
	shll	$8, %edx
	orl	%eax, %edx
	movl	%edx, 56(%rcx)
.LBB103_168:
	movq	-8(%rbp), %rax
	movl	$26, 8(%rax)
	.p2align	4, 0x90
.LBB103_169:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_173
# %bb.170:                              #   in Loop: Header=BB103_169 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.171:                              #   in Loop: Header=BB103_169 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_169
# %bb.172:                              #   in Loop: Header=BB103_169 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_169
.LBB103_173:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -304(%rbp)
	addl	$-8, 36(%rax)
	movzbl	-304(%rbp), %eax
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rcx
	movl	56(%rcx), %edx
	shll	$8, %edx
	orl	%eax, %edx
	movl	%edx, 56(%rcx)
.LBB103_174:
	movq	-8(%rbp), %rax
	movl	$27, 8(%rax)
	.p2align	4, 0x90
.LBB103_175:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$8, 36(%rax)
	jge	.LBB103_179
# %bb.176:                              #   in Loop: Header=BB103_175 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.177:                              #   in Loop: Header=BB103_175 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_175
# %bb.178:                              #   in Loop: Header=BB103_175 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_175
.LBB103_179:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-8, %cl
	shrl	%cl, %edx
	movzbl	%dl, %ecx
	movl	%ecx, -300(%rbp)
	addl	$-8, 36(%rax)
	movzbl	-300(%rbp), %eax
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rcx
	movl	56(%rcx), %edx
	shll	$8, %edx
	orl	%eax, %edx
	movl	%edx, 56(%rcx)
	movq	-8(%rbp), %rax
	cmpl	$0, 56(%rax)
	js	.LBB103_98
# %bb.180:
	movq	-8(%rbp), %rax
	imull	$100000, 40(%rax), %ecx         # imm = 0x186A0
	orl	$10, %ecx
	cmpl	%ecx, 56(%rax)
	jg	.LBB103_98
# %bb.181:
	movl	$0, -20(%rbp)
	jmp	.LBB103_182
.LBB103_35:
	movq	-200(%rbp), %rax
	movq	72(%rax), %rdi
	movq	-8(%rbp), %rcx
	imull	$400000, 40(%rcx), %esi         # imm = 0x61A80
	movl	$1, %edx
	callq	*56(%rax)
	movq	-8(%rbp), %rcx
	movq	%rax, 3152(%rcx)
	movq	-8(%rbp), %rax
	cmpq	$0, 3152(%rax)
	jne	.LBB103_36
.LBB103_34:
	movl	$-3, -16(%rbp)
	jmp	.LBB103_389
.LBB103_98:
	movl	$-4, -16(%rbp)
	jmp	.LBB103_389
.LBB103_182:
	cmpl	$15, -20(%rbp)
	jg	.LBB103_191
.LBB103_183:
	movq	-8(%rbp), %rax
	movl	$28, 8(%rax)
	.p2align	4, 0x90
.LBB103_184:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB103_188
# %bb.185:                              #   in Loop: Header=BB103_184 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.186:                              #   in Loop: Header=BB103_184 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_184
# %bb.187:                              #   in Loop: Header=BB103_184 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_184
.LBB103_188:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-1, %cl
	shrl	%cl, %edx
	andl	$1, %edx
	movl	%edx, -296(%rbp)
	addl	$-1, 36(%rax)
	movb	-296(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$1, %al
	jne	.LBB103_190
# %bb.189:
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movb	$1, 3452(%rax,%rcx)
	addl	$1, -20(%rbp)
	jmp	.LBB103_182
.LBB103_190:
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movb	$0, 3452(%rax,%rcx)
	addl	$1, -20(%rbp)
	jmp	.LBB103_182
.LBB103_191:
	movl	$0, -20(%rbp)
	cmpl	$255, -20(%rbp)
	jg	.LBB103_193
.LBB103_192:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movb	$0, 3196(%rax,%rcx)
	addl	$1, -20(%rbp)
	cmpl	$255, -20(%rbp)
	jle	.LBB103_192
.LBB103_193:
	movl	$0, -20(%rbp)
.LBB103_194:
	cmpl	$15, -20(%rbp)
	jg	.LBB103_206
# %bb.195:
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	cmpb	$0, 3452(%rax,%rcx)
	je	.LBB103_205
# %bb.196:
	movl	$0, -40(%rbp)
	cmpl	$15, -40(%rbp)
	jg	.LBB103_205
.LBB103_197:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB103_198 Depth 2
	movq	-8(%rbp), %rax
	movl	$29, 8(%rax)
	.p2align	4, 0x90
.LBB103_198:                            #   Parent Loop BB103_197 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-8(%rbp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB103_202
# %bb.199:                              #   in Loop: Header=BB103_198 Depth=2
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.200:                              #   in Loop: Header=BB103_198 Depth=2
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_198
# %bb.201:                              #   in Loop: Header=BB103_198 Depth=2
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_198
.LBB103_202:                            #   in Loop: Header=BB103_197 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-1, %cl
	shrl	%cl, %edx
	andl	$1, %edx
	movl	%edx, -292(%rbp)
	addl	$-1, 36(%rax)
	movb	-292(%rbp), %al
	movb	%al, -9(%rbp)
	cmpb	$1, %al
	jne	.LBB103_204
# %bb.203:                              #   in Loop: Header=BB103_197 Depth=1
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	shlq	$4, %rcx
	movslq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movb	$1, 3196(%rax,%rdx)
.LBB103_204:                            #   in Loop: Header=BB103_197 Depth=1
	addl	$1, -40(%rbp)
	cmpl	$15, -40(%rbp)
	jle	.LBB103_197
.LBB103_205:
	addl	$1, -20(%rbp)
	jmp	.LBB103_194
.LBB103_206:
	movq	-8(%rbp), %rdi
	callq	makeMaps_d
	movq	-8(%rbp), %rax
	cmpl	$0, 3192(%rax)
	je	.LBB103_98
# %bb.207:
	movq	-8(%rbp), %rax
	movl	3192(%rax), %eax
	addl	$2, %eax
	movl	%eax, -112(%rbp)
.LBB103_208:
	movq	-8(%rbp), %rax
	movl	$30, 8(%rax)
	.p2align	4, 0x90
.LBB103_209:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$3, 36(%rax)
	jge	.LBB103_213
# %bb.210:                              #   in Loop: Header=BB103_209 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.211:                              #   in Loop: Header=BB103_209 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_209
# %bb.212:                              #   in Loop: Header=BB103_209 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_209
.LBB103_213:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-3, %cl
	shrl	%cl, %edx
	andl	$7, %edx
	movl	%edx, -288(%rbp)
	addl	$-3, 36(%rax)
	movl	-288(%rbp), %eax
	movl	%eax, -84(%rbp)
	cmpl	$2, %eax
	jl	.LBB103_98
# %bb.214:
	cmpl	$7, -84(%rbp)
	jge	.LBB103_98
.LBB103_215:
	movq	-8(%rbp), %rax
	movl	$31, 8(%rax)
	.p2align	4, 0x90
.LBB103_216:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$15, 36(%rax)
	jge	.LBB103_220
# %bb.217:                              #   in Loop: Header=BB103_216 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.218:                              #   in Loop: Header=BB103_216 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_216
# %bb.219:                              #   in Loop: Header=BB103_216 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_216
.LBB103_220:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-15, %cl
	shrl	%cl, %edx
	andl	$32767, %edx                    # imm = 0x7FFF
	movl	%edx, -284(%rbp)
	addl	$-15, 36(%rax)
	movl	-284(%rbp), %eax
	movl	%eax, -80(%rbp)
	testl	%eax, %eax
	jle	.LBB103_98
# %bb.221:
	movl	$0, -20(%rbp)
.LBB103_222:
	movl	-20(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jge	.LBB103_231
# %bb.223:
	movl	$0, -40(%rbp)
.LBB103_224:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB103_225 Depth 2
	movq	-8(%rbp), %rax
	movl	$32, 8(%rax)
	.p2align	4, 0x90
.LBB103_225:                            #   Parent Loop BB103_224 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-8(%rbp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB103_229
# %bb.226:                              #   in Loop: Header=BB103_225 Depth=2
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.227:                              #   in Loop: Header=BB103_225 Depth=2
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_225
# %bb.228:                              #   in Loop: Header=BB103_225 Depth=2
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_225
.LBB103_229:                            #   in Loop: Header=BB103_224 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-1, %cl
	shrl	%cl, %edx
	andl	$1, %edx
	movl	%edx, -280(%rbp)
	addl	$-1, 36(%rax)
	movb	-280(%rbp), %al
	movb	%al, -9(%rbp)
	testb	%al, %al
	je	.LBB103_240
# %bb.230:                              #   in Loop: Header=BB103_224 Depth=1
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	cmpl	-84(%rbp), %eax
	jl	.LBB103_224
	jmp	.LBB103_98
.LBB103_231:
	movb	$0, -21(%rbp)
.LBB103_232:                            # =>This Inner Loop Header: Depth=1
	movzbl	-21(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jge	.LBB103_234
# %bb.233:                              #   in Loop: Header=BB103_232 Depth=1
	movzbl	-21(%rbp), %eax
	movb	%al, -186(%rbp,%rax)
	addl	$1, %eax
	movb	%al, -21(%rbp)
	jmp	.LBB103_232
.LBB103_234:
	movl	$0, -20(%rbp)
	jmp	.LBB103_236
.LBB103_235:                            #   in Loop: Header=BB103_236 Depth=1
	movb	-85(%rbp), %al
	movb	%al, -186(%rbp)
	movq	-8(%rbp), %rcx
	movslq	-20(%rbp), %rdx
	movb	%al, 7884(%rcx,%rdx)
	addl	$1, -20(%rbp)
.LBB103_236:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB103_238 Depth 2
	movl	-20(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jge	.LBB103_241
# %bb.237:                              #   in Loop: Header=BB103_236 Depth=1
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movzbl	25886(%rax,%rcx), %eax
	movb	%al, -21(%rbp)
	movb	-186(%rbp,%rax), %al
	movb	%al, -85(%rbp)
	.p2align	4, 0x90
.LBB103_238:                            #   Parent Loop BB103_236 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	-21(%rbp), %eax
	testl	%eax, %eax
	jle	.LBB103_235
# %bb.239:                              #   in Loop: Header=BB103_238 Depth=2
	movzbl	-21(%rbp), %eax
	movzbl	-187(%rbp,%rax), %ecx
	movb	%cl, -186(%rbp,%rax)
	addl	$-1, %eax
	movb	%al, -21(%rbp)
	jmp	.LBB103_238
.LBB103_241:
	movl	$0, -44(%rbp)
	jmp	.LBB103_242
.LBB103_240:
	movb	-40(%rbp), %al
	movq	-8(%rbp), %rcx
	movslq	-20(%rbp), %rdx
	movb	%al, 25886(%rcx,%rdx)
	addl	$1, -20(%rbp)
	jmp	.LBB103_222
.LBB103_242:
	movl	-44(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jge	.LBB103_248
.LBB103_243:
	movq	-8(%rbp), %rax
	movl	$33, 8(%rax)
	.p2align	4, 0x90
.LBB103_244:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$5, 36(%rax)
	jge	.LBB103_274
# %bb.245:                              #   in Loop: Header=BB103_244 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.246:                              #   in Loop: Header=BB103_244 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_244
# %bb.247:                              #   in Loop: Header=BB103_244 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_244
.LBB103_274:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-5, %cl
	shrl	%cl, %edx
	andl	$31, %edx
	movl	%edx, -276(%rbp)
	addl	$-5, 36(%rax)
	movl	-276(%rbp), %eax
	movl	%eax, -76(%rbp)
	movl	$0, -20(%rbp)
	jmp	.LBB103_275
.LBB103_248:
	movl	$0, -44(%rbp)
	jmp	.LBB103_250
.LBB103_249:                            #   in Loop: Header=BB103_250 Depth=1
	movq	-8(%rbp), %r8
	movslq	-44(%rbp), %rax
	movq	%rax, %rdx
	shlq	$10, %rdx
	leaq	(%rdx,%rax,8), %rdx
	leaq	(%r8,%rdx), %rdi
	addq	$45436, %rdi                    # imm = 0xB17C
	leaq	(%r8,%rdx), %rsi
	addq	$51628, %rsi                    # imm = 0xC9AC
	addq	%r8, %rdx
	addq	$57820, %rdx                    # imm = 0xE1DC
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	leaq	(%r8,%rax), %rcx
	addq	$43888, %rcx                    # imm = 0xAB70
	movl	-132(%rbp), %r8d
	movl	-180(%rbp), %r9d
	movl	-112(%rbp), %eax
	movl	%eax, (%rsp)
	callq	BZ2_hbCreateDecodeTables
	movl	-132(%rbp), %eax
	movq	-8(%rbp), %rcx
	movslq	-44(%rbp), %rdx
	movl	%eax, 64012(%rcx,%rdx,4)
	addl	$1, -44(%rbp)
.LBB103_250:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB103_253 Depth 2
	movl	-44(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jge	.LBB103_258
# %bb.251:                              #   in Loop: Header=BB103_250 Depth=1
	movl	$32, -132(%rbp)
	movl	$0, -180(%rbp)
	movl	$0, -20(%rbp)
	jmp	.LBB103_253
	.p2align	4, 0x90
.LBB103_252:                            #   in Loop: Header=BB103_253 Depth=2
	addl	$1, -20(%rbp)
.LBB103_253:                            #   Parent Loop BB103_250 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-20(%rbp), %eax
	cmpl	-112(%rbp), %eax
	jge	.LBB103_249
# %bb.254:                              #   in Loop: Header=BB103_253 Depth=2
	movslq	-44(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	addq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movzbl	43888(%rcx,%rax), %eax
	cmpl	-180(%rbp), %eax
	jle	.LBB103_256
# %bb.255:                              #   in Loop: Header=BB103_253 Depth=2
	movslq	-44(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	addq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movzbl	43888(%rcx,%rax), %eax
	movl	%eax, -180(%rbp)
.LBB103_256:                            #   in Loop: Header=BB103_253 Depth=2
	movslq	-44(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	addq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movzbl	43888(%rcx,%rax), %eax
	cmpl	-132(%rbp), %eax
	jge	.LBB103_252
# %bb.257:                              #   in Loop: Header=BB103_253 Depth=2
	movslq	-44(%rbp), %rax
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	addq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movzbl	43888(%rcx,%rax), %eax
	movl	%eax, -132(%rbp)
	jmp	.LBB103_252
.LBB103_258:
	movq	-8(%rbp), %rax
	movl	3192(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, -176(%rbp)
	imull	$100000, 40(%rax), %eax         # imm = 0x186A0
	movl	%eax, -108(%rbp)
	movl	$-1, -56(%rbp)
	movl	$0, -52(%rbp)
	movl	$0, -20(%rbp)
	cmpl	$255, -20(%rbp)
	jg	.LBB103_260
.LBB103_259:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movl	$0, 68(%rax,%rcx,4)
	addl	$1, -20(%rbp)
	cmpl	$255, -20(%rbp)
	jle	.LBB103_259
.LBB103_260:
	movl	$4095, -168(%rbp)               # imm = 0xFFF
	movl	$15, -120(%rbp)
	cmpl	$0, -120(%rbp)
	js	.LBB103_265
.LBB103_263:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB103_264 Depth 2
	movl	$15, -172(%rbp)
	cmpl	$0, -172(%rbp)
	js	.LBB103_261
	.p2align	4, 0x90
.LBB103_264:                            #   Parent Loop BB103_263 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-120(%rbp), %eax
	shll	$4, %eax
	addl	-172(%rbp), %eax
	movq	-8(%rbp), %rcx
	movslq	-168(%rbp), %rdx
	movb	%al, 3724(%rcx,%rdx)
	addl	$-1, -168(%rbp)
	addl	$-1, -172(%rbp)
	cmpl	$0, -172(%rbp)
	jns	.LBB103_264
.LBB103_261:                            #   in Loop: Header=BB103_263 Depth=1
	movl	-168(%rbp), %eax
	addl	$1, %eax
	movq	-8(%rbp), %rcx
	movslq	-120(%rbp), %rdx
	movl	%eax, 7820(%rcx,%rdx,4)
	addl	$-1, -120(%rbp)
	cmpl	$0, -120(%rbp)
	jns	.LBB103_263
.LBB103_265:
	movl	$0, -36(%rbp)
	cmpl	$0, -52(%rbp)
	jne	.LBB103_268
# %bb.266:
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	cmpl	-80(%rbp), %eax
	jge	.LBB103_98
# %bb.267:
	movl	$50, -52(%rbp)
	movslq	-56(%rbp), %rax
	movq	-8(%rbp), %rcx
	movzbl	7884(%rcx,%rax), %eax
	movl	%eax, -124(%rbp)
	movl	64012(%rcx,%rax,4), %edx
	movl	%edx, -72(%rbp)
	movq	%rax, %rdx
	shlq	$10, %rdx
	leaq	(%rdx,%rax,8), %rax
	leaq	(%rcx,%rax), %rdx
	addq	$45436, %rdx                    # imm = 0xB17C
	movq	%rdx, -152(%rbp)
	leaq	(%rcx,%rax), %rdx
	addq	$57820, %rdx                    # imm = 0xE1DC
	movq	%rdx, -144(%rbp)
	addq	%rcx, %rax
	addq	$51628, %rax                    # imm = 0xC9AC
	movq	%rax, -96(%rbp)
.LBB103_268:
	addl	$-1, -52(%rbp)
	movl	-72(%rbp), %eax
	movl	%eax, -28(%rbp)
.LBB103_269:
	movq	-8(%rbp), %rax
	movl	$36, 8(%rax)
	.p2align	4, 0x90
.LBB103_270:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movl	36(%rax), %eax
	cmpl	-28(%rbp), %eax
	jge	.LBB103_294
# %bb.271:                              #   in Loop: Header=BB103_270 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.272:                              #   in Loop: Header=BB103_270 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_270
# %bb.273:                              #   in Loop: Header=BB103_270 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_270
.LBB103_294:
	movq	-8(%rbp), %rdx
	movl	32(%rdx), %esi
	movl	36(%rdx), %ecx
	movl	-28(%rbp), %eax
	subl	%eax, %ecx
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %esi
	movl	$1, %edi
	movl	%eax, %ecx
	shll	%cl, %edi
	addl	$-1, %edi
	andl	%esi, %edi
	movl	%edi, -264(%rbp)
	subl	%eax, 36(%rdx)
	movl	-264(%rbp), %eax
	movl	%eax, -32(%rbp)
	jmp	.LBB103_295
.LBB103_275:
	movl	-20(%rbp), %eax
	cmpl	-112(%rbp), %eax
	jl	.LBB103_278
# %bb.276:
	addl	$1, -44(%rbp)
	jmp	.LBB103_242
.LBB103_277:
	addl	$1, -76(%rbp)
.LBB103_278:
	cmpl	$0, -76(%rbp)
	jle	.LBB103_98
# %bb.279:
	cmpl	$21, -76(%rbp)
	jge	.LBB103_98
.LBB103_280:
	movq	-8(%rbp), %rax
	movl	$34, 8(%rax)
	.p2align	4, 0x90
.LBB103_281:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB103_285
# %bb.282:                              #   in Loop: Header=BB103_281 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.283:                              #   in Loop: Header=BB103_281 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_281
# %bb.284:                              #   in Loop: Header=BB103_281 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_281
.LBB103_285:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-1, %cl
	shrl	%cl, %edx
	andl	$1, %edx
	movl	%edx, -272(%rbp)
	addl	$-1, 36(%rax)
	movb	-272(%rbp), %al
	movb	%al, -9(%rbp)
	testb	%al, %al
	je	.LBB103_293
.LBB103_286:
	movq	-8(%rbp), %rax
	movl	$35, 8(%rax)
	jmp	.LBB103_290
	.p2align	4, 0x90
.LBB103_287:                            #   in Loop: Header=BB103_290 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.288:                              #   in Loop: Header=BB103_290 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_290
# %bb.289:                              #   in Loop: Header=BB103_290 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
.LBB103_290:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$0, 36(%rax)
	jle	.LBB103_287
# %bb.291:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-1, %cl
	shrl	%cl, %edx
	andl	$1, %edx
	movl	%edx, -268(%rbp)
	addl	$-1, 36(%rax)
	movb	-268(%rbp), %al
	movb	%al, -9(%rbp)
	testb	%al, %al
	je	.LBB103_277
# %bb.292:
	addl	$-1, -76(%rbp)
	jmp	.LBB103_278
.LBB103_293:
	movb	-76(%rbp), %al
	movslq	-44(%rbp), %rcx
	movq	%rcx, %rdx
	shlq	$8, %rdx
	leaq	(%rdx,%rcx,2), %rcx
	addq	-8(%rbp), %rcx
	movslq	-20(%rbp), %rdx
	movb	%al, 43888(%rdx,%rcx)
	addl	$1, -20(%rbp)
	jmp	.LBB103_275
.LBB103_295:
	cmpl	$21, -28(%rbp)
	jge	.LBB103_98
# %bb.296:
	movl	-32(%rbp), %eax
	movq	-152(%rbp), %rcx
	movslq	-28(%rbp), %rdx
	cmpl	(%rcx,%rdx,4), %eax
	jle	.LBB103_304
# %bb.297:
	addl	$1, -28(%rbp)
.LBB103_298:
	movq	-8(%rbp), %rax
	movl	$37, 8(%rax)
	.p2align	4, 0x90
.LBB103_299:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB103_303
# %bb.300:                              #   in Loop: Header=BB103_299 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.301:                              #   in Loop: Header=BB103_299 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_299
# %bb.302:                              #   in Loop: Header=BB103_299 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_299
.LBB103_303:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-1, %cl
	shrl	%cl, %edx
	andl	$1, %edx
	movl	%edx, -260(%rbp)
	addl	$-1, 36(%rax)
	movl	-260(%rbp), %eax
	movl	%eax, -128(%rbp)
	movl	-32(%rbp), %ecx
	addl	%ecx, %ecx
	orl	%eax, %ecx
	movl	%ecx, -32(%rbp)
	jmp	.LBB103_295
.LBB103_304:
	movl	-32(%rbp), %eax
	movq	-96(%rbp), %rcx
	movslq	-28(%rbp), %rdx
	cmpl	(%rcx,%rdx,4), %eax
	js	.LBB103_98
# %bb.305:
	movl	-32(%rbp), %eax
	movq	-96(%rbp), %rcx
	movslq	-28(%rbp), %rdx
	subl	(%rcx,%rdx,4), %eax
	cmpl	$258, %eax                      # imm = 0x102
	jge	.LBB103_98
# %bb.306:
	movq	-144(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movq	-96(%rbp), %rdx
	movslq	-28(%rbp), %rsi
	movslq	(%rdx,%rsi,4), %rdx
	subq	%rdx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -48(%rbp)
.LBB103_307:
	movl	-48(%rbp), %eax
	cmpl	-176(%rbp), %eax
	je	.LBB103_348
# %bb.308:
	cmpl	$0, -48(%rbp)
	je	.LBB103_310
# %bb.309:
	cmpl	$1, -48(%rbp)
	jne	.LBB103_314
.LBB103_310:
	movl	$-1, -60(%rbp)
	movl	$1, -104(%rbp)
	jmp	.LBB103_311
.LBB103_314:
	movl	-36(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.LBB103_98
# %bb.315:
	movl	-48(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -64(%rbp)
	cmpl	$15, %eax
	ja	.LBB103_321
# %bb.316:
	movq	-8(%rbp), %rax
	movl	7820(%rax), %ecx
	movl	%ecx, -68(%rbp)
	addl	-64(%rbp), %ecx
	movb	3724(%rax,%rcx), %al
	movb	%al, -9(%rbp)
	cmpl	$4, -64(%rbp)
	jb	.LBB103_319
.LBB103_317:                            # =>This Inner Loop Header: Depth=1
	movl	-68(%rbp), %eax
	addl	-64(%rbp), %eax
	movl	%eax, -156(%rbp)
	movq	-8(%rbp), %rcx
	cltq
	movzbl	3723(%rcx,%rax), %edx
	movb	%dl, 3724(%rcx,%rax)
	movq	-8(%rbp), %rax
	movslq	-156(%rbp), %rcx
	movzbl	3722(%rax,%rcx), %edx
	movb	%dl, 3723(%rax,%rcx)
	movq	-8(%rbp), %rax
	movslq	-156(%rbp), %rcx
	movzbl	3721(%rax,%rcx), %edx
	movb	%dl, 3722(%rax,%rcx)
	movq	-8(%rbp), %rax
	movslq	-156(%rbp), %rcx
	movzbl	3720(%rax,%rcx), %edx
	movb	%dl, 3721(%rax,%rcx)
	addl	$-4, -64(%rbp)
	cmpl	$4, -64(%rbp)
	jae	.LBB103_317
	jmp	.LBB103_319
.LBB103_318:                            #   in Loop: Header=BB103_319 Depth=1
	movq	-8(%rbp), %rax
	movl	-68(%rbp), %ecx
	movl	-64(%rbp), %edx
	leal	(%rcx,%rdx), %esi
	addl	%edx, %ecx
	addl	$-1, %ecx
	movzbl	3724(%rax,%rcx), %ecx
	movb	%cl, 3724(%rax,%rsi)
	addl	$-1, -64(%rbp)
.LBB103_319:                            # =>This Inner Loop Header: Depth=1
	cmpl	$0, -64(%rbp)
	jne	.LBB103_318
# %bb.320:
	movb	-9(%rbp), %al
	movq	-8(%rbp), %rcx
	movslq	-68(%rbp), %rdx
	movb	%al, 3724(%rcx,%rdx)
	jmp	.LBB103_327
.LBB103_321:
	movl	-64(%rbp), %eax
	movl	%eax, %ecx
	shrl	$4, %ecx
	movl	%ecx, -100(%rbp)
	andl	$15, %eax
	movl	%eax, -376(%rbp)
	movq	-8(%rbp), %rdx
	addl	7820(%rdx,%rcx,4), %eax
	movl	%eax, -68(%rbp)
	cltq
	movb	3724(%rdx,%rax), %al
	movb	%al, -9(%rbp)
.LBB103_322:                            # =>This Inner Loop Header: Depth=1
	movl	-68(%rbp), %eax
	movq	-8(%rbp), %rcx
	movslq	-100(%rbp), %rdx
	cmpl	7820(%rcx,%rdx,4), %eax
	jle	.LBB103_324
# %bb.323:                              #   in Loop: Header=BB103_322 Depth=1
	movq	-8(%rbp), %rax
	movslq	-68(%rbp), %rcx
	movzbl	3723(%rax,%rcx), %edx
	movb	%dl, 3724(%rax,%rcx)
	addl	$-1, -68(%rbp)
	jmp	.LBB103_322
.LBB103_324:
	movq	-8(%rbp), %rax
	movslq	-100(%rbp), %rcx
	addl	$1, 7820(%rax,%rcx,4)
	cmpl	$0, -100(%rbp)
	jle	.LBB103_326
.LBB103_325:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movslq	-100(%rbp), %rcx
	addl	$-1, 7820(%rax,%rcx,4)
	movq	-8(%rbp), %rax
	movslq	-100(%rbp), %rcx
	movslq	7816(%rax,%rcx,4), %rdx
	movzbl	3739(%rdx,%rax), %edx
	movslq	7820(%rax,%rcx,4), %rcx
	movb	%dl, 3724(%rax,%rcx)
	addl	$-1, -100(%rbp)
	cmpl	$0, -100(%rbp)
	jg	.LBB103_325
.LBB103_326:
	movq	-8(%rbp), %rax
	addl	$-1, 7820(%rax)
	movb	-9(%rbp), %al
	movq	-8(%rbp), %rcx
	movslq	7820(%rcx), %rdx
	movb	%al, 3724(%rcx,%rdx)
	movq	-8(%rbp), %rax
	cmpl	$0, 7820(%rax)
	je	.LBB103_343
.LBB103_327:
	movq	-8(%rbp), %rax
	movzbl	-9(%rbp), %ecx
	movzbl	3468(%rax,%rcx), %ecx
	addl	$1, 68(%rax,%rcx,4)
	movq	-8(%rbp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB103_329
# %bb.328:
	movq	-8(%rbp), %rax
	movzbl	-9(%rbp), %ecx
	movzbl	3468(%rax,%rcx), %ecx
	movq	3160(%rax), %rax
	movslq	-36(%rbp), %rdx
	movw	%cx, (%rax,%rdx,2)
	jmp	.LBB103_330
.LBB103_329:
	movq	-8(%rbp), %rax
	movzbl	-9(%rbp), %ecx
	movzbl	3468(%rax,%rcx), %ecx
	movq	3152(%rax), %rax
	movslq	-36(%rbp), %rdx
	movl	%ecx, (%rax,%rdx,4)
.LBB103_330:
	addl	$1, -36(%rbp)
	cmpl	$0, -52(%rbp)
	jne	.LBB103_333
# %bb.331:
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	cmpl	-80(%rbp), %eax
	jge	.LBB103_98
# %bb.332:
	movl	$50, -52(%rbp)
	movslq	-56(%rbp), %rax
	movq	-8(%rbp), %rcx
	movzbl	7884(%rcx,%rax), %eax
	movl	%eax, -124(%rbp)
	movl	64012(%rcx,%rax,4), %edx
	movl	%edx, -72(%rbp)
	movq	%rax, %rdx
	shlq	$10, %rdx
	leaq	(%rdx,%rax,8), %rax
	leaq	(%rcx,%rax), %rdx
	addq	$45436, %rdx                    # imm = 0xB17C
	movq	%rdx, -152(%rbp)
	leaq	(%rcx,%rax), %rdx
	addq	$57820, %rdx                    # imm = 0xE1DC
	movq	%rdx, -144(%rbp)
	addq	%rcx, %rax
	addq	$51628, %rax                    # imm = 0xC9AC
	movq	%rax, -96(%rbp)
.LBB103_333:
	addl	$-1, -52(%rbp)
	movl	-72(%rbp), %eax
	movl	%eax, -28(%rbp)
.LBB103_334:
	movq	-8(%rbp), %rax
	movl	$40, 8(%rax)
	jmp	.LBB103_338
	.p2align	4, 0x90
.LBB103_335:                            #   in Loop: Header=BB103_338 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.336:                              #   in Loop: Header=BB103_338 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_338
# %bb.337:                              #   in Loop: Header=BB103_338 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
.LBB103_338:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movl	36(%rax), %eax
	cmpl	-28(%rbp), %eax
	jl	.LBB103_335
# %bb.339:
	movq	-8(%rbp), %rdx
	movl	32(%rdx), %esi
	movl	36(%rdx), %ecx
	movl	-28(%rbp), %eax
	subl	%eax, %ecx
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %esi
	movl	$1, %edi
	movl	%eax, %ecx
	shll	%cl, %edi
	addl	$-1, %edi
	andl	%esi, %edi
	movl	%edi, -248(%rbp)
	subl	%eax, 36(%rdx)
	movl	-248(%rbp), %eax
	movl	%eax, -32(%rbp)
	jmp	.LBB103_340
.LBB103_343:
	movl	$4095, -160(%rbp)               # imm = 0xFFF
	movl	$15, -116(%rbp)
	cmpl	$0, -116(%rbp)
	js	.LBB103_327
.LBB103_346:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB103_347 Depth 2
	movl	$15, -164(%rbp)
	cmpl	$0, -164(%rbp)
	js	.LBB103_344
	.p2align	4, 0x90
.LBB103_347:                            #   Parent Loop BB103_346 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-8(%rbp), %rax
	movslq	-116(%rbp), %rcx
	movslq	7820(%rax,%rcx,4), %rcx
	movslq	-164(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	3724(%rax,%rdx), %ecx
	movslq	-160(%rbp), %rdx
	movb	%cl, 3724(%rax,%rdx)
	addl	$-1, -160(%rbp)
	addl	$-1, -164(%rbp)
	cmpl	$0, -164(%rbp)
	jns	.LBB103_347
.LBB103_344:                            #   in Loop: Header=BB103_346 Depth=1
	movl	-160(%rbp), %eax
	addl	$1, %eax
	movq	-8(%rbp), %rcx
	movslq	-116(%rbp), %rdx
	movl	%eax, 7820(%rcx,%rdx,4)
	addl	$-1, -116(%rbp)
	cmpl	$0, -116(%rbp)
	jns	.LBB103_346
	jmp	.LBB103_327
.LBB103_348:
	movq	-8(%rbp), %rax
	cmpl	$0, 56(%rax)
	js	.LBB103_98
# %bb.349:
	movq	-8(%rbp), %rax
	movl	56(%rax), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB103_98
# %bb.350:
	movq	-8(%rbp), %rax
	movl	$0, 1096(%rax)
	movl	$1, -20(%rbp)
	cmpl	$256, -20(%rbp)                 # imm = 0x100
	jg	.LBB103_352
.LBB103_351:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movl	64(%rax,%rcx,4), %edx
	movl	%edx, 1096(%rax,%rcx,4)
	addl	$1, -20(%rbp)
	cmpl	$256, -20(%rbp)                 # imm = 0x100
	jle	.LBB103_351
.LBB103_352:
	movl	$1, -20(%rbp)
	cmpl	$256, -20(%rbp)                 # imm = 0x100
	jg	.LBB103_354
.LBB103_353:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movl	1092(%rax,%rcx,4), %edx
	addl	%edx, 1096(%rax,%rcx,4)
	addl	$1, -20(%rbp)
	cmpl	$256, -20(%rbp)                 # imm = 0x100
	jle	.LBB103_353
.LBB103_354:
	movl	$0, -20(%rbp)
	cmpl	$256, -20(%rbp)                 # imm = 0x100
	jg	.LBB103_358
.LBB103_355:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	cmpl	$0, 1096(%rax,%rcx,4)
	js	.LBB103_98
# %bb.356:                              #   in Loop: Header=BB103_355 Depth=1
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movl	1096(%rax,%rcx,4), %eax
	cmpl	-36(%rbp), %eax
	jg	.LBB103_98
# %bb.357:                              #   in Loop: Header=BB103_355 Depth=1
	addl	$1, -20(%rbp)
	cmpl	$256, -20(%rbp)                 # imm = 0x100
	jle	.LBB103_355
.LBB103_358:
	movq	-8(%rbp), %rax
	movl	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movb	$0, 12(%rax)
	movq	-8(%rbp), %rax
	movl	$-1, 3184(%rax)
	movq	-8(%rbp), %rax
	movl	$2, 8(%rax)
	movq	-8(%rbp), %rax
	cmpl	$2, 52(%rax)
	jl	.LBB103_360
# %bb.359:
	movq	stderr(%rip), %rdi
	movl	$.L.str.1.159, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB103_360:
	movq	-8(%rbp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB103_376
# %bb.361:
	movl	$0, -20(%rbp)
	cmpl	$256, -20(%rbp)                 # imm = 0x100
	jg	.LBB103_363
.LBB103_362:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movl	1096(%rax,%rcx,4), %edx
	movl	%edx, 2124(%rax,%rcx,4)
	addl	$1, -20(%rbp)
	cmpl	$256, -20(%rbp)                 # imm = 0x100
	jle	.LBB103_362
.LBB103_363:
	movl	$0, -20(%rbp)
	jmp	.LBB103_366
.LBB103_364:                            #   in Loop: Header=BB103_366 Depth=1
	movq	-8(%rbp), %rax
	movq	3168(%rax), %rcx
	movl	-20(%rbp), %edx
	sarl	%edx
	movslq	%edx, %rdx
	movzbl	(%rcx,%rdx), %esi
	andl	$15, %esi
	movzbl	-9(%rbp), %edi
	movzwl	2126(%rax,%rdi,4), %eax
	shll	$4, %eax
.LBB103_365:                            #   in Loop: Header=BB103_366 Depth=1
	orl	%esi, %eax
	movb	%al, (%rcx,%rdx)
	movq	-8(%rbp), %rax
	movzbl	-9(%rbp), %ecx
	addl	$1, 2124(%rax,%rcx,4)
	addl	$1, -20(%rbp)
.LBB103_366:                            # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB103_369
# %bb.367:                              #   in Loop: Header=BB103_366 Depth=1
	movq	-8(%rbp), %rax
	movq	3160(%rax), %rcx
	movslq	-20(%rbp), %rdx
	movzbl	(%rcx,%rdx,2), %ecx
	movb	%cl, -9(%rbp)
	movzwl	2124(%rax,%rcx,4), %ecx
	movq	3160(%rax), %rax
	movw	%cx, (%rax,%rdx,2)
	testb	$1, -20(%rbp)
	jne	.LBB103_364
# %bb.368:                              #   in Loop: Header=BB103_366 Depth=1
	movq	-8(%rbp), %rax
	movq	3168(%rax), %rcx
	movl	-20(%rbp), %edx
	sarl	%edx
	movslq	%edx, %rdx
	movzbl	(%rcx,%rdx), %esi
	andl	$-16, %esi
	movzbl	-9(%rbp), %edi
	movzwl	2126(%rax,%rdi,4), %eax
	jmp	.LBB103_365
.LBB103_369:
	movq	-8(%rbp), %rax
	movslq	56(%rax), %rdx
	movl	%edx, -20(%rbp)
	movq	3160(%rax), %rcx
	movq	3168(%rax), %rax
	movzwl	(%rcx,%rdx,2), %esi
	leal	(,%rdx,4), %ecx
                                        # kill: def $edx killed $edx killed $rdx
	sarl	%edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %eax
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %eax
	andl	$15, %eax
	shll	$16, %eax
	orl	%esi, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB103_372
.LBB103_370:                            #   in Loop: Header=BB103_372 Depth=1
	movq	-8(%rbp), %rax
	movq	3168(%rax), %rax
	movl	-40(%rbp), %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edx
	andl	$15, %edx
	movzwl	-18(%rbp), %esi
	shll	$4, %esi
.LBB103_371:                            #   in Loop: Header=BB103_372 Depth=1
	orl	%edx, %esi
	movb	%sil, (%rax,%rcx)
	movl	-40(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-240(%rbp), %ecx
	movl	%ecx, -40(%rbp)
	movq	-8(%rbp), %rcx
	cmpl	56(%rcx), %eax
	je	.LBB103_374
.LBB103_372:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movslq	-40(%rbp), %rdx
	movq	3160(%rax), %rcx
	movq	3168(%rax), %rsi
	movzwl	(%rcx,%rdx,2), %edi
	movl	%edx, %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movzbl	(%rsi,%rcx), %esi
	leal	(,%rdx,4), %ecx
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edi, %esi
	movl	%esi, -240(%rbp)
	movzwl	-20(%rbp), %ecx
	movq	3160(%rax), %rax
	movw	%cx, (%rax,%rdx,2)
	testb	$1, -40(%rbp)
	jne	.LBB103_370
# %bb.373:                              #   in Loop: Header=BB103_372 Depth=1
	movq	-8(%rbp), %rax
	movq	3168(%rax), %rax
	movl	-40(%rbp), %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edx
	andl	$-16, %edx
	movzwl	-18(%rbp), %esi
	jmp	.LBB103_371
.LBB103_374:
	movq	-8(%rbp), %rax
	movl	56(%rax), %ecx
	movl	%ecx, 60(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 1092(%rax)
	movq	-8(%rbp), %rax
	cmpb	$0, 20(%rax)
	je	.LBB103_385
# %bb.375:
	movq	-8(%rbp), %rax
	movl	$0, 24(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 28(%rax)
	movq	-8(%rbp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi                     # imm = 0x448
	callq	BZ2_indexIntoF
	movq	-8(%rbp), %rcx
	movl	%eax, 64(%rcx)
	movq	-8(%rbp), %rax
	movq	3160(%rax), %rcx
	movl	60(%rax), %edx
	movzwl	(%rcx,%rdx,2), %esi
	movq	3168(%rax), %rdi
	leal	(,%rdx,4), %ecx
	shrq	%rdx
	movzbl	(%rdi,%rdx), %edx
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %edx
	andl	$15, %edx
	shll	$16, %edx
	orl	%esi, %edx
	movl	%edx, 60(%rax)
	jmp	.LBB103_381
.LBB103_376:
	movl	$0, -20(%rbp)
.LBB103_377:                            # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB103_379
# %bb.378:                              #   in Loop: Header=BB103_377 Depth=1
	movq	-8(%rbp), %rax
	movq	3152(%rax), %rcx
	movslq	-20(%rbp), %rdx
	movl	(%rcx,%rdx,4), %ecx
	movzbl	%cl, %ecx
	movb	%cl, -9(%rbp)
	shll	$8, %edx
	movq	3152(%rax), %rsi
	movslq	1096(%rax,%rcx,4), %rax
	orl	%edx, (%rsi,%rax,4)
	movq	-8(%rbp), %rax
	movzbl	-9(%rbp), %ecx
	addl	$1, 1096(%rax,%rcx,4)
	addl	$1, -20(%rbp)
	jmp	.LBB103_377
.LBB103_379:
	movq	-8(%rbp), %rax
	movq	3152(%rax), %rcx
	movslq	56(%rax), %rdx
	movl	(%rcx,%rdx,4), %ecx
	shrl	$8, %ecx
	movl	%ecx, 60(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 1092(%rax)
	movq	-8(%rbp), %rax
	cmpb	$0, 20(%rax)
	je	.LBB103_386
# %bb.380:
	movq	-8(%rbp), %rax
	movl	$0, 24(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 28(%rax)
	movq	-8(%rbp), %rax
	movq	3152(%rax), %rcx
	movl	60(%rax), %edx
	movl	(%rcx,%rdx,4), %ecx
	movl	%ecx, 60(%rax)
	movq	-8(%rbp), %rax
	movzbl	60(%rax), %ecx
	movl	%ecx, 64(%rax)
	movq	-8(%rbp), %rax
	shrl	$8, 60(%rax)
.LBB103_381:
	movq	-8(%rbp), %rax
	addl	$1, 1092(%rax)
	movq	-8(%rbp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB103_384
# %bb.382:
	movq	-8(%rbp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	-8(%rbp), %rax
	addl	$1, 28(%rax)
	movq	-8(%rbp), %rax
	cmpl	$512, 28(%rax)                  # imm = 0x200
	jne	.LBB103_384
# %bb.383:
	movq	-8(%rbp), %rax
	movl	$0, 28(%rax)
.LBB103_384:
	movq	-8(%rbp), %rax
	addl	$-1, 24(%rax)
	movq	-8(%rbp), %rax
	xorl	%ecx, %ecx
	cmpl	$1, 24(%rax)
	sete	%cl
	xorl	%ecx, 64(%rax)
	jmp	.LBB103_388
.LBB103_385:
	movq	-8(%rbp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi                     # imm = 0x448
	callq	BZ2_indexIntoF
	movq	-8(%rbp), %rcx
	movl	%eax, 64(%rcx)
	movq	-8(%rbp), %rax
	movq	3160(%rax), %rcx
	movl	60(%rax), %edx
	movzwl	(%rcx,%rdx,2), %esi
	movq	3168(%rax), %rdi
	leal	(,%rdx,4), %ecx
	shrq	%rdx
	movzbl	(%rdi,%rdx), %edx
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %edx
	andl	$15, %edx
	shll	$16, %edx
	orl	%esi, %edx
	movl	%edx, 60(%rax)
	jmp	.LBB103_387
.LBB103_386:
	movq	-8(%rbp), %rax
	movq	3152(%rax), %rcx
	movl	60(%rax), %edx
	movl	(%rcx,%rdx,4), %ecx
	movl	%ecx, 60(%rax)
	movq	-8(%rbp), %rax
	movzbl	60(%rax), %ecx
	movl	%ecx, 64(%rax)
	movq	-8(%rbp), %rax
	shrl	$8, 60(%rax)
.LBB103_387:
	movq	-8(%rbp), %rax
	addl	$1, 1092(%rax)
.LBB103_388:
	movl	$0, -16(%rbp)
.LBB103_389:
	movl	-20(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64036(%rcx)
	movl	-40(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64040(%rcx)
	movl	-44(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64044(%rcx)
	movl	-112(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64048(%rcx)
	movl	-84(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64052(%rcx)
	movl	-80(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64056(%rcx)
	movl	-176(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64060(%rcx)
	movl	-56(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64064(%rcx)
	movl	-52(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64068(%rcx)
	movl	-48(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64072(%rcx)
	movl	-108(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64076(%rcx)
	movl	-36(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64080(%rcx)
	movl	-60(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64084(%rcx)
	movl	-104(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64088(%rcx)
	movl	-76(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64092(%rcx)
	movl	-372(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64096(%rcx)
	movl	-28(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64100(%rcx)
	movl	-32(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64104(%rcx)
	movl	-128(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64108(%rcx)
	movl	-124(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64112(%rcx)
	movl	-72(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 64116(%rcx)
	movq	-152(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rax, 64120(%rcx)
	movq	-96(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rax, 64128(%rcx)
	movq	-144(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rax, 64136(%rcx)
	movl	-16(%rbp), %eax
	addq	$384, %rsp                      # imm = 0x180
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB103_311:
	.cfi_def_cfa %rbp, 16
	cmpl	$0, -48(%rbp)
	je	.LBB103_390
# %bb.312:
	cmpl	$1, -48(%rbp)
	jne	.LBB103_392
# %bb.313:
	movl	-104(%rbp), %eax
	addl	%eax, %eax
	jmp	.LBB103_391
.LBB103_390:
	movl	-104(%rbp), %eax
.LBB103_391:
	addl	%eax, -60(%rbp)
.LBB103_392:
	shll	-104(%rbp)
	cmpl	$0, -52(%rbp)
	jne	.LBB103_395
# %bb.393:
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	cmpl	-80(%rbp), %eax
	jge	.LBB103_98
# %bb.394:
	movl	$50, -52(%rbp)
	movslq	-56(%rbp), %rax
	movq	-8(%rbp), %rcx
	movzbl	7884(%rcx,%rax), %eax
	movl	%eax, -124(%rbp)
	movl	64012(%rcx,%rax,4), %edx
	movl	%edx, -72(%rbp)
	movq	%rax, %rdx
	shlq	$10, %rdx
	leaq	(%rdx,%rax,8), %rax
	leaq	(%rcx,%rax), %rdx
	addq	$45436, %rdx                    # imm = 0xB17C
	movq	%rdx, -152(%rbp)
	leaq	(%rcx,%rax), %rdx
	addq	$57820, %rdx                    # imm = 0xE1DC
	movq	%rdx, -144(%rbp)
	addq	%rcx, %rax
	addq	$51628, %rax                    # imm = 0xC9AC
	movq	%rax, -96(%rbp)
.LBB103_395:
	addl	$-1, -52(%rbp)
	movl	-72(%rbp), %eax
	movl	%eax, -28(%rbp)
.LBB103_396:
	movq	-8(%rbp), %rax
	movl	$38, 8(%rax)
	.p2align	4, 0x90
.LBB103_397:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movl	36(%rax), %eax
	cmpl	-28(%rbp), %eax
	jge	.LBB103_401
# %bb.398:                              #   in Loop: Header=BB103_397 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.399:                              #   in Loop: Header=BB103_397 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_397
# %bb.400:                              #   in Loop: Header=BB103_397 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_397
.LBB103_401:
	movq	-8(%rbp), %rdx
	movl	32(%rdx), %esi
	movl	36(%rdx), %ecx
	movl	-28(%rbp), %eax
	subl	%eax, %ecx
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %esi
	movl	$1, %edi
	movl	%eax, %ecx
	shll	%cl, %edi
	addl	$-1, %edi
	andl	%esi, %edi
	movl	%edi, -256(%rbp)
	subl	%eax, 36(%rdx)
	movl	-256(%rbp), %eax
	movl	%eax, -32(%rbp)
	jmp	.LBB103_402
.LBB103_340:
	cmpl	$21, -28(%rbp)
	jge	.LBB103_98
# %bb.341:
	movl	-32(%rbp), %eax
	movq	-152(%rbp), %rcx
	movslq	-28(%rbp), %rdx
	cmpl	(%rcx,%rdx,4), %eax
	jle	.LBB103_304
# %bb.424:
	addl	$1, -28(%rbp)
.LBB103_425:
	movq	-8(%rbp), %rax
	movl	$41, 8(%rax)
	.p2align	4, 0x90
.LBB103_426:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB103_430
# %bb.427:                              #   in Loop: Header=BB103_426 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.428:                              #   in Loop: Header=BB103_426 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_426
# %bb.429:                              #   in Loop: Header=BB103_426 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_426
.LBB103_430:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-1, %cl
	shrl	%cl, %edx
	andl	$1, %edx
	movl	%edx, -244(%rbp)
	addl	$-1, 36(%rax)
	movl	-244(%rbp), %eax
	movl	%eax, -128(%rbp)
	movl	-32(%rbp), %ecx
	addl	%ecx, %ecx
	orl	%eax, %ecx
	movl	%ecx, -32(%rbp)
	jmp	.LBB103_340
.LBB103_402:
	cmpl	$21, -28(%rbp)
	jge	.LBB103_98
# %bb.403:
	movl	-32(%rbp), %eax
	movq	-152(%rbp), %rcx
	movslq	-28(%rbp), %rdx
	cmpl	(%rcx,%rdx,4), %eax
	jg	.LBB103_408
# %bb.404:
	movl	-32(%rbp), %eax
	movq	-96(%rbp), %rcx
	movslq	-28(%rbp), %rdx
	cmpl	(%rcx,%rdx,4), %eax
	js	.LBB103_98
# %bb.405:
	movl	-32(%rbp), %eax
	movq	-96(%rbp), %rcx
	movslq	-28(%rbp), %rdx
	subl	(%rcx,%rdx,4), %eax
	cmpl	$258, %eax                      # imm = 0x102
	jge	.LBB103_98
# %bb.406:
	movq	-144(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movq	-96(%rbp), %rdx
	movslq	-28(%rbp), %rsi
	movslq	(%rdx,%rsi,4), %rdx
	subq	%rdx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -48(%rbp)
	testl	%eax, %eax
	je	.LBB103_415
# %bb.407:
	cmpl	$1, -48(%rbp)
	sete	%al
	jmp	.LBB103_416
.LBB103_408:
	addl	$1, -28(%rbp)
.LBB103_409:
	movq	-8(%rbp), %rax
	movl	$39, 8(%rax)
	.p2align	4, 0x90
.LBB103_410:                            # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB103_414
# %bb.411:                              #   in Loop: Header=BB103_410 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB103_388
# %bb.412:                              #   in Loop: Header=BB103_410 Depth=1
	movq	-8(%rbp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	-8(%rbp), %rax
	addl	$8, 36(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$-1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB103_410
# %bb.413:                              #   in Loop: Header=BB103_410 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addl	$1, 16(%rax)
	jmp	.LBB103_410
.LBB103_414:
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movb	36(%rax), %cl
	addb	$-1, %cl
	shrl	%cl, %edx
	andl	$1, %edx
	movl	%edx, -252(%rbp)
	addl	$-1, 36(%rax)
	movl	-252(%rbp), %eax
	movl	%eax, -128(%rbp)
	movl	-32(%rbp), %ecx
	addl	%ecx, %ecx
	orl	%eax, %ecx
	movl	%ecx, -32(%rbp)
	jmp	.LBB103_402
.LBB103_415:
	movb	$1, %al
.LBB103_416:
	testb	%al, %al
	jne	.LBB103_311
# %bb.417:
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	movq	-8(%rbp), %rcx
	movslq	7820(%rcx), %rdx
	movzbl	3724(%rcx,%rdx), %edx
	movzbl	3468(%rcx,%rdx), %edx
	movb	%dl, -9(%rbp)
	addl	%eax, 68(%rcx,%rdx,4)
	movq	-8(%rbp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB103_422
# %bb.418:
	cmpl	$0, -60(%rbp)
	jle	.LBB103_307
.LBB103_419:                            # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jge	.LBB103_98
# %bb.420:                              #   in Loop: Header=BB103_419 Depth=1
	movzbl	-9(%rbp), %eax
	movq	-8(%rbp), %rcx
	movq	3160(%rcx), %rcx
	movslq	-36(%rbp), %rdx
	movw	%ax, (%rcx,%rdx,2)
	addl	$1, -36(%rbp)
	addl	$-1, -60(%rbp)
	cmpl	$0, -60(%rbp)
	jg	.LBB103_419
	jmp	.LBB103_307
.LBB103_421:                            #   in Loop: Header=BB103_422 Depth=1
	movzbl	-9(%rbp), %eax
	movq	-8(%rbp), %rcx
	movq	3152(%rcx), %rcx
	movslq	-36(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$1, -36(%rbp)
	addl	$-1, -60(%rbp)
.LBB103_422:                            # =>This Inner Loop Header: Depth=1
	cmpl	$0, -60(%rbp)
	jle	.LBB103_307
# %bb.423:                              #   in Loop: Header=BB103_422 Depth=1
	movl	-36(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.LBB103_421
	jmp	.LBB103_98
.Lfunc_end103:
	.size	BZ2_decompress, .Lfunc_end103-BZ2_decompress
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI103_0:
	.quad	.LBB103_4
	.quad	.LBB103_12
	.quad	.LBB103_18
	.quad	.LBB103_24
	.quad	.LBB103_36
	.quad	.LBB103_99
	.quad	.LBB103_105
	.quad	.LBB103_111
	.quad	.LBB103_117
	.quad	.LBB103_123
	.quad	.LBB103_132
	.quad	.LBB103_138
	.quad	.LBB103_144
	.quad	.LBB103_150
	.quad	.LBB103_156
	.quad	.LBB103_162
	.quad	.LBB103_168
	.quad	.LBB103_174
	.quad	.LBB103_183
	.quad	.LBB103_197
	.quad	.LBB103_208
	.quad	.LBB103_215
	.quad	.LBB103_224
	.quad	.LBB103_243
	.quad	.LBB103_280
	.quad	.LBB103_286
	.quad	.LBB103_269
	.quad	.LBB103_298
	.quad	.LBB103_396
	.quad	.LBB103_409
	.quad	.LBB103_334
	.quad	.LBB103_425
	.quad	.LBB103_42
	.quad	.LBB103_48
	.quad	.LBB103_54
	.quad	.LBB103_60
	.quad	.LBB103_66
	.quad	.LBB103_73
	.quad	.LBB103_79
	.quad	.LBB103_85
	.quad	.LBB103_91
                                        # -- End function
	.text
	.p2align	4, 0x90                         # -- Begin function makeMaps_d
	.type	makeMaps_d,@function
makeMaps_d:                             # @makeMaps_d
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movl	$0, 3192(%rdi)
	movl	$0, -4(%rbp)
	jmp	.LBB104_1
	.p2align	4, 0x90
.LBB104_4:                              #   in Loop: Header=BB104_1 Depth=1
	addl	$1, -4(%rbp)
.LBB104_1:                              # =>This Inner Loop Header: Depth=1
	cmpl	$255, -4(%rbp)
	jg	.LBB104_5
# %bb.2:                                #   in Loop: Header=BB104_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-4(%rbp), %rcx
	cmpb	$0, 3196(%rax,%rcx)
	je	.LBB104_4
# %bb.3:                                #   in Loop: Header=BB104_1 Depth=1
	movzbl	-4(%rbp), %eax
	movq	-16(%rbp), %rcx
	movslq	3192(%rcx), %rdx
	movb	%al, 3468(%rcx,%rdx)
	movq	-16(%rbp), %rax
	addl	$1, 3192(%rax)
	jmp	.LBB104_4
.LBB104_5:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end104:
	.size	makeMaps_d, .Lfunc_end104-makeMaps_d
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_hbMakeCodeLengths           # -- Begin function BZ2_hbMakeCodeLengths
	.p2align	4, 0x90
	.type	BZ2_hbMakeCodeLengths,@function
BZ2_hbMakeCodeLengths:                  # @BZ2_hbMakeCodeLengths
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$5264, %rsp                     # imm = 0x1490
	movq	%rdi, -96(%rbp)
	movq	%rsi, -88(%rbp)
	movl	%edx, -24(%rbp)
	movl	%ecx, -80(%rbp)
	movl	$0, -4(%rbp)
	jmp	.LBB105_1
	.p2align	4, 0x90
.LBB105_4:                              #   in Loop: Header=BB105_1 Depth=1
	movq	-88(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
.LBB105_5:                              #   in Loop: Header=BB105_1 Depth=1
	shll	$8, %eax
	movslq	-4(%rbp), %rcx
	movl	%eax, -3196(%rbp,%rcx,4)
	leal	1(%rcx), %eax
	movl	%eax, -4(%rbp)
.LBB105_1:                              # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jge	.LBB105_6
# %bb.2:                                #   in Loop: Header=BB105_1 Depth=1
	movq	-88(%rbp), %rax
	movslq	-4(%rbp), %rcx
	cmpl	$0, (%rax,%rcx,4)
	jne	.LBB105_4
# %bb.3:                                #   in Loop: Header=BB105_1 Depth=1
	movl	$1, %eax
	jmp	.LBB105_5
	.p2align	4, 0x90
.LBB105_47:                             #   in Loop: Header=BB105_6 Depth=1
	movl	$1, -4(%rbp)
	.p2align	4, 0x90
.LBB105_48:                             #   Parent Loop BB105_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jg	.LBB105_6
# %bb.49:                               #   in Loop: Header=BB105_48 Depth=2
	movslq	-4(%rbp), %rax
	movl	-3200(%rbp,%rax,4), %ecx
	movl	%ecx, %edx
	sarl	$8, %edx
	shrl	$31, %ecx
	addl	%edx, %ecx
	sarl	%ecx
	addl	$1, %ecx
	movl	%ecx, -44(%rbp)
	shll	$8, %ecx
	movl	%ecx, -3200(%rbp,%rax,4)
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB105_48
	.p2align	4, 0x90
.LBB105_6:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB105_7 Depth 2
                                        #       Child Loop BB105_9 Depth 3
                                        #     Child Loop BB105_14 Depth 2
                                        #       Child Loop BB105_16 Depth 3
                                        #       Child Loop BB105_23 Depth 3
                                        #       Child Loop BB105_33 Depth 3
                                        #     Child Loop BB105_39 Depth 2
                                        #       Child Loop BB105_41 Depth 3
                                        #     Child Loop BB105_48 Depth 2
	movl	-24(%rbp), %eax
	movl	%eax, -48(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -1136(%rbp)
	movl	$0, -3200(%rbp)
	movl	$-2, -5264(%rbp)
	movl	$1, -4(%rbp)
	jmp	.LBB105_7
	.p2align	4, 0x90
.LBB105_11:                             #   in Loop: Header=BB105_7 Depth=2
	movl	-68(%rbp), %eax
	movslq	-40(%rbp), %rcx
	movl	%eax, -1136(%rbp,%rcx,4)
	addl	$1, -4(%rbp)
.LBB105_7:                              #   Parent Loop BB105_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB105_9 Depth 3
	movl	-4(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jg	.LBB105_12
# %bb.8:                                #   in Loop: Header=BB105_7 Depth=2
	movslq	-4(%rbp), %rax
	movl	$-1, -5264(%rbp,%rax,4)
	movslq	-8(%rbp), %rcx
	leal	1(%rcx), %edx
	movl	%edx, -8(%rbp)
	movl	%eax, -1132(%rbp,%rcx,4)
	movl	%edx, -40(%rbp)
	movl	-1132(%rbp,%rcx,4), %eax
	movl	%eax, -68(%rbp)
	.p2align	4, 0x90
.LBB105_9:                              #   Parent Loop BB105_6 Depth=1
                                        #     Parent Loop BB105_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	-68(%rbp), %rax
	movl	-3200(%rbp,%rax,4), %eax
	movl	-40(%rbp), %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movslq	-1136(%rbp,%rcx,4), %rcx
	cmpl	-3200(%rbp,%rcx,4), %eax
	jge	.LBB105_11
# %bb.10:                               #   in Loop: Header=BB105_9 Depth=3
	movslq	-40(%rbp), %rax
	movl	%eax, %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movl	-1136(%rbp,%rcx,4), %edx
	movl	%edx, -1136(%rbp,%rax,4)
	movl	%ecx, -40(%rbp)
	jmp	.LBB105_9
	.p2align	4, 0x90
.LBB105_12:                             #   in Loop: Header=BB105_6 Depth=1
	cmpl	$260, -8(%rbp)                  # imm = 0x104
	jl	.LBB105_14
# %bb.13:                               #   in Loop: Header=BB105_6 Depth=1
	movl	$2001, %edi                     # imm = 0x7D1
	callq	BZ2_bz__AssertH__fail
	jmp	.LBB105_14
	.p2align	4, 0x90
.LBB105_35:                             #   in Loop: Header=BB105_14 Depth=2
	movl	-56(%rbp), %eax
	movslq	-28(%rbp), %rcx
	movl	%eax, -1136(%rbp,%rcx,4)
.LBB105_14:                             #   Parent Loop BB105_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB105_16 Depth 3
                                        #       Child Loop BB105_23 Depth 3
                                        #       Child Loop BB105_33 Depth 3
	cmpl	$2, -8(%rbp)
	jl	.LBB105_36
# %bb.15:                               #   in Loop: Header=BB105_14 Depth=2
	movl	-1132(%rbp), %eax
	movl	%eax, -76(%rbp)
	movslq	-8(%rbp), %rax
	addl	$-1, -8(%rbp)
	movl	-1136(%rbp,%rax,4), %eax
	movl	%eax, -1132(%rbp)
	movl	$1, -36(%rbp)
	movl	%eax, -64(%rbp)
	.p2align	4, 0x90
.LBB105_16:                             #   Parent Loop BB105_6 Depth=1
                                        #     Parent Loop BB105_14 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -20(%rbp)
	cmpl	-8(%rbp), %eax
	jg	.LBB105_22
# %bb.17:                               #   in Loop: Header=BB105_16 Depth=3
	movl	-20(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB105_20
# %bb.18:                               #   in Loop: Header=BB105_16 Depth=3
	movslq	-20(%rbp), %rax
	movslq	-1132(%rbp,%rax,4), %rcx
	movl	-3200(%rbp,%rcx,4), %ecx
	movslq	-1136(%rbp,%rax,4), %rax
	cmpl	-3200(%rbp,%rax,4), %ecx
	jge	.LBB105_20
# %bb.19:                               #   in Loop: Header=BB105_16 Depth=3
	addl	$1, -20(%rbp)
.LBB105_20:                             #   in Loop: Header=BB105_16 Depth=3
	movslq	-64(%rbp), %rax
	movl	-3200(%rbp,%rax,4), %eax
	movslq	-20(%rbp), %rcx
	movslq	-1136(%rbp,%rcx,4), %rcx
	cmpl	-3200(%rbp,%rcx,4), %eax
	jl	.LBB105_22
# %bb.21:                               #   in Loop: Header=BB105_16 Depth=3
	movslq	-20(%rbp), %rax
	movl	-1136(%rbp,%rax,4), %ecx
	movslq	-36(%rbp), %rdx
	movl	%ecx, -1136(%rbp,%rdx,4)
	movl	%eax, -36(%rbp)
	jmp	.LBB105_16
	.p2align	4, 0x90
.LBB105_22:                             #   in Loop: Header=BB105_14 Depth=2
	movl	-64(%rbp), %eax
	movslq	-36(%rbp), %rcx
	movl	%eax, -1136(%rbp,%rcx,4)
	movl	-1132(%rbp), %eax
	movl	%eax, -72(%rbp)
	movslq	-8(%rbp), %rax
	addl	$-1, -8(%rbp)
	movl	-1136(%rbp,%rax,4), %eax
	movl	%eax, -1132(%rbp)
	movl	$1, -32(%rbp)
	movl	%eax, -60(%rbp)
	.p2align	4, 0x90
.LBB105_23:                             #   Parent Loop BB105_6 Depth=1
                                        #     Parent Loop BB105_14 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-32(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -16(%rbp)
	cmpl	-8(%rbp), %eax
	jg	.LBB105_29
# %bb.24:                               #   in Loop: Header=BB105_23 Depth=3
	movl	-16(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB105_27
# %bb.25:                               #   in Loop: Header=BB105_23 Depth=3
	movslq	-16(%rbp), %rax
	movslq	-1132(%rbp,%rax,4), %rcx
	movl	-3200(%rbp,%rcx,4), %ecx
	movslq	-1136(%rbp,%rax,4), %rax
	cmpl	-3200(%rbp,%rax,4), %ecx
	jge	.LBB105_27
# %bb.26:                               #   in Loop: Header=BB105_23 Depth=3
	addl	$1, -16(%rbp)
.LBB105_27:                             #   in Loop: Header=BB105_23 Depth=3
	movslq	-60(%rbp), %rax
	movl	-3200(%rbp,%rax,4), %eax
	movslq	-16(%rbp), %rcx
	movslq	-1136(%rbp,%rcx,4), %rcx
	cmpl	-3200(%rbp,%rcx,4), %eax
	jl	.LBB105_29
# %bb.28:                               #   in Loop: Header=BB105_23 Depth=3
	movslq	-16(%rbp), %rax
	movl	-1136(%rbp,%rax,4), %ecx
	movslq	-32(%rbp), %rdx
	movl	%ecx, -1136(%rbp,%rdx,4)
	movl	%eax, -32(%rbp)
	jmp	.LBB105_23
	.p2align	4, 0x90
.LBB105_29:                             #   in Loop: Header=BB105_14 Depth=2
	movl	-60(%rbp), %eax
	movslq	-32(%rbp), %rcx
	movl	%eax, -1136(%rbp,%rcx,4)
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	movslq	-72(%rbp), %rcx
	movl	%eax, -5264(%rbp,%rcx,4)
	movslq	-76(%rbp), %rdx
	movl	%eax, -5264(%rbp,%rdx,4)
	movl	-3200(%rbp,%rdx,4), %eax
	movzbl	%al, %edx
	movl	%eax, %esi
	andl	$-256, %esi
	movl	-3200(%rbp,%rcx,4), %eax
	movzbl	%al, %ecx
	andl	$-256, %eax
	addl	%esi, %eax
	cmpl	%ecx, %edx
	jle	.LBB105_31
# %bb.30:                               #   in Loop: Header=BB105_14 Depth=2
	movslq	-76(%rbp), %rcx
	jmp	.LBB105_32
	.p2align	4, 0x90
.LBB105_31:                             #   in Loop: Header=BB105_14 Depth=2
	movslq	-72(%rbp), %rcx
.LBB105_32:                             #   in Loop: Header=BB105_14 Depth=2
	movzbl	-3200(%rbp,%rcx,4), %ecx
	addl	$1, %ecx
	orl	%ecx, %eax
	movslq	-48(%rbp), %rcx
	movl	%eax, -3200(%rbp,%rcx,4)
	movl	$-1, -5264(%rbp,%rcx,4)
	movslq	-8(%rbp), %rax
	leal	1(%rax), %edx
	movl	%edx, -8(%rbp)
	movl	%ecx, -1132(%rbp,%rax,4)
	movl	%edx, -28(%rbp)
	movl	-1132(%rbp,%rax,4), %eax
	movl	%eax, -56(%rbp)
	.p2align	4, 0x90
.LBB105_33:                             #   Parent Loop BB105_6 Depth=1
                                        #     Parent Loop BB105_14 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	-56(%rbp), %rax
	movl	-3200(%rbp,%rax,4), %eax
	movl	-28(%rbp), %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movslq	-1136(%rbp,%rcx,4), %rcx
	cmpl	-3200(%rbp,%rcx,4), %eax
	jge	.LBB105_35
# %bb.34:                               #   in Loop: Header=BB105_33 Depth=3
	movslq	-28(%rbp), %rax
	movl	%eax, %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movl	-1136(%rbp,%rcx,4), %edx
	movl	%edx, -1136(%rbp,%rax,4)
	movl	%ecx, -28(%rbp)
	jmp	.LBB105_33
	.p2align	4, 0x90
.LBB105_36:                             #   in Loop: Header=BB105_6 Depth=1
	cmpl	$516, -48(%rbp)                 # imm = 0x204
	jl	.LBB105_38
# %bb.37:                               #   in Loop: Header=BB105_6 Depth=1
	movl	$2002, %edi                     # imm = 0x7D2
	callq	BZ2_bz__AssertH__fail
.LBB105_38:                             #   in Loop: Header=BB105_6 Depth=1
	movb	$0, -9(%rbp)
	movl	$1, -4(%rbp)
	jmp	.LBB105_39
	.p2align	4, 0x90
.LBB105_45:                             #   in Loop: Header=BB105_39 Depth=2
	addl	$1, -4(%rbp)
.LBB105_39:                             #   Parent Loop BB105_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB105_41 Depth 3
	movl	-4(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jg	.LBB105_46
# %bb.40:                               #   in Loop: Header=BB105_39 Depth=2
	movl	$0, -44(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -52(%rbp)
	.p2align	4, 0x90
.LBB105_41:                             #   Parent Loop BB105_6 Depth=1
                                        #     Parent Loop BB105_39 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	-52(%rbp), %rax
	cmpl	$0, -5264(%rbp,%rax,4)
	js	.LBB105_43
# %bb.42:                               #   in Loop: Header=BB105_41 Depth=3
	movslq	-52(%rbp), %rax
	movl	-5264(%rbp,%rax,4), %eax
	movl	%eax, -52(%rbp)
	addl	$1, -44(%rbp)
	jmp	.LBB105_41
	.p2align	4, 0x90
.LBB105_43:                             #   in Loop: Header=BB105_39 Depth=2
	movb	-44(%rbp), %al
	movq	-96(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movb	%al, -1(%rdx,%rcx)
	movl	-44(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jle	.LBB105_45
# %bb.44:                               #   in Loop: Header=BB105_39 Depth=2
	movb	$1, -9(%rbp)
	jmp	.LBB105_45
	.p2align	4, 0x90
.LBB105_46:                             #   in Loop: Header=BB105_6 Depth=1
	cmpb	$0, -9(%rbp)
	jne	.LBB105_47
# %bb.50:
	addq	$5264, %rsp                     # imm = 0x1490
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end105:
	.size	BZ2_hbMakeCodeLengths, .Lfunc_end105-BZ2_hbMakeCodeLengths
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_hbAssignCodes               # -- Begin function BZ2_hbAssignCodes
	.p2align	4, 0x90
	.type	BZ2_hbAssignCodes,@function
BZ2_hbAssignCodes:                      # @BZ2_hbAssignCodes
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -44(%rbp)
	movl	%ecx, -20(%rbp)
	movl	%r8d, -16(%rbp)
	movl	$0, -8(%rbp)
	movl	%edx, -12(%rbp)
	jmp	.LBB106_1
	.p2align	4, 0x90
.LBB106_7:                              #   in Loop: Header=BB106_1 Depth=1
	shll	-8(%rbp)
	addl	$1, -12(%rbp)
.LBB106_1:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB106_3 Depth 2
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jg	.LBB106_8
# %bb.2:                                #   in Loop: Header=BB106_1 Depth=1
	movl	$0, -4(%rbp)
	jmp	.LBB106_3
	.p2align	4, 0x90
.LBB106_6:                              #   in Loop: Header=BB106_3 Depth=2
	addl	$1, -4(%rbp)
.LBB106_3:                              #   Parent Loop BB106_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB106_7
# %bb.4:                                #   in Loop: Header=BB106_3 Depth=2
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movzbl	(%rax,%rcx), %eax
	cmpl	-12(%rbp), %eax
	jne	.LBB106_6
# %bb.5:                                #   in Loop: Header=BB106_3 Depth=2
	movl	-8(%rbp), %eax
	movq	-40(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$1, -8(%rbp)
	jmp	.LBB106_6
.LBB106_8:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end106:
	.size	BZ2_hbAssignCodes, .Lfunc_end106-BZ2_hbAssignCodes
	.cfi_endproc
                                        # -- End function
	.globl	BZ2_hbCreateDecodeTables        # -- Begin function BZ2_hbCreateDecodeTables
	.p2align	4, 0x90
	.type	BZ2_hbCreateDecodeTables,@function
BZ2_hbCreateDecodeTables:               # @BZ2_hbCreateDecodeTables
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -48(%rbp)
	movl	%r8d, -32(%rbp)
	movl	%r9d, -16(%rbp)
	movl	$0, -28(%rbp)
	movl	%r8d, -4(%rbp)
	jmp	.LBB107_1
	.p2align	4, 0x90
.LBB107_7:                              #   in Loop: Header=BB107_1 Depth=1
	addl	$1, -4(%rbp)
.LBB107_1:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB107_3 Depth 2
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB107_8
# %bb.2:                                #   in Loop: Header=BB107_1 Depth=1
	movl	$0, -8(%rbp)
	jmp	.LBB107_3
	.p2align	4, 0x90
.LBB107_6:                              #   in Loop: Header=BB107_3 Depth=2
	addl	$1, -8(%rbp)
.LBB107_3:                              #   Parent Loop BB107_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jge	.LBB107_7
# %bb.4:                                #   in Loop: Header=BB107_3 Depth=2
	movq	-48(%rbp), %rax
	movslq	-8(%rbp), %rcx
	movzbl	(%rax,%rcx), %eax
	cmpl	-4(%rbp), %eax
	jne	.LBB107_6
# %bb.5:                                #   in Loop: Header=BB107_3 Depth=2
	movl	-8(%rbp), %eax
	movq	-56(%rbp), %rcx
	movslq	-28(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	addl	$1, -28(%rbp)
	jmp	.LBB107_6
.LBB107_8:
	movl	$0, -4(%rbp)
	cmpl	$22, -4(%rbp)
	jg	.LBB107_11
	.p2align	4, 0x90
.LBB107_10:                             # =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	$0, (%rax,%rcx,4)
	addl	$1, -4(%rbp)
	cmpl	$22, -4(%rbp)
	jle	.LBB107_10
.LBB107_11:
	movl	$0, -4(%rbp)
	.p2align	4, 0x90
.LBB107_12:                             # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	16(%rbp), %eax
	jge	.LBB107_14
# %bb.13:                               #   in Loop: Header=BB107_12 Depth=1
	movq	-24(%rbp), %rax
	movq	-48(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	movzbl	(%rcx,%rdx), %ecx
	addl	$1, 4(%rax,%rcx,4)
	addl	$1, -4(%rbp)
	jmp	.LBB107_12
.LBB107_14:
	movl	$1, -4(%rbp)
	cmpl	$22, -4(%rbp)
	jg	.LBB107_17
	.p2align	4, 0x90
.LBB107_16:                             # =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	-4(%rax,%rcx,4), %edx
	addl	%edx, (%rax,%rcx,4)
	addl	$1, -4(%rbp)
	cmpl	$22, -4(%rbp)
	jle	.LBB107_16
.LBB107_17:
	movl	$0, -4(%rbp)
	cmpl	$22, -4(%rbp)
	jg	.LBB107_20
	.p2align	4, 0x90
.LBB107_19:                             # =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	$0, (%rax,%rcx,4)
	addl	$1, -4(%rbp)
	cmpl	$22, -4(%rbp)
	jle	.LBB107_19
.LBB107_20:
	movl	$0, -12(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, -4(%rbp)
	.p2align	4, 0x90
.LBB107_21:                             # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB107_23
# %bb.22:                               #   in Loop: Header=BB107_21 Depth=1
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	4(%rax,%rcx,4), %edx
	subl	(%rax,%rcx,4), %edx
	movl	-12(%rbp), %eax
	leal	(%rax,%rdx), %esi
	movl	%esi, -12(%rbp)
	addl	%edx, %eax
	addl	$-1, %eax
	movq	-40(%rbp), %rdx
	movl	%eax, (%rdx,%rcx,4)
	shll	-12(%rbp)
	addl	$1, -4(%rbp)
	jmp	.LBB107_21
.LBB107_23:
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	.p2align	4, 0x90
.LBB107_24:                             # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB107_26
# %bb.25:                               #   in Loop: Header=BB107_24 Depth=1
	movq	-40(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	-4(%rax,%rcx,4), %eax
	addl	%eax, %eax
	movq	-24(%rbp), %rdx
	subl	(%rdx,%rcx,4), %eax
	addl	$2, %eax
	movl	%eax, (%rdx,%rcx,4)
	addl	$1, -4(%rbp)
	jmp	.LBB107_24
.LBB107_26:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end107:
	.size	BZ2_hbCreateDecodeTables, .Lfunc_end107-BZ2_hbCreateDecodeTables
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -28(%rbp)
	movq	%rsi, -48(%rbp)
	movq	$0, -24(%rbp)
	movl	$.L.str.166, %edi
	movl	$.L.str.1.167, %esi
	callq	fopen
	movq	%rax, -24(%rbp)
	testq	%rax, %rax
	je	.LBB108_1
# %bb.2:
	movq	-24(%rbp), %rdi
	leaq	-40(%rbp), %rdx
	movl	$.L.str.3.169, %esi
	xorl	%eax, %eax
	callq	__isoc99_fscanf
	movq	-24(%rbp), %rdi
	callq	fclose
	movq	$0, -16(%rbp)
	.p2align	4, 0x90
.LBB108_3:                              # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jge	.LBB108_5
# %bb.4:                                #   in Loop: Header=BB108_3 Depth=1
	movl	-28(%rbp), %edi
	movq	-48(%rbp), %rsi
	movq	-16(%rbp), %rax
	addq	$1, %rax
	xorl	%edx, %edx
	cmpq	-40(%rbp), %rax
	sete	%dl
	callq	main1
	addq	$1, -16(%rbp)
	jmp	.LBB108_3
.LBB108_5:
	movl	$0, -4(%rbp)
	jmp	.LBB108_6
.LBB108_1:
	movq	stderr(%rip), %rdi
	movl	$.L.str.2.168, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	$1, -4(%rbp)
.LBB108_6:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end108:
	.size	main, .Lfunc_end108-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"      %d work, %d block, ratio %5.2f\n"
	.size	.L.str, 38

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"    too repetitive; using fallback sorting algorithm\n"
	.size	.L.str.1, 54

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"        main sort initialise ...\n"
	.size	.L.str.6, 34

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"        bucket sorting ...\n"
	.size	.L.str.2, 28

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"        qsort [0x%x, 0x%x]   done %d   this %d\n"
	.size	.L.str.7, 48

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"        %d pointers, %d sorted, %d scanned\n"
	.size	.L.str.8, 44

	.type	incs,@object                    # @incs
	.data
	.p2align	4
incs:
	.long	1                               # 0x1
	.long	4                               # 0x4
	.long	13                              # 0xd
	.long	40                              # 0x28
	.long	121                             # 0x79
	.long	364                             # 0x16c
	.long	1093                            # 0x445
	.long	3280                            # 0xcd0
	.long	9841                            # 0x2671
	.long	29524                           # 0x7354
	.long	88573                           # 0x159fd
	.long	265720                          # 0x40df8
	.long	797161                          # 0xc29e9
	.long	2391484                         # 0x247dbc
	.size	incs, 56

	.type	.L.str.3,@object                # @.str.3
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.3:
	.asciz	"        depth %6d has "
	.size	.L.str.3, 23

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"%6d unresolved strings\n"
	.size	.L.str.4, 24

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"        reconstructing block ...\n"
	.size	.L.str.5, 34

	.type	zSuffix,@object                 # @zSuffix
	.data
	.globl	zSuffix
	.p2align	4
zSuffix:
	.quad	.L.str.9
	.quad	.L.str.1.10
	.quad	.L.str.2.11
	.quad	.L.str.3.12
	.size	zSuffix, 32

	.type	.L.str.9,@object                # @.str.9
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.9:
	.asciz	".bz2"
	.size	.L.str.9, 5

	.type	.L.str.1.10,@object             # @.str.1.10
.L.str.1.10:
	.asciz	".bz"
	.size	.L.str.1.10, 4

	.type	.L.str.2.11,@object             # @.str.2.11
.L.str.2.11:
	.asciz	".tbz2"
	.size	.L.str.2.11, 6

	.type	.L.str.3.12,@object             # @.str.3.12
.L.str.3.12:
	.asciz	".tbz"
	.size	.L.str.3.12, 5

	.type	unzSuffix,@object               # @unzSuffix
	.data
	.globl	unzSuffix
	.p2align	4
unzSuffix:
	.quad	.L.str.4.13
	.quad	.L.str.4.13
	.quad	.L.str.5.14
	.quad	.L.str.5.14
	.size	unzSuffix, 32

	.type	.L.str.4.13,@object             # @.str.4.13
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4.13:
	.zero	1
	.size	.L.str.4.13, 1

	.type	.L.str.5.14,@object             # @.str.5.14
.L.str.5.14:
	.asciz	".tar"
	.size	.L.str.5.14, 5

	.type	outputHandleJustInCase,@object  # @outputHandleJustInCase
	.bss
	.globl	outputHandleJustInCase
	.p2align	3
outputHandleJustInCase:
	.quad	0
	.size	outputHandleJustInCase, 8

	.type	smallMode,@object               # @smallMode
	.globl	smallMode
smallMode:
	.byte	0                               # 0x0
	.size	smallMode, 1

	.type	keepInputFiles,@object          # @keepInputFiles
	.globl	keepInputFiles
keepInputFiles:
	.byte	0                               # 0x0
	.size	keepInputFiles, 1

	.type	forceOverwrite,@object          # @forceOverwrite
	.globl	forceOverwrite
forceOverwrite:
	.byte	0                               # 0x0
	.size	forceOverwrite, 1

	.type	noisy,@object                   # @noisy
	.globl	noisy
noisy:
	.byte	0                               # 0x0
	.size	noisy, 1

	.type	verbosity,@object               # @verbosity
	.globl	verbosity
	.p2align	2
verbosity:
	.long	0                               # 0x0
	.size	verbosity, 4

	.type	blockSize100k,@object           # @blockSize100k
	.globl	blockSize100k
	.p2align	2
blockSize100k:
	.long	0                               # 0x0
	.size	blockSize100k, 4

	.type	testFailsExist,@object          # @testFailsExist
	.globl	testFailsExist
testFailsExist:
	.byte	0                               # 0x0
	.size	testFailsExist, 1

	.type	unzFailsExist,@object           # @unzFailsExist
	.globl	unzFailsExist
unzFailsExist:
	.byte	0                               # 0x0
	.size	unzFailsExist, 1

	.type	numFileNames,@object            # @numFileNames
	.globl	numFileNames
	.p2align	2
numFileNames:
	.long	0                               # 0x0
	.size	numFileNames, 4

	.type	numFilesProcessed,@object       # @numFilesProcessed
	.globl	numFilesProcessed
	.p2align	2
numFilesProcessed:
	.long	0                               # 0x0
	.size	numFilesProcessed, 4

	.type	workFactor,@object              # @workFactor
	.globl	workFactor
	.p2align	2
workFactor:
	.long	0                               # 0x0
	.size	workFactor, 4

	.type	deleteOutputOnInterrupt,@object # @deleteOutputOnInterrupt
	.globl	deleteOutputOnInterrupt
deleteOutputOnInterrupt:
	.byte	0                               # 0x0
	.size	deleteOutputOnInterrupt, 1

	.type	exitValue,@object               # @exitValue
	.globl	exitValue
	.p2align	2
exitValue:
	.long	0                               # 0x0
	.size	exitValue, 4

	.type	inName,@object                  # @inName
	.globl	inName
	.p2align	4
inName:
	.zero	1034
	.size	inName, 1034

	.type	outName,@object                 # @outName
	.globl	outName
	.p2align	4
outName:
	.zero	1034
	.size	outName, 1034

	.type	progNameReally,@object          # @progNameReally
	.globl	progNameReally
	.p2align	4
progNameReally:
	.zero	1034
	.size	progNameReally, 1034

	.type	progName,@object                # @progName
	.globl	progName
	.p2align	3
progName:
	.quad	0
	.size	progName, 8

	.type	longestFileName,@object         # @longestFileName
	.globl	longestFileName
	.p2align	2
longestFileName:
	.long	0                               # 0x0
	.size	longestFileName, 4

	.type	srcMode,@object                 # @srcMode
	.globl	srcMode
	.p2align	2
srcMode:
	.long	0                               # 0x0
	.size	srcMode, 4

	.type	opMode,@object                  # @opMode
	.globl	opMode
	.p2align	2
opMode:
	.long	0                               # 0x0
	.size	opMode, 4

	.type	tmpName,@object                 # @tmpName
	.globl	tmpName
	.p2align	4
tmpName:
	.zero	1034
	.size	tmpName, 1034

	.type	.L.str.6.15,@object             # @.str.6.15
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6.15:
	.asciz	"(none)"
	.size	.L.str.6.15, 7

	.type	.L.str.7.16,@object             # @.str.7.16
.L.str.7.16:
	.asciz	"BZIP2"
	.size	.L.str.7.16, 6

	.type	.L.str.8.17,@object             # @.str.8.17
.L.str.8.17:
	.asciz	"BZIP"
	.size	.L.str.8.17, 5

	.type	.L.str.9.18,@object             # @.str.9.18
.L.str.9.18:
	.asciz	"--"
	.size	.L.str.9.18, 3

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"unzip"
	.size	.L.str.10, 6

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"UNZIP"
	.size	.L.str.11, 6

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"z2cat"
	.size	.L.str.12, 6

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"Z2CAT"
	.size	.L.str.13, 6

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"zcat"
	.size	.L.str.14, 5

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"ZCAT"
	.size	.L.str.15, 5

	.type	.L.str.16,@object               # @.str.16
.L.str.16:
	.asciz	"%s: Bad flag `%s'\n"
	.size	.L.str.16, 19

	.type	.L.str.17,@object               # @.str.17
.L.str.17:
	.asciz	"--stdout"
	.size	.L.str.17, 9

	.type	.L.str.18,@object               # @.str.18
.L.str.18:
	.asciz	"--decompress"
	.size	.L.str.18, 13

	.type	.L.str.19,@object               # @.str.19
.L.str.19:
	.asciz	"--compress"
	.size	.L.str.19, 11

	.type	.L.str.20,@object               # @.str.20
.L.str.20:
	.asciz	"--force"
	.size	.L.str.20, 8

	.type	.L.str.21,@object               # @.str.21
.L.str.21:
	.asciz	"--test"
	.size	.L.str.21, 7

	.type	.L.str.22,@object               # @.str.22
.L.str.22:
	.asciz	"--keep"
	.size	.L.str.22, 7

	.type	.L.str.23,@object               # @.str.23
.L.str.23:
	.asciz	"--small"
	.size	.L.str.23, 8

	.type	.L.str.24,@object               # @.str.24
.L.str.24:
	.asciz	"--quiet"
	.size	.L.str.24, 8

	.type	.L.str.25,@object               # @.str.25
.L.str.25:
	.asciz	"--version"
	.size	.L.str.25, 10

	.type	.L.str.26,@object               # @.str.26
.L.str.26:
	.asciz	"--license"
	.size	.L.str.26, 10

	.type	.L.str.27,@object               # @.str.27
.L.str.27:
	.asciz	"--exponential"
	.size	.L.str.27, 14

	.type	.L.str.28,@object               # @.str.28
.L.str.28:
	.asciz	"--repetitive-best"
	.size	.L.str.28, 18

	.type	.L.str.29,@object               # @.str.29
.L.str.29:
	.asciz	"--repetitive-fast"
	.size	.L.str.29, 18

	.type	.L.str.30,@object               # @.str.30
.L.str.30:
	.asciz	"--fast"
	.size	.L.str.30, 7

	.type	.L.str.31,@object               # @.str.31
.L.str.31:
	.asciz	"--best"
	.size	.L.str.31, 7

	.type	.L.str.32,@object               # @.str.32
.L.str.32:
	.asciz	"--verbose"
	.size	.L.str.32, 10

	.type	.L.str.33,@object               # @.str.33
.L.str.33:
	.asciz	"--help"
	.size	.L.str.33, 7

	.type	.L.str.34,@object               # @.str.34
.L.str.34:
	.asciz	"%s: -c and -t cannot be used together.\n"
	.size	.L.str.34, 40

	.type	.L.str.35,@object               # @.str.35
.L.str.35:
	.asciz	"\nYou can use the `bzip2recover' program to attempt to recover\ndata from undamaged sections of corrupted files.\n\n"
	.size	.L.str.35, 113

	.type	.L.str.94,@object               # @.str.94
.L.str.94:
	.asciz	"testf: bad modes\n"
	.size	.L.str.94, 18

	.type	.L.str.54,@object               # @.str.54
.L.str.54:
	.asciz	"(stdin)"
	.size	.L.str.54, 8

	.type	.L.str.56,@object               # @.str.56
.L.str.56:
	.asciz	"%s: There are no files matching `%s'.\n"
	.size	.L.str.56, 39

	.type	.L.str.95,@object               # @.str.95
.L.str.95:
	.asciz	"%s: Can't open input %s: %s.\n"
	.size	.L.str.95, 30

	.type	.L.str.59,@object               # @.str.59
.L.str.59:
	.asciz	"%s: Input file %s is a directory.\n"
	.size	.L.str.59, 35

	.type	.L.str.82,@object               # @.str.82
.L.str.82:
	.asciz	"%s: I won't read compressed data from a terminal.\n"
	.size	.L.str.82, 51

	.type	.L.str.65,@object               # @.str.65
.L.str.65:
	.asciz	"%s: For help, type: `%s --help'.\n"
	.size	.L.str.65, 34

	.type	.L.str.66,@object               # @.str.66
.L.str.66:
	.asciz	"rb"
	.size	.L.str.66, 3

	.type	.L.str.83,@object               # @.str.83
.L.str.83:
	.asciz	"%s: Can't open input file %s:%s.\n"
	.size	.L.str.83, 34

	.type	.L.str.96,@object               # @.str.96
.L.str.96:
	.asciz	"testf: bad srcMode"
	.size	.L.str.96, 19

	.type	.L.str.70,@object               # @.str.70
.L.str.70:
	.asciz	"  %s: "
	.size	.L.str.70, 7

	.type	.L.str.97,@object               # @.str.97
.L.str.97:
	.asciz	"ok\n"
	.size	.L.str.97, 4

	.type	.L.str.98,@object               # @.str.98
.L.str.98:
	.asciz	"test:bzReadGetUnused"
	.size	.L.str.98, 21

	.type	.L.str.89,@object               # @.str.89
.L.str.89:
	.asciz	"\n    "
	.size	.L.str.89, 6

	.type	.L.str.99,@object               # @.str.99
.L.str.99:
	.asciz	"%s: %s: "
	.size	.L.str.99, 9

	.type	.L.str.100,@object              # @.str.100
.L.str.100:
	.asciz	"data integrity (CRC) error in data\n"
	.size	.L.str.100, 36

	.type	.L.str.101,@object              # @.str.101
.L.str.101:
	.asciz	"file ends unexpectedly\n"
	.size	.L.str.101, 24

	.type	.L.str.102,@object              # @.str.102
.L.str.102:
	.asciz	"bad magic number (file not created by bzip2)\n"
	.size	.L.str.102, 46

	.type	.L.str.103,@object              # @.str.103
.L.str.103:
	.asciz	"trailing garbage after EOF ignored\n"
	.size	.L.str.103, 36

	.type	.L.str.104,@object              # @.str.104
.L.str.104:
	.asciz	"test:unexpected error"
	.size	.L.str.104, 22

	.type	.L.str.48,@object               # @.str.48
.L.str.48:
	.asciz	"\n%s: couldn't allocate enough memory\n"
	.size	.L.str.48, 38

	.type	.L.str.39,@object               # @.str.39
.L.str.39:
	.asciz	"%s: Deleting output file %s, if it exists.\n"
	.size	.L.str.39, 44

	.type	.L.str.40,@object               # @.str.40
.L.str.40:
	.asciz	"%s: WARNING: deletion of output file (apparently) failed.\n"
	.size	.L.str.40, 59

	.type	.L.str.41,@object               # @.str.41
.L.str.41:
	.asciz	"%s: WARNING: deletion of output file suppressed\n"
	.size	.L.str.41, 49

	.type	.L.str.42,@object               # @.str.42
.L.str.42:
	.asciz	"%s:    since input file no longer exists.  Output file\n"
	.size	.L.str.42, 56

	.type	.L.str.43,@object               # @.str.43
.L.str.43:
	.asciz	"%s:    `%s' may be incomplete.\n"
	.size	.L.str.43, 32

	.type	.L.str.44,@object               # @.str.44
.L.str.44:
	.asciz	"%s:    I suggest doing an integrity test (bzip2 -tv) of it.\n"
	.size	.L.str.44, 61

	.type	.L.str.45,@object               # @.str.45
.L.str.45:
	.asciz	"%s: WARNING: some files have not been processed:\n%s:    %d specified on command line, %d not processed yet.\n\n"
	.size	.L.str.45, 110

	.type	.L.str.38,@object               # @.str.38
.L.str.38:
	.asciz	"\tInput file = %s, output file = %s\n"
	.size	.L.str.38, 36

	.type	.L.str.78,@object               # @.str.78
.L.str.78:
	.asciz	"\n%s: I/O or other error, bailing out.  Possible reason follows.\n"
	.size	.L.str.78, 65

	.type	.L.str.77,@object               # @.str.77
.L.str.77:
	.asciz	"bzip2: I'm not configured correctly for this platform!\n\tI require Int32, Int16 and Char to have sizes\n\tof 4, 2 and 1 bytes to run properly, and they don't.\n\tProbably you can fix this by defining them correctly,\n\tand recompiling.  Bye!\n"
	.size	.L.str.77, 236

	.type	.L.str.72,@object               # @.str.72
.L.str.72:
	.asciz	" "
	.size	.L.str.72, 2

	.type	.L.str.71,@object               # @.str.71
.L.str.71:
	.asciz	"\n%s: PANIC -- internal consistency error:\n\t%s\n\tThis is a BUG.  Please report it to me at:\n\tjseward@bzip.org\n"
	.size	.L.str.71, 109

	.type	.L.str.79,@object               # @.str.79
.L.str.79:
	.asciz	"uncompress: bad modes\n"
	.size	.L.str.79, 23

	.type	.L.str.55,@object               # @.str.55
.L.str.55:
	.asciz	"(stdout)"
	.size	.L.str.55, 9

	.type	.L.str.80,@object               # @.str.80
.L.str.80:
	.asciz	".out"
	.size	.L.str.80, 5

	.type	.L.str.57,@object               # @.str.57
.L.str.57:
	.asciz	"%s: Can't open input file %s: %s.\n"
	.size	.L.str.57, 35

	.type	.L.str.60,@object               # @.str.60
.L.str.60:
	.asciz	"%s: Input file %s is not a normal file.\n"
	.size	.L.str.60, 41

	.type	.L.str.81,@object               # @.str.81
.L.str.81:
	.asciz	"%s: Can't guess original name for %s -- using %s\n"
	.size	.L.str.81, 50

	.type	.L.str.61,@object               # @.str.61
.L.str.61:
	.asciz	"%s: Output file %s already exists.\n"
	.size	.L.str.61, 36

	.type	.L.str.63,@object               # @.str.63
.L.str.63:
	.asciz	"s"
	.size	.L.str.63, 2

	.type	.L.str.62,@object               # @.str.62
.L.str.62:
	.asciz	"%s: Input file %s has %d other link%s.\n"
	.size	.L.str.62, 40

	.type	.L.str.67,@object               # @.str.67
.L.str.67:
	.asciz	"wb"
	.size	.L.str.67, 3

	.type	.L.str.68,@object               # @.str.68
.L.str.68:
	.asciz	"%s: Can't create output file %s: %s.\n"
	.size	.L.str.68, 38

	.type	.L.str.84,@object               # @.str.84
.L.str.84:
	.asciz	"uncompress: bad srcMode"
	.size	.L.str.84, 24

	.type	.L.str.85,@object               # @.str.85
.L.str.85:
	.asciz	"done\n"
	.size	.L.str.85, 6

	.type	.L.str.86,@object               # @.str.86
.L.str.86:
	.asciz	"not a bzip2 file.\n"
	.size	.L.str.86, 19

	.type	.L.str.87,@object               # @.str.87
.L.str.87:
	.asciz	"%s: %s is not a bzip2 file.\n"
	.size	.L.str.87, 29

	.type	fileMetaInfo,@object            # @fileMetaInfo
	.local	fileMetaInfo
	.comm	fileMetaInfo,144,8
	.type	.L.str.88,@object               # @.str.88
.L.str.88:
	.asciz	"decompress:bzReadGetUnused"
	.size	.L.str.88, 27

	.type	.L.str.90,@object               # @.str.90
.L.str.90:
	.asciz	"\n%s: %s: trailing garbage after EOF ignored\n"
	.size	.L.str.90, 45

	.type	.L.str.91,@object               # @.str.91
.L.str.91:
	.asciz	"decompress:unexpected error"
	.size	.L.str.91, 28

	.type	.L.str.93,@object               # @.str.93
.L.str.93:
	.asciz	"\n%s: Compressed file ends unexpectedly;\n\tperhaps it is corrupted?  *Possible* reason follows.\n"
	.size	.L.str.93, 95

	.type	.L.str.46,@object               # @.str.46
.L.str.46:
	.asciz	"\nIt is possible that the compressed file(s) have become corrupted.\nYou can use the -tvv option to test integrity of such files.\n\nYou can use the `bzip2recover' program to attempt to recover\ndata from undamaged sections of corrupted files.\n\n"
	.size	.L.str.46, 241

	.type	.L.str.92,@object               # @.str.92
.L.str.92:
	.asciz	"\n%s: Data integrity error when decompressing.\n"
	.size	.L.str.92, 47

	.type	.L.str.53,@object               # @.str.53
.L.str.53:
	.asciz	"compress: bad modes\n"
	.size	.L.str.53, 21

	.type	.L.str.58,@object               # @.str.58
.L.str.58:
	.asciz	"%s: Input file %s already has %s suffix.\n"
	.size	.L.str.58, 42

	.type	.L.str.64,@object               # @.str.64
.L.str.64:
	.asciz	"%s: I won't write compressed data to a terminal.\n"
	.size	.L.str.64, 50

	.type	.L.str.69,@object               # @.str.69
.L.str.69:
	.asciz	"compress: bad srcMode"
	.size	.L.str.69, 22

	.type	.L.str.73,@object               # @.str.73
.L.str.73:
	.asciz	"\n"
	.size	.L.str.73, 2

	.type	.L.str.74,@object               # @.str.74
.L.str.74:
	.asciz	" no data compressed.\n"
	.size	.L.str.74, 22

	.type	.L.str.75,@object               # @.str.75
.L.str.75:
	.asciz	"%6.3f:1, %6.3f bits/byte, %5.2f%% saved, %s in, %s out.\n"
	.size	.L.str.75, 57

	.type	.L.str.76,@object               # @.str.76
.L.str.76:
	.asciz	"compress:unexpected error"
	.size	.L.str.76, 26

	.type	.L.str.52,@object               # @.str.52
.L.str.52:
	.asciz	"\n%s: Control-C or similar caught, quitting.\n"
	.size	.L.str.52, 45

	.type	.L.str.51,@object               # @.str.51
.L.str.51:
	.asciz	"%s: %s is redundant in versions 0.9.5 and above\n"
	.size	.L.str.51, 49

	.type	.L.str.50,@object               # @.str.50
.L.str.50:
	.asciz	"bzip2, a block-sorting file compressor.  Version %s.\n\n   usage: %s [flags and input files in any order]\n\n   -h --help           print this message\n   -d --decompress     force decompression\n   -z --compress       force compression\n   -k --keep           keep (don't delete) input files\n   -f --force          overwrite existing output files\n   -t --test           test compressed file integrity\n   -c --stdout         output to standard out\n   -q --quiet          suppress noncritical error messages\n   -v --verbose        be verbose (a 2nd -v gives more)\n   -L --license        display software version & license\n   -V --version        display software version & license\n   -s --small          use less memory (at most 2500k)\n   -1 .. -9            set block size to 100k .. 900k\n   --fast              alias for -1\n   --best              alias for -9\n\n   If invoked as `bzip2', default action is to compress.\n              as `bunzip2',  default action is to decompress.\n              as `bzcat', default action is to decompress to stdout.\n\n   If no file names are given, bzip2 compresses or decompresses\n   from standard input to standard output.  You can combine\n   short flags, so `-v -4' means the same as -v4 or -4v, &c.\n\n"
	.size	.L.str.50, 1230

	.type	.L.str.49,@object               # @.str.49
.L.str.49:
	.asciz	"bzip2, a block-sorting file compressor.  Version %s.\n   \n   Copyright (C) 1996-2006 by Julian Seward.\n   \n   This program is free software; you can redistribute it and/or modify\n   it under the terms set out in the LICENSE file, which is included\n   in the bzip2-1.0.4 source distribution.\n   \n   This program is distributed in the hope that it will be useful,\n   but WITHOUT ANY WARRANTY; without even the implied warranty of\n   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n   LICENSE file for more details.\n   \n"
	.size	.L.str.49, 531

	.type	.L.str.47,@object               # @.str.47
.L.str.47:
	.asciz	"bzip2: file name\n`%s'\nis suspiciously (more than %d chars) long.\nTry using a reasonable file name instead.  Sorry! :-)\n"
	.size	.L.str.47, 120

	.type	.L.str.36,@object               # @.str.36
.L.str.36:
	.asciz	"\n%s: Caught a SIGSEGV or SIGBUS whilst compressing.\n\n   Possible causes are (most likely first):\n   (1) This computer has unreliable memory or cache hardware\n       (a surprisingly common problem; try a different machine.)\n   (2) A bug in the compiler used to create this executable\n       (unlikely, if you didn't compile bzip2 yourself.)\n   (3) A real bug in bzip2 -- I hope this should never be the case.\n   The user's manual, Section 4.3, has more info on (1) and (2).\n   \n   If you suspect this is a bug in bzip2, or are unsure about (1)\n   or (2), feel free to report it to me at: jseward@bzip.org.\n   Section 4.3 of the user's manual describes the info a useful\n   bug report should have.  If the manual is available on your\n   system, please try and read it before mailing me.  If you don't\n   have the manual or can't be bothered to read it, mail me anyway.\n\n"
	.size	.L.str.36, 869

	.type	.L.str.37,@object               # @.str.37
.L.str.37:
	.asciz	"\n%s: Caught a SIGSEGV or SIGBUS whilst decompressing.\n\n   Possible causes are (most likely first):\n   (1) The compressed data is corrupted, and bzip2's usual checks\n       failed to detect this.  Try bzip2 -tvv my_file.bz2.\n   (2) This computer has unreliable memory or cache hardware\n       (a surprisingly common problem; try a different machine.)\n   (3) A bug in the compiler used to create this executable\n       (unlikely, if you didn't compile bzip2 yourself.)\n   (4) A real bug in bzip2 -- I hope this should never be the case.\n   The user's manual, Section 4.3, has more info on (2) and (3).\n   \n   If you suspect this is a bug in bzip2, or are unsure about (2)\n   or (3), feel free to report it to me at: jseward@bzip.org.\n   Section 4.3 of the user's manual describes the info a useful\n   bug report should have.  If the manual is available on your\n   system, please try and read it before mailing me.  If you don't\n   have the manual or can't be bothered to read it, mail me anyway.\n\n"
	.size	.L.str.37, 996

	.type	.L.str.105,@object              # @.str.105
.L.str.105:
	.asciz	"\n\nbzip2/libbzip2: internal error number %d.\nThis is a bug in bzip2/libbzip2, %s.\nPlease report it to me at: jseward@bzip.org.  If this happened\nwhen you were using some program which uses libbzip2 as a\ncomponent, you should also report this bug to the author(s)\nof that program.  Please make an effort to report this bug;\ntimely and accurate bug reports eventually lead to higher\nquality software.  Thanks.  Julian Seward, 15 February 2005.\n\n"
	.size	.L.str.105, 443

	.type	.L.str.1.106,@object            # @.str.1.106
.L.str.1.106:
	.asciz	"\n*** A special note about internal error number 1007 ***\n\nExperience suggests that a common cause of i.e. 1007\nis unreliable memory or other hardware.  The 1007 assertion\njust happens to cross-check the results of huge numbers of\nmemory reads/writes, and so acts (unintendedly) as a stress\ntest of your memory system.\n\nI suggest the following: try compressing the file again,\npossibly monitoring progress in detail with the -vv flag.\n\n* If the error cannot be reproduced, and/or happens at different\n  points in compression, you may have a flaky memory system.\n  Try a memory-test program.  I have used Memtest86\n  (www.memtest86.com).  At the time of writing it is free (GPLd).\n  Memtest86 tests memory much more thorougly than your BIOSs\n  power-on test, and may find failures that the BIOS doesn't.\n\n* If the error can be repeatably reproduced, this is a bug in\n  bzip2, and I would very much like to hear about it.  Please\n  let me know, and, ideally, save a copy of the file causing the\n  problem -- without which I will be unable to investigate it.\n\n"
	.size	.L.str.1.106, 1057

	.type	.L.str.5.107,@object            # @.str.5.107
.L.str.5.107:
	.asciz	"1.0.4, 20-Dec-2006"
	.size	.L.str.5.107, 19

	.type	.L.str.2.108,@object            # @.str.2.108
.L.str.2.108:
	.asciz	" {0x%08x, 0x%08x}"
	.size	.L.str.2.108, 18

	.type	.L.str.3.109,@object            # @.str.3.109
.L.str.3.109:
	.asciz	"]"
	.size	.L.str.3.109, 2

	.type	.L.str.4.110,@object            # @.str.4.110
.L.str.4.110:
	.asciz	"\n    combined CRCs: stored = 0x%08x, computed = 0x%08x"
	.size	.L.str.4.110, 55

	.type	.L.str.6.126,@object            # @.str.6.126
.L.str.6.126:
	.asciz	"w"
	.size	.L.str.6.126, 2

	.type	.L.str.7.127,@object            # @.str.7.127
.L.str.7.127:
	.asciz	"r"
	.size	.L.str.7.127, 2

	.type	.L.str.8.128,@object            # @.str.8.128
.L.str.8.128:
	.asciz	"b"
	.size	.L.str.8.128, 2

	.type	.L.str.9.129,@object            # @.str.9.129
.L.str.9.129:
	.zero	1
	.size	.L.str.9.129, 1

	.type	bzerrorstrings,@object          # @bzerrorstrings
	.data
	.p2align	4
bzerrorstrings:
	.quad	.L.str.10.130
	.quad	.L.str.11.131
	.quad	.L.str.12.132
	.quad	.L.str.13.133
	.quad	.L.str.14.134
	.quad	.L.str.15.135
	.quad	.L.str.16.136
	.quad	.L.str.17.137
	.quad	.L.str.18.138
	.quad	.L.str.19.139
	.quad	.L.str.20.140
	.quad	.L.str.20.140
	.quad	.L.str.20.140
	.quad	.L.str.20.140
	.quad	.L.str.20.140
	.quad	.L.str.20.140
	.size	bzerrorstrings, 128

	.type	.L.str.10.130,@object           # @.str.10.130
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.10.130:
	.asciz	"OK"
	.size	.L.str.10.130, 3

	.type	.L.str.11.131,@object           # @.str.11.131
.L.str.11.131:
	.asciz	"SEQUENCE_ERROR"
	.size	.L.str.11.131, 15

	.type	.L.str.12.132,@object           # @.str.12.132
.L.str.12.132:
	.asciz	"PARAM_ERROR"
	.size	.L.str.12.132, 12

	.type	.L.str.13.133,@object           # @.str.13.133
.L.str.13.133:
	.asciz	"MEM_ERROR"
	.size	.L.str.13.133, 10

	.type	.L.str.14.134,@object           # @.str.14.134
.L.str.14.134:
	.asciz	"DATA_ERROR"
	.size	.L.str.14.134, 11

	.type	.L.str.15.135,@object           # @.str.15.135
.L.str.15.135:
	.asciz	"DATA_ERROR_MAGIC"
	.size	.L.str.15.135, 17

	.type	.L.str.16.136,@object           # @.str.16.136
.L.str.16.136:
	.asciz	"IO_ERROR"
	.size	.L.str.16.136, 9

	.type	.L.str.17.137,@object           # @.str.17.137
.L.str.17.137:
	.asciz	"UNEXPECTED_EOF"
	.size	.L.str.17.137, 15

	.type	.L.str.18.138,@object           # @.str.18.138
.L.str.18.138:
	.asciz	"OUTBUFF_FULL"
	.size	.L.str.18.138, 13

	.type	.L.str.19.139,@object           # @.str.19.139
.L.str.19.139:
	.asciz	"CONFIG_ERROR"
	.size	.L.str.19.139, 13

	.type	.L.str.20.140,@object           # @.str.20.140
.L.str.20.140:
	.asciz	"???"
	.size	.L.str.20.140, 4

	.type	.L.str.143,@object              # @.str.143
.L.str.143:
	.asciz	"    block %d: crc = 0x%08x, combined CRC = 0x%08x, size = %d\n"
	.size	.L.str.143, 62

	.type	.L.str.1.144,@object            # @.str.1.144
.L.str.1.144:
	.asciz	"    final combined CRC = 0x%08x\n   "
	.size	.L.str.1.144, 36

	.type	.L.str.2.145,@object            # @.str.2.145
.L.str.2.145:
	.asciz	"      %d in block, %d after MTF & 1-2 coding, %d+2 syms in use\n"
	.size	.L.str.2.145, 64

	.type	.L.str.3.146,@object            # @.str.3.146
.L.str.3.146:
	.asciz	"      initial group %d, [%d .. %d], has %d syms (%4.1f%%)\n"
	.size	.L.str.3.146, 59

	.type	.L.str.4.147,@object            # @.str.4.147
.L.str.4.147:
	.asciz	"      pass %d: size is %d, grp uses are "
	.size	.L.str.4.147, 41

	.type	.L.str.5.148,@object            # @.str.5.148
.L.str.5.148:
	.asciz	"%d "
	.size	.L.str.5.148, 4

	.type	.L.str.6.149,@object            # @.str.6.149
.L.str.6.149:
	.asciz	"\n"
	.size	.L.str.6.149, 2

	.type	.L.str.7.150,@object            # @.str.7.150
.L.str.7.150:
	.asciz	"      bytes: mapping %d, "
	.size	.L.str.7.150, 26

	.type	.L.str.8.151,@object            # @.str.8.151
.L.str.8.151:
	.asciz	"selectors %d, "
	.size	.L.str.8.151, 15

	.type	.L.str.9.152,@object            # @.str.9.152
.L.str.9.152:
	.asciz	"code lengths %d, "
	.size	.L.str.9.152, 18

	.type	.L.str.10.153,@object           # @.str.10.153
.L.str.10.153:
	.asciz	"codes %d\n"
	.size	.L.str.10.153, 10

	.type	BZ2_crc32Table,@object          # @BZ2_crc32Table
	.data
	.globl	BZ2_crc32Table
	.p2align	4
BZ2_crc32Table:
	.long	0                               # 0x0
	.long	79764919                        # 0x4c11db7
	.long	159529838                       # 0x9823b6e
	.long	222504665                       # 0xd4326d9
	.long	319059676                       # 0x130476dc
	.long	398814059                       # 0x17c56b6b
	.long	445009330                       # 0x1a864db2
	.long	507990021                       # 0x1e475005
	.long	638119352                       # 0x2608edb8
	.long	583659535                       # 0x22c9f00f
	.long	797628118                       # 0x2f8ad6d6
	.long	726387553                       # 0x2b4bcb61
	.long	890018660                       # 0x350c9b64
	.long	835552979                       # 0x31cd86d3
	.long	1015980042                      # 0x3c8ea00a
	.long	944750013                       # 0x384fbdbd
	.long	1276238704                      # 0x4c11db70
	.long	1221641927                      # 0x48d0c6c7
	.long	1167319070                      # 0x4593e01e
	.long	1095957929                      # 0x4152fda9
	.long	1595256236                      # 0x5f15adac
	.long	1540665371                      # 0x5bd4b01b
	.long	1452775106                      # 0x569796c2
	.long	1381403509                      # 0x52568b75
	.long	1780037320                      # 0x6a1936c8
	.long	1859660671                      # 0x6ed82b7f
	.long	1671105958                      # 0x639b0da6
	.long	1733955601                      # 0x675a1011
	.long	2031960084                      # 0x791d4014
	.long	2111593891                      # 0x7ddc5da3
	.long	1889500026                      # 0x709f7b7a
	.long	1952343757                      # 0x745e66cd
	.long	2552477408                      # 0x9823b6e0
	.long	2632100695                      # 0x9ce2ab57
	.long	2443283854                      # 0x91a18d8e
	.long	2506133561                      # 0x95609039
	.long	2334638140                      # 0x8b27c03c
	.long	2414271883                      # 0x8fe6dd8b
	.long	2191915858                      # 0x82a5fb52
	.long	2254759653                      # 0x8664e6e5
	.long	3190512472                      # 0xbe2b5b58
	.long	3135915759                      # 0xbaea46ef
	.long	3081330742                      # 0xb7a96036
	.long	3009969537                      # 0xb3687d81
	.long	2905550212                      # 0xad2f2d84
	.long	2850959411                      # 0xa9ee3033
	.long	2762807018                      # 0xa4ad16ea
	.long	2691435357                      # 0xa06c0b5d
	.long	3560074640                      # 0xd4326d90
	.long	3505614887                      # 0xd0f37027
	.long	3719321342                      # 0xddb056fe
	.long	3648080713                      # 0xd9714b49
	.long	3342211916                      # 0xc7361b4c
	.long	3287746299                      # 0xc3f706fb
	.long	3467911202                      # 0xceb42022
	.long	3396681109                      # 0xca753d95
	.long	4063920168                      # 0xf23a8028
	.long	4143685023                      # 0xf6fb9d9f
	.long	4223187782                      # 0xfbb8bb46
	.long	4286162673                      # 0xff79a6f1
	.long	3779000052                      # 0xe13ef6f4
	.long	3858754371                      # 0xe5ffeb43
	.long	3904687514                      # 0xe8bccd9a
	.long	3967668269                      # 0xec7dd02d
	.long	881225847                       # 0x34867077
	.long	809987520                       # 0x30476dc0
	.long	1023691545                      # 0x3d044b19
	.long	969234094                       # 0x39c556ae
	.long	662832811                       # 0x278206ab
	.long	591600412                       # 0x23431b1c
	.long	771767749                       # 0x2e003dc5
	.long	717299826                       # 0x2ac12072
	.long	311336399                       # 0x128e9dcf
	.long	374308984                       # 0x164f8078
	.long	453813921                       # 0x1b0ca6a1
	.long	533576470                       # 0x1fcdbb16
	.long	25881363                        # 0x18aeb13
	.long	88864420                        # 0x54bf6a4
	.long	134795389                       # 0x808d07d
	.long	214552010                       # 0xcc9cdca
	.long	2023205639                      # 0x7897ab07
	.long	2086057648                      # 0x7c56b6b0
	.long	1897238633                      # 0x71159069
	.long	1976864222                      # 0x75d48dde
	.long	1804852699                      # 0x6b93dddb
	.long	1867694188                      # 0x6f52c06c
	.long	1645340341                      # 0x6211e6b5
	.long	1724971778                      # 0x66d0fb02
	.long	1587496639                      # 0x5e9f46bf
	.long	1516133128                      # 0x5a5e5b08
	.long	1461550545                      # 0x571d7dd1
	.long	1406951526                      # 0x53dc6066
	.long	1302016099                      # 0x4d9b3063
	.long	1230646740                      # 0x495a2dd4
	.long	1142491917                      # 0x44190b0d
	.long	1087903418                      # 0x40d816ba
	.long	2896545431                      # 0xaca5c697
	.long	2825181984                      # 0xa864db20
	.long	2770861561                      # 0xa527fdf9
	.long	2716262478                      # 0xa1e6e04e
	.long	3215044683                      # 0xbfa1b04b
	.long	3143675388                      # 0xbb60adfc
	.long	3055782693                      # 0xb6238b25
	.long	3001194130                      # 0xb2e29692
	.long	2326604591                      # 0x8aad2b2f
	.long	2389456536                      # 0x8e6c3698
	.long	2200899649                      # 0x832f1041
	.long	2280525302                      # 0x87ee0df6
	.long	2578013683                      # 0x99a95df3
	.long	2640855108                      # 0x9d684044
	.long	2418763421                      # 0x902b669d
	.long	2498394922                      # 0x94ea7b2a
	.long	3769900519                      # 0xe0b41de7
	.long	3832873040                      # 0xe4750050
	.long	3912640137                      # 0xe9362689
	.long	3992402750                      # 0xedf73b3e
	.long	4088425275                      # 0xf3b06b3b
	.long	4151408268                      # 0xf771768c
	.long	4197601365                      # 0xfa325055
	.long	4277358050                      # 0xfef34de2
	.long	3334271071                      # 0xc6bcf05f
	.long	3263032808                      # 0xc27dede8
	.long	3476998961                      # 0xcf3ecb31
	.long	3422541446                      # 0xcbffd686
	.long	3585640067                      # 0xd5b88683
	.long	3514407732                      # 0xd1799b34
	.long	3694837229                      # 0xdc3abded
	.long	3640369242                      # 0xd8fba05a
	.long	1762451694                      # 0x690ce0ee
	.long	1842216281                      # 0x6dcdfd59
	.long	1619975040                      # 0x608edb80
	.long	1682949687                      # 0x644fc637
	.long	2047383090                      # 0x7a089632
	.long	2127137669                      # 0x7ec98b85
	.long	1938468188                      # 0x738aad5c
	.long	2001449195                      # 0x774bb0eb
	.long	1325665622                      # 0x4f040d56
	.long	1271206113                      # 0x4bc510e1
	.long	1183200824                      # 0x46863638
	.long	1111960463                      # 0x42472b8f
	.long	1543535498                      # 0x5c007b8a
	.long	1489069629                      # 0x58c1663d
	.long	1434599652                      # 0x558240e4
	.long	1363369299                      # 0x51435d53
	.long	622672798                       # 0x251d3b9e
	.long	568075817                       # 0x21dc2629
	.long	748617968                       # 0x2c9f00f0
	.long	677256519                       # 0x285e1d47
	.long	907627842                       # 0x36194d42
	.long	853037301                       # 0x32d850f5
	.long	1067152940                      # 0x3f9b762c
	.long	995781531                       # 0x3b5a6b9b
	.long	51762726                        # 0x315d626
	.long	131386257                       # 0x7d4cb91
	.long	177728840                       # 0xa97ed48
	.long	240578815                       # 0xe56f0ff
	.long	269590778                       # 0x1011a0fa
	.long	349224269                       # 0x14d0bd4d
	.long	429104020                       # 0x19939b94
	.long	491947555                       # 0x1d528623
	.long	4046411278                      # 0xf12f560e
	.long	4126034873                      # 0xf5ee4bb9
	.long	4172115296                      # 0xf8ad6d60
	.long	4234965207                      # 0xfc6c70d7
	.long	3794477266                      # 0xe22b20d2
	.long	3874110821                      # 0xe6ea3d65
	.long	3953728444                      # 0xeba91bbc
	.long	4016571915                      # 0xef68060b
	.long	3609705398                      # 0xd727bbb6
	.long	3555108353                      # 0xd3e6a601
	.long	3735388376                      # 0xdea580d8
	.long	3664026991                      # 0xda649d6f
	.long	3290680682                      # 0xc423cd6a
	.long	3236090077                      # 0xc0e2d0dd
	.long	3449943556                      # 0xcda1f604
	.long	3378572211                      # 0xc960ebb3
	.long	3174993278                      # 0xbd3e8d7e
	.long	3120533705                      # 0xb9ff90c9
	.long	3032266256                      # 0xb4bcb610
	.long	2961025959                      # 0xb07daba7
	.long	2923101090                      # 0xae3afba2
	.long	2868635157                      # 0xaafbe615
	.long	2813903052                      # 0xa7b8c0cc
	.long	2742672763                      # 0xa379dd7b
	.long	2604032198                      # 0x9b3660c6
	.long	2683796849                      # 0x9ff77d71
	.long	2461293480                      # 0x92b45ba8
	.long	2524268063                      # 0x9675461f
	.long	2284983834                      # 0x8832161a
	.long	2364738477                      # 0x8cf30bad
	.long	2175806836                      # 0x81b02d74
	.long	2238787779                      # 0x857130c3
	.long	1569362073                      # 0x5d8a9099
	.long	1498123566                      # 0x594b8d2e
	.long	1409854455                      # 0x5408abf7
	.long	1355396672                      # 0x50c9b640
	.long	1317987909                      # 0x4e8ee645
	.long	1246755826                      # 0x4a4ffbf2
	.long	1192025387                      # 0x470cdd2b
	.long	1137557660                      # 0x43cdc09c
	.long	2072149281                      # 0x7b827d21
	.long	2135122070                      # 0x7f436096
	.long	1912620623                      # 0x7200464f
	.long	1992383480                      # 0x76c15bf8
	.long	1753615357                      # 0x68860bfd
	.long	1816598090                      # 0x6c47164a
	.long	1627664531                      # 0x61043093
	.long	1707420964                      # 0x65c52d24
	.long	295390185                       # 0x119b4be9
	.long	358241886                       # 0x155a565e
	.long	404320391                       # 0x18197087
	.long	483945776                       # 0x1cd86d30
	.long	43990325                        # 0x29f3d35
	.long	106832002                       # 0x65e2082
	.long	186451547                       # 0xb1d065b
	.long	266083308                       # 0xfdc1bec
	.long	932423249                       # 0x3793a651
	.long	861060070                       # 0x3352bbe6
	.long	1041341759                      # 0x3e119d3f
	.long	986742920                       # 0x3ad08088
	.long	613929101                       # 0x2497d08d
	.long	542559546                       # 0x2056cd3a
	.long	756411363                       # 0x2d15ebe3
	.long	701822548                       # 0x29d4f654
	.long	3316196985                      # 0xc5a92679
	.long	3244833742                      # 0xc1683bce
	.long	3425377559                      # 0xcc2b1d17
	.long	3370778784                      # 0xc8ea00a0
	.long	3601682597                      # 0xd6ad50a5
	.long	3530312978                      # 0xd26c4d12
	.long	3744426955                      # 0xdf2f6bcb
	.long	3689838204                      # 0xdbee767c
	.long	3819031489                      # 0xe3a1cbc1
	.long	3881883254                      # 0xe760d676
	.long	3928223919                      # 0xea23f0af
	.long	4007849240                      # 0xeee2ed18
	.long	4037393693                      # 0xf0a5bd1d
	.long	4100235434                      # 0xf464a0aa
	.long	4180117107                      # 0xf9278673
	.long	4259748804                      # 0xfde69bc4
	.long	2310601993                      # 0x89b8fd09
	.long	2373574846                      # 0x8d79e0be
	.long	2151335527                      # 0x803ac667
	.long	2231098320                      # 0x84fbdbd0
	.long	2596047829                      # 0x9abc8bd5
	.long	2659030626                      # 0x9e7d9662
	.long	2470359227                      # 0x933eb0bb
	.long	2550115596                      # 0x97ffad0c
	.long	2947551409                      # 0xafb010b1
	.long	2876312838                      # 0xab710d06
	.long	2788305887                      # 0xa6322bdf
	.long	2733848168                      # 0xa2f33668
	.long	3165939309                      # 0xbcb4666d
	.long	3094707162                      # 0xb8757bda
	.long	3040238851                      # 0xb5365d03
	.long	2985771188                      # 0xb1f740b4
	.size	BZ2_crc32Table, 1024

	.type	.L.str.158,@object              # @.str.158
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.158:
	.asciz	"\n    [%d: huff+mtf "
	.size	.L.str.158, 20

	.type	.L.str.1.159,@object            # @.str.1.159
.L.str.1.159:
	.asciz	"rt+rld"
	.size	.L.str.1.159, 7

	.type	.L.str.166,@object              # @.str.166
.L.str.166:
	.asciz	"_finfo_dataset"
	.size	.L.str.166, 15

	.type	.L.str.1.167,@object            # @.str.1.167
.L.str.1.167:
	.asciz	"rt"
	.size	.L.str.1.167, 3

	.type	.L.str.2.168,@object            # @.str.2.168
.L.str.2.168:
	.asciz	"\nError: Can't find dataset!\n"
	.size	.L.str.2.168, 29

	.type	.L.str.3.169,@object            # @.str.3.169
.L.str.3.169:
	.asciz	"%ld"
	.size	.L.str.3.169, 4

	.type	BZ2_rNums,@object               # @BZ2_rNums
	.data
	.globl	BZ2_rNums
	.p2align	4
BZ2_rNums:
	.long	619                             # 0x26b
	.long	720                             # 0x2d0
	.long	127                             # 0x7f
	.long	481                             # 0x1e1
	.long	931                             # 0x3a3
	.long	816                             # 0x330
	.long	813                             # 0x32d
	.long	233                             # 0xe9
	.long	566                             # 0x236
	.long	247                             # 0xf7
	.long	985                             # 0x3d9
	.long	724                             # 0x2d4
	.long	205                             # 0xcd
	.long	454                             # 0x1c6
	.long	863                             # 0x35f
	.long	491                             # 0x1eb
	.long	741                             # 0x2e5
	.long	242                             # 0xf2
	.long	949                             # 0x3b5
	.long	214                             # 0xd6
	.long	733                             # 0x2dd
	.long	859                             # 0x35b
	.long	335                             # 0x14f
	.long	708                             # 0x2c4
	.long	621                             # 0x26d
	.long	574                             # 0x23e
	.long	73                              # 0x49
	.long	654                             # 0x28e
	.long	730                             # 0x2da
	.long	472                             # 0x1d8
	.long	419                             # 0x1a3
	.long	436                             # 0x1b4
	.long	278                             # 0x116
	.long	496                             # 0x1f0
	.long	867                             # 0x363
	.long	210                             # 0xd2
	.long	399                             # 0x18f
	.long	680                             # 0x2a8
	.long	480                             # 0x1e0
	.long	51                              # 0x33
	.long	878                             # 0x36e
	.long	465                             # 0x1d1
	.long	811                             # 0x32b
	.long	169                             # 0xa9
	.long	869                             # 0x365
	.long	675                             # 0x2a3
	.long	611                             # 0x263
	.long	697                             # 0x2b9
	.long	867                             # 0x363
	.long	561                             # 0x231
	.long	862                             # 0x35e
	.long	687                             # 0x2af
	.long	507                             # 0x1fb
	.long	283                             # 0x11b
	.long	482                             # 0x1e2
	.long	129                             # 0x81
	.long	807                             # 0x327
	.long	591                             # 0x24f
	.long	733                             # 0x2dd
	.long	623                             # 0x26f
	.long	150                             # 0x96
	.long	238                             # 0xee
	.long	59                              # 0x3b
	.long	379                             # 0x17b
	.long	684                             # 0x2ac
	.long	877                             # 0x36d
	.long	625                             # 0x271
	.long	169                             # 0xa9
	.long	643                             # 0x283
	.long	105                             # 0x69
	.long	170                             # 0xaa
	.long	607                             # 0x25f
	.long	520                             # 0x208
	.long	932                             # 0x3a4
	.long	727                             # 0x2d7
	.long	476                             # 0x1dc
	.long	693                             # 0x2b5
	.long	425                             # 0x1a9
	.long	174                             # 0xae
	.long	647                             # 0x287
	.long	73                              # 0x49
	.long	122                             # 0x7a
	.long	335                             # 0x14f
	.long	530                             # 0x212
	.long	442                             # 0x1ba
	.long	853                             # 0x355
	.long	695                             # 0x2b7
	.long	249                             # 0xf9
	.long	445                             # 0x1bd
	.long	515                             # 0x203
	.long	909                             # 0x38d
	.long	545                             # 0x221
	.long	703                             # 0x2bf
	.long	919                             # 0x397
	.long	874                             # 0x36a
	.long	474                             # 0x1da
	.long	882                             # 0x372
	.long	500                             # 0x1f4
	.long	594                             # 0x252
	.long	612                             # 0x264
	.long	641                             # 0x281
	.long	801                             # 0x321
	.long	220                             # 0xdc
	.long	162                             # 0xa2
	.long	819                             # 0x333
	.long	984                             # 0x3d8
	.long	589                             # 0x24d
	.long	513                             # 0x201
	.long	495                             # 0x1ef
	.long	799                             # 0x31f
	.long	161                             # 0xa1
	.long	604                             # 0x25c
	.long	958                             # 0x3be
	.long	533                             # 0x215
	.long	221                             # 0xdd
	.long	400                             # 0x190
	.long	386                             # 0x182
	.long	867                             # 0x363
	.long	600                             # 0x258
	.long	782                             # 0x30e
	.long	382                             # 0x17e
	.long	596                             # 0x254
	.long	414                             # 0x19e
	.long	171                             # 0xab
	.long	516                             # 0x204
	.long	375                             # 0x177
	.long	682                             # 0x2aa
	.long	485                             # 0x1e5
	.long	911                             # 0x38f
	.long	276                             # 0x114
	.long	98                              # 0x62
	.long	553                             # 0x229
	.long	163                             # 0xa3
	.long	354                             # 0x162
	.long	666                             # 0x29a
	.long	933                             # 0x3a5
	.long	424                             # 0x1a8
	.long	341                             # 0x155
	.long	533                             # 0x215
	.long	870                             # 0x366
	.long	227                             # 0xe3
	.long	730                             # 0x2da
	.long	475                             # 0x1db
	.long	186                             # 0xba
	.long	263                             # 0x107
	.long	647                             # 0x287
	.long	537                             # 0x219
	.long	686                             # 0x2ae
	.long	600                             # 0x258
	.long	224                             # 0xe0
	.long	469                             # 0x1d5
	.long	68                              # 0x44
	.long	770                             # 0x302
	.long	919                             # 0x397
	.long	190                             # 0xbe
	.long	373                             # 0x175
	.long	294                             # 0x126
	.long	822                             # 0x336
	.long	808                             # 0x328
	.long	206                             # 0xce
	.long	184                             # 0xb8
	.long	943                             # 0x3af
	.long	795                             # 0x31b
	.long	384                             # 0x180
	.long	383                             # 0x17f
	.long	461                             # 0x1cd
	.long	404                             # 0x194
	.long	758                             # 0x2f6
	.long	839                             # 0x347
	.long	887                             # 0x377
	.long	715                             # 0x2cb
	.long	67                              # 0x43
	.long	618                             # 0x26a
	.long	276                             # 0x114
	.long	204                             # 0xcc
	.long	918                             # 0x396
	.long	873                             # 0x369
	.long	777                             # 0x309
	.long	604                             # 0x25c
	.long	560                             # 0x230
	.long	951                             # 0x3b7
	.long	160                             # 0xa0
	.long	578                             # 0x242
	.long	722                             # 0x2d2
	.long	79                              # 0x4f
	.long	804                             # 0x324
	.long	96                              # 0x60
	.long	409                             # 0x199
	.long	713                             # 0x2c9
	.long	940                             # 0x3ac
	.long	652                             # 0x28c
	.long	934                             # 0x3a6
	.long	970                             # 0x3ca
	.long	447                             # 0x1bf
	.long	318                             # 0x13e
	.long	353                             # 0x161
	.long	859                             # 0x35b
	.long	672                             # 0x2a0
	.long	112                             # 0x70
	.long	785                             # 0x311
	.long	645                             # 0x285
	.long	863                             # 0x35f
	.long	803                             # 0x323
	.long	350                             # 0x15e
	.long	139                             # 0x8b
	.long	93                              # 0x5d
	.long	354                             # 0x162
	.long	99                              # 0x63
	.long	820                             # 0x334
	.long	908                             # 0x38c
	.long	609                             # 0x261
	.long	772                             # 0x304
	.long	154                             # 0x9a
	.long	274                             # 0x112
	.long	580                             # 0x244
	.long	184                             # 0xb8
	.long	79                              # 0x4f
	.long	626                             # 0x272
	.long	630                             # 0x276
	.long	742                             # 0x2e6
	.long	653                             # 0x28d
	.long	282                             # 0x11a
	.long	762                             # 0x2fa
	.long	623                             # 0x26f
	.long	680                             # 0x2a8
	.long	81                              # 0x51
	.long	927                             # 0x39f
	.long	626                             # 0x272
	.long	789                             # 0x315
	.long	125                             # 0x7d
	.long	411                             # 0x19b
	.long	521                             # 0x209
	.long	938                             # 0x3aa
	.long	300                             # 0x12c
	.long	821                             # 0x335
	.long	78                              # 0x4e
	.long	343                             # 0x157
	.long	175                             # 0xaf
	.long	128                             # 0x80
	.long	250                             # 0xfa
	.long	170                             # 0xaa
	.long	774                             # 0x306
	.long	972                             # 0x3cc
	.long	275                             # 0x113
	.long	999                             # 0x3e7
	.long	639                             # 0x27f
	.long	495                             # 0x1ef
	.long	78                              # 0x4e
	.long	352                             # 0x160
	.long	126                             # 0x7e
	.long	857                             # 0x359
	.long	956                             # 0x3bc
	.long	358                             # 0x166
	.long	619                             # 0x26b
	.long	580                             # 0x244
	.long	124                             # 0x7c
	.long	737                             # 0x2e1
	.long	594                             # 0x252
	.long	701                             # 0x2bd
	.long	612                             # 0x264
	.long	669                             # 0x29d
	.long	112                             # 0x70
	.long	134                             # 0x86
	.long	694                             # 0x2b6
	.long	363                             # 0x16b
	.long	992                             # 0x3e0
	.long	809                             # 0x329
	.long	743                             # 0x2e7
	.long	168                             # 0xa8
	.long	974                             # 0x3ce
	.long	944                             # 0x3b0
	.long	375                             # 0x177
	.long	748                             # 0x2ec
	.long	52                              # 0x34
	.long	600                             # 0x258
	.long	747                             # 0x2eb
	.long	642                             # 0x282
	.long	182                             # 0xb6
	.long	862                             # 0x35e
	.long	81                              # 0x51
	.long	344                             # 0x158
	.long	805                             # 0x325
	.long	988                             # 0x3dc
	.long	739                             # 0x2e3
	.long	511                             # 0x1ff
	.long	655                             # 0x28f
	.long	814                             # 0x32e
	.long	334                             # 0x14e
	.long	249                             # 0xf9
	.long	515                             # 0x203
	.long	897                             # 0x381
	.long	955                             # 0x3bb
	.long	664                             # 0x298
	.long	981                             # 0x3d5
	.long	649                             # 0x289
	.long	113                             # 0x71
	.long	974                             # 0x3ce
	.long	459                             # 0x1cb
	.long	893                             # 0x37d
	.long	228                             # 0xe4
	.long	433                             # 0x1b1
	.long	837                             # 0x345
	.long	553                             # 0x229
	.long	268                             # 0x10c
	.long	926                             # 0x39e
	.long	240                             # 0xf0
	.long	102                             # 0x66
	.long	654                             # 0x28e
	.long	459                             # 0x1cb
	.long	51                              # 0x33
	.long	686                             # 0x2ae
	.long	754                             # 0x2f2
	.long	806                             # 0x326
	.long	760                             # 0x2f8
	.long	493                             # 0x1ed
	.long	403                             # 0x193
	.long	415                             # 0x19f
	.long	394                             # 0x18a
	.long	687                             # 0x2af
	.long	700                             # 0x2bc
	.long	946                             # 0x3b2
	.long	670                             # 0x29e
	.long	656                             # 0x290
	.long	610                             # 0x262
	.long	738                             # 0x2e2
	.long	392                             # 0x188
	.long	760                             # 0x2f8
	.long	799                             # 0x31f
	.long	887                             # 0x377
	.long	653                             # 0x28d
	.long	978                             # 0x3d2
	.long	321                             # 0x141
	.long	576                             # 0x240
	.long	617                             # 0x269
	.long	626                             # 0x272
	.long	502                             # 0x1f6
	.long	894                             # 0x37e
	.long	679                             # 0x2a7
	.long	243                             # 0xf3
	.long	440                             # 0x1b8
	.long	680                             # 0x2a8
	.long	879                             # 0x36f
	.long	194                             # 0xc2
	.long	572                             # 0x23c
	.long	640                             # 0x280
	.long	724                             # 0x2d4
	.long	926                             # 0x39e
	.long	56                              # 0x38
	.long	204                             # 0xcc
	.long	700                             # 0x2bc
	.long	707                             # 0x2c3
	.long	151                             # 0x97
	.long	457                             # 0x1c9
	.long	449                             # 0x1c1
	.long	797                             # 0x31d
	.long	195                             # 0xc3
	.long	791                             # 0x317
	.long	558                             # 0x22e
	.long	945                             # 0x3b1
	.long	679                             # 0x2a7
	.long	297                             # 0x129
	.long	59                              # 0x3b
	.long	87                              # 0x57
	.long	824                             # 0x338
	.long	713                             # 0x2c9
	.long	663                             # 0x297
	.long	412                             # 0x19c
	.long	693                             # 0x2b5
	.long	342                             # 0x156
	.long	606                             # 0x25e
	.long	134                             # 0x86
	.long	108                             # 0x6c
	.long	571                             # 0x23b
	.long	364                             # 0x16c
	.long	631                             # 0x277
	.long	212                             # 0xd4
	.long	174                             # 0xae
	.long	643                             # 0x283
	.long	304                             # 0x130
	.long	329                             # 0x149
	.long	343                             # 0x157
	.long	97                              # 0x61
	.long	430                             # 0x1ae
	.long	751                             # 0x2ef
	.long	497                             # 0x1f1
	.long	314                             # 0x13a
	.long	983                             # 0x3d7
	.long	374                             # 0x176
	.long	822                             # 0x336
	.long	928                             # 0x3a0
	.long	140                             # 0x8c
	.long	206                             # 0xce
	.long	73                              # 0x49
	.long	263                             # 0x107
	.long	980                             # 0x3d4
	.long	736                             # 0x2e0
	.long	876                             # 0x36c
	.long	478                             # 0x1de
	.long	430                             # 0x1ae
	.long	305                             # 0x131
	.long	170                             # 0xaa
	.long	514                             # 0x202
	.long	364                             # 0x16c
	.long	692                             # 0x2b4
	.long	829                             # 0x33d
	.long	82                              # 0x52
	.long	855                             # 0x357
	.long	953                             # 0x3b9
	.long	676                             # 0x2a4
	.long	246                             # 0xf6
	.long	369                             # 0x171
	.long	970                             # 0x3ca
	.long	294                             # 0x126
	.long	750                             # 0x2ee
	.long	807                             # 0x327
	.long	827                             # 0x33b
	.long	150                             # 0x96
	.long	790                             # 0x316
	.long	288                             # 0x120
	.long	923                             # 0x39b
	.long	804                             # 0x324
	.long	378                             # 0x17a
	.long	215                             # 0xd7
	.long	828                             # 0x33c
	.long	592                             # 0x250
	.long	281                             # 0x119
	.long	565                             # 0x235
	.long	555                             # 0x22b
	.long	710                             # 0x2c6
	.long	82                              # 0x52
	.long	896                             # 0x380
	.long	831                             # 0x33f
	.long	547                             # 0x223
	.long	261                             # 0x105
	.long	524                             # 0x20c
	.long	462                             # 0x1ce
	.long	293                             # 0x125
	.long	465                             # 0x1d1
	.long	502                             # 0x1f6
	.long	56                              # 0x38
	.long	661                             # 0x295
	.long	821                             # 0x335
	.long	976                             # 0x3d0
	.long	991                             # 0x3df
	.long	658                             # 0x292
	.long	869                             # 0x365
	.long	905                             # 0x389
	.long	758                             # 0x2f6
	.long	745                             # 0x2e9
	.long	193                             # 0xc1
	.long	768                             # 0x300
	.long	550                             # 0x226
	.long	608                             # 0x260
	.long	933                             # 0x3a5
	.long	378                             # 0x17a
	.long	286                             # 0x11e
	.long	215                             # 0xd7
	.long	979                             # 0x3d3
	.long	792                             # 0x318
	.long	961                             # 0x3c1
	.long	61                              # 0x3d
	.long	688                             # 0x2b0
	.long	793                             # 0x319
	.long	644                             # 0x284
	.long	986                             # 0x3da
	.long	403                             # 0x193
	.long	106                             # 0x6a
	.long	366                             # 0x16e
	.long	905                             # 0x389
	.long	644                             # 0x284
	.long	372                             # 0x174
	.long	567                             # 0x237
	.long	466                             # 0x1d2
	.long	434                             # 0x1b2
	.long	645                             # 0x285
	.long	210                             # 0xd2
	.long	389                             # 0x185
	.long	550                             # 0x226
	.long	919                             # 0x397
	.long	135                             # 0x87
	.long	780                             # 0x30c
	.long	773                             # 0x305
	.long	635                             # 0x27b
	.long	389                             # 0x185
	.long	707                             # 0x2c3
	.long	100                             # 0x64
	.long	626                             # 0x272
	.long	958                             # 0x3be
	.long	165                             # 0xa5
	.long	504                             # 0x1f8
	.long	920                             # 0x398
	.long	176                             # 0xb0
	.long	193                             # 0xc1
	.long	713                             # 0x2c9
	.long	857                             # 0x359
	.long	265                             # 0x109
	.long	203                             # 0xcb
	.long	50                              # 0x32
	.long	668                             # 0x29c
	.long	108                             # 0x6c
	.long	645                             # 0x285
	.long	990                             # 0x3de
	.long	626                             # 0x272
	.long	197                             # 0xc5
	.long	510                             # 0x1fe
	.long	357                             # 0x165
	.long	358                             # 0x166
	.long	850                             # 0x352
	.long	858                             # 0x35a
	.long	364                             # 0x16c
	.long	936                             # 0x3a8
	.long	638                             # 0x27e
	.size	BZ2_rNums, 2048

	.ident	"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"
	.ident	"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"
	.ident	"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"
	.ident	"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"
	.ident	"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"
	.ident	"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"
	.ident	"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"
	.ident	"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"
	.ident	"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"
	.section	".note.GNU-stack","",@progbits
