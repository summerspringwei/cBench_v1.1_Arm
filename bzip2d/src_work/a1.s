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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movq	40(%rdi), %rcx
	movq	56(%rdi), %rbx
	movl	108(%rdi), %r13d
	movl	656(%rdi), %r15d
	cmpl	$9999, %r13d                    # imm = 0x270F
	jg	.LBB0_2
# %bb.1:
	movq	24(%r14), %rdi
	movq	32(%r14), %rsi
	movq	%rcx, %rdx
	jmp	.LBB0_12
.LBB0_2:                                # %.thread
	movq	64(%r14), %rsi
	movl	88(%r14), %edi
	movl	%r13d, %eax
	andl	$1, %eax
	addl	%r13d, %eax
	addl	$34, %eax
	movslq	%eax, %rdx
	addq	%rsi, %rdx
	cmpl	$100, %edi
	movl	$100, %eax
	cmovll	%edi, %eax
	testl	%edi, %edi
	jle	.LBB0_3
# %bb.4:                                # %select.true.sink
	addl	$-1, %eax
	cltq
	imulq	$1431655766, %rax, %r12         # imm = 0x55555556
	movq	%r12, %rax
	shrq	$63, %rax
	shrq	$32, %r12
	addl	%eax, %r12d
	jmp	.LBB0_5
.LBB0_3:
	xorl	%r12d, %r12d
.LBB0_5:                                # %select.end
	imull	%r13d, %r12d
	movl	%r12d, -44(%rbp)
	leaq	-44(%rbp), %rax
	movq	%rax, (%rsp)
	movq	%rbx, %rdi
	movq	%rcx, -56(%rbp)                 # 8-byte Spill
	movl	%r13d, %r8d
	movl	%r15d, %r9d
	callq	mainSort
	movl	%r15d, -48(%rbp)                # 4-byte Spill
	cmpl	$2, %r15d
	jg	.LBB0_7
# %bb.6:                                # %.thread._crit_edge
	movl	-44(%rbp), %r15d
	testl	%r15d, %r15d
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	jns	.LBB0_13
.LBB0_9:
	movl	-48(%rbp), %r15d                # 4-byte Reload
	cmpl	$2, %r15d
	jge	.LBB0_10
.LBB0_11:
	movq	24(%r14), %rdi
	movq	32(%r14), %rsi
.LBB0_12:
	movl	%r13d, %ecx
	movl	%r15d, %r8d
	callq	fallbackSort
.LBB0_13:
	movl	$-1, 48(%r14)
	movslq	108(%r14), %rax
	testq	%rax, %rax
	jle	.LBB0_17
# %bb.14:                               # %.lr.ph.preheader
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_15:                               # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, (%rbx,%rcx,4)
	je	.LBB0_18
# %bb.16:                               #   in Loop: Header=BB0_15 Depth=1
	addq	$1, %rcx
	cmpq	%rcx, %rax
	jne	.LBB0_15
.LBB0_17:                               # %.loopexit.thread
	movl	$1003, %edi                     # imm = 0x3EB
	callq	BZ2_bz__AssertH__fail
.LBB0_18:                               # %.loopexit
	movl	%ecx, 48(%r14)
	cmpl	$-1, %ecx
	je	.LBB0_17
# %bb.19:
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB0_7:
	.cfi_def_cfa %rbp, 16
	movl	-44(%rbp), %r15d
	subl	%r15d, %r12d
	cvtsi2ss	%r12d, %xmm0
	cvtsi2ss	%r13d, %xmm1
	movq	stderr(%rip), %rdi
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str, %esi
	movl	%r12d, %edx
	movl	%r13d, %ecx
	movb	$1, %al
	callq	fprintf
	testl	%r15d, %r15d
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	jns	.LBB0_13
	jmp	.LBB0_9
.LBB0_10:
	movq	stderr(%rip), %rcx
	movl	$.L.str.1, %edi
	movl	$53, %esi
	movl	$1, %edx
	callq	fwrite
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	jmp	.LBB0_11
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$2104, %rsp                     # imm = 0x838
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%ecx, %r12d
	movq	%rdx, %r14
	movq	%rsi, %r13
	movq	%rdi, -64(%rbp)                 # 8-byte Spill
	movl	%r8d, -68(%rbp)                 # 4-byte Spill
	cmpl	$4, %r8d
	jge	.LBB1_1
.LBB1_2:
	leaq	-1120(%rbp), %rdi
	xorl	%ebx, %ebx
	movl	$1028, %edx                     # imm = 0x404
	xorl	%esi, %esi
	callq	memset@PLT
	movl	$0, %r15d
	testl	%r12d, %r12d
	cmovnsl	%r12d, %r15d
	jle	.LBB1_9
# %bb.3:                                # %.lr.ph268.preheader
	leaq	-1(%r15), %rcx
	movl	%r15d, %eax
	andl	$3, %eax
	cmpq	$3, %rcx
	jae	.LBB1_14
# %bb.4:
	xorl	%ecx, %ecx
	jmp	.LBB1_5
.LBB1_14:                               # %.lr.ph268.preheader.new
	movl	%r15d, %edx
	andl	$2147483644, %edx               # imm = 0x7FFFFFFC
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_15:                               # %.lr.ph268
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%r13,%rcx), %esi
	addl	$1, -1120(%rbp,%rsi,4)
	movzbl	1(%r13,%rcx), %esi
	addl	$1, -1120(%rbp,%rsi,4)
	movzbl	2(%r13,%rcx), %esi
	addl	$1, -1120(%rbp,%rsi,4)
	movzbl	3(%r13,%rcx), %esi
	addl	$1, -1120(%rbp,%rsi,4)
	addq	$4, %rcx
	cmpq	%rcx, %rdx
	jne	.LBB1_15
.LBB1_5:                                # %.preheader232.loopexit.unr-lcssa
	testq	%rax, %rax
	je	.LBB1_8
# %bb.6:                                # %.lr.ph268.epil.preheader
	addq	%r13, %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_7:                                # %.lr.ph268.epil
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%rcx,%rdx), %esi
	addl	$1, -1120(%rbp,%rsi,4)
	addq	$1, %rdx
	cmpq	%rdx, %rax
	jne	.LBB1_7
.LBB1_8:                                # %.preheader232.loopexit
	movl	-1120(%rbp), %ebx
.LBB1_9:                                # %.preheader232
	movq	%r12, -56(%rbp)                 # 8-byte Spill
	leaq	-2144(%rbp), %rdi
	leaq	-1120(%rbp), %rsi
	movl	$1024, %edx                     # imm = 0x400
	callq	memcpy@PLT
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_10:                               # %.preheader231
                                        # =>This Inner Loop Header: Depth=1
	addl	-1116(%rbp,%rax,4), %ebx
	movl	%ebx, -1116(%rbp,%rax,4)
	addl	-1112(%rbp,%rax,4), %ebx
	movl	%ebx, -1112(%rbp,%rax,4)
	addl	-1108(%rbp,%rax,4), %ebx
	movl	%ebx, -1108(%rbp,%rax,4)
	addl	-1104(%rbp,%rax,4), %ebx
	movl	%ebx, -1104(%rbp,%rax,4)
	addq	$4, %rax
	cmpq	$256, %rax                      # imm = 0x100
	jne	.LBB1_10
# %bb.11:                               # %.preheader230
	movq	-56(%rbp), %r8                  # 8-byte Reload
	testl	%r8d, %r8d
	movq	-64(%rbp), %rdi                 # 8-byte Reload
	jle	.LBB1_20
# %bb.12:                               # %.lr.ph261.preheader
	cmpl	$1, %r15d
	jne	.LBB1_16
# %bb.13:
	xorl	%eax, %eax
	jmp	.LBB1_18
.LBB1_16:                               # %.lr.ph261.preheader.new
	movl	%r15d, %ecx
	andl	$2147483646, %ecx               # imm = 0x7FFFFFFE
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_17:                               # %.lr.ph261
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%r13,%rax), %edx
	movslq	-1120(%rbp,%rdx,4), %rsi
	leaq	-1(%rsi), %rbx
	movl	%ebx, -1120(%rbp,%rdx,4)
	movl	%eax, -4(%rdi,%rsi,4)
	movzbl	1(%r13,%rax), %edx
	movslq	-1120(%rbp,%rdx,4), %rsi
	leaq	-1(%rsi), %rbx
	movl	%ebx, -1120(%rbp,%rdx,4)
	leal	1(%rax), %edx
	movl	%edx, -4(%rdi,%rsi,4)
	addq	$2, %rax
	cmpq	%rax, %rcx
	jne	.LBB1_17
.LBB1_18:                               # %._crit_edge262.loopexit.unr-lcssa
	testb	$1, %r15b
	je	.LBB1_20
# %bb.19:                               # %.lr.ph261.epil.preheader
	movzbl	(%r13,%rax), %ecx
	movslq	-1120(%rbp,%rcx,4), %rdx
	leaq	-1(%rdx), %rsi
	movl	%esi, -1120(%rbp,%rcx,4)
	movl	%eax, -4(%rdi,%rdx,4)
.LBB1_20:                               # %._crit_edge262
	leal	31(%r8), %ecx
	testl	%r8d, %r8d
	cmovnsl	%r8d, %ecx
	sarl	$5, %ecx
	cmpl	$-2, %ecx
	movl	$-2, %eax
	cmovgl	%ecx, %eax
	addl	$2, %eax
	je	.LBB1_22
# %bb.21:                               # %.lr.ph258.preheader
	movl	%eax, %edx
	shlq	$2, %rdx
	movq	%r14, %rdi
	xorl	%esi, %esi
	callq	memset@PLT
	movq	-56(%rbp), %r8                  # 8-byte Reload
	movq	-64(%rbp), %rdi                 # 8-byte Reload
.LBB1_22:                               # %.preheader229
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_23:                               # =>This Inner Loop Header: Depth=1
	movl	-1120(%rbp,%rax,4), %ecx
	movl	$1, %edx
	shll	%cl, %edx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	orl	%edx, (%r14,%rcx,4)
	movl	-1116(%rbp,%rax,4), %ecx
	movl	$1, %edx
	shll	%cl, %edx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	orl	%edx, (%r14,%rcx,4)
	addq	$2, %rax
	cmpq	$256, %rax                      # imm = 0x100
	jne	.LBB1_23
# %bb.24:                               # %.preheader228.preheader
	leal	1(%r8), %eax
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB1_25:                               # %.preheader228
                                        # =>This Inner Loop Header: Depth=1
	leal	(%r8,%rdx), %ecx
	movl	$1, %esi
	shll	%cl, %esi
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	orl	%esi, (%r14,%rcx,4)
	leal	(%rax,%rdx), %ecx
	movl	$-2, %esi
	roll	%cl, %esi
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	andl	%esi, (%r14,%rcx,4)
	addl	$2, %edx
	cmpl	$64, %edx
	jne	.LBB1_25
# %bb.26:                               # %.preheader227.preheader
	movl	$1, %edx
	movq	%r15, -80(%rbp)                 # 8-byte Spill
	movq	%r13, -88(%rbp)                 # 8-byte Spill
	.p2align	4, 0x90
.LBB1_27:                               # %.preheader227
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_31 Depth 2
                                        #     Child Loop BB1_33 Depth 2
                                        #       Child Loop BB1_37 Depth 3
                                        #       Child Loop BB1_38 Depth 3
                                        #       Child Loop BB1_42 Depth 3
                                        #       Child Loop BB1_48 Depth 3
                                        #       Child Loop BB1_49 Depth 3
                                        #       Child Loop BB1_53 Depth 3
	cmpl	$4, -68(%rbp)                   # 4-byte Folded Reload
	movl	%edx, -44(%rbp)                 # 4-byte Spill
	jge	.LBB1_28
# %bb.29:                               #   in Loop: Header=BB1_27 Depth=1
	testl	%r8d, %r8d
	jle	.LBB1_32
.LBB1_30:                               # %.lr.ph240.preheader
                                        #   in Loop: Header=BB1_27 Depth=1
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB1_31:                               # %.lr.ph240
                                        #   Parent Loop BB1_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ecx, %esi
	sarl	$5, %esi
	movslq	%esi, %rsi
	movl	(%r14,%rsi,4), %esi
	btl	%ecx, %esi
	cmovbl	%ecx, %eax
	movl	(%rdi,%rcx,4), %ebx
	subl	%edx, %ebx
	movl	%ebx, %esi
	sarl	$31, %esi
	andl	%r8d, %esi
	addl	%ebx, %esi
	movslq	%esi, %rsi
	movl	%eax, (%r13,%rsi,4)
	addq	$1, %rcx
	cmpq	%rcx, %r15
	jne	.LBB1_31
.LBB1_32:                               # %.preheader226
                                        #   in Loop: Header=BB1_27 Depth=1
	xorl	%r10d, %r10d
	movl	$-1, %r12d
	jmp	.LBB1_33
.LBB1_56:                               # %.loopexit
                                        #   in Loop: Header=BB1_33 Depth=2
	addl	%r11d, %r10d
	addl	%r12d, %r10d
	addl	$2, %r10d
	movq	-56(%rbp), %r8                  # 8-byte Reload
	movl	-44(%rbp), %edx                 # 4-byte Reload
	.p2align	4, 0x90
.LBB1_33:                               #   Parent Loop BB1_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_37 Depth 3
                                        #       Child Loop BB1_38 Depth 3
                                        #       Child Loop BB1_42 Depth 3
                                        #       Child Loop BB1_48 Depth 3
                                        #       Child Loop BB1_49 Depth 3
                                        #       Child Loop BB1_53 Depth 3
	movl	%r12d, %eax
	leal	1(%rax), %r12d
	movl	%r12d, %esi
	sarl	$5, %esi
	movl	%r12d, %ecx
	andl	$31, %ecx
	movl	$1, %ebx
	shll	%cl, %ebx
	movslq	%esi, %rsi
	andl	(%r14,%rsi,4), %ebx
	testl	%ecx, %ecx
	je	.LBB1_35
# %bb.34:                               #   in Loop: Header=BB1_33 Depth=2
	testl	%ebx, %ebx
	jne	.LBB1_33
.LBB1_35:                               # %.thread
                                        #   in Loop: Header=BB1_33 Depth=2
	testl	%ebx, %ebx
	je	.LBB1_36
	.p2align	4, 0x90
.LBB1_37:                               # %.preheader225
                                        #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_33 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	%eax, %r15d
	movl	%r12d, %eax
	sarl	$5, %eax
	movslq	%eax, %rcx
	addl	$32, %r12d
	leal	32(%r15), %eax
	cmpl	$-1, (%r14,%rcx,4)
	je	.LBB1_37
	.p2align	4, 0x90
.LBB1_38:                               # %.preheader224
                                        #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_33 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	addl	$1, %r15d
	movl	%r15d, %eax
	sarl	$5, %eax
	cltq
	movl	(%r14,%rax,4), %eax
	btl	%r15d, %eax
	jb	.LBB1_38
# %bb.39:                               # %.loopexit167
                                        #   in Loop: Header=BB1_33 Depth=2
	cmpl	%r8d, %r15d
	jle	.LBB1_40
	jmp	.LBB1_57
.LBB1_36:                               #   in Loop: Header=BB1_33 Depth=2
	movl	%r12d, %r15d
	cmpl	%r8d, %r15d
	jg	.LBB1_57
.LBB1_40:                               #   in Loop: Header=BB1_33 Depth=2
	movl	%r15d, %r11d
	negl	%r11d
	movl	%r15d, %eax
	sarl	$5, %eax
	cltq
	movl	(%r14,%rax,4), %eax
	movl	%r15d, %ecx
	andl	$31, %ecx
	movl	$1, %ebx
	shll	%cl, %ebx
	btl	%ecx, %eax
	movl	%r15d, %esi
	jb	.LBB1_45
# %bb.41:                               # %.lr.ph244.preheader
                                        #   in Loop: Header=BB1_33 Depth=2
	movl	%r11d, %r9d
	andl	$31, %r9d
	addl	%r15d, %r9d
	movl	%r15d, %esi
	.p2align	4, 0x90
.LBB1_42:                               # %.lr.ph244
                                        #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_33 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	testl	%ecx, %ecx
	je	.LBB1_43
# %bb.44:                               #   in Loop: Header=BB1_42 Depth=3
	addl	$1, %esi
	movl	%esi, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movl	(%r14,%rcx,4), %eax
	movl	%esi, %ecx
	andl	$31, %ecx
	movl	$1, %ebx
	shll	%cl, %ebx
	btl	%ecx, %eax
	jae	.LBB1_42
.LBB1_45:                               # %.thread165
                                        #   in Loop: Header=BB1_33 Depth=2
	testl	%eax, %ebx
	je	.LBB1_47
.LBB1_46:                               #   in Loop: Header=BB1_33 Depth=2
	movl	%esi, %eax
	jmp	.LBB1_50
.LBB1_43:                               # %.lr.ph244..thread165.loopexit_crit_edge
                                        #   in Loop: Header=BB1_33 Depth=2
	movl	%r9d, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rax
	movl	$1, %ebx
	movl	%r9d, %ecx
	shll	%cl, %ebx
	movl	(%r14,%rax,4), %eax
	movl	%r9d, %esi
	testl	%eax, %ebx
	jne	.LBB1_46
.LBB1_47:                               # %.preheader223.preheader
                                        #   in Loop: Header=BB1_33 Depth=2
	leal	-1(%rsi), %ecx
	.p2align	4, 0x90
.LBB1_48:                               # %.preheader223
                                        #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_33 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	%ecx, %eax
	movl	%esi, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rbx
	addl	$32, %esi
	leal	32(%rax), %ecx
	cmpl	$0, (%r14,%rbx,4)
	je	.LBB1_48
	.p2align	4, 0x90
.LBB1_49:                               # %.preheader
                                        #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_33 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	addl	$1, %eax
	movl	%eax, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movl	(%r14,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB1_49
.LBB1_50:                               # %.loopexit166
                                        #   in Loop: Header=BB1_33 Depth=2
	cmpl	%r8d, %eax
	jg	.LBB1_57
# %bb.51:                               #   in Loop: Header=BB1_33 Depth=2
	leal	-1(%rax), %r12d
	cmpl	%r15d, %eax
	jle	.LBB1_33
# %bb.52:                               # %.lr.ph252.preheader
                                        #   in Loop: Header=BB1_33 Depth=2
	addl	$-1, %r15d
	movq	%r13, %rsi
	movl	%r15d, %edx
	movl	%r12d, %ecx
	movq	%r10, %rbx
	movl	%r11d, %r13d
	callq	fallbackQSort3
	movl	%r13d, %r11d
	movq	-88(%rbp), %r13                 # 8-byte Reload
	movq	%rbx, %r10
	movq	-64(%rbp), %rdi                 # 8-byte Reload
	movslq	%r12d, %r9
	movslq	%r15d, %rcx
	cmpq	%r9, %rcx
	cmovgq	%rcx, %r9
	subq	%rcx, %r9
	addq	$1, %r9
	leaq	(%rdi,%rcx,4), %r8
	movl	$-1, %ecx
	xorl	%esi, %esi
	jmp	.LBB1_53
	.p2align	4, 0x90
.LBB1_55:                               #   in Loop: Header=BB1_53 Depth=3
	addq	$1, %rsi
	cmpq	%rsi, %r9
	je	.LBB1_56
.LBB1_53:                               # %.lr.ph252
                                        #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_33 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	(%r8,%rsi,4), %eax
	movl	(%r13,%rax,4), %eax
	cmpl	%eax, %ecx
	je	.LBB1_55
# %bb.54:                               #   in Loop: Header=BB1_53 Depth=3
	leaq	(%r15,%rsi), %rcx
	movl	%ecx, %ebx
	sarl	$5, %ebx
	movl	$1, %edx
                                        # kill: def $cl killed $cl killed $rcx
	shll	%cl, %edx
	movslq	%ebx, %rcx
	orl	%edx, (%r14,%rcx,4)
	movl	%eax, %ecx
	jmp	.LBB1_55
	.p2align	4, 0x90
.LBB1_57:                               #   in Loop: Header=BB1_27 Depth=1
	cmpl	$4, -68(%rbp)                   # 4-byte Folded Reload
	jge	.LBB1_58
# %bb.61:                               # %.thread220
                                        #   in Loop: Header=BB1_27 Depth=1
	addl	%edx, %edx
	cmpl	%r8d, %edx
	movq	-80(%rbp), %r15                 # 8-byte Reload
	jg	.LBB1_63
# %bb.62:                               # %.thread220
                                        #   in Loop: Header=BB1_27 Depth=1
	testl	%r10d, %r10d
	jne	.LBB1_27
	jmp	.LBB1_63
.LBB1_28:                               #   in Loop: Header=BB1_27 Depth=1
	movq	stderr(%rip), %rdi
	movl	$.L.str.3, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	-44(%rbp), %edx                 # 4-byte Reload
	movq	-56(%rbp), %r8                  # 8-byte Reload
	movq	-64(%rbp), %rdi                 # 8-byte Reload
	testl	%r8d, %r8d
	jg	.LBB1_30
	jmp	.LBB1_32
.LBB1_58:                               #   in Loop: Header=BB1_27 Depth=1
	movq	stderr(%rip), %rdi
	movl	$.L.str.4, %esi
	movl	%r10d, %edx
	xorl	%eax, %eax
	movq	%r10, %rbx
	callq	fprintf
	movl	-44(%rbp), %edx                 # 4-byte Reload
	movq	-56(%rbp), %r8                  # 8-byte Reload
	movq	-64(%rbp), %rdi                 # 8-byte Reload
	addl	%edx, %edx
	cmpl	%r8d, %edx
	movq	-80(%rbp), %r15                 # 8-byte Reload
	jg	.LBB1_60
# %bb.59:                               #   in Loop: Header=BB1_27 Depth=1
	movq	%rbx, %rax
	testl	%eax, %eax
	jne	.LBB1_27
.LBB1_60:
	movq	stderr(%rip), %rcx
	movl	$.L.str.5, %edi
	movl	$33, %esi
	movl	$1, %edx
	callq	fwrite
	movq	-56(%rbp), %r8                  # 8-byte Reload
	movq	-64(%rbp), %rdi                 # 8-byte Reload
.LBB1_63:                               # %.thread222
	testl	%r8d, %r8d
	jle	.LBB1_69
# %bb.64:                               # %.lr.ph.preheader
	xorl	%edx, %edx
	movabsq	$-4294967296, %rax              # imm = 0xFFFFFFFF00000000
	movabsq	$4294967296, %rcx               # imm = 0x100000000
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_65:                               # %.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_66 Depth 2
	movslq	%edx, %rdx
	movq	%rdx, %rbx
	shlq	$32, %rbx
	addq	%rax, %rbx
	addq	$-1, %rdx
	.p2align	4, 0x90
.LBB1_66:                               #   Parent Loop BB1_65 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addq	%rcx, %rbx
	cmpl	$0, -2140(%rbp,%rdx,4)
	leaq	1(%rdx), %rdx
	je	.LBB1_66
# %bb.67:                               #   in Loop: Header=BB1_65 Depth=1
	sarq	$30, %rbx
	addl	$-1, -2144(%rbp,%rbx)
	movl	(%rdi,%rsi,4), %ebx
	movb	%dl, (%r13,%rbx)
	addq	$1, %rsi
	cmpq	%r15, %rsi
	jne	.LBB1_65
# %bb.68:
	cmpl	$256, %edx                      # imm = 0x100
	jge	.LBB1_70
.LBB1_69:                               # %.thread287
	addq	$2104, %rsp                     # imm = 0x838
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB1_1:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rcx
	movl	$.L.str.2, %edi
	movl	$27, %esi
	movl	$1, %edx
	callq	fwrite
	jmp	.LBB1_2
.LBB1_70:
	movl	$1005, %edi                     # imm = 0x3ED
	callq	BZ2_bz__AssertH__fail
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$3464, %rsp                     # imm = 0xD88
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %r15d
	movq	%rcx, %r14
	movq	%rdx, -72(%rbp)                 # 8-byte Spill
	movq	%rsi, %r12
	movq	%rdi, %r13
	movq	16(%rbp), %rax
	movq	%rax, -96(%rbp)                 # 8-byte Spill
	movl	%r8d, %eax
	movq	%rax, -120(%rbp)                # 8-byte Spill
	movl	%r9d, -44(%rbp)                 # 4-byte Spill
	cmpl	$4, %r9d
	jge	.LBB2_1
.LBB2_2:                                # %.lr.ph402.preheader
	xorl	%ebx, %ebx
	movl	$262148, %edx                   # imm = 0x40004
	movq	%r14, %rdi
	xorl	%esi, %esi
	callq	memset@PLT
	movzbl	(%r12), %eax
	shll	$8, %eax
	leal	-1(%r15), %r11d
	leal	-2(%r15), %r8d
	leal	-3(%r15), %r9d
	leal	-4(%r15), %r10d
	movq	-72(%rbp), %rsi                 # 8-byte Reload
	movq	-120(%rbp), %rdi                # 8-byte Reload
	.p2align	4, 0x90
.LBB2_3:                                # %.lr.ph402
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rcx
	addl	%r11d, %ebx
	movw	$0, (%rsi,%rbx,2)
	sarl	$8, %eax
	movzbl	(%r12,%rbx), %ebx
	shlq	$8, %rbx
	cltq
	orq	%rbx, %rax
	addl	$1, (%r14,%rax,4)
	leal	(%r8,%rcx), %ebx
	movw	$0, (%rsi,%rbx,2)
	sarl	$8, %eax
	movzbl	(%r12,%rbx), %ebx
	shlq	$8, %rbx
	cltq
	orq	%rbx, %rax
	addl	$1, (%r14,%rax,4)
	leal	(%r9,%rcx), %ebx
	movw	$0, (%rsi,%rbx,2)
	sarl	$8, %eax
	movzbl	(%r12,%rbx), %ebx
	shlq	$8, %rbx
	cltq
	orq	%rbx, %rax
	addl	$1, (%r14,%rax,4)
	leal	(%r10,%rcx), %ebx
	movw	$0, (%rsi,%rbx,2)
	sarl	$8, %eax
	movzbl	(%r12,%rbx), %ebx
	shlq	$8, %rbx
	cltq
	orq	%rbx, %rax
	addl	$1, (%r14,%rax,4)
	leaq	-4(%rcx), %rbx
	leal	(%rdi,%rbx), %edx
	addl	$3, %edx
	cmpl	$6, %edx
	jg	.LBB2_3
# %bb.4:                                # %._crit_edge403
	leaq	(%rdi,%rbx), %rdx
	addl	$3, %edx
	cmpl	$4, %edx
	jl	.LBB2_10
# %bb.5:                                # %.lr.ph397.preheader
	leal	-5(%r15), %edx
	movslq	%edx, %r9
	leaq	(%r9,%rbx), %rdx
	addq	$4, %rdx
	leaq	(%rdi,%rbx), %r8
	addq	$-1, %r8
	testb	$1, %dl
	jne	.LBB2_7
# %bb.6:                                # %.lr.ph397.prol.preheader
	leaq	(%rsi,%r9,2), %rdx
	addq	$8, %rdx
	movw	$0, -8(%rdx,%rcx,2)
	sarl	$8, %eax
	leaq	(%r12,%r9), %rdx
	addq	$4, %rdx
	movzbl	-4(%rcx,%rdx), %ecx
	shlq	$8, %rcx
	cltq
	orq	%rcx, %rax
	addl	$1, (%r14,%rax,4)
	leaq	(%r9,%rbx), %rdx
	addq	$3, %rdx
.LBB2_7:                                # %.lr.ph397.prol.loopexit
	testl	%r8d, %r8d
	je	.LBB2_10
# %bb.8:                                # %.lr.ph397.preheader4
	addq	$2, %rdx
	.p2align	4, 0x90
.LBB2_9:                                # %.lr.ph397
                                        # =>This Inner Loop Header: Depth=1
	movw	$0, -4(%rsi,%rdx,2)
	sarl	$8, %eax
	movzbl	-2(%r12,%rdx), %ecx
	shlq	$8, %rcx
	cltq
	orq	%rcx, %rax
	addl	$1, (%r14,%rax,4)
	movw	$0, -6(%rsi,%rdx,2)
	sarl	$8, %eax
	movzbl	-3(%r12,%rdx), %ecx
	shlq	$8, %rcx
	cltq
	orq	%rcx, %rax
	addl	$1, (%r14,%rax,4)
	addq	$-2, %rdx
	cmpq	$1, %rdx
	jg	.LBB2_9
.LBB2_10:                               # %._crit_edge398
	movslq	%r15d, %rax
	leaq	1(%r12), %rcx
	leaq	(%rsi,%rax,2), %rdx
	movl	$2, %esi
	.p2align	4, 0x90
.LBB2_11:                               # =>This Inner Loop Header: Depth=1
	movzbl	-1(%rcx), %ebx
	movb	%bl, -1(%rcx,%rax)
	movw	$0, -2(%rdx,%rsi)
	movzbl	(%rcx), %ebx
	movb	%bl, (%rcx,%rax)
	movw	$0, (%rdx,%rsi)
	addq	$2, %rcx
	addq	$4, %rsi
	cmpq	$70, %rsi
	jne	.LBB2_11
# %bb.12:
	cmpl	$4, -44(%rbp)                   # 4-byte Folded Reload
	movq	%r15, -64(%rbp)                 # 8-byte Spill
	movq	%r11, -144(%rbp)                # 8-byte Spill
	jge	.LBB2_13
.LBB2_14:
	movl	(%r14), %eax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB2_15:                               # =>This Inner Loop Header: Depth=1
	addl	4(%r14,%rcx,4), %eax
	movl	%eax, 4(%r14,%rcx,4)
	addl	8(%r14,%rcx,4), %eax
	movl	%eax, 8(%r14,%rcx,4)
	addl	12(%r14,%rcx,4), %eax
	movl	%eax, 12(%r14,%rcx,4)
	addl	16(%r14,%rcx,4), %eax
	movl	%eax, 16(%r14,%rcx,4)
	addq	$4, %rcx
	cmpq	$65536, %rcx                    # imm = 0x10000
	jne	.LBB2_15
# %bb.16:                               # %.lr.ph388.preheader
	movzbl	(%r12), %ecx
	shll	$8, %ecx
	leal	3(%r15), %eax
	.p2align	4, 0x90
.LBB2_17:                               # %.lr.ph388
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, %edx
	leal	-4(%rdx), %eax
	movzbl	(%r12,%rax), %esi
	shldw	$8, %cx, %si
	movzwl	%si, %ecx
	movl	(%r14,%rcx,4), %esi
	addl	$-1, %esi
	movl	%esi, (%r14,%rcx,4)
	movslq	%esi, %rsi
	movl	%eax, (%r13,%rsi,4)
	leal	-5(%rdx), %esi
	movzbl	(%r12,%rsi), %edi
	shrdw	$8, %di, %cx
	movzwl	%cx, %ecx
	movl	(%r14,%rcx,4), %edi
	addl	$-1, %edi
	movl	%edi, (%r14,%rcx,4)
	movslq	%edi, %rdi
	movl	%esi, (%r13,%rdi,4)
	leal	-6(%rdx), %esi
	movzbl	(%r12,%rsi), %edi
	shrdw	$8, %di, %cx
	movzwl	%cx, %ecx
	movl	(%r14,%rcx,4), %edi
	addl	$-1, %edi
	movl	%edi, (%r14,%rcx,4)
	movslq	%edi, %rdi
	movl	%esi, (%r13,%rdi,4)
	addl	$-7, %edx
	movzbl	(%r12,%rdx), %esi
	shrdw	$8, %si, %cx
	movzwl	%cx, %esi
	movl	(%r14,%rsi,4), %edi
	addl	$-1, %edi
	movl	%edi, (%r14,%rsi,4)
	movslq	%edi, %rsi
	movl	%edx, (%r13,%rsi,4)
	cmpl	$6, %eax
	jg	.LBB2_17
# %bb.18:                               # %._crit_edge389
	cmpl	$4, %eax
	jl	.LBB2_21
# %bb.19:                               # %.lr.ph384.preheader
	addl	$-4, %eax
	movl	%eax, %edx
	addq	$1, %rdx
	.p2align	4, 0x90
.LBB2_20:                               # %.lr.ph384
                                        # =>This Inner Loop Header: Depth=1
	movzbl	-1(%r12,%rdx), %esi
	shrdw	$8, %si, %cx
	movzwl	%cx, %esi
	movl	(%r14,%rsi,4), %edi
	addl	$-1, %edi
	movl	%edi, (%r14,%rsi,4)
	movslq	%edi, %rsi
	movl	%eax, (%r13,%rsi,4)
	addl	$-1, %eax
	addq	$-1, %rdx
	jg	.LBB2_20
.LBB2_21:                               # %.preheader349
	movq	%r13, -112(%rbp)                # 8-byte Spill
	movq	%r12, -88(%rbp)                 # 8-byte Spill
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -176(%rbp)
	movaps	%xmm0, -192(%rbp)
	movaps	%xmm0, -208(%rbp)
	movaps	%xmm0, -224(%rbp)
	movaps	%xmm0, -240(%rbp)
	movaps	%xmm0, -256(%rbp)
	movaps	%xmm0, -272(%rbp)
	movaps	%xmm0, -288(%rbp)
	movaps	%xmm0, -304(%rbp)
	movaps	%xmm0, -320(%rbp)
	movaps	%xmm0, -336(%rbp)
	movaps	%xmm0, -352(%rbp)
	movaps	%xmm0, -368(%rbp)
	movaps	%xmm0, -384(%rbp)
	movaps	%xmm0, -400(%rbp)
	movaps	%xmm0, -416(%rbp)
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB2_22:                               # =>This Inner Loop Header: Depth=1
	movl	%eax, -1440(%rbp,%rax,4)
	leal	1(%rax), %ecx
	movl	%ecx, -1436(%rbp,%rax,4)
	leal	2(%rax), %ecx
	movl	%ecx, -1432(%rbp,%rax,4)
	leal	3(%rax), %ecx
	movl	%ecx, -1428(%rbp,%rax,4)
	leal	4(%rax), %ecx
	movl	%ecx, -1424(%rbp,%rax,4)
	leal	5(%rax), %ecx
	movl	%ecx, -1420(%rbp,%rax,4)
	leal	6(%rax), %ecx
	movl	%ecx, -1416(%rbp,%rax,4)
	leal	7(%rax), %ecx
	movl	%ecx, -1412(%rbp,%rax,4)
	addq	$8, %rax
	cmpq	$256, %rax                      # imm = 0x100
	jne	.LBB2_22
# %bb.23:                               # %.preheader348.preheader
	movl	$364, %r8d                      # imm = 0x16C
	jmp	.LBB2_24
	.p2align	4, 0x90
.LBB2_31:                               # %._crit_edge379
                                        #   in Loop: Header=BB2_24 Depth=1
	addl	$-3, %r8d
	cmpl	$2, %r8d
	movl	%r12d, %r8d
	jbe	.LBB2_32
.LBB2_24:                               # %.preheader348
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_26 Depth 2
                                        #       Child Loop BB2_27 Depth 3
	movslq	%r8d, %rax
	imulq	$1431655766, %rax, %r12         # imm = 0x55555556
	movq	%r12, %rax
	shrq	$63, %rax
	shrq	$32, %r12
	addl	%eax, %r12d
	movslq	%r12d, %r15
	cmpl	$256, %r15d                     # imm = 0x100
	movl	$256, %r9d                      # imm = 0x100
	cmovgl	%r15d, %r9d
	cmpq	%r9, %r15
	je	.LBB2_31
# %bb.25:                               # %.lr.ph378.preheader
                                        #   in Loop: Header=BB2_24 Depth=1
	xorl	%r11d, %r11d
	jmp	.LBB2_26
	.p2align	4, 0x90
.LBB2_28:                               # %._crit_edge427
                                        #   in Loop: Header=BB2_26 Depth=2
	movslq	%edi, %rax
.LBB2_30:                               # %split
                                        #   in Loop: Header=BB2_26 Depth=2
	movl	%r10d, -1440(%rbp,%rax,4)
	addq	$1, %r15
	addl	$1, %r11d
	cmpq	%r9, %r15
	je	.LBB2_31
.LBB2_26:                               # %.lr.ph378
                                        #   Parent Loop BB2_24 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_27 Depth 3
	movl	-1440(%rbp,%r15,4), %r10d
	movl	%r10d, %eax
	shll	$8, %eax
	leal	256(%rax), %edx
	movslq	%edx, %rdx
	movl	(%r14,%rdx,4), %r13d
	cltq
	subl	(%r14,%rax,4), %r13d
	movl	%r11d, %ebx
	.p2align	4, 0x90
.LBB2_27:                               #   Parent Loop BB2_24 Depth=1
                                        #     Parent Loop BB2_26 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	leal	(%r12,%rbx), %edi
	movslq	%ebx, %rax
	movl	-1440(%rbp,%rax,4), %edx
	movl	%edx, %ecx
	shll	$8, %ecx
	leal	256(%rcx), %esi
	movslq	%esi, %rsi
	movl	(%r14,%rsi,4), %esi
	movslq	%ecx, %rcx
	subl	(%r14,%rcx,4), %esi
	cmpl	%r13d, %esi
	jbe	.LBB2_28
# %bb.29:                               #   in Loop: Header=BB2_27 Depth=3
	movslq	%edi, %rcx
	movl	%edx, -1440(%rbp,%rcx,4)
	subl	%r12d, %ebx
	jge	.LBB2_27
	jmp	.LBB2_30
.LBB2_32:                               # %.preheader347.preheader
	leaq	3072(%r14), %rax
	movq	%rax, -152(%rbp)                # 8-byte Spill
	movl	$-2097153, %edi                 # imm = 0xFFDFFFFF
	xorl	%eax, %eax
	movq	%rax, -56(%rbp)                 # 8-byte Spill
	xorl	%r15d, %r15d
	movq	-64(%rbp), %r10                 # 8-byte Reload
	movq	-72(%rbp), %r11                 # 8-byte Reload
	jmp	.LBB2_33
	.p2align	4, 0x90
.LBB2_84:                               # %._crit_edge372
                                        #   in Loop: Header=BB2_33 Depth=1
	addl	$-1, %eax
                                        # kill: def $cl killed $cl killed $ecx
	sarl	%cl, %eax
	cmpl	$65536, %eax                    # imm = 0x10000
	jge	.LBB2_90
.LBB2_85:                               #   in Loop: Header=BB2_33 Depth=1
	addq	$1, %r15
	cmpq	$256, %r15                      # imm = 0x100
	movl	$-2097153, %edi                 # imm = 0xFFDFFFFF
	je	.LBB2_86
.LBB2_33:                               # %.preheader347
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_35 Depth 2
                                        #     Child Loop BB2_43 Depth 2
                                        #     Child Loop BB2_52 Depth 2
                                        #     Child Loop BB2_56 Depth 2
                                        #     Child Loop BB2_61 Depth 2
                                        #     Child Loop BB2_68 Depth 2
                                        #     Child Loop BB2_71 Depth 2
                                        #     Child Loop BB2_79 Depth 2
	movq	%r15, -160(%rbp)                # 8-byte Spill
	movl	-1440(%rbp,%r15,4), %r12d
	movl	%r12d, %eax
	shll	$8, %eax
	movl	%eax, -76(%rbp)                 # 4-byte Spill
	cltq
	cmpl	$3, -44(%rbp)                   # 4-byte Folded Reload
	movq	%rax, -128(%rbp)                # 8-byte Spill
	leaq	(%r14,%rax,4), %rcx
	jle	.LBB2_34
# %bb.42:                               # %.split.us.preheader
                                        #   in Loop: Header=BB2_33 Depth=1
	xorl	%r15d, %r15d
	jmp	.LBB2_43
	.p2align	4, 0x90
.LBB2_34:                               # %.split.preheader
                                        #   in Loop: Header=BB2_33 Depth=1
	xorl	%r13d, %r13d
	movq	%rcx, -104(%rbp)                # 8-byte Spill
	jmp	.LBB2_35
	.p2align	4, 0x90
.LBB2_40:                               #   in Loop: Header=BB2_35 Depth=2
	orl	$2097152, %eax                  # imm = 0x200000
	movl	%eax, (%rcx,%r13,4)
.LBB2_41:                               #   in Loop: Header=BB2_35 Depth=2
	addq	$1, %r13
	cmpq	$256, %r13                      # imm = 0x100
	je	.LBB2_50
.LBB2_35:                               # %.split
                                        #   Parent Loop BB2_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	%r13, %r12
	je	.LBB2_41
# %bb.36:                               #   in Loop: Header=BB2_35 Depth=2
	movl	(%rcx,%r13,4), %eax
	testl	$2097152, %eax                  # imm = 0x200000
	jne	.LBB2_40
# %bb.37:                               #   in Loop: Header=BB2_35 Depth=2
	movl	%eax, %r15d
	andl	$-2097153, %r15d                # imm = 0xFFDFFFFF
	movl	4(%rcx,%r13,4), %ebx
	andl	%edi, %ebx
	addl	$-1, %ebx
	cmpl	%r15d, %ebx
	jle	.LBB2_40
# %bb.38:                               #   in Loop: Header=BB2_35 Depth=2
	movq	-96(%rbp), %rax                 # 8-byte Reload
	movq	%rax, (%rsp)
	movq	-112(%rbp), %rdi                # 8-byte Reload
	movq	-88(%rbp), %rsi                 # 8-byte Reload
	movq	%r11, %rdx
	movl	%r10d, %ecx
	movl	%r15d, %r8d
	movl	%ebx, %r9d
	callq	mainQSort3
	movq	-96(%rbp), %rax                 # 8-byte Reload
	cmpl	$0, (%rax)
	js	.LBB2_87
# %bb.39:                               # %._crit_edge421
                                        #   in Loop: Header=BB2_35 Depth=2
	movq	-56(%rbp), %rax                 # 8-byte Reload
	subl	%r15d, %eax
	addl	%ebx, %eax
	addl	$1, %eax
	movq	%rax, -56(%rbp)                 # 8-byte Spill
	movq	-104(%rbp), %rcx                # 8-byte Reload
	movl	(%rcx,%r13,4), %eax
	movq	-64(%rbp), %r10                 # 8-byte Reload
	movq	-72(%rbp), %r11                 # 8-byte Reload
	movl	$-2097153, %edi                 # imm = 0xFFDFFFFF
	jmp	.LBB2_40
.LBB2_47:                               # %._crit_edge423
                                        #   in Loop: Header=BB2_43 Depth=2
	movq	-56(%rbp), %rax                 # 8-byte Reload
	addl	-136(%rbp), %eax                # 4-byte Folded Reload
	addl	%ebx, %eax
	addl	$1, %eax
	movq	%rax, -56(%rbp)                 # 8-byte Spill
	movq	-104(%rbp), %rcx                # 8-byte Reload
	movl	(%rcx,%r15,4), %eax
	movq	-64(%rbp), %r10                 # 8-byte Reload
	movq	-72(%rbp), %r11                 # 8-byte Reload
	movl	$-2097153, %edi                 # imm = 0xFFDFFFFF
	.p2align	4, 0x90
.LBB2_48:                               #   in Loop: Header=BB2_43 Depth=2
	orl	$2097152, %eax                  # imm = 0x200000
	movl	%eax, (%rcx,%r15,4)
.LBB2_49:                               #   in Loop: Header=BB2_43 Depth=2
	addq	$1, %r15
	cmpq	$256, %r15                      # imm = 0x100
	je	.LBB2_50
.LBB2_43:                               # %.split.us
                                        #   Parent Loop BB2_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	%r15, %r12
	je	.LBB2_49
# %bb.44:                               #   in Loop: Header=BB2_43 Depth=2
	movl	(%rcx,%r15,4), %eax
	testl	$2097152, %eax                  # imm = 0x200000
	jne	.LBB2_48
# %bb.45:                               #   in Loop: Header=BB2_43 Depth=2
	movl	%eax, %r13d
	andl	$-2097153, %r13d                # imm = 0xFFDFFFFF
	movl	4(%rcx,%r15,4), %ebx
	andl	%edi, %ebx
	addl	$-1, %ebx
	cmpl	%r13d, %ebx
	jle	.LBB2_48
# %bb.46:                               #   in Loop: Header=BB2_43 Depth=2
	movq	%rcx, -104(%rbp)                # 8-byte Spill
	movl	%r13d, %eax
	negl	%eax
	movq	%rax, -136(%rbp)                # 8-byte Spill
	leal	(%rax,%rbx), %r9d
	addl	$1, %r9d
	movq	stderr(%rip), %rdi
	movl	$.L.str.7, %esi
	movl	%r12d, %edx
	movl	%r15d, %ecx
	movq	-56(%rbp), %r8                  # 8-byte Reload
                                        # kill: def $r8d killed $r8d killed $r8
	xorl	%eax, %eax
	callq	fprintf
	movq	-96(%rbp), %rax                 # 8-byte Reload
	movq	%rax, (%rsp)
	movq	-112(%rbp), %rdi                # 8-byte Reload
	movq	-88(%rbp), %rsi                 # 8-byte Reload
	movq	-72(%rbp), %rdx                 # 8-byte Reload
	movq	-120(%rbp), %rcx                # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx
	movl	%r13d, %r8d
	movl	%ebx, %r9d
	callq	mainQSort3
	movq	-96(%rbp), %rax                 # 8-byte Reload
	cmpl	$0, (%rax)
	jns	.LBB2_47
	jmp	.LBB2_87
	.p2align	4, 0x90
.LBB2_50:                               # %.us-lcssa.us
                                        #   in Loop: Header=BB2_33 Depth=1
	movslq	%r12d, %r9
	cmpb	$0, -416(%rbp,%r9)
	movq	-112(%rbp), %r13                # 8-byte Reload
	jne	.LBB2_88
# %bb.51:                               # %.preheader
                                        #   in Loop: Header=BB2_33 Depth=1
	addl	$1, %r12d
	leaq	(%r14,%r9,4), %rcx
	xorl	%edx, %edx
	movq	-128(%rbp), %rax                # 8-byte Reload
	.p2align	4, 0x90
.LBB2_52:                               #   Parent Loop BB2_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rcx), %esi
	andl	%edi, %esi
	movl	%esi, -3488(%rbp,%rdx,4)
	movslq	%r12d, %r12
	movl	(%r14,%r12,4), %esi
	andl	%edi, %esi
	addl	$-1, %esi
	movl	%esi, -2464(%rbp,%rdx,4)
	addq	$1, %rdx
	addq	$1024, %rcx                     # imm = 0x400
	addl	$256, %r12d                     # imm = 0x100
	cmpq	$256, %rdx                      # imm = 0x100
	jne	.LBB2_52
# %bb.53:                               #   in Loop: Header=BB2_33 Depth=1
	movslq	(%r14,%rax,4), %rdx
	andq	$-2097153, %rdx                 # imm = 0xFFDFFFFF
	movl	-3488(%rbp,%r9,4), %ecx
	movl	$-2097153, %r12d                # imm = 0xFFDFFFFF
	cmpl	%ecx, %edx
	jge	.LBB2_54
# %bb.55:                               # %.lr.ph.preheader
                                        #   in Loop: Header=BB2_33 Depth=1
	movq	-88(%rbp), %r15                 # 8-byte Reload
	movl	-76(%rbp), %eax                 # 4-byte Reload
	jmp	.LBB2_56
	.p2align	4, 0x90
.LBB2_58:                               #   in Loop: Header=BB2_56 Depth=2
	addq	$1, %rdx
	movslq	%ecx, %rsi
	cmpq	%rsi, %rdx
	jge	.LBB2_59
.LBB2_56:                               # %.lr.ph
                                        #   Parent Loop BB2_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%r13,%rdx,4), %esi
	leal	-1(%rsi), %edi
	sarl	$31, %edi
	andl	%r10d, %edi
	addl	%edi, %esi
	addl	$-1, %esi
	movslq	%esi, %rdi
	movzbl	(%r15,%rdi), %edi
	cmpb	$0, -416(%rbp,%rdi)
	jne	.LBB2_58
# %bb.57:                               #   in Loop: Header=BB2_56 Depth=2
	movslq	-3488(%rbp,%rdi,4), %rcx
	leal	1(%rcx), %ebx
	movl	%ebx, -3488(%rbp,%rdi,4)
	movl	%esi, (%r13,%rcx,4)
	movl	-3488(%rbp,%r9,4), %ecx
	jmp	.LBB2_58
	.p2align	4, 0x90
.LBB2_54:                               #   in Loop: Header=BB2_33 Depth=1
	movq	-88(%rbp), %r15                 # 8-byte Reload
	movl	-76(%rbp), %eax                 # 4-byte Reload
.LBB2_59:                               # %._crit_edge
                                        #   in Loop: Header=BB2_33 Depth=1
	addl	$256, %eax                      # imm = 0x100
	movslq	%eax, %r8
	movl	(%r14,%r8,4), %edx
	andl	%r12d, %edx
	addl	$-1, %edx
	movl	-2464(%rbp,%r9,4), %esi
	cmpl	%esi, %edx
	jle	.LBB2_64
# %bb.60:                               # %.lr.ph365.preheader
                                        #   in Loop: Header=BB2_33 Depth=1
	movslq	%edx, %rdi
	jmp	.LBB2_61
	.p2align	4, 0x90
.LBB2_63:                               #   in Loop: Header=BB2_61 Depth=2
	addq	$-1, %rdi
	movslq	%esi, %rax
	cmpq	%rax, %rdi
	jle	.LBB2_64
.LBB2_61:                               # %.lr.ph365
                                        #   Parent Loop BB2_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%r13,%rdi,4), %edx
	leal	-1(%rdx), %ebx
	sarl	$31, %ebx
	andl	%r10d, %ebx
	addl	%edx, %ebx
	addl	$-1, %ebx
	movslq	%ebx, %rdx
	movzbl	(%r15,%rdx), %edx
	cmpb	$0, -416(%rbp,%rdx)
	jne	.LBB2_63
# %bb.62:                               #   in Loop: Header=BB2_61 Depth=2
	movslq	-2464(%rbp,%rdx,4), %rsi
	leal	-1(%rsi), %eax
	movl	%eax, -2464(%rbp,%rdx,4)
	movl	%ebx, (%r13,%rsi,4)
	movl	-2464(%rbp,%r9,4), %esi
	jmp	.LBB2_63
	.p2align	4, 0x90
.LBB2_64:                               # %._crit_edge366
                                        #   in Loop: Header=BB2_33 Depth=1
	leal	-1(%rcx), %eax
	cmpl	%esi, %eax
	je	.LBB2_67
# %bb.65:                               #   in Loop: Header=BB2_33 Depth=1
	testl	%ecx, %ecx
	jne	.LBB2_89
# %bb.66:                               #   in Loop: Header=BB2_33 Depth=1
	cmpl	-144(%rbp), %esi                # 4-byte Folded Reload
	jne	.LBB2_89
.LBB2_67:                               #   in Loop: Header=BB2_33 Depth=1
	movq	-152(%rbp), %rax                # 8-byte Reload
	leaq	(%rax,%r9,4), %rcx
	xorl	%esi, %esi
	movq	-160(%rbp), %r15                # 8-byte Reload
	.p2align	4, 0x90
.LBB2_68:                               #   Parent Loop BB2_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	orb	$32, -3070(%rcx,%rsi)
	orb	$32, -2046(%rcx,%rsi)
	orb	$32, -1022(%rcx,%rsi)
	orb	$32, 2(%rcx,%rsi)
	addq	$4096, %rsi                     # imm = 0x1000
	cmpq	$262144, %rsi                   # imm = 0x40000
	jne	.LBB2_68
# %bb.69:                               #   in Loop: Header=BB2_33 Depth=1
	movb	$1, -416(%rbp,%r9)
	cmpq	$254, %r15
	ja	.LBB2_85
# %bb.70:                               #   in Loop: Header=BB2_33 Depth=1
	movq	-128(%rbp), %rax                # 8-byte Reload
	movslq	(%r14,%rax,4), %rsi
	andq	$-2097153, %rsi                 # imm = 0xFFDFFFFF
	movl	(%r14,%r8,4), %edi
	movl	$-2097153, %eax                 # imm = 0xFFDFFFFF
	andl	%eax, %edi
	movl	%edi, %eax
	subl	%esi, %eax
	movl	$-1, %ecx
	.p2align	4, 0x90
.LBB2_71:                               #   Parent Loop BB2_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addl	$1, %ecx
	movl	%eax, %edx
	sarl	%cl, %edx
	cmpl	$65534, %edx                    # imm = 0xFFFE
	jg	.LBB2_71
# %bb.72:                               #   in Loop: Header=BB2_33 Depth=1
	movl	%esi, %edx
	notl	%edx
	addl	%edx, %edi
	js	.LBB2_84
# %bb.73:                               # %.lr.ph371.preheader
                                        #   in Loop: Header=BB2_33 Depth=1
	movslq	%edi, %rdx
	testb	$1, %dl
	jne	.LBB2_77
# %bb.74:                               # %.lr.ph371.prol.preheader
                                        #   in Loop: Header=BB2_33 Depth=1
	movl	%edx, %r8d
	shrl	%cl, %r8d
	leaq	(%rdx,%rsi), %rbx
	movslq	(%r13,%rbx,4), %rbx
	movw	%r8w, (%r11,%rbx,2)
	cmpq	$33, %rbx
	jg	.LBB2_76
# %bb.75:                               #   in Loop: Header=BB2_33 Depth=1
	addl	%r10d, %ebx
	movslq	%ebx, %rbx
	movw	%r8w, (%r11,%rbx,2)
.LBB2_76:                               #   in Loop: Header=BB2_33 Depth=1
	addq	$-1, %rdx
.LBB2_77:                               # %.lr.ph371.prol.loopexit.unr-lcssa
                                        #   in Loop: Header=BB2_33 Depth=1
	testl	%edi, %edi
	je	.LBB2_84
# %bb.78:                               # %.lr.ph371.preheader1
                                        #   in Loop: Header=BB2_33 Depth=1
	leaq	(,%rsi,4), %rsi
	addq	%r13, %rsi
	jmp	.LBB2_79
	.p2align	4, 0x90
.LBB2_83:                               #   in Loop: Header=BB2_79 Depth=2
	leaq	1(%rdx), %rdi
	addq	$-1, %rdx
	cmpq	$1, %rdi
	jle	.LBB2_84
.LBB2_79:                               # %.lr.ph371
                                        #   Parent Loop BB2_33 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%edx, %edi
	sarl	%cl, %edi
	movslq	(%rsi,%rdx,4), %rbx
	movw	%di, (%r11,%rbx,2)
	cmpq	$33, %rbx
	jg	.LBB2_81
# %bb.80:                               #   in Loop: Header=BB2_79 Depth=2
	addl	%r10d, %ebx
	movslq	%ebx, %rbx
	movw	%di, (%r11,%rbx,2)
.LBB2_81:                               # %.lr.ph371.1
                                        #   in Loop: Header=BB2_79 Depth=2
	movslq	-4(%rsi,%rdx,4), %rdi
	addq	$-1, %rdx
	movl	%edx, %ebx
	sarl	%cl, %ebx
	movw	%bx, (%r11,%rdi,2)
	cmpq	$34, %rdi
	jge	.LBB2_83
# %bb.82:                               #   in Loop: Header=BB2_79 Depth=2
	addl	%r10d, %edi
	movslq	%edi, %rdi
	movw	%bx, (%r11,%rdi,2)
	jmp	.LBB2_83
.LBB2_86:
	cmpl	$4, -44(%rbp)                   # 4-byte Folded Reload
	jge	.LBB2_91
.LBB2_87:                               # %.loopexit
	addq	$3464, %rsp                     # imm = 0xD88
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB2_1:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rcx
	movl	$.L.str.6, %edi
	movl	$33, %esi
	movl	$1, %edx
	callq	fwrite
	jmp	.LBB2_2
.LBB2_13:
	movq	stderr(%rip), %rcx
	movl	$.L.str.2, %edi
	movl	$27, %esi
	movl	$1, %edx
	callq	fwrite
	movq	-64(%rbp), %r15                 # 8-byte Reload
	jmp	.LBB2_14
.LBB2_91:
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	movl	%edx, %r8d
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	subl	%ecx, %r8d
	movq	stderr(%rip), %rdi
	movl	$.L.str.8, %esi
                                        # kill: def $edx killed $edx killed $rdx
                                        # kill: def $ecx killed $ecx killed $rcx
	xorl	%eax, %eax
	addq	$3464, %rsp                     # imm = 0xD88
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	fprintf                         # TAILCALL
.LBB2_88:
	.cfi_def_cfa %rbp, 16
	movl	$1006, %edi                     # imm = 0x3EE
	callq	BZ2_bz__AssertH__fail
.LBB2_90:
	movl	$1002, %edi                     # imm = 0x3EA
	callq	BZ2_bz__AssertH__fail
.LBB2_89:
	movl	$1007, %edi                     # imm = 0x3EF
	callq	BZ2_bz__AssertH__fail
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$1272, %rsp                     # imm = 0x4F8
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%ecx, -60(%rbp)                 # 4-byte Spill
	movq	%rdx, -104(%rbp)                # 8-byte Spill
	movq	%rsi, %r12
	movq	%rdi, %r15
	movl	%r8d, -1312(%rbp)
	movl	%r9d, -912(%rbp)
	movl	$2, -512(%rbp)
	leaq	4(%rdi), %rax
	movq	%rax, -72(%rbp)                 # 8-byte Spill
	movl	$1, %ecx
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_4:                                #   in Loop: Header=BB3_1 Depth=1
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	-104(%rbp), %rdx                # 8-byte Reload
	movl	-60(%rbp), %ecx                 # 4-byte Reload
	movl	%r13d, %r8d
                                        # kill: def $r9d killed $r9d killed $r9
	movq	16(%rbp), %rbx
	pushq	%rbx
	pushq	%r14
	callq	mainSimpleSort
	addq	$16, %rsp
	cmpl	$0, (%rbx)
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	js	.LBB3_6
.LBB3_5:                                # %.backedge
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	%edi, %ecx
	testl	%edi, %edi
	jle	.LBB3_6
.LBB3_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_11 Depth 2
                                        #       Child Loop BB3_12 Depth 3
                                        #     Child Loop BB3_20 Depth 2
                                        #       Child Loop BB3_21 Depth 3
                                        #     Child Loop BB3_36 Depth 2
                                        #     Child Loop BB3_42 Depth 2
	cmpl	$98, %ecx
	jge	.LBB3_53
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	leal	-1(%rcx), %eax
	movl	-1312(%rbp,%rax,4), %r13d
	movl	-912(%rbp,%rax,4), %r9d
	movq	%rax, -56(%rbp)                 # 8-byte Spill
	movl	-512(%rbp,%rax,4), %r14d
	movl	%r9d, %eax
	subl	%r13d, %eax
	cmpl	$20, %eax
	jl	.LBB3_4
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	cmpl	$15, %r14d
	jge	.LBB3_4
# %bb.7:                                #   in Loop: Header=BB3_1 Depth=1
	movq	%rcx, -96(%rbp)                 # 8-byte Spill
	movslq	%r13d, %rcx
	movslq	%r9d, %rax
	movq	%rcx, -48(%rbp)                 # 8-byte Spill
	movl	(%r15,%rcx,4), %ecx
	addl	%r14d, %ecx
	movzbl	(%r12,%rcx), %edi
	movl	(%r15,%rax,4), %eax
	addl	%r14d, %eax
	movzbl	(%r12,%rax), %esi
	leal	(%r9,%r13), %eax
	sarl	%eax
	cltq
	movl	(%r15,%rax,4), %eax
	addl	%r14d, %eax
	movzbl	(%r12,%rax), %edx
	movq	%r9, %rbx
	callq	mmed3
	movzbl	%al, %eax
	movl	%ebx, %r9d
	movl	%r13d, %r8d
	movq	%rbx, -88(%rbp)                 # 8-byte Spill
	movl	%ebx, %esi
	movq	%r13, %rcx
	movq	%r13, -80(%rbp)                 # 8-byte Spill
	movl	%r13d, %ebx
	movslq	%esi, %r11
	movslq	%ebx, %rdx
	cmpl	%r11d, %edx
	jle	.LBB3_10
	.p2align	4, 0x90
.LBB3_9:                                #   in Loop: Header=BB3_1 Depth=1
	movl	%ebx, %r10d
	movslq	%edx, %rdi
	cmpq	%r11, %rdi
	jle	.LBB3_19
	jmp	.LBB3_27
	.p2align	4, 0x90
.LBB3_10:                               # %.lr.ph.preheader
                                        #   in Loop: Header=BB3_1 Depth=1
	movslq	%r8d, %r8
.LBB3_11:                               # %.lr.ph
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_12 Depth 3
	cmpq	%r11, %rdx
	movq	%r11, %r10
	cmovgq	%rdx, %r10
	addq	$1, %r10
	movq	%rdx, %rdi
	shlq	$32, %rdi
	.p2align	4, 0x90
.LBB3_12:                               #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	(%r15,%rdx,4), %ecx
	addl	%r14d, %ecx
	movzbl	(%r12,%rcx), %ecx
	subl	%eax, %ecx
	je	.LBB3_13
# %bb.14:                               #   in Loop: Header=BB3_12 Depth=3
	testl	%ecx, %ecx
	jg	.LBB3_15
# %bb.16:                               #   in Loop: Header=BB3_12 Depth=3
	addq	$1, %rdx
	movabsq	$4294967296, %rcx               # imm = 0x100000000
	addq	%rcx, %rdi
	movl	%edx, %ebx
	cmpq	%rdx, %r10
	jne	.LBB3_12
	jmp	.LBB3_17
	.p2align	4, 0x90
.LBB3_13:                               # %.outer237
                                        #   in Loop: Header=BB3_11 Depth=2
	sarq	$30, %rdi
	movl	(%r15,%rdi), %ecx
	movl	(%r15,%r8,4), %edx
	movl	%edx, (%r15,%rdi)
	movl	%ecx, (%r15,%r8,4)
	addq	$1, %r8
	leal	1(%rbx), %r10d
	movslq	%r10d, %rdx
	cmpl	%esi, %ebx
	movl	%r10d, %ebx
	jl	.LBB3_11
	jmp	.LBB3_18
	.p2align	4, 0x90
.LBB3_15:                               #   in Loop: Header=BB3_1 Depth=1
	movl	%ebx, %r10d
.LBB3_18:                               # %.outer237._crit_edge
                                        #   in Loop: Header=BB3_1 Depth=1
	movslq	%edx, %rdi
	cmpq	%r11, %rdi
	jg	.LBB3_27
.LBB3_19:                               # %.lr.ph27.preheader
                                        #   in Loop: Header=BB3_1 Depth=1
	movslq	%r9d, %r9
.LBB3_20:                               # %.lr.ph27
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_21 Depth 3
	movq	%r11, %rdx
	shlq	$32, %rdx
	movq	%r11, %rcx
	.p2align	4, 0x90
.LBB3_21:                               #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_20 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	(%r15,%rcx,4), %ebx
	addl	%r14d, %ebx
	movzbl	(%r12,%rbx), %ebx
	subl	%eax, %ebx
	je	.LBB3_22
# %bb.23:                               #   in Loop: Header=BB3_21 Depth=3
	testl	%ebx, %ebx
	js	.LBB3_24
# %bb.25:                               #   in Loop: Header=BB3_21 Depth=3
	leaq	-1(%rcx), %rsi
	movabsq	$-4294967296, %rbx              # imm = 0xFFFFFFFF00000000
	addq	%rbx, %rdx
	cmpq	%rcx, %rdi
	movq	%rsi, %rcx
	jl	.LBB3_21
	jmp	.LBB3_26
	.p2align	4, 0x90
.LBB3_22:                               # %.outer
                                        #   in Loop: Header=BB3_20 Depth=2
	sarq	$30, %rdx
	movl	(%r15,%rdx), %ecx
	movl	(%r15,%r9,4), %ebx
	movl	%ebx, (%r15,%rdx)
	movl	%ecx, (%r15,%r9,4)
	addq	$-1, %r9
	addl	$-1, %esi
	movslq	%esi, %r11
	cmpq	%r11, %rdi
	jle	.LBB3_20
	jmp	.LBB3_27
	.p2align	4, 0x90
.LBB3_24:                               #   in Loop: Header=BB3_1 Depth=1
	movq	%rcx, %r11
	jmp	.LBB3_27
	.p2align	4, 0x90
.LBB3_17:                               # %._crit_edge18
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	%r10, %rdx
	movslq	%edx, %rdi
	cmpq	%r11, %rdi
	jle	.LBB3_19
	jmp	.LBB3_27
	.p2align	4, 0x90
.LBB3_26:                               # %._crit_edge35
                                        #   in Loop: Header=BB3_1 Depth=1
	cmpq	%rdi, %r11
	cmovgeq	%rdi, %r11
	addq	$-1, %r11
	movl	%r11d, %esi
.LBB3_27:                               # %.outer._crit_edge
                                        #   in Loop: Header=BB3_1 Depth=1
	cmpl	%esi, %r10d
	jg	.LBB3_29
# %bb.28:                               #   in Loop: Header=BB3_1 Depth=1
	movl	(%r15,%rdi,4), %ecx
	movslq	%r11d, %rdx
	movl	(%r15,%rdx,4), %ebx
	movl	%ebx, (%r15,%rdi,4)
	movl	%ecx, (%r15,%rdx,4)
	addl	$1, %r10d
	addl	$-1, %esi
	movl	%r10d, %ebx
	movslq	%esi, %r11
	movslq	%ebx, %rdx
	cmpl	%r11d, %edx
	jle	.LBB3_10
	jmp	.LBB3_9
	.p2align	4, 0x90
.LBB3_29:                               #   in Loop: Header=BB3_1 Depth=1
	cmpl	%r8d, %r9d
	jge	.LBB3_31
# %bb.30:                               #   in Loop: Header=BB3_1 Depth=1
	addl	$1, %r14d
	movq	-56(%rbp), %rax                 # 8-byte Reload
	movl	%r14d, -512(%rbp,%rax,4)
	movq	-96(%rbp), %rax                 # 8-byte Reload
	movl	%eax, %edi
	jmp	.LBB3_5
	.p2align	4, 0x90
.LBB3_31:                               #   in Loop: Header=BB3_1 Depth=1
	movl	%r8d, %ecx
	subl	-80(%rbp), %ecx                 # 4-byte Folded Reload
	movl	%r10d, %eax
	subl	%r8d, %eax
	cmpl	%eax, %ecx
	cmovll	%ecx, %eax
	testl	%eax, %eax
	movq	-48(%rbp), %r13                 # 8-byte Reload
	jle	.LBB3_37
# %bb.32:                               # %.lr.ph47.preheader
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	%r10d, %ecx
	subl	%eax, %ecx
	movslq	%ecx, %r11
	leal	-1(%rax), %ecx
	testb	$1, %al
	je	.LBB3_34
# %bb.33:                               # %.lr.ph47.prol.preheader
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	(%r15,%r13,4), %eax
	movl	(%r15,%r11,4), %ebx
	movl	%ebx, (%r15,%r13,4)
	movl	%eax, (%r15,%r11,4)
	addq	$1, %r13
	addq	$1, %r11
	movl	%ecx, %eax
.LBB3_34:                               # %.lr.ph47.prol.loopexit.unr-lcssa
                                        #   in Loop: Header=BB3_1 Depth=1
	testl	%ecx, %ecx
	je	.LBB3_37
# %bb.35:                               # %.lr.ph47.preheader4
                                        #   in Loop: Header=BB3_1 Depth=1
	addl	$2, %eax
	movq	-72(%rbp), %rcx                 # 8-byte Reload
	.p2align	4, 0x90
.LBB3_36:                               # %.lr.ph47
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rcx,%r13,4), %ebx
	movl	-4(%rcx,%r11,4), %edx
	movl	%edx, -4(%rcx,%r13,4)
	movl	%ebx, -4(%rcx,%r11,4)
	movl	(%rcx,%r13,4), %edx
	movl	(%rcx,%r11,4), %ebx
	movl	%ebx, (%rcx,%r13,4)
	movl	%edx, (%rcx,%r11,4)
	addl	$-2, %eax
	addq	$8, %rcx
	cmpl	$2, %eax
	jg	.LBB3_36
.LBB3_37:                               # %._crit_edge48
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	-88(%rbp), %rcx                 # 8-byte Reload
	movl	%ecx, %eax
	subl	%r9d, %eax
	movl	%r9d, %edx
	subl	%esi, %edx
	cmpl	%edx, %eax
	cmovll	%eax, %edx
	leal	1(%rcx), %eax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	testl	%edx, %edx
	jle	.LBB3_43
# %bb.38:                               # %.lr.ph53.preheader
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movl	%eax, %ecx
	subl	%edx, %ecx
	movslq	%ecx, %r13
	leal	-1(%rdx), %ebx
	testb	$1, %dl
	je	.LBB3_40
# %bb.39:                               # %.lr.ph53.prol.preheader
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	(%r15,%rdi,4), %eax
	movl	(%r15,%r13,4), %edx
	movl	%edx, (%r15,%rdi,4)
	movl	%eax, (%r15,%r13,4)
	addq	$1, %rdi
	addq	$1, %r13
	movl	%ebx, %edx
.LBB3_40:                               # %.lr.ph53.prol.loopexit.unr-lcssa
                                        #   in Loop: Header=BB3_1 Depth=1
	testl	%ebx, %ebx
	je	.LBB3_43
# %bb.41:                               # %.lr.ph53.preheader3
                                        #   in Loop: Header=BB3_1 Depth=1
	addl	$2, %edx
	movq	-72(%rbp), %rbx                 # 8-byte Reload
	.p2align	4, 0x90
.LBB3_42:                               # %.lr.ph53
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rbx,%rdi,4), %eax
	movl	-4(%rbx,%r13,4), %r11d
	movl	%r11d, -4(%rbx,%rdi,4)
	movl	%eax, -4(%rbx,%r13,4)
	movl	(%rbx,%rdi,4), %eax
	movl	(%rbx,%r13,4), %ecx
	movl	%ecx, (%rbx,%rdi,4)
	movl	%eax, (%rbx,%r13,4)
	addl	$-2, %edx
	addq	$8, %rbx
	cmpl	$2, %edx
	jg	.LBB3_42
.LBB3_43:                               # %._crit_edge54
                                        #   in Loop: Header=BB3_1 Depth=1
	notl	%r8d
	movq	-80(%rbp), %rax                 # 8-byte Reload
	addl	%eax, %r8d
	leal	(%r8,%r10), %ebx
	movq	-48(%rbp), %rdx                 # 8-byte Reload
	subl	%r9d, %edx
	leal	(%rsi,%rdx), %r13d
	movl	%ebx, %ecx
	subl	%eax, %ecx
	movq	-88(%rbp), %r11                 # 8-byte Reload
	movl	%r11d, %edi
	subl	%r13d, %edi
	cmpl	%edi, %ecx
	jge	.LBB3_44
# %bb.45:                               #   in Loop: Header=BB3_1 Depth=1
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	movl	%ebx, %r9d
	jmp	.LBB3_46
.LBB3_44:                               #   in Loop: Header=BB3_1 Depth=1
	movl	%edi, %ecx
	movl	%r13d, -48(%rbp)                # 4-byte Spill
	movl	%eax, %r13d
	movl	%r11d, %r9d
	movl	%ebx, %r11d
.LBB3_46:                               #   in Loop: Header=BB3_1 Depth=1
	leal	(%r10,%r8), %edi
	addl	$1, %edi
	leal	(%rsi,%rdx), %ebx
	addl	$-1, %ebx
	leal	1(%r14), %esi
	movl	%ebx, %eax
	subl	%edi, %eax
	cmpl	%eax, %ecx
	jge	.LBB3_47
# %bb.48:                               #   in Loop: Header=BB3_1 Depth=1
	movl	%edi, %r10d
	movl	%r9d, %r8d
	movl	%r14d, %r9d
	movl	%r11d, %ecx
	subl	%r13d, %ecx
	cmpl	%eax, %ecx
	jl	.LBB3_51
.LBB3_50:                               #   in Loop: Header=BB3_1 Depth=1
	movl	%r10d, %eax
	movl	%r13d, %r10d
	movl	%ebx, %edx
	movl	%r11d, %ebx
	movl	%esi, %ecx
	movl	%r14d, %esi
	jmp	.LBB3_52
.LBB3_47:                               #   in Loop: Header=BB3_1 Depth=1
	movl	%ecx, %eax
	movl	-48(%rbp), %r10d                # 4-byte Reload
	movl	%ebx, %r8d
	movl	%r9d, %ebx
	movl	%esi, %r9d
	movl	%r14d, %esi
	movl	%edi, -48(%rbp)                 # 4-byte Spill
	movl	%r11d, %ecx
	subl	%r13d, %ecx
	cmpl	%eax, %ecx
	jge	.LBB3_50
.LBB3_51:                               #   in Loop: Header=BB3_1 Depth=1
	movl	%r13d, %eax
	movl	%r11d, %edx
	movl	%r14d, %ecx
.LBB3_52:                               #   in Loop: Header=BB3_1 Depth=1
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	movl	%r10d, -1312(%rbp,%rdi,4)
	movl	%ebx, -912(%rbp,%rdi,4)
	movl	%esi, -512(%rbp,%rdi,4)
	movq	-96(%rbp), %rdi                 # 8-byte Reload
	movslq	%edi, %rsi
	movl	%eax, -1312(%rbp,%rsi,4)
	movl	%edx, -912(%rbp,%rsi,4)
	movl	%ecx, -512(%rbp,%rsi,4)
	movl	-48(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -1308(%rbp,%rsi,4)
	movl	%r8d, -908(%rbp,%rsi,4)
	movl	%r9d, -508(%rbp,%rsi,4)
	addl	$2, %edi
                                        # kill: def $edi killed $edi killed $rdi def $rdi
	jmp	.LBB3_5
.LBB3_6:
	addq	$1272, %rsp                     # imm = 0x4F8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB3_53:
	.cfi_def_cfa %rbp, 16
	movl	$1001, %edi                     # imm = 0x3E9
	callq	BZ2_bz__AssertH__fail
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
                                        # kill: def $r8d killed $r8d def $r8
	movl	%ecx, -48(%rbp)                 # 4-byte Spill
	movq	%rdx, -104(%rbp)                # 8-byte Spill
	movq	%rsi, -96(%rbp)                 # 8-byte Spill
	movl	%r9d, %eax
	movq	%r8, -120(%rbp)                 # 8-byte Spill
	subl	%r8d, %eax
	jle	.LBB4_23
# %bb.1:                                # %.preheader.preheader
	movq	%rdi, %r12
	movq	$-1, %rdx
	.p2align	4, 0x90
.LBB4_2:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movq	%rdx, %rcx
	addq	$1, %rdx
	cmpl	%eax, incs+4(,%rcx,4)
	jle	.LBB4_2
# %bb.3:
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	andq	%rax, %rdx
	movq	%rdx, -128(%rbp)                # 8-byte Spill
	je	.LBB4_23
# %bb.4:                                # %.lr.ph.preheader
	movslq	%r9d, %rax
	movq	%rax, -80(%rbp)                 # 8-byte Spill
	movq	-120(%rbp), %rax                # 8-byte Reload
	leal	1(%rax), %ecx
	movl	%ecx, -112(%rbp)                # 4-byte Spill
	addl	$2, %eax
	movl	%eax, -108(%rbp)                # 4-byte Spill
	jmp	.LBB4_5
	.p2align	4, 0x90
.LBB4_22:                               #   in Loop: Header=BB4_5 Depth=1
	cmpq	$1, -136(%rbp)                  # 8-byte Folded Reload
	jle	.LBB4_23
.LBB4_5:                                # %.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_6 Depth 2
                                        #       Child Loop BB4_8 Depth 3
                                        #       Child Loop BB4_13 Depth 3
                                        #       Child Loop BB4_18 Depth 3
	movq	-128(%rbp), %rcx                # 8-byte Reload
	leaq	-1(%rcx), %rax
	movq	%rax, -128(%rbp)                # 8-byte Spill
	movq	%rcx, -136(%rbp)                # 8-byte Spill
	movl	incs-4(,%rcx,4), %r15d
	movq	-120(%rbp), %rcx                # 8-byte Reload
	leal	(%r15,%rcx), %eax
	leal	-1(%r15,%rcx), %edx
	movl	%edx, -44(%rbp)                 # 4-byte Spill
	movslq	%eax, %rdx
	movl	-108(%rbp), %eax                # 4-byte Reload
	movl	%eax, -60(%rbp)                 # 4-byte Spill
	movl	-112(%rbp), %eax                # 4-byte Reload
	movl	%eax, -64(%rbp)                 # 4-byte Spill
	movl	%ecx, %eax
	movl	%ecx, -68(%rbp)                 # 4-byte Spill
	jmp	.LBB4_6
	.p2align	4, 0x90
.LBB4_19:                               # %._crit_edge
                                        #   in Loop: Header=BB4_6 Depth=2
	movslq	%r13d, %rbx
.LBB4_21:                               # %split
                                        #   in Loop: Header=BB4_6 Depth=2
	movq	-56(%rbp), %rax                 # 8-byte Reload
	movl	%eax, (%r12,%rbx,4)
	movq	-88(%rbp), %rdx                 # 8-byte Reload
	addq	$3, %rdx
	addl	$3, -68(%rbp)                   # 4-byte Folded Spill
	addl	$3, -64(%rbp)                   # 4-byte Folded Spill
	addl	$3, -60(%rbp)                   # 4-byte Folded Spill
	movq	24(%rbp), %rax
	cmpl	$0, (%rax)
	js	.LBB4_23
.LBB4_6:                                #   Parent Loop BB4_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_8 Depth 3
                                        #       Child Loop BB4_13 Depth 3
                                        #       Child Loop BB4_18 Depth 3
	cmpq	-80(%rbp), %rdx                 # 8-byte Folded Reload
	jg	.LBB4_22
# %bb.7:                                #   in Loop: Header=BB4_6 Depth=2
	movq	%rdx, -88(%rbp)                 # 8-byte Spill
	movl	(%r12,%rdx,4), %ecx
	movl	16(%rbp), %eax
	movq	%rcx, -56(%rbp)                 # 8-byte Spill
	leal	(%rcx,%rax), %r14d
	movl	-68(%rbp), %eax                 # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	.p2align	4, 0x90
.LBB4_8:                                #   Parent Loop BB4_5 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	leal	(%r15,%rax), %ebx
	movslq	%eax, %r13
	movl	(%r12,%r13,4), %edi
	movl	16(%rbp), %eax
	addl	%eax, %edi
	movl	%r14d, %esi
	movq	-96(%rbp), %rdx                 # 8-byte Reload
	movq	-104(%rbp), %rcx                # 8-byte Reload
	movl	-48(%rbp), %r8d                 # 4-byte Reload
	movq	24(%rbp), %r9
	callq	mainGtU
	testb	%al, %al
	je	.LBB4_9
# %bb.10:                               #   in Loop: Header=BB4_8 Depth=3
	movl	(%r12,%r13,4), %eax
	movslq	%ebx, %rcx
	movl	%eax, (%r12,%rcx,4)
	movl	%r13d, %eax
	subl	%r15d, %eax
	cmpl	-44(%rbp), %r13d                # 4-byte Folded Reload
	jg	.LBB4_8
	jmp	.LBB4_11
	.p2align	4, 0x90
.LBB4_9:                                # %._crit_edge126
                                        #   in Loop: Header=BB4_6 Depth=2
	movslq	%ebx, %r13
.LBB4_11:                               # %split127
                                        #   in Loop: Header=BB4_6 Depth=2
	movq	-56(%rbp), %rax                 # 8-byte Reload
	movl	%eax, (%r12,%r13,4)
	movq	-88(%rbp), %rax                 # 8-byte Reload
	cmpq	-80(%rbp), %rax                 # 8-byte Folded Reload
	jge	.LBB4_22
# %bb.12:                               #   in Loop: Header=BB4_6 Depth=2
	movl	4(%r12,%rax,4), %ecx
	movl	16(%rbp), %eax
	movq	%rcx, -56(%rbp)                 # 8-byte Spill
	leal	(%rcx,%rax), %r14d
	movl	-64(%rbp), %eax                 # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	.p2align	4, 0x90
.LBB4_13:                               #   Parent Loop BB4_5 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	leal	(%r15,%rax), %r13d
	movslq	%eax, %rbx
	movl	(%r12,%rbx,4), %edi
	movl	16(%rbp), %eax
	addl	%eax, %edi
	movl	%r14d, %esi
	movq	-96(%rbp), %rdx                 # 8-byte Reload
	movq	-104(%rbp), %rcx                # 8-byte Reload
	movl	-48(%rbp), %r8d                 # 4-byte Reload
	movq	24(%rbp), %r9
	callq	mainGtU
	testb	%al, %al
	je	.LBB4_14
# %bb.15:                               #   in Loop: Header=BB4_13 Depth=3
	movl	(%r12,%rbx,4), %eax
	movslq	%r13d, %rcx
	movl	%eax, (%r12,%rcx,4)
	movl	%ebx, %eax
	subl	%r15d, %eax
	cmpl	-44(%rbp), %ebx                 # 4-byte Folded Reload
	jg	.LBB4_13
	jmp	.LBB4_16
	.p2align	4, 0x90
.LBB4_14:                               # %._crit_edge124
                                        #   in Loop: Header=BB4_6 Depth=2
	movslq	%r13d, %rbx
.LBB4_16:                               # %split125
                                        #   in Loop: Header=BB4_6 Depth=2
	movq	-56(%rbp), %rax                 # 8-byte Reload
	movl	%eax, (%r12,%rbx,4)
	movq	-88(%rbp), %rcx                 # 8-byte Reload
	leaq	2(%rcx), %rax
	cmpq	-80(%rbp), %rax                 # 8-byte Folded Reload
	jg	.LBB4_22
# %bb.17:                               #   in Loop: Header=BB4_6 Depth=2
	movl	8(%r12,%rcx,4), %ecx
	movl	16(%rbp), %eax
	movq	%rcx, -56(%rbp)                 # 8-byte Spill
	leal	(%rcx,%rax), %r14d
	movl	-60(%rbp), %eax                 # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	.p2align	4, 0x90
.LBB4_18:                               #   Parent Loop BB4_5 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	leal	(%r15,%rax), %r13d
	movslq	%eax, %rbx
	movl	(%r12,%rbx,4), %edi
	movl	16(%rbp), %eax
	addl	%eax, %edi
	movl	%r14d, %esi
	movq	-96(%rbp), %rdx                 # 8-byte Reload
	movq	-104(%rbp), %rcx                # 8-byte Reload
	movl	-48(%rbp), %r8d                 # 4-byte Reload
	movq	24(%rbp), %r9
	callq	mainGtU
	testb	%al, %al
	je	.LBB4_19
# %bb.20:                               #   in Loop: Header=BB4_18 Depth=3
	movl	(%r12,%rbx,4), %eax
	movslq	%r13d, %rcx
	movl	%eax, (%r12,%rcx,4)
	movl	%ebx, %eax
	subl	%r15d, %eax
	cmpl	-44(%rbp), %ebx                 # 4-byte Folded Reload
	jg	.LBB4_18
	jmp	.LBB4_21
.LBB4_23:                               # %.loopexit
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
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
	cmpb	%sil, %dil
	movl	%esi, %eax
	cmoval	%edi, %eax
	cmoval	%esi, %edi
	cmpb	%dl, %al
	jbe	.LBB5_2
# %bb.1:
	cmpb	%dl, %dil
	movzbl	%dil, %ecx
	movzbl	%dl, %eax
	cmoval	%ecx, %eax
.LBB5_2:
                                        # kill: def $al killed $al killed $eax
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
	pushq	%rbx
	.cfi_offset %rbx, -24
                                        # kill: def $r8d killed $r8d def $r8
                                        # kill: def $esi killed $esi def $rsi
                                        # kill: def $edi killed $edi def $rdi
	movl	%edi, %r10d
	movl	%esi, %eax
	movb	(%rdx,%rax), %al
	cmpb	%al, (%rdx,%r10)
	jne	.LBB6_30
# %bb.1:
	leal	1(%rdi), %r10d
	leal	1(%rsi), %eax
	movb	(%rdx,%rax), %al
	cmpb	%al, (%rdx,%r10)
	jne	.LBB6_32
# %bb.2:
	leal	2(%rdi), %r10d
	leal	2(%rsi), %eax
	movb	(%rdx,%rax), %al
	cmpb	%al, (%rdx,%r10)
	jne	.LBB6_32
# %bb.3:
	leal	3(%rdi), %r10d
	leal	3(%rsi), %eax
	movb	(%rdx,%rax), %al
	cmpb	%al, (%rdx,%r10)
	jne	.LBB6_32
# %bb.4:
	leal	4(%rdi), %r10d
	leal	4(%rsi), %eax
	movb	(%rdx,%rax), %al
	cmpb	%al, (%rdx,%r10)
	jne	.LBB6_32
# %bb.5:
	leal	5(%rdi), %r10d
	leal	5(%rsi), %eax
	movb	(%rdx,%rax), %al
	cmpb	%al, (%rdx,%r10)
	jne	.LBB6_32
# %bb.6:
	leal	6(%rdi), %r10d
	leal	6(%rsi), %eax
	movb	(%rdx,%rax), %al
	cmpb	%al, (%rdx,%r10)
	jne	.LBB6_32
# %bb.7:
	leal	7(%rdi), %r10d
	leal	7(%rsi), %eax
	movb	(%rdx,%rax), %al
	cmpb	%al, (%rdx,%r10)
	jne	.LBB6_32
# %bb.8:
	leal	8(%rdi), %r10d
	leal	8(%rsi), %eax
	movb	(%rdx,%rax), %al
	cmpb	%al, (%rdx,%r10)
	jne	.LBB6_32
# %bb.9:
	leal	9(%rdi), %r10d
	leal	9(%rsi), %eax
	movb	(%rdx,%rax), %al
	cmpb	%al, (%rdx,%r10)
	jne	.LBB6_32
# %bb.10:
	leal	10(%rdi), %r10d
	leal	10(%rsi), %eax
	movb	(%rdx,%rax), %al
	cmpb	%al, (%rdx,%r10)
	jne	.LBB6_32
# %bb.11:
	leal	11(%rdi), %r10d
	leal	11(%rsi), %eax
	movb	(%rdx,%rax), %al
	cmpb	%al, (%rdx,%r10)
	jne	.LBB6_32
# %bb.12:
	addl	$12, %edi
	addl	$12, %esi
	leal	16(%r8), %r10d
.LBB6_13:                               # =>This Inner Loop Header: Depth=1
	movl	%edi, %edi
	movl	%esi, %esi
	movzbl	(%rdx,%rsi), %eax
	cmpb	%al, (%rdx,%rdi)
	jne	.LBB6_32
# %bb.14:                               #   in Loop: Header=BB6_13 Depth=1
	movzwl	(%rcx,%rsi,2), %eax
	cmpw	%ax, (%rcx,%rdi,2)
	jne	.LBB6_32
# %bb.15:                               #   in Loop: Header=BB6_13 Depth=1
	leal	1(%rdi), %r11d
	leal	1(%rsi), %eax
	movzbl	(%rdx,%rax), %ebx
	cmpb	%bl, (%rdx,%r11)
	jne	.LBB6_32
# %bb.16:                               #   in Loop: Header=BB6_13 Depth=1
	movzwl	(%rcx,%rax,2), %eax
	cmpw	%ax, (%rcx,%r11,2)
	jne	.LBB6_32
# %bb.17:                               #   in Loop: Header=BB6_13 Depth=1
	leal	2(%rdi), %r11d
	leal	2(%rsi), %eax
	movzbl	(%rdx,%rax), %ebx
	cmpb	%bl, (%rdx,%r11)
	jne	.LBB6_32
# %bb.18:                               #   in Loop: Header=BB6_13 Depth=1
	movzwl	(%rcx,%rax,2), %eax
	cmpw	%ax, (%rcx,%r11,2)
	jne	.LBB6_32
# %bb.19:                               #   in Loop: Header=BB6_13 Depth=1
	leal	3(%rdi), %r11d
	leal	3(%rsi), %eax
	movzbl	(%rdx,%rax), %ebx
	cmpb	%bl, (%rdx,%r11)
	jne	.LBB6_32
# %bb.20:                               #   in Loop: Header=BB6_13 Depth=1
	movzwl	(%rcx,%rax,2), %eax
	cmpw	%ax, (%rcx,%r11,2)
	jne	.LBB6_32
# %bb.21:                               #   in Loop: Header=BB6_13 Depth=1
	leal	4(%rdi), %r11d
	leal	4(%rsi), %eax
	movzbl	(%rdx,%rax), %ebx
	cmpb	%bl, (%rdx,%r11)
	jne	.LBB6_32
# %bb.22:                               #   in Loop: Header=BB6_13 Depth=1
	movzwl	(%rcx,%rax,2), %eax
	cmpw	%ax, (%rcx,%r11,2)
	jne	.LBB6_32
# %bb.23:                               #   in Loop: Header=BB6_13 Depth=1
	leal	5(%rdi), %r11d
	leal	5(%rsi), %eax
	movzbl	(%rdx,%rax), %ebx
	cmpb	%bl, (%rdx,%r11)
	jne	.LBB6_32
# %bb.24:                               #   in Loop: Header=BB6_13 Depth=1
	movzwl	(%rcx,%rax,2), %eax
	cmpw	%ax, (%rcx,%r11,2)
	jne	.LBB6_32
# %bb.25:                               #   in Loop: Header=BB6_13 Depth=1
	leal	6(%rdi), %r11d
	leal	6(%rsi), %eax
	movzbl	(%rdx,%rax), %ebx
	cmpb	%bl, (%rdx,%r11)
	jne	.LBB6_32
# %bb.26:                               #   in Loop: Header=BB6_13 Depth=1
	movzwl	(%rcx,%rax,2), %eax
	cmpw	%ax, (%rcx,%r11,2)
	jne	.LBB6_32
# %bb.27:                               #   in Loop: Header=BB6_13 Depth=1
	leal	7(%rdi), %r11d
	leal	7(%rsi), %eax
	movzbl	(%rdx,%rax), %ebx
	cmpb	%bl, (%rdx,%r11)
	jne	.LBB6_32
# %bb.28:                               #   in Loop: Header=BB6_13 Depth=1
	movzwl	(%rcx,%rax,2), %eax
	cmpw	%ax, (%rcx,%r11,2)
	jne	.LBB6_32
# %bb.29:                               #   in Loop: Header=BB6_13 Depth=1
	addl	$8, %edi
	addl	$8, %esi
	xorl	%eax, %eax
	cmpl	%r8d, %edi
	movl	%r8d, %ebx
	cmovbl	%eax, %ebx
	subl	%ebx, %edi
	cmpl	%r8d, %esi
	movl	%r8d, %ebx
	cmovbl	%eax, %ebx
	addl	$-1, (%r9)
	subl	%ebx, %esi
	addl	$-8, %r10d
	cmpl	$7, %r10d
	jg	.LBB6_13
	jmp	.LBB6_31
.LBB6_30:
	seta	%al
.LBB6_31:                               # %.loopexit
                                        # kill: def $al killed $al killed $eax
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB6_32:
	.cfi_def_cfa %rbp, 16
	seta	%al
                                        # kill: def $al killed $al killed $eax
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$856, %rsp                      # imm = 0x358
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movq	%rdi, %r15
	movl	%edx, -896(%rbp)
	movl	%ecx, -496(%rbp)
	leaq	4(%rdi), %rax
	movq	%rax, -80(%rbp)                 # 8-byte Spill
	xorl	%ebx, %ebx
	movl	$1, %r12d
.LBB7_1:                                # %.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_3 Depth 2
                                        #     Child Loop BB7_14 Depth 2
                                        #       Child Loop BB7_15 Depth 3
                                        #     Child Loop BB7_22 Depth 2
                                        #       Child Loop BB7_23 Depth 3
                                        #     Child Loop BB7_38 Depth 2
                                        #     Child Loop BB7_44 Depth 2
	cmpq	$98, %r12
	jg	.LBB7_51
# %bb.2:                                # %.lr.ph..lr.ph.split_crit_edge.preheader
                                        #   in Loop: Header=BB7_1 Depth=1
	movq	%r12, %r13
	shlq	$32, %r13
	addq	$-1, %r12
	.p2align	4, 0x90
.LBB7_3:                                # %.lr.ph..lr.ph.split_crit_edge
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-896(%rbp,%r12,4), %edx
	movl	-496(%rbp,%r12,4), %ecx
	movl	%ecx, %eax
	subl	%edx, %eax
	cmpl	$10, %eax
	jge	.LBB7_5
# %bb.4:                                #   in Loop: Header=BB7_3 Depth=2
	movq	%r15, %rdi
	movq	%r14, %rsi
                                        # kill: def $edx killed $edx killed $rdx
                                        # kill: def $ecx killed $ecx killed $rcx
	callq	fallbackSimpleSort
	movabsq	$-4294967296, %rax              # imm = 0xFFFFFFFF00000000
	addq	%rax, %r13
	leaq	-1(%r12), %rax
	addq	$1, %r12
	cmpq	$1, %r12
	movq	%rax, %r12
	jg	.LBB7_3
	jmp	.LBB7_50
	.p2align	4, 0x90
.LBB7_5:                                #   in Loop: Header=BB7_1 Depth=1
	movslq	%edx, %rdi
	imull	$7621, %ebx, %ebx               # imm = 0x1DC5
	addl	$1, %ebx
	andl	$32767, %ebx                    # imm = 0x7FFF
	imull	$43691, %ebx, %eax              # imm = 0xAAAB
	shrl	$17, %eax
	leal	(%rax,%rax,2), %esi
	movl	%ebx, %eax
	subl	%esi, %eax
	cmpw	$1, %ax
	movl	%ebx, -52(%rbp)                 # 4-byte Spill
	movq	%rdi, -72(%rbp)                 # 8-byte Spill
	je	.LBB7_8
# %bb.6:                                #   in Loop: Header=BB7_1 Depth=1
	movzwl	%ax, %eax
	testl	%eax, %eax
	jne	.LBB7_9
# %bb.7:                                #   in Loop: Header=BB7_1 Depth=1
	movl	(%r15,%rdi,4), %eax
	jmp	.LBB7_11
.LBB7_8:                                #   in Loop: Header=BB7_1 Depth=1
	leal	(%rcx,%rdx), %eax
	sarl	%eax
	cltq
	jmp	.LBB7_10
.LBB7_9:                                #   in Loop: Header=BB7_1 Depth=1
	movslq	%ecx, %rax
.LBB7_10:                               #   in Loop: Header=BB7_1 Depth=1
	movl	(%r15,%rax,4), %eax
.LBB7_11:                               #   in Loop: Header=BB7_1 Depth=1
	leaq	(%r14,%rax,4), %rax
	movl	(%rax), %ebx
	movl	%ecx, %eax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	movl	%edx, %eax
	movq	%rax, -64(%rbp)                 # 8-byte Spill
	movl	%ecx, %r9d
	movl	%edx, %r11d
	movslq	%r9d, %r10
	movslq	%r11d, %rax
	cmpl	%r10d, %eax
	jg	.LBB7_12
	.p2align	4, 0x90
.LBB7_13:                               # %.lr.ph235.preheader
                                        #   in Loop: Header=BB7_1 Depth=1
	movq	-64(%rbp), %rsi                 # 8-byte Reload
	movslq	%esi, %rsi
	movq	%rsi, -64(%rbp)                 # 8-byte Spill
.LBB7_14:                               # %.lr.ph235
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_15 Depth 3
	cmpq	%r10, %rax
	movq	%r10, %r8
	cmovgq	%rax, %r8
	addq	$1, %r8
	movq	%rax, %rdi
	shlq	$32, %rdi
	.p2align	4, 0x90
.LBB7_15:                               #   Parent Loop BB7_1 Depth=1
                                        #     Parent Loop BB7_14 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	(%r15,%rax,4), %esi
	movl	(%r14,%rsi,4), %esi
	subl	%ebx, %esi
	je	.LBB7_18
# %bb.16:                               #   in Loop: Header=BB7_15 Depth=3
	testl	%esi, %esi
	jg	.LBB7_19
# %bb.17:                               #   in Loop: Header=BB7_15 Depth=3
	addq	$1, %rax
	movabsq	$4294967296, %rsi               # imm = 0x100000000
	addq	%rsi, %rdi
	movl	%eax, %r11d
	cmpq	%rax, %r8
	jne	.LBB7_15
	jmp	.LBB7_28
	.p2align	4, 0x90
.LBB7_18:                               # %.outer184
                                        #   in Loop: Header=BB7_14 Depth=2
	sarq	$30, %rdi
	movl	(%r15,%rdi), %r8d
	movq	-64(%rbp), %rax                 # 8-byte Reload
	movl	(%r15,%rax,4), %esi
	movl	%esi, (%r15,%rdi)
	movl	%r8d, (%r15,%rax,4)
	addq	$1, %rax
	movq	%rax, -64(%rbp)                 # 8-byte Spill
	leal	1(%r11), %r8d
	movslq	%r8d, %rax
	cmpl	%r9d, %r11d
	movl	%r8d, %r11d
	jl	.LBB7_14
	jmp	.LBB7_20
	.p2align	4, 0x90
.LBB7_19:                               #   in Loop: Header=BB7_1 Depth=1
	movl	%r11d, %r8d
.LBB7_20:                               # %.outer184._crit_edge
                                        #   in Loop: Header=BB7_1 Depth=1
	movslq	%eax, %r11
	cmpq	%r10, %r11
	jg	.LBB7_30
	jmp	.LBB7_21
	.p2align	4, 0x90
.LBB7_28:                               # %._crit_edge242
                                        #   in Loop: Header=BB7_1 Depth=1
	movq	%r8, %rax
	movslq	%eax, %r11
	cmpq	%r10, %r11
	jle	.LBB7_21
	jmp	.LBB7_30
	.p2align	4, 0x90
.LBB7_12:                               #   in Loop: Header=BB7_1 Depth=1
	movl	%r11d, %r8d
	movslq	%eax, %r11
	cmpq	%r10, %r11
	jg	.LBB7_30
.LBB7_21:                               # %.lr.ph251.preheader
                                        #   in Loop: Header=BB7_1 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	cltq
	movq	%rax, -48(%rbp)                 # 8-byte Spill
.LBB7_22:                               # %.lr.ph251
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_23 Depth 3
	movq	%r10, %rax
	shlq	$32, %rax
	movq	%r10, %rsi
	.p2align	4, 0x90
.LBB7_23:                               #   Parent Loop BB7_1 Depth=1
                                        #     Parent Loop BB7_22 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	(%r15,%rsi,4), %edi
	movl	(%r14,%rdi,4), %edi
	subl	%ebx, %edi
	je	.LBB7_26
# %bb.24:                               #   in Loop: Header=BB7_23 Depth=3
	testl	%edi, %edi
	js	.LBB7_27
# %bb.25:                               #   in Loop: Header=BB7_23 Depth=3
	leaq	-1(%rsi), %r9
	movabsq	$-4294967296, %rdi              # imm = 0xFFFFFFFF00000000
	addq	%rdi, %rax
	cmpq	%rsi, %r11
	movq	%r9, %rsi
	jl	.LBB7_23
	jmp	.LBB7_29
	.p2align	4, 0x90
.LBB7_26:                               # %.outer
                                        #   in Loop: Header=BB7_22 Depth=2
	sarq	$30, %rax
	movl	(%r15,%rax), %r10d
	movq	-48(%rbp), %rsi                 # 8-byte Reload
	movl	(%r15,%rsi,4), %edi
	movl	%edi, (%r15,%rax)
	movl	%r10d, (%r15,%rsi,4)
	addq	$-1, %rsi
	movq	%rsi, -48(%rbp)                 # 8-byte Spill
	addl	$-1, %r9d
	movslq	%r9d, %r10
	cmpq	%r10, %r11
	jle	.LBB7_22
	jmp	.LBB7_30
	.p2align	4, 0x90
.LBB7_27:                               #   in Loop: Header=BB7_1 Depth=1
	movq	%rsi, %r10
.LBB7_30:                               # %.outer._crit_edge
                                        #   in Loop: Header=BB7_1 Depth=1
	cmpl	%r9d, %r8d
	jg	.LBB7_32
.LBB7_31:                               #   in Loop: Header=BB7_1 Depth=1
	movl	(%r15,%r11,4), %eax
	movslq	%r10d, %rsi
	movl	(%r15,%rsi,4), %edi
	movl	%edi, (%r15,%r11,4)
	movl	%eax, (%r15,%rsi,4)
	addl	$1, %r8d
	addl	$-1, %r9d
	movl	%r8d, %r11d
	movslq	%r9d, %r10
	movslq	%r11d, %rax
	cmpl	%r10d, %eax
	jle	.LBB7_13
	jmp	.LBB7_12
	.p2align	4, 0x90
.LBB7_29:                               # %._crit_edge259
                                        #   in Loop: Header=BB7_1 Depth=1
	cmpq	%r11, %r10
	cmovgeq	%r11, %r10
	addq	$-1, %r10
	movl	%r10d, %r9d
	cmpl	%r9d, %r8d
	jle	.LBB7_31
.LBB7_32:                               #   in Loop: Header=BB7_1 Depth=1
	movq	-64(%rbp), %rdi                 # 8-byte Reload
	cmpl	%edi, -48(%rbp)                 # 4-byte Folded Reload
	jl	.LBB7_49
# %bb.33:                               #   in Loop: Header=BB7_1 Depth=1
	movq	%r13, -88(%rbp)                 # 8-byte Spill
	movl	%edi, %esi
	subl	%edx, %esi
	movl	%r8d, %eax
	subl	%edi, %eax
	cmpl	%eax, %esi
	cmovll	%esi, %eax
	testl	%eax, %eax
	movq	-72(%rbp), %r10                 # 8-byte Reload
	jle	.LBB7_39
# %bb.34:                               # %.lr.ph271.preheader
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	%r8d, %esi
	subl	%eax, %esi
	movslq	%esi, %r13
	leal	-1(%rax), %esi
	testb	$1, %al
	je	.LBB7_36
# %bb.35:                               # %.lr.ph271.prol.preheader
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	(%r15,%r10,4), %eax
	movl	(%r15,%r13,4), %edi
	movl	%edi, (%r15,%r10,4)
	movl	%eax, (%r15,%r13,4)
	addq	$1, %r10
	addq	$1, %r13
	movl	%esi, %eax
.LBB7_36:                               # %.lr.ph271.prol.loopexit.unr-lcssa
                                        #   in Loop: Header=BB7_1 Depth=1
	testl	%esi, %esi
	je	.LBB7_39
# %bb.37:                               # %.lr.ph271.preheader4
                                        #   in Loop: Header=BB7_1 Depth=1
	addl	$2, %eax
	movq	-80(%rbp), %rsi                 # 8-byte Reload
	.p2align	4, 0x90
.LBB7_38:                               # %.lr.ph271
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rsi,%r10,4), %edi
	movl	-4(%rsi,%r13,4), %ebx
	movl	%ebx, -4(%rsi,%r10,4)
	movl	%edi, -4(%rsi,%r13,4)
	movl	(%rsi,%r10,4), %edi
	movl	(%rsi,%r13,4), %ebx
	movl	%ebx, (%rsi,%r10,4)
	movl	%edi, (%rsi,%r13,4)
	addl	$-2, %eax
	addq	$8, %rsi
	cmpl	$2, %eax
	jg	.LBB7_38
.LBB7_39:                               # %._crit_edge272
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	%ecx, %eax
	movq	-48(%rbp), %rbx                 # 8-byte Reload
	subl	%ebx, %eax
                                        # kill: def $ebx killed $ebx killed $rbx def $rbx
	subl	%r9d, %ebx
	cmpl	%ebx, %eax
	cmovll	%eax, %ebx
	leal	1(%rcx), %eax
	movl	%eax, -72(%rbp)                 # 4-byte Spill
	testl	%ebx, %ebx
	movq	-88(%rbp), %r13                 # 8-byte Reload
	jle	.LBB7_45
# %bb.40:                               # %.lr.ph277.preheader
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	-72(%rbp), %eax                 # 4-byte Reload
	subl	%ebx, %eax
	cltq
	leal	-1(%rbx), %edi
	testb	$1, %bl
	je	.LBB7_42
# %bb.41:                               # %.lr.ph277.prol.preheader
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	(%r15,%r11,4), %esi
	movl	(%r15,%rax,4), %ebx
	movl	%ebx, (%r15,%r11,4)
	movl	%esi, (%r15,%rax,4)
	addq	$1, %r11
	addq	$1, %rax
	movl	%edi, %ebx
.LBB7_42:                               # %.lr.ph277.prol.loopexit.unr-lcssa
                                        #   in Loop: Header=BB7_1 Depth=1
	testl	%edi, %edi
	je	.LBB7_45
# %bb.43:                               # %.lr.ph277.preheader3
                                        #   in Loop: Header=BB7_1 Depth=1
	addl	$2, %ebx
	movq	-80(%rbp), %rsi                 # 8-byte Reload
	.p2align	4, 0x90
.LBB7_44:                               # %.lr.ph277
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rsi,%r11,4), %edi
	movl	-4(%rsi,%rax,4), %r10d
	movl	%r10d, -4(%rsi,%r11,4)
	movl	%edi, -4(%rsi,%rax,4)
	movl	(%rsi,%r11,4), %r10d
	movq	%rax, %rdi
	movl	(%rsi,%rax,4), %eax
	movl	%eax, (%rsi,%r11,4)
	movq	%rdi, %rax
	movl	%r10d, (%rsi,%rdi,4)
	addl	$-2, %ebx
	addq	$8, %rsi
	cmpl	$2, %ebx
	jg	.LBB7_44
.LBB7_45:                               # %._crit_edge278
                                        #   in Loop: Header=BB7_1 Depth=1
	movq	-64(%rbp), %rdi                 # 8-byte Reload
	notl	%edi
	addl	%edx, %edi
	addl	%r8d, %edi
	movl	-72(%rbp), %eax                 # 4-byte Reload
	subl	-48(%rbp), %eax                 # 4-byte Folded Reload
	addl	%eax, %r9d
	movl	%edi, %eax
	subl	%edx, %eax
	movl	%ecx, %esi
	subl	%r9d, %esi
	cmpl	%esi, %eax
	jle	.LBB7_47
# %bb.46:                               #   in Loop: Header=BB7_1 Depth=1
	movabsq	$-4294967296, %rax              # imm = 0xFFFFFFFF00000000
	addq	%r13, %rax
	sarq	$30, %rax
	movl	%edx, -896(%rbp,%rax)
	movl	%edi, -496(%rbp,%rax)
	sarq	$30, %r13
	movl	%r9d, -896(%rbp,%r13)
	movl	%ecx, -496(%rbp,%r13)
	jmp	.LBB7_48
.LBB7_47:                               #   in Loop: Header=BB7_1 Depth=1
	movabsq	$-4294967296, %rax              # imm = 0xFFFFFFFF00000000
	addq	%r13, %rax
	sarq	$30, %rax
	movl	%r9d, -896(%rbp,%rax)
	movl	%ecx, -496(%rbp,%rax)
	sarq	$30, %r13
	movl	%edx, -896(%rbp,%r13)
	movl	%edi, -496(%rbp,%r13)
.LBB7_48:                               #   in Loop: Header=BB7_1 Depth=1
	addq	$2, %r12
.LBB7_49:                               #   in Loop: Header=BB7_1 Depth=1
	movl	-52(%rbp), %ebx                 # 4-byte Reload
	movq	%r12, %rax
	shlq	$32, %rax
	movslq	%r12d, %r12
	testq	%rax, %rax
	jg	.LBB7_1
.LBB7_50:                               # %.outer185._crit_edge
	addq	$856, %rsp                      # imm = 0x358
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB7_51:                               # %.split
	.cfi_def_cfa %rbp, 16
	movl	$1004, %edi                     # imm = 0x3EC
	callq	BZ2_bz__AssertH__fail
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
                                        # kill: def $ecx killed $ecx def $rcx
	movl	%ecx, %eax
	subl	%edx, %eax
	je	.LBB8_11
# %bb.1:
	movslq	%ecx, %r12
	cmpl	$3, %eax
	jle	.LBB8_9
# %bb.2:
	leal	-4(%rcx), %eax
	movslq	%edx, %r8
	cmpl	%edx, %eax
	jl	.LBB8_10
# %bb.3:                                # %.lr.ph85.preheader
	movabsq	$4294967296, %r9                # imm = 0x100000000
	movslq	%eax, %r14
	movabsq	$-17179869184, %r10             # imm = 0xFFFFFFFC00000000
	movl	%ecx, %r11d
	jmp	.LBB8_5
	.p2align	4, 0x90
.LBB8_4:                                # %.thread
                                        #   in Loop: Header=BB8_5 Depth=1
	imulq	%r9, %rbx
	addq	%r10, %rbx
	sarq	$30, %rbx
	movl	%r15d, (%rdi,%rbx)
	leaq	-1(%r14), %rax
	addl	$-1, %r11d
	cmpq	%r8, %r14
	movq	%rax, %r14
	jle	.LBB8_10
.LBB8_5:                                # %.lr.ph85
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_7 Depth 2
	movslq	%r11d, %rbx
	movslq	(%rdi,%r14,4), %r15
	cmpl	%ecx, %ebx
	jg	.LBB8_4
# %bb.6:                                # %.lr.ph78.preheader
                                        #   in Loop: Header=BB8_5 Depth=1
	movl	(%rsi,%r15,4), %r13d
	.p2align	4, 0x90
.LBB8_7:                                # %.lr.ph78
                                        #   Parent Loop BB8_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rdi,%rbx,4), %eax
	cmpl	(%rsi,%rax,4), %r13d
	jbe	.LBB8_4
# %bb.8:                                #   in Loop: Header=BB8_7 Depth=2
	movl	%eax, -16(%rdi,%rbx,4)
	addq	$4, %rbx
	cmpq	%r12, %rbx
	jle	.LBB8_7
	jmp	.LBB8_4
.LBB8_9:                                # %..loopexit52_crit_edge
	movslq	%edx, %r8
.LBB8_10:                               # %.loopexit52
	leal	-1(%rcx), %eax
	cmpl	%edx, %eax
	jge	.LBB8_12
.LBB8_11:                               # %.loopexit
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB8_12:                               # %.lr.ph75.preheader
	.cfi_def_cfa %rbp, 16
	movabsq	$4294967296, %r9                # imm = 0x100000000
	movslq	%eax, %r14
	movabsq	$-4294967296, %r10              # imm = 0xFFFFFFFF00000000
	movl	%ecx, %r15d
	jmp	.LBB8_15
	.p2align	4, 0x90
.LBB8_13:                               #   in Loop: Header=BB8_15 Depth=1
	movq	%rax, %rdx
.LBB8_14:                               # %.thread51
                                        #   in Loop: Header=BB8_15 Depth=1
	imulq	%r9, %rdx
	addq	%r10, %rdx
	sarq	$30, %rdx
	movl	%r11d, (%rdi,%rdx)
	leaq	-1(%r14), %rax
	addl	$-1, %r15d
	cmpq	%r8, %r14
	movq	%rax, %r14
	jle	.LBB8_11
.LBB8_15:                               # %.lr.ph75
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_17 Depth 2
	movslq	%r15d, %rax
	movslq	(%rdi,%r14,4), %r11
	cmpl	%ecx, %eax
	jg	.LBB8_13
# %bb.16:                               # %.lr.ph.preheader
                                        #   in Loop: Header=BB8_15 Depth=1
	movl	(%rsi,%r11,4), %ebx
	.p2align	4, 0x90
.LBB8_17:                               # %.lr.ph
                                        #   Parent Loop BB8_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rdi,%rax,4), %edx
	cmpl	(%rsi,%rdx,4), %ebx
	jbe	.LBB8_13
# %bb.18:                               #   in Loop: Header=BB8_17 Depth=2
	movl	%edx, -4(%rdi,%rax,4)
	leaq	1(%rax), %rdx
	cmpq	%r12, %rax
	movq	%rdx, %rax
	jl	.LBB8_17
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movl	%edi, %r12d
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
	movq	(%r15), %rsi
	movl	$progNameReally, %edi
	callq	copyFileName
	movq	$progNameReally, progName(%rip)
	movl	$progNameReally+1, %eax
	jmp	.LBB9_3
	.p2align	4, 0x90
.LBB9_1:                                #   in Loop: Header=BB9_3 Depth=1
	movq	%rax, progName(%rip)
.LBB9_2:                                #   in Loop: Header=BB9_3 Depth=1
	addq	$1, %rax
.LBB9_3:                                # =>This Inner Loop Header: Depth=1
	movzbl	-1(%rax), %ecx
	cmpb	$47, %cl
	je	.LBB9_1
# %bb.4:                                #   in Loop: Header=BB9_3 Depth=1
	testb	%cl, %cl
	jne	.LBB9_2
# %bb.5:
	movq	$0, -48(%rbp)
	leaq	-48(%rbp), %r14
	movl	$.L.str.7.16, %esi
	movq	%r14, %rdi
	callq	addFlagsFromEnvVar
	movl	$.L.str.8.17, %esi
	movq	%r14, %rdi
	callq	addFlagsFromEnvVar
	leal	-1(%r12), %eax
	testl	%eax, %eax
	movl	$1, %eax
	cmovlel	%eax, %r12d
	cmpl	$1, %r12d
	jne	.LBB9_7
# %bb.6:                                # %._crit_edge190
	movq	-48(%rbp), %rax
	jmp	.LBB9_10
.LBB9_7:                                # %.lr.ph183
	movl	$1, %ebx
	movq	-48(%rbp), %rax
	.p2align	4, 0x90
.LBB9_8:                                # =>This Inner Loop Header: Depth=1
	movq	(%r15,%rbx,8), %rsi
	movq	%rax, %rdi
	callq	snocString
	addq	$1, %rbx
	cmpq	%rbx, %r12
	jne	.LBB9_8
# %bb.9:                                # %._crit_edge184
	movq	%rax, -48(%rbp)
.LBB9_10:
	movl	$7, longestFileName(%rip)
	movl	$0, numFileNames(%rip)
	testq	%rax, %rax
	movq	%rax, -56(%rbp)                 # 8-byte Spill
	je	.LBB9_20
# %bb.11:                               # %.lr.ph178.preheader
	movb	$1, %r13b
	xorl	%r15d, %r15d
	movl	$7, %r12d
	movq	%rax, %r14
	jmp	.LBB9_14
	.p2align	4, 0x90
.LBB9_12:                               #   in Loop: Header=BB9_14 Depth=1
	xorl	%r13d, %r13d
.LBB9_13:                               #   in Loop: Header=BB9_14 Depth=1
	movq	8(%r14), %r14
	testq	%r14, %r14
	je	.LBB9_21
.LBB9_14:                               # %.lr.ph178
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r14), %rbx
	movl	$.L.str.9.18, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_12
# %bb.15:                               #   in Loop: Header=BB9_14 Depth=1
	testb	%r13b, %r13b
	je	.LBB9_18
# %bb.16:                               #   in Loop: Header=BB9_14 Depth=1
	cmpb	$45, (%rbx)
	jne	.LBB9_18
# %bb.17:                               #   in Loop: Header=BB9_14 Depth=1
	movb	$1, %r13b
	jmp	.LBB9_13
	.p2align	4, 0x90
.LBB9_18:                               #   in Loop: Header=BB9_14 Depth=1
	addl	$1, %r15d
	movl	%r15d, numFileNames(%rip)
	movq	%rbx, %rdi
	callq	strlen
	cmpl	%eax, %r12d
	jge	.LBB9_13
# %bb.19:                               #   in Loop: Header=BB9_14 Depth=1
	movl	%eax, longestFileName(%rip)
	movl	%eax, %r12d
	jmp	.LBB9_13
.LBB9_20:
	xorl	%r15d, %r15d
.LBB9_21:                               # %._crit_edge179
	xorl	%eax, %eax
	testl	%r15d, %r15d
	setne	%al
	leal	1(%rax,%rax), %eax
	movl	%eax, srcMode(%rip)
	movl	$1, opMode(%rip)
	movq	progName(%rip), %rbx
	movl	$.L.str.10, %esi
	movq	%rbx, %rdi
	callq	strstr
	testq	%rax, %rax
	jne	.LBB9_23
# %bb.22:
	movl	$.L.str.11, %esi
	movq	%rbx, %rdi
	callq	strstr
	testq	%rax, %rax
	je	.LBB9_24
.LBB9_23:
	movl	$2, opMode(%rip)
.LBB9_24:
	movl	$.L.str.12, %esi
	movq	%rbx, %rdi
	callq	strstr
	testq	%rax, %rax
	movq	-56(%rbp), %r13                 # 8-byte Reload
	jne	.LBB9_28
# %bb.25:
	movl	$.L.str.13, %esi
	movq	%rbx, %rdi
	callq	strstr
	testq	%rax, %rax
	jne	.LBB9_28
# %bb.26:
	movl	$.L.str.14, %esi
	movq	%rbx, %rdi
	callq	strstr
	testq	%rax, %rax
	jne	.LBB9_28
# %bb.27:
	movl	$.L.str.15, %esi
	movq	%rbx, %rdi
	callq	strstr
	testq	%rax, %rax
	je	.LBB9_29
.LBB9_28:
	movl	$2, opMode(%rip)
	cmpl	$1, %r15d
	movl	$2, %eax
	sbbl	$0, %eax
	movl	%eax, srcMode(%rip)
.LBB9_29:
	testq	%r13, %r13
	je	.LBB9_95
# %bb.30:                               # %.lr.ph170.preheader
	movq	%r13, %r15
	jmp	.LBB9_32
	.p2align	4, 0x90
.LBB9_31:                               # %.loopexit89
                                        #   in Loop: Header=BB9_32 Depth=1
	movq	8(%r15), %r15
	testq	%r15, %r15
	je	.LBB9_59
.LBB9_32:                               # %.lr.ph170
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_39 Depth 2
	movq	(%r15), %r12
	movl	$.L.str.9.18, %esi
	movq	%r12, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_59
# %bb.33:                               #   in Loop: Header=BB9_32 Depth=1
	cmpb	$45, (%r12)
	jne	.LBB9_31
# %bb.34:                               #   in Loop: Header=BB9_32 Depth=1
	movb	1(%r12), %al
	testb	%al, %al
	je	.LBB9_31
# %bb.35:                               #   in Loop: Header=BB9_32 Depth=1
	cmpb	$45, %al
	je	.LBB9_31
# %bb.36:                               # %.lr.ph165.preheader
                                        #   in Loop: Header=BB9_32 Depth=1
	movl	$2, %ebx
	jmp	.LBB9_39
.LBB9_37:                               #   in Loop: Header=BB9_39 Depth=2
	addl	$1, verbosity(%rip)
	.p2align	4, 0x90
.LBB9_38:                               #   in Loop: Header=BB9_39 Depth=2
	movzbl	(%r12,%rbx), %eax
	addq	$1, %rbx
	testb	%al, %al
	je	.LBB9_31
.LBB9_39:                               # %.lr.ph165
                                        #   Parent Loop BB9_32 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsbl	%al, %eax
	addl	$-49, %eax
	cmpl	$73, %eax
	ja	.LBB9_152
# %bb.40:                               # %.lr.ph165
                                        #   in Loop: Header=BB9_39 Depth=2
	jmpq	*.LJTI9_0(,%rax,8)
.LBB9_41:                               #   in Loop: Header=BB9_39 Depth=2
	callq	license
	movq	(%r15), %r12
	jmp	.LBB9_38
.LBB9_42:                               #   in Loop: Header=BB9_39 Depth=2
	movb	$1, forceOverwrite(%rip)
	jmp	.LBB9_38
.LBB9_43:                               #   in Loop: Header=BB9_39 Depth=2
	movl	$2, srcMode(%rip)
	jmp	.LBB9_38
.LBB9_44:                               #   in Loop: Header=BB9_39 Depth=2
	movl	$3, opMode(%rip)
	jmp	.LBB9_38
.LBB9_45:                               #   in Loop: Header=BB9_39 Depth=2
	movl	$1, opMode(%rip)
	jmp	.LBB9_38
.LBB9_46:                               #   in Loop: Header=BB9_39 Depth=2
	movl	$3, blockSize100k(%rip)
	jmp	.LBB9_38
.LBB9_47:                               #   in Loop: Header=BB9_39 Depth=2
	movl	$4, blockSize100k(%rip)
	jmp	.LBB9_38
.LBB9_48:                               #   in Loop: Header=BB9_39 Depth=2
	movl	$7, blockSize100k(%rip)
	jmp	.LBB9_38
.LBB9_49:                               #   in Loop: Header=BB9_39 Depth=2
	movl	$2, opMode(%rip)
	jmp	.LBB9_38
.LBB9_50:                               #   in Loop: Header=BB9_39 Depth=2
	movl	$1, blockSize100k(%rip)
	jmp	.LBB9_38
.LBB9_51:                               #   in Loop: Header=BB9_39 Depth=2
	movl	$2, blockSize100k(%rip)
	jmp	.LBB9_38
.LBB9_52:                               #   in Loop: Header=BB9_39 Depth=2
	movb	$1, keepInputFiles(%rip)
	jmp	.LBB9_38
.LBB9_53:                               #   in Loop: Header=BB9_39 Depth=2
	movb	$1, smallMode(%rip)
	jmp	.LBB9_38
.LBB9_54:                               #   in Loop: Header=BB9_39 Depth=2
	movl	$5, blockSize100k(%rip)
	jmp	.LBB9_38
.LBB9_55:                               #   in Loop: Header=BB9_39 Depth=2
	movl	$8, blockSize100k(%rip)
	jmp	.LBB9_38
.LBB9_56:                               #   in Loop: Header=BB9_39 Depth=2
	movl	$6, blockSize100k(%rip)
	jmp	.LBB9_38
.LBB9_57:                               #   in Loop: Header=BB9_39 Depth=2
	movb	$0, noisy(%rip)
	jmp	.LBB9_38
.LBB9_58:                               #   in Loop: Header=BB9_39 Depth=2
	movl	$9, blockSize100k(%rip)
	jmp	.LBB9_38
.LBB9_59:                               # %.lr.ph160.preheader
	movq	%r13, %r15
	jmp	.LBB9_62
	.p2align	4, 0x90
.LBB9_60:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$2, srcMode(%rip)
.LBB9_61:                               #   in Loop: Header=BB9_62 Depth=1
	movq	8(%r15), %r15
	testq	%r15, %r15
	je	.LBB9_95
.LBB9_62:                               # %.lr.ph160
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r15), %rbx
	movl	$.L.str.9.18, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_95
# %bb.63:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.17, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_60
# %bb.64:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.18, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_81
# %bb.65:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.19, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_82
# %bb.66:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.20, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_83
# %bb.67:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.21, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_84
# %bb.68:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.22, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_85
# %bb.69:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.23, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_86
# %bb.70:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.24, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_87
# %bb.71:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.25, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_89
# %bb.72:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.26, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_89
# %bb.73:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.27, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_91
# %bb.74:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.28, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_90
# %bb.75:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.29, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_90
# %bb.76:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.30, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_92
# %bb.77:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.31, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_93
# %bb.78:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.32, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_94
# %bb.79:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.33, %esi
	movq	%rbx, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_151
# %bb.80:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$.L.str.9.18, %esi
	movl	$2, %edx
	movq	%rbx, %rdi
	callq	strncmp
	testl	%eax, %eax
	jne	.LBB9_61
	jmp	.LBB9_156
	.p2align	4, 0x90
.LBB9_81:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$2, opMode(%rip)
	jmp	.LBB9_61
.LBB9_82:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$1, opMode(%rip)
	jmp	.LBB9_61
.LBB9_83:                               #   in Loop: Header=BB9_62 Depth=1
	movb	$1, forceOverwrite(%rip)
	jmp	.LBB9_61
.LBB9_84:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$3, opMode(%rip)
	jmp	.LBB9_61
.LBB9_85:                               #   in Loop: Header=BB9_62 Depth=1
	movb	$1, keepInputFiles(%rip)
	jmp	.LBB9_61
.LBB9_86:                               #   in Loop: Header=BB9_62 Depth=1
	movb	$1, smallMode(%rip)
	jmp	.LBB9_61
.LBB9_89:                               #   in Loop: Header=BB9_62 Depth=1
	callq	license
	jmp	.LBB9_61
.LBB9_87:                               #   in Loop: Header=BB9_62 Depth=1
	movb	$0, noisy(%rip)
	jmp	.LBB9_61
.LBB9_90:                               #   in Loop: Header=BB9_62 Depth=1
	movq	%rbx, %rdi
	callq	redundant
	jmp	.LBB9_61
.LBB9_91:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$1, workFactor(%rip)
	jmp	.LBB9_61
.LBB9_92:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$1, blockSize100k(%rip)
	jmp	.LBB9_61
.LBB9_93:                               #   in Loop: Header=BB9_62 Depth=1
	movl	$9, blockSize100k(%rip)
	jmp	.LBB9_61
.LBB9_94:                               #   in Loop: Header=BB9_62 Depth=1
	addl	$1, verbosity(%rip)
	jmp	.LBB9_61
.LBB9_95:                               # %._crit_edge161
	cmpl	$5, verbosity(%rip)
	jl	.LBB9_97
# %bb.96:
	movl	$4, verbosity(%rip)
.LBB9_97:
	movl	opMode(%rip), %eax
	cmpl	$1, %eax
	jne	.LBB9_101
# %bb.98:
	cmpb	$0, smallMode(%rip)
	je	.LBB9_104
# %bb.99:
	cmpl	$3, blockSize100k(%rip)
	jl	.LBB9_104
# %bb.100:
	movl	$2, blockSize100k(%rip)
	jmp	.LBB9_104
.LBB9_101:                              # %thread-pre-split
	cmpl	$3, %eax
	jne	.LBB9_104
# %bb.102:
	movl	srcMode(%rip), %ecx
	cmpl	$2, %ecx
	jne	.LBB9_113
# %bb.103:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.34, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	$1, %edi
	callq	exit
.LBB9_104:                              # %thread-pre-split.thread
	movl	srcMode(%rip), %ecx
	cmpl	$2, %ecx
	jne	.LBB9_107
# %bb.105:                              # %thread-pre-split.thread
	cmpl	$0, numFileNames(%rip)
	jne	.LBB9_107
# %bb.106:
	movl	$1, srcMode(%rip)
	movl	$1, %ecx
.LBB9_107:                              # %.thread
	cmpl	$1, %eax
	jne	.LBB9_113
# %bb.108:
	cmpl	$3, %ecx
	jne	.LBB9_109
.LBB9_114:
	movl	$mySignalCatcher, %esi
	movl	$2, %edi
	callq	signal
	movl	$mySignalCatcher, %esi
	movl	$15, %edi
	callq	signal
	movl	$mySignalCatcher, %esi
	movl	$1, %edi
	callq	signal
	movl	opMode(%rip), %eax
	cmpl	$2, %eax
	jne	.LBB9_110
.LBB9_115:
	movb	$0, unzFailsExist(%rip)
	cmpl	$1, srcMode(%rip)
	jne	.LBB9_128
# %bb.116:
	xorl	%edi, %edi
	callq	uncompress
.LBB9_117:                              # %.loopexit87
	cmpb	$0, unzFailsExist(%rip)
	je	.LBB9_146
	jmp	.LBB9_155
.LBB9_113:                              # %.thread.thread
	movl	$0, blockSize100k(%rip)
	cmpl	$3, %ecx
	je	.LBB9_114
.LBB9_109:
	cmpl	$2, %eax
	je	.LBB9_115
.LBB9_110:
	cmpl	$1, %eax
	jne	.LBB9_118
# %bb.111:
	cmpl	$1, srcMode(%rip)
	jne	.LBB9_120
# %bb.112:
	xorl	%edi, %edi
	callq	compress
	jmp	.LBB9_146
.LBB9_118:
	movb	$0, testFailsExist(%rip)
	cmpl	$1, srcMode(%rip)
	jne	.LBB9_136
# %bb.119:
	xorl	%edi, %edi
	callq	testf
	jmp	.LBB9_144
.LBB9_128:                              # %.preheader134
	testq	%r13, %r13
	je	.LBB9_147
# %bb.129:                              # %.lr.ph155.preheader
	movb	$1, %r15b
	movq	%r13, %rbx
	jmp	.LBB9_132
	.p2align	4, 0x90
.LBB9_130:                              #   in Loop: Header=BB9_132 Depth=1
	xorl	%eax, %eax
.LBB9_131:                              #   in Loop: Header=BB9_132 Depth=1
	movq	8(%rbx), %rbx
	movl	%eax, %r15d
	testq	%rbx, %rbx
	je	.LBB9_117
.LBB9_132:                              # %.lr.ph155
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r14
	movl	$.L.str.9.18, %esi
	movq	%r14, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_130
# %bb.133:                              #   in Loop: Header=BB9_132 Depth=1
	testb	%r15b, %r15b
	je	.LBB9_135
# %bb.134:                              #   in Loop: Header=BB9_132 Depth=1
	movb	$1, %al
	cmpb	$45, (%r14)
	je	.LBB9_131
.LBB9_135:                              #   in Loop: Header=BB9_132 Depth=1
	addl	$1, numFilesProcessed(%rip)
	movq	%r14, %rdi
	callq	uncompress
	movl	%r15d, %eax
	jmp	.LBB9_131
.LBB9_120:                              # %.preheader133
	testq	%r13, %r13
	je	.LBB9_147
# %bb.121:                              # %.lr.ph150.preheader
	movb	$1, %r15b
	movq	%r13, %rbx
	jmp	.LBB9_124
	.p2align	4, 0x90
.LBB9_122:                              #   in Loop: Header=BB9_124 Depth=1
	xorl	%eax, %eax
.LBB9_123:                              #   in Loop: Header=BB9_124 Depth=1
	movq	8(%rbx), %rbx
	movl	%eax, %r15d
	testq	%rbx, %rbx
	je	.LBB9_146
.LBB9_124:                              # %.lr.ph150
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r14
	movl	$.L.str.9.18, %esi
	movq	%r14, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_122
# %bb.125:                              #   in Loop: Header=BB9_124 Depth=1
	testb	%r15b, %r15b
	je	.LBB9_127
# %bb.126:                              #   in Loop: Header=BB9_124 Depth=1
	movb	$1, %al
	cmpb	$45, (%r14)
	je	.LBB9_123
.LBB9_127:                              #   in Loop: Header=BB9_124 Depth=1
	addl	$1, numFilesProcessed(%rip)
	movq	%r14, %rdi
	callq	compress
	movl	%r15d, %eax
	jmp	.LBB9_123
.LBB9_136:                              # %.preheader
	testq	%r13, %r13
	je	.LBB9_144
# %bb.137:                              # %.lr.ph145.preheader
	movb	$1, %r15b
	movq	%r13, %rbx
	jmp	.LBB9_140
	.p2align	4, 0x90
.LBB9_138:                              #   in Loop: Header=BB9_140 Depth=1
	xorl	%eax, %eax
.LBB9_139:                              #   in Loop: Header=BB9_140 Depth=1
	movq	8(%rbx), %rbx
	movl	%eax, %r15d
	testq	%rbx, %rbx
	je	.LBB9_144
.LBB9_140:                              # %.lr.ph145
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r14
	movl	$.L.str.9.18, %esi
	movq	%r14, %rdi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_138
# %bb.141:                              #   in Loop: Header=BB9_140 Depth=1
	testb	%r15b, %r15b
	je	.LBB9_143
# %bb.142:                              #   in Loop: Header=BB9_140 Depth=1
	movb	$1, %al
	cmpb	$45, (%r14)
	je	.LBB9_139
.LBB9_143:                              #   in Loop: Header=BB9_140 Depth=1
	addl	$1, numFilesProcessed(%rip)
	movq	%r14, %rdi
	callq	testf
	movl	%r15d, %eax
	jmp	.LBB9_139
.LBB9_144:                              # %.loopexit88
	cmpb	$0, testFailsExist(%rip)
	je	.LBB9_146
# %bb.145:                              # %.loopexit88
	cmpb	$0, noisy(%rip)
	jne	.LBB9_154
.LBB9_146:                              # %.loopexit
	testq	%r13, %r13
	jne	.LBB9_149
.LBB9_147:                              # %._crit_edge
	movl	exitValue(%rip), %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
	.p2align	4, 0x90
.LBB9_148:                              #   in Loop: Header=BB9_149 Depth=1
	.cfi_def_cfa %rbp, 16
	movq	%r13, %rdi
	callq	free
	movq	%rbx, %r13
	testq	%rbx, %rbx
	je	.LBB9_147
.LBB9_149:                              # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r13), %rdi
	movq	8(%r13), %rbx
	testq	%rdi, %rdi
	je	.LBB9_148
# %bb.150:                              #   in Loop: Header=BB9_149 Depth=1
	callq	free
	jmp	.LBB9_148
.LBB9_151:
	movq	progName(%rip), %rdi
	callq	usage
	xorl	%edi, %edi
	callq	exit
.LBB9_152:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.16, %esi
	movq	%r12, %rcx
.LBB9_153:
	xorl	%eax, %eax
	callq	fprintf
	movq	progName(%rip), %rdi
	callq	usage
	movl	$1, %edi
	callq	exit
.LBB9_154:
	movq	stderr(%rip), %rcx
	movl	$.L.str.35, %edi
	movl	$112, %esi
	movl	$1, %edx
	callq	fwrite
.LBB9_155:
	movl	$2, %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
.LBB9_156:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.16, %esi
	movq	%rbx, %rcx
	jmp	.LBB9_153
.Lfunc_end9:
	.size	main1, .Lfunc_end9-main1
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI9_0:
	.quad	.LBB9_50
	.quad	.LBB9_51
	.quad	.LBB9_46
	.quad	.LBB9_47
	.quad	.LBB9_54
	.quad	.LBB9_56
	.quad	.LBB9_48
	.quad	.LBB9_55
	.quad	.LBB9_58
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_41
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_41
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_43
	.quad	.LBB9_49
	.quad	.LBB9_152
	.quad	.LBB9_42
	.quad	.LBB9_152
	.quad	.LBB9_151
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_52
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_57
	.quad	.LBB9_152
	.quad	.LBB9_53
	.quad	.LBB9_44
	.quad	.LBB9_152
	.quad	.LBB9_37
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_152
	.quad	.LBB9_45
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
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	strlen
	cmpq	$1025, %rax                     # imm = 0x401
	jae	.LBB11_2
# %bb.1:
	movl	$1024, %edx                     # imm = 0x400
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	strncpy
	movb	$0, 1024(%rbx)
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB11_2:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rdi
	movl	$.L.str.47, %esi
	movq	%r14, %rdx
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movq	%rsi, %rdi
	callq	getenv
	testq	%rax, %rax
	je	.LBB12_23
# %bb.1:                                # %.preheader38
	movq	%rax, %rbx
	movb	(%rax), %r12b
	testb	%r12b, %r12b
	je	.LBB12_23
# %bb.2:                                # %.preheader37.lr.ph
	callq	__ctype_b_loc
	movq	%rax, %r15
	jmp	.LBB12_5
	.p2align	4, 0x90
.LBB12_3:                               #   in Loop: Header=BB12_5 Depth=1
	xorl	%r13d, %r13d
.LBB12_4:                               # %.thread.thread
                                        #   in Loop: Header=BB12_5 Depth=1
	movslq	%r13d, %rax
	movb	(%rbx,%rax), %r12b
	addq	%rax, %rbx
	testb	%r12b, %r12b
	je	.LBB12_23
.LBB12_5:                               # %.preheader37
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB12_6 Depth 2
                                        #     Child Loop BB12_10 Depth 2
                                        #     Child Loop BB12_21 Depth 2
                                        #     Child Loop BB12_17 Depth 2
	movq	(%r15), %rcx
	movsbq	%r12b, %rax
	movzwl	(%rcx,%rax,2), %eax
	testl	$8192, %eax                     # imm = 0x2000
	je	.LBB12_8
	.p2align	4, 0x90
.LBB12_6:                               # %._crit_edge
                                        #   Parent Loop BB12_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsbq	1(%rbx), %r12
	addq	$1, %rbx
	movzwl	(%rcx,%r12,2), %eax
	testl	$8192, %eax                     # imm = 0x2000
	jne	.LBB12_6
# %bb.7:                                # %.preheader
                                        #   in Loop: Header=BB12_5 Depth=1
	testb	%r12b, %r12b
	je	.LBB12_3
.LBB12_8:                               # %.lr.ph.preheader
                                        #   in Loop: Header=BB12_5 Depth=1
	testl	$8192, %eax                     # imm = 0x2000
	jne	.LBB12_3
# %bb.9:                                # %.lr.ph70.preheader
                                        #   in Loop: Header=BB12_5 Depth=1
	movl	$1, %edx
	movl	$1, %esi
	.p2align	4, 0x90
.LBB12_10:                              # %.lr.ph70
                                        #   Parent Loop BB12_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rdx, %r13
	movl	%esi, %eax
	movsbq	(%rbx,%rdx), %rdi
	testq	%rdi, %rdi
	je	.LBB12_12
# %bb.11:                               # %..lr.ph_crit_edge
                                        #   in Loop: Header=BB12_10 Depth=2
	leaq	1(%r13), %rdx
	leal	1(%rax), %esi
	testb	$32, 1(%rcx,%rdi,2)
	je	.LBB12_10
.LBB12_12:                              # %.thread
                                        #   in Loop: Header=BB12_5 Depth=1
	testl	%r13d, %r13d
	jle	.LBB12_4
# %bb.13:                               #   in Loop: Header=BB12_5 Depth=1
	cmpl	$1024, %r13d                    # imm = 0x400
	movl	$1024, %r8d                     # imm = 0x400
	cmovll	%r13d, %r8d
	leaq	-1(%r8), %rdx
	cmpq	$3, %rdx
	jae	.LBB12_20
# %bb.14:                               #   in Loop: Header=BB12_5 Depth=1
	xorl	%edx, %edx
.LBB12_15:                              # %.unr-lcssa
                                        #   in Loop: Header=BB12_5 Depth=1
	testb	$3, %r8b
	je	.LBB12_18
# %bb.16:                               # %.epil.preheader.preheader
                                        #   in Loop: Header=BB12_5 Depth=1
	leaq	(%rbx,%rdx), %rsi
	cmpl	$1024, %eax                     # imm = 0x400
	movl	$1024, %ecx                     # imm = 0x400
	cmovgel	%ecx, %eax
	andl	$3, %eax
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB12_17:                              # %.epil.preheader
                                        #   Parent Loop BB12_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rsi,%rdi), %ecx
	movb	%cl, tmpName(%rdx,%rdi)
	addq	$1, %rdi
	cmpq	%rdi, %rax
	jne	.LBB12_17
.LBB12_18:                              # %.epilog-lcssa
                                        #   in Loop: Header=BB12_5 Depth=1
	movslq	%r8d, %rax
	movb	$0, tmpName(%rax)
	movq	(%r14), %rdi
	movl	$tmpName, %esi
	callq	snocString
	movq	%rax, (%r14)
	jmp	.LBB12_4
.LBB12_20:                              # %.new
                                        #   in Loop: Header=BB12_5 Depth=1
	cmpl	$1024, %eax                     # imm = 0x400
	movl	$1024, %esi                     # imm = 0x400
	cmovll	%eax, %esi
	andl	$-4, %esi
	movl	$4, %edx
	.p2align	4, 0x90
.LBB12_21:                              #   Parent Loop BB12_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movb	%r12b, tmpName-4(%rdx)
	movzbl	-3(%rbx,%rdx), %ecx
	movb	%cl, tmpName-3(%rdx)
	movzbl	-2(%rbx,%rdx), %ecx
	movb	%cl, tmpName-2(%rdx)
	movzbl	-1(%rbx,%rdx), %ecx
	movb	%cl, tmpName-1(%rdx)
	cmpq	%rdx, %rsi
	je	.LBB12_15
# %bb.22:                               # %._crit_edge51
                                        #   in Loop: Header=BB12_21 Depth=2
	movzbl	(%rbx,%rdx), %r12d
	addq	$4, %rdx
	jmp	.LBB12_21
.LBB12_23:                              # %.loopexit
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	testq	%rdi, %rdi
	je	.LBB13_5
# %bb.1:
	movq	%rdi, %r15
	movq	%rdi, %rax
	.p2align	4, 0x90
.LBB13_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rbx
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.LBB13_2
# %bb.3:
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	snocString
	movq	%rax, 8(%rbx)
	movq	%r15, %rax
	jmp	.LBB13_4
.LBB13_5:
	callq	mkCell
	movq	%rax, %rbx
	movq	%r14, %rdi
	callq	strlen
	leal	5(%rax), %edi
	callq	myMalloc
	movq	%rax, (%rbx)
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	strcpy
	movq	%rbx, %rax
.LBB13_4:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
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
	movq	stderr(%rip), %rdi
	movl	$.L.str.49, %esi
	movl	$.L.str.5.107, %edx
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	fprintf                         # TAILCALL
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
	movq	%rdi, %rcx
	movq	stderr(%rip), %rdi
	movl	$.L.str.50, %esi
	movl	$.L.str.5.107, %edx
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	fprintf                         # TAILCALL
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
	movq	%rdi, %rcx
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.51, %esi
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	fprintf                         # TAILCALL
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$152, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movb	$0, deleteOutputOnInterrupt(%rip)
	testq	%rdi, %rdi
	je	.LBB18_1
# %bb.3:
	movq	%rdi, %rbx
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB18_7
# %bb.4:
	cmpl	$2, %eax
	je	.LBB18_8
# %bb.5:
	cmpl	$1, %eax
	je	.LBB18_6
# %bb.11:                               # %thread-pre-split24
	cmpl	$1, %eax
	jne	.LBB18_12
	jmp	.LBB18_14
.LBB18_1:
	cmpl	$1, srcMode(%rip)
	jne	.LBB18_2
.LBB18_6:                               # %.thread
	movl	$inName, %edi
	movl	$.L.str.54, %esi
	jmp	.LBB18_9
.LBB18_7:
	movl	$inName, %edi
	movq	%rbx, %rsi
	callq	copyFileName
	movl	$outName, %edi
	movq	%rbx, %rsi
	callq	copyFileName
	movl	$outName, %edi
	callq	strlen
	movl	$846881326, outName(%rax)       # imm = 0x327A622E
	movb	$0, outName+4(%rax)
	movl	srcMode(%rip), %eax
	cmpl	$1, %eax
	jne	.LBB18_12
	jmp	.LBB18_14
.LBB18_8:
	movl	$inName, %edi
	movq	%rbx, %rsi
.LBB18_9:                               # %thread-pre-split24thread-pre-split
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str.55, %esi
	callq	copyFileName
	movl	srcMode(%rip), %eax
	cmpl	$1, %eax
	je	.LBB18_14
.LBB18_12:
	movl	$inName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB18_13
.LBB18_14:
	movq	zSuffix(%rip), %rbx
	movl	$inName, %edi
	movq	%rbx, %rsi
	callq	hasSuffix
	testb	%al, %al
	jne	.LBB18_15
# %bb.63:
	movq	zSuffix+8(%rip), %rbx
	movl	$inName, %edi
	movq	%rbx, %rsi
	callq	hasSuffix
	testb	%al, %al
	jne	.LBB18_15
# %bb.64:
	movq	zSuffix+16(%rip), %rbx
	movl	$inName, %edi
	movq	%rbx, %rsi
	callq	hasSuffix
	testb	%al, %al
	jne	.LBB18_15
# %bb.65:
	movq	zSuffix+24(%rip), %rbx
	movl	$inName, %edi
	movq	%rbx, %rsi
	callq	hasSuffix
	testb	%al, %al
	je	.LBB18_66
.LBB18_15:
	cmpb	$0, noisy(%rip)
	jne	.LBB18_16
.LBB18_18:
	movl	$1, %edi
	addq	$152, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	setExit                         # TAILCALL
.LBB18_16:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.58, %esi
	movl	$inName, %ecx
	movq	%rbx, %r8
	jmp	.LBB18_17
.LBB18_66:
	movl	srcMode(%rip), %eax
	movl	%eax, %ecx
	andl	$-2, %ecx
	cmpl	$2, %ecx
	jne	.LBB18_24
# %bb.19:
	leaq	-168(%rbp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	$61440, %eax                    # imm = 0xF000
	andl	-144(%rbp), %eax
	cmpl	$16384, %eax                    # imm = 0x4000
	je	.LBB18_20
# %bb.23:                               # %thread-pre-split26
	movl	srcMode(%rip), %eax
.LBB18_24:
	cmpl	$3, %eax
	jne	.LBB18_28
# %bb.25:
	cmpb	$0, forceOverwrite(%rip)
	jne	.LBB18_28
# %bb.26:
	callq	notAStandardFile
	testb	%al, %al
	je	.LBB18_27
# %bb.32:
	cmpb	$0, noisy(%rip)
	je	.LBB18_18
# %bb.33:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.60, %esi
	jmp	.LBB18_21
.LBB18_27:                              # %._crit_edge
	movl	srcMode(%rip), %eax
.LBB18_28:
	cmpl	$3, %eax
	jne	.LBB18_41
# %bb.29:
	movl	$outName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB18_35
# %bb.30:
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB18_31
# %bb.34:
	movl	$outName, %edi
	callq	remove
.LBB18_35:
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	jne	.LBB18_41
# %bb.36:
	cmpb	$0, forceOverwrite(%rip)
	jne	.LBB18_40
# %bb.37:
	callq	countHardLinks
	testl	%eax, %eax
	jg	.LBB18_38
# %bb.39:
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	jne	.LBB18_41
.LBB18_40:                              # %.thread34
	callq	saveInputFileMetaInfo
	movl	srcMode(%rip), %eax
.LBB18_41:                              # %thread-pre-split35
	cmpl	$3, %eax
	je	.LBB18_57
# %bb.42:                               # %thread-pre-split35
	cmpl	$2, %eax
	je	.LBB18_46
# %bb.43:                               # %thread-pre-split35
	cmpl	$1, %eax
	jne	.LBB18_61
# %bb.44:
	movq	stdin(%rip), %r14
	movq	stdout(%rip), %rbx
	movq	%rbx, %rdi
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	je	.LBB18_51
# %bb.45:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.64, %esi
	xorl	%eax, %eax
	callq	fprintf
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rcx
	movl	$.L.str.65, %esi
	movq	%rcx, %rdx
	jmp	.LBB18_22
.LBB18_57:
	movl	$inName, %edi
	movl	$.L.str.66, %esi
	callq	fopen
	movq	%rax, %r14
	callq	fopen_output_safely
	testq	%rax, %rax
	je	.LBB18_58
# %bb.59:
	movq	%rax, %rbx
	testq	%r14, %r14
	jne	.LBB18_51
# %bb.60:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %r15
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.57, %esi
	movl	$inName, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rax, %r8
	xorl	%eax, %eax
	callq	fprintf
	movq	%rbx, %rdi
	callq	fclose
	jmp	.LBB18_18
.LBB18_46:
	movl	$inName, %edi
	movl	$.L.str.66, %esi
	callq	fopen
	movq	%rax, %r14
	movq	stdout(%rip), %rbx
	movq	%rbx, %rdi
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	jne	.LBB18_47
# %bb.50:
	testq	%r14, %r14
	je	.LBB18_13
.LBB18_51:
	cmpl	$0, verbosity(%rip)
	jg	.LBB18_52
.LBB18_53:
	movq	%rbx, outputHandleJustInCase(%rip)
	movb	$1, deleteOutputOnInterrupt(%rip)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	compressStream
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$3, srcMode(%rip)
	jne	.LBB18_62
# %bb.54:
	callq	applySavedTimeInfoToOutputFile
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpb	$0, keepInputFiles(%rip)
	jne	.LBB18_62
# %bb.55:
	movl	$inName, %edi
	callq	remove
	testl	%eax, %eax
	jne	.LBB18_56
.LBB18_62:
	movb	$0, deleteOutputOnInterrupt(%rip)
	addq	$152, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB18_13:
	.cfi_def_cfa %rbp, 16
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
.LBB18_17:
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB18_18
.LBB18_52:
	movq	stderr(%rip), %rdi
	movl	$.L.str.70, %esi
	movl	$inName, %edx
	xorl	%eax, %eax
	callq	fprintf
	callq	pad
	movq	stderr(%rip), %rdi
	callq	fflush
	jmp	.LBB18_53
.LBB18_20:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.59, %esi
.LBB18_21:
	movl	$inName, %ecx
	jmp	.LBB18_22
.LBB18_58:
	movq	stderr(%rip), %r15
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.68, %esi
	movl	$outName, %ecx
	movq	%r15, %rdi
	movq	%rbx, %rdx
	movq	%rax, %r8
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB18_48
.LBB18_47:
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
.LBB18_48:
	testq	%r14, %r14
	je	.LBB18_18
# %bb.49:
	movq	%r14, %rdi
	callq	fclose
	jmp	.LBB18_18
.LBB18_31:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.61, %esi
	movl	$outName, %ecx
.LBB18_22:
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB18_18
.LBB18_38:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	cmpl	$1, %eax
	movl	$.L.str.4.13, %ecx
	movl	$.L.str.63, %r9d
	cmoveq	%rcx, %r9
	movl	$.L.str.62, %esi
	movl	$inName, %ecx
	movl	%eax, %r8d
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB18_18
.LBB18_2:
	movl	$.L.str.53, %edi
	callq	panic
.LBB18_61:
	movl	$.L.str.69, %edi
	callq	panic
.LBB18_56:
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$152, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movb	$0, deleteOutputOnInterrupt(%rip)
	testq	%rdi, %rdi
	je	.LBB19_1
# %bb.3:
	movq	%rdi, %rbx
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB19_8
# %bb.4:
	cmpl	$2, %eax
	je	.LBB19_13
# %bb.5:
	cmpl	$1, %eax
	je	.LBB19_7
# %bb.6:
	xorl	%ebx, %ebx
	cmpl	$1, %eax
	jne	.LBB19_18
	jmp	.LBB19_32
.LBB19_1:
	cmpl	$1, srcMode(%rip)
	jne	.LBB19_2
.LBB19_7:                               # %.thread
	movl	$inName, %edi
	movl	$.L.str.54, %esi
	jmp	.LBB19_14
.LBB19_8:
	movl	$inName, %edi
	movq	%rbx, %rsi
	callq	copyFileName
	movl	$outName, %edi
	movq	%rbx, %rsi
	callq	copyFileName
	movq	zSuffix(%rip), %rdi
	movq	unzSuffix(%rip), %rsi
	callq	mapSuffix
	testb	%al, %al
	jne	.LBB19_15
# %bb.9:
	movq	zSuffix+8(%rip), %rdi
	movq	unzSuffix+8(%rip), %rsi
	callq	mapSuffix
	testb	%al, %al
	jne	.LBB19_15
# %bb.10:
	movq	zSuffix+16(%rip), %rdi
	movq	unzSuffix+16(%rip), %rsi
	callq	mapSuffix
	testb	%al, %al
	jne	.LBB19_15
# %bb.11:
	movq	zSuffix+24(%rip), %rdi
	movq	unzSuffix+24(%rip), %rsi
	callq	mapSuffix
	testb	%al, %al
	jne	.LBB19_15
# %bb.12:
	movl	$outName, %edi
	callq	strlen
	movl	$1953853230, outName(%rax)      # imm = 0x74756F2E
	movb	$0, outName+4(%rax)
	movb	$1, %bl
	jmp	.LBB19_16
.LBB19_13:
	movl	$inName, %edi
	movq	%rbx, %rsi
.LBB19_14:                              # %thread-pre-split29thread-pre-split
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str.55, %esi
	callq	copyFileName
.LBB19_15:                              # %thread-pre-split29thread-pre-split
	xorl	%ebx, %ebx
.LBB19_16:                              # %thread-pre-split29thread-pre-split
	movl	srcMode(%rip), %eax
	cmpl	$1, %eax
	je	.LBB19_32
.LBB19_18:
	movl	$inName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB19_19
# %bb.21:
	movl	srcMode(%rip), %eax
	andl	$-2, %eax
	cmpl	$2, %eax
	jne	.LBB19_32
# %bb.22:
	leaq	-168(%rbp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	$61440, %eax                    # imm = 0xF000
	andl	-144(%rbp), %eax
	cmpl	$16384, %eax                    # imm = 0x4000
	je	.LBB19_23
# %bb.24:
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_32
# %bb.25:
	cmpb	$0, forceOverwrite(%rip)
	jne	.LBB19_32
# %bb.26:
	callq	notAStandardFile
	testb	%al, %al
	je	.LBB19_32
# %bb.27:
	cmpb	$0, noisy(%rip)
	je	.LBB19_31
# %bb.28:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.60, %esi
	jmp	.LBB19_29
.LBB19_32:                              # %.thread37
	cmpb	$0, noisy(%rip)
	sete	%al
	xorb	$1, %bl
	orb	%al, %bl
	je	.LBB19_33
# %bb.34:
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	jne	.LBB19_45
.LBB19_35:
	movl	$outName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB19_39
# %bb.36:
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB19_37
# %bb.38:
	movl	$outName, %edi
	callq	remove
.LBB19_39:
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	jne	.LBB19_45
# %bb.40:
	cmpb	$0, forceOverwrite(%rip)
	jne	.LBB19_44
# %bb.41:
	callq	countHardLinks
	testl	%eax, %eax
	jg	.LBB19_42
# %bb.43:
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	jne	.LBB19_45
.LBB19_44:                              # %.thread45
	callq	saveInputFileMetaInfo
	movl	srcMode(%rip), %eax
.LBB19_45:                              # %thread-pre-split46
	cmpl	$3, %eax
	je	.LBB19_60
# %bb.46:                               # %thread-pre-split46
	cmpl	$2, %eax
	je	.LBB19_50
# %bb.47:                               # %thread-pre-split46
	cmpl	$1, %eax
	jne	.LBB19_65
# %bb.48:
	movq	stdin(%rip), %r14
	movq	stdout(%rip), %rbx
	movq	%r14, %rdi
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	je	.LBB19_52
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
	jmp	.LBB19_30
.LBB19_60:
	movl	$inName, %edi
	movl	$.L.str.66, %esi
	callq	fopen
	movq	%rax, %r14
	callq	fopen_output_safely
	testq	%rax, %rax
	je	.LBB19_61
# %bb.63:
	movq	%rax, %rbx
	testq	%r14, %r14
	jne	.LBB19_52
# %bb.64:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %r15
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.57, %esi
	movl	$inName, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rax, %r8
	xorl	%eax, %eax
	callq	fprintf
	movq	%rbx, %rdi
	callq	fclose
	jmp	.LBB19_31
.LBB19_50:
	movl	$inName, %edi
	movl	$.L.str.66, %esi
	callq	fopen
	testq	%rax, %rax
	je	.LBB19_59
# %bb.51:
	movq	%rax, %r14
	movq	stdout(%rip), %rbx
.LBB19_52:
	cmpl	$0, verbosity(%rip)
	jg	.LBB19_53
.LBB19_54:
	movq	%rbx, outputHandleJustInCase(%rip)
	movb	$1, deleteOutputOnInterrupt(%rip)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	uncompressStream
	movq	$0, outputHandleJustInCase(%rip)
	testb	%al, %al
	je	.LBB19_66
# %bb.55:
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_70
# %bb.56:
	callq	applySavedTimeInfoToOutputFile
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpb	$0, keepInputFiles(%rip)
	jne	.LBB19_70
# %bb.57:
	movl	$inName, %edi
	callq	remove
	testl	%eax, %eax
	jne	.LBB19_58
.LBB19_70:
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpl	$0, verbosity(%rip)
	jg	.LBB19_71
# %bb.74:
	addq	$152, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB19_33:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.81, %esi
	movl	$inName, %ecx
	movl	$outName, %r8d
	xorl	%eax, %eax
	callq	fprintf
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB19_35
	jmp	.LBB19_45
.LBB19_53:
	movq	stderr(%rip), %rdi
	movl	$.L.str.70, %esi
	movl	$inName, %edx
	xorl	%eax, %eax
	callq	fprintf
	callq	pad
	movq	stderr(%rip), %rdi
	callq	fflush
	jmp	.LBB19_54
.LBB19_66:
	movb	$1, unzFailsExist(%rip)
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_68
# %bb.67:
	movl	$outName, %edi
	callq	remove
	testl	%eax, %eax
	jne	.LBB19_58
.LBB19_68:
	movb	$0, deleteOutputOnInterrupt(%rip)
	movl	$2, %edi
	callq	setExit
	cmpl	$0, verbosity(%rip)
	jle	.LBB19_73
# %bb.69:
	movq	stderr(%rip), %rcx
	movl	$.L.str.86, %edi
	movl	$18, %esi
	jmp	.LBB19_72
.LBB19_71:
	movq	stderr(%rip), %rcx
	movl	$.L.str.85, %edi
	movl	$5, %esi
.LBB19_72:
	movl	$1, %edx
	addq	$152, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	fwrite                          # TAILCALL
.LBB19_19:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %r14
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.57, %esi
	jmp	.LBB19_20
.LBB19_73:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.87, %esi
	movl	$inName, %ecx
	xorl	%eax, %eax
	addq	$152, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	fprintf                         # TAILCALL
.LBB19_61:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %r15
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.68, %esi
	movl	$outName, %ecx
	movq	%r15, %rdi
	movq	%rbx, %rdx
	movq	%rax, %r8
	xorl	%eax, %eax
	callq	fprintf
	testq	%r14, %r14
	je	.LBB19_31
# %bb.62:
	movq	%r14, %rdi
	callq	fclose
	jmp	.LBB19_31
.LBB19_59:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.83, %esi
.LBB19_20:
	movl	$inName, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movq	%rax, %r8
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB19_31
.LBB19_37:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.61, %esi
	movl	$outName, %ecx
	jmp	.LBB19_30
.LBB19_23:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.59, %esi
.LBB19_29:
	movl	$inName, %ecx
.LBB19_30:
	xorl	%eax, %eax
	callq	fprintf
.LBB19_31:
	movl	$1, %edi
	addq	$152, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	setExit                         # TAILCALL
.LBB19_42:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	cmpl	$1, %eax
	movl	$.L.str.4.13, %ecx
	movl	$.L.str.63, %r9d
	cmoveq	%rcx, %r9
	movl	$.L.str.62, %esi
	movl	$inName, %ecx
	movl	%eax, %r8d
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB19_31
.LBB19_58:
	callq	ioError
.LBB19_2:
	movl	$.L.str.79, %edi
	callq	panic
.LBB19_65:
	movl	$.L.str.84, %edi
	callq	panic
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
	cmpl	%edi, exitValue(%rip)
	jge	.LBB20_2
# %bb.1:
	movl	%edi, exitValue(%rip)
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
	subq	$144, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, %rbx
	movb	$0, deleteOutputOnInterrupt(%rip)
	testq	%rdi, %rdi
	jne	.LBB21_2
# %bb.1:
	cmpl	$1, srcMode(%rip)
	jne	.LBB21_32
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
	movl	$inName, %edi
	movq	%rbx, %rsi
.LBB21_7:                               # %thread-pre-splitthread-pre-split
	callq	copyFileName
	movl	srcMode(%rip), %eax
.LBB21_8:                               # %thread-pre-split
	cmpl	$1, %eax
	je	.LBB21_19
# %bb.9:
	movl	$inName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB21_10
# %bb.12:
	cmpl	$1, srcMode(%rip)
	je	.LBB21_19
# %bb.13:
	leaq	-160(%rbp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	$61440, %eax                    # imm = 0xF000
	andl	-136(%rbp), %eax
	cmpl	$16384, %eax                    # imm = 0x4000
	je	.LBB21_14
# %bb.17:
	movl	srcMode(%rip), %eax
	leal	-2(%rax), %ecx
	cmpl	$2, %ecx
	jae	.LBB21_18
# %bb.21:
	movl	$inName, %edi
	movl	$.L.str.66, %esi
	callq	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.LBB21_25
# %bb.22:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.83, %esi
	jmp	.LBB21_11
.LBB21_18:
	cmpl	$1, %eax
	jne	.LBB21_23
.LBB21_19:                              # %.thread10
	movq	stdin(%rip), %rdi
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	jne	.LBB21_20
# %bb.24:
	movq	stdin(%rip), %rbx
.LBB21_25:
	cmpl	$0, verbosity(%rip)
	jg	.LBB21_26
.LBB21_27:
	movq	$0, outputHandleJustInCase(%rip)
	movq	%rbx, %rdi
	callq	testStream
	testb	%al, %al
	je	.LBB21_29
# %bb.28:
	cmpl	$0, verbosity(%rip)
	jg	.LBB21_33
.LBB21_29:
	testb	%al, %al
	jne	.LBB21_31
# %bb.30:
	movb	$1, testFailsExist(%rip)
.LBB21_31:
	addq	$144, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB21_26:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rdi
	movl	$.L.str.70, %esi
	movl	$inName, %edx
	xorl	%eax, %eax
	callq	fprintf
	callq	pad
	movq	stderr(%rip), %rdi
	callq	fflush
	jmp	.LBB21_27
.LBB21_33:                              # %.thread
	movq	stderr(%rip), %rcx
	movl	$.L.str.97, %edi
	movl	$3, %esi
	movl	$1, %edx
	addq	$144, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	fwrite                          # TAILCALL
.LBB21_20:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.82, %esi
	xorl	%eax, %eax
	callq	fprintf
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rcx
	movl	$.L.str.65, %esi
	movq	%rcx, %rdx
	jmp	.LBB21_15
.LBB21_10:
	movq	stderr(%rip), %r14
	movq	progName(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movl	$.L.str.95, %esi
.LBB21_11:
	movl	$inName, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movq	%rax, %r8
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB21_16
.LBB21_14:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.59, %esi
	movl	$inName, %ecx
.LBB21_15:
	xorl	%eax, %eax
	callq	fprintf
.LBB21_16:
	movl	$1, %edi
	addq	$144, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	setExit                         # TAILCALL
.LBB21_32:
	.cfi_def_cfa %rbp, 16
	movl	$.L.str.94, %edi
	callq	panic
.LBB21_23:
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
	movq	%rdi, %rcx
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	$.L.str.66, %esi
	callq	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB23_2
# %bb.1:
	movq	%rbx, %rdi
	callq	fclose
.LBB23_2:
	testq	%rbx, %rbx
	setne	%al
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end23:
	.size	fileExists, .Lfunc_end23-fileExists
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
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	$inName, %edi
	callq	strlen
	cmpl	%eax, longestFileName(%rip)
	jle	.LBB24_3
# %bb.1:                                # %.lr.ph.preheader
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB24_2:                               # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movq	stderr(%rip), %rsi
	movl	$32, %edi
	callq	fputc@PLT
	movl	longestFileName(%rip), %r14d
	movl	$inName, %edi
	callq	strlen
	subl	%eax, %r14d
	addl	$1, %ebx
	cmpl	%r14d, %ebx
	jl	.LBB24_2
.LBB24_3:                               # %.loopexit
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end24:
	.size	pad, .Lfunc_end24-pad
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
	subq	$10040, %rsp                    # imm = 0x2738
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movl	$0, -48(%rbp)
	callq	ferror
	testl	%eax, %eax
	jne	.LBB25_36
# %bb.1:                                # %.preheader
	movl	verbosity(%rip), %edx
	movzbl	smallMode(%rip), %ecx
	leaq	-44(%rbp), %rdi
	leaq	-5072(%rbp), %r8
	xorl	%r13d, %r13d
	movq	%r14, %rsi
	xorl	%r9d, %r9d
	callq	BZ2_bzReadOpen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB25_24
# %bb.2:                                # %.preheader
	cmpl	$0, -44(%rbp)
	jne	.LBB25_24
# %bb.3:                                # %.lr.ph55
	xorl	%r13d, %r13d
	leaq	-44(%rbp), %r12
	leaq	-10080(%rbp), %r15
.LBB25_4:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB25_5 Depth 2
                                        #     Child Loop BB25_14 Depth 2
                                        #     Child Loop BB25_17 Depth 2
	addl	$1, %r13d
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB25_5:                               #   Parent Loop BB25_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testl	%eax, %eax
	jne	.LBB25_6
# %bb.9:                                #   in Loop: Header=BB25_5 Depth=2
	movq	%r12, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	movl	$5000, %ecx                     # imm = 0x1388
	callq	BZ2_bzRead
	movl	-44(%rbp), %eax
	cmpl	$-5, %eax
	jne	.LBB25_5
	jmp	.LBB25_24
	.p2align	4, 0x90
.LBB25_6:                               #   in Loop: Header=BB25_4 Depth=1
	cmpl	$4, %eax
	jne	.LBB25_24
# %bb.7:                                #   in Loop: Header=BB25_4 Depth=1
	movq	%r12, %rdi
	movq	%rbx, %rsi
	leaq	-56(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	callq	BZ2_bzReadGetUnused
	cmpl	$0, -44(%rbp)
	jne	.LBB25_8
# %bb.10:                               #   in Loop: Header=BB25_4 Depth=1
	movl	-48(%rbp), %edx
	testl	%edx, %edx
	jle	.LBB25_18
# %bb.11:                               # %.lr.ph
                                        #   in Loop: Header=BB25_4 Depth=1
	testq	%rdx, %rdx
	movl	$1, %eax
	cmoveq	%rax, %rdx
	movq	-56(%rbp), %rax
	leaq	-1(%rdx), %rsi
	movl	%edx, %edi
	andl	$3, %edi
	cmpq	$3, %rsi
	jae	.LBB25_13
# %bb.12:                               #   in Loop: Header=BB25_4 Depth=1
	xorl	%esi, %esi
	jmp	.LBB25_15
.LBB25_13:                              # %.lr.ph.new
                                        #   in Loop: Header=BB25_4 Depth=1
	andl	$-4, %edx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB25_14:                              #   Parent Loop BB25_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rax,%rsi), %ecx
	movb	%cl, -5072(%rbp,%rsi)
	movzbl	1(%rax,%rsi), %ecx
	movb	%cl, -5071(%rbp,%rsi)
	movzbl	2(%rax,%rsi), %ecx
	movb	%cl, -5070(%rbp,%rsi)
	movzbl	3(%rax,%rsi), %ecx
	movb	%cl, -5069(%rbp,%rsi)
	addq	$4, %rsi
	cmpq	%rsi, %rdx
	jne	.LBB25_14
.LBB25_15:                              # %._crit_edge.loopexit.unr-lcssa
                                        #   in Loop: Header=BB25_4 Depth=1
	testq	%rdi, %rdi
	je	.LBB25_18
# %bb.16:                               # %.epil.preheader.preheader
                                        #   in Loop: Header=BB25_4 Depth=1
	leaq	(%rsi,%rbp), %rdx
	addq	$-5072, %rdx                    # imm = 0xEC30
	addq	%rsi, %rax
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB25_17:                              # %.epil.preheader
                                        #   Parent Loop BB25_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rax,%rsi), %ecx
	movb	%cl, (%rdx,%rsi)
	addq	$1, %rsi
	cmpq	%rsi, %rdi
	jne	.LBB25_17
.LBB25_18:                              # %._crit_edge
                                        #   in Loop: Header=BB25_4 Depth=1
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	BZ2_bzReadClose
	cmpl	$0, -44(%rbp)
	jne	.LBB25_8
# %bb.19:                               #   in Loop: Header=BB25_4 Depth=1
	movl	-48(%rbp), %r9d
	testl	%r9d, %r9d
	jne	.LBB25_22
# %bb.20:                               #   in Loop: Header=BB25_4 Depth=1
	movq	%r14, %rdi
	callq	myfeof
	testb	%al, %al
	jne	.LBB25_29
# %bb.21:                               # %._crit_edge70
                                        #   in Loop: Header=BB25_4 Depth=1
	movl	-48(%rbp), %r9d
.LBB25_22:                              #   in Loop: Header=BB25_4 Depth=1
	movl	verbosity(%rip), %edx
	movzbl	smallMode(%rip), %ecx
	movq	%r12, %rdi
	movq	%r14, %rsi
	leaq	-5072(%rbp), %r8
	callq	BZ2_bzReadOpen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB25_24
# %bb.23:                               #   in Loop: Header=BB25_4 Depth=1
	cmpl	$0, -44(%rbp)
	je	.LBB25_4
.LBB25_24:                              # %.loopexit
	leaq	-60(%rbp), %rdi
	movq	%rbx, %rsi
	callq	BZ2_bzReadClose
	cmpl	$0, verbosity(%rip)
	je	.LBB25_25
# %bb.26:
	movl	-44(%rbp), %eax
	cmpl	$-5, %eax
	jne	.LBB25_27
.LBB25_41:
	cmpq	%r14, stdin(%rip)
	je	.LBB25_43
# %bb.42:
	movq	%r14, %rdi
	callq	fclose
.LBB25_43:
	cmpl	$1, %r13d
	je	.LBB25_44
# %bb.45:
	movb	$1, %bl
	cmpb	$0, noisy(%rip)
	jne	.LBB25_46
.LBB25_34:
	movl	%ebx, %eax
	addq	$10040, %rsp                    # imm = 0x2738
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB25_25:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.99, %esi
	movl	$inName, %ecx
	xorl	%eax, %eax
	callq	fprintf
	movl	-44(%rbp), %eax
	cmpl	$-5, %eax
	je	.LBB25_41
.LBB25_27:
	addl	$9, %eax
	cmpl	$6, %eax
	ja	.LBB25_47
# %bb.28:
	jmpq	*.LJTI25_0(,%rax,8)
.LBB25_40:
	movq	stderr(%rip), %rcx
	movl	$.L.str.101, %edi
	movl	$23, %esi
	jmp	.LBB25_38
.LBB25_37:
	movq	stderr(%rip), %rcx
	movl	$.L.str.100, %edi
	movl	$35, %esi
	jmp	.LBB25_38
.LBB25_44:
	movq	stderr(%rip), %rcx
	movl	$.L.str.102, %edi
	movl	$45, %esi
.LBB25_38:
	movl	$1, %edx
	callq	fwrite
	xorl	%ebx, %ebx
	jmp	.LBB25_34
.LBB25_46:
	movq	stderr(%rip), %rcx
	movl	$.L.str.103, %edi
	movl	$35, %esi
.LBB25_33:
	movl	$1, %edx
	callq	fwrite
	jmp	.LBB25_34
.LBB25_29:
	movq	%r14, %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB25_36
# %bb.30:
	movq	%r14, %rdi
	callq	fclose
	cmpl	$-1, %eax
	je	.LBB25_36
# %bb.31:
	movb	$1, %bl
	cmpl	$2, verbosity(%rip)
	jl	.LBB25_34
# %bb.32:
	movq	stderr(%rip), %rcx
	movl	$.L.str.89, %edi
	movl	$5, %esi
	jmp	.LBB25_33
.LBB25_36:
	callq	ioError
.LBB25_35:
	callq	configError
.LBB25_47:
	movl	$.L.str.104, %edi
	callq	panic
.LBB25_39:
	callq	outOfMemory
.LBB25_8:
	movl	$.L.str.98, %edi
	callq	panic
.Lfunc_end25:
	.size	testStream, .Lfunc_end25-testStream
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI25_0:
	.quad	.LBB25_35
	.quad	.LBB25_47
	.quad	.LBB25_40
	.quad	.LBB25_36
	.quad	.LBB25_47
	.quad	.LBB25_37
	.quad	.LBB25_39
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	callq	fgetc
	cmpl	$-1, %eax
	je	.LBB26_1
# %bb.2:
	movl	%eax, %edi
	movq	%rbx, %rsi
	callq	ungetc
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB26_1:
	.cfi_def_cfa %rbp, 16
	movb	$1, %al
                                        # kill: def $al killed $al killed $eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end26:
	.size	myfeof, .Lfunc_end26-myfeof
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
	movq	stderr(%rip), %rcx
	movl	$.L.str.77, %edi
	movl	$235, %esi
	movl	$1, %edx
	callq	fwrite
	movl	$3, %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
.Lfunc_end27:
	.size	configError, .Lfunc_end27-configError
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
.Lfunc_end28:
	.size	ioError, .Lfunc_end28-ioError
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
.Lfunc_end29:
	.size	outOfMemory, .Lfunc_end29-outOfMemory
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
	jne	.LBB30_2
# %bb.1:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB30_2:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rdi
	movl	$.L.str.38, %esi
	movl	$inName, %edx
	movl	$outName, %ecx
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	fprintf                         # TAILCALL
.Lfunc_end30:
	.size	showFileNames, .Lfunc_end30-showFileNames
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
	pushq	%rbx
	subq	$152, %rsp
	.cfi_offset %rbx, -24
	movl	%edi, %ebx
	cmpl	$3, srcMode(%rip)
	jne	.LBB31_12
# %bb.1:
	cmpl	$3, opMode(%rip)
	je	.LBB31_12
# %bb.2:
	cmpb	$0, deleteOutputOnInterrupt(%rip)
	je	.LBB31_12
# %bb.3:
	leaq	-152(%rbp), %rsi
	movl	$inName, %edi
	callq	stat
	testl	%eax, %eax
	jne	.LBB31_10
# %bb.4:
	cmpb	$0, noisy(%rip)
	jne	.LBB31_5
# %bb.6:
	movq	outputHandleJustInCase(%rip), %rdi
	testq	%rdi, %rdi
	jne	.LBB31_7
.LBB31_8:
	movl	$outName, %edi
	callq	remove
	testl	%eax, %eax
	jne	.LBB31_9
	jmp	.LBB31_12
.LBB31_10:
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
	jmp	.LBB31_11
.LBB31_5:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.39, %esi
	movl	$outName, %ecx
	xorl	%eax, %eax
	callq	fprintf
	movq	outputHandleJustInCase(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB31_8
.LBB31_7:
	callq	fclose
	movl	$outName, %edi
	callq	remove
	testl	%eax, %eax
	je	.LBB31_12
.LBB31_9:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.40, %esi
.LBB31_11:
	xorl	%eax, %eax
	callq	fprintf
.LBB31_12:
	cmpb	$0, noisy(%rip)
	je	.LBB31_16
# %bb.13:
	movl	numFileNames(%rip), %r8d
	testl	%r8d, %r8d
	jle	.LBB31_16
# %bb.14:
	movl	%r8d, %r9d
	subl	numFilesProcessed(%rip), %r9d
	jle	.LBB31_16
# %bb.15:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rcx
	movl	$.L.str.45, %esi
	movq	%rcx, %rdx
	xorl	%eax, %eax
	callq	fprintf
.LBB31_16:
	movl	%ebx, %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
.Lfunc_end31:
	.size	cleanUpAndFail, .Lfunc_end31-cleanUpAndFail
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movq	%rdi, %r15
	movl	$outName, %edi
	movq	%r15, %rsi
	callq	hasSuffix
	testb	%al, %al
	je	.LBB32_1
# %bb.2:
	movl	$outName, %edi
	callq	strlen
	movq	%rax, %rbx
	movq	%r15, %rdi
	callq	strlen
	subq	%rax, %rbx
	movb	$0, outName(%rbx)
	movl	$outName, %edi
	movq	%r14, %rsi
	callq	strcat
	movb	$1, %al
	jmp	.LBB32_3
.LBB32_1:
	xorl	%eax, %eax
.LBB32_3:
                                        # kill: def $al killed $al killed $eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end32:
	.size	mapSuffix, .Lfunc_end32-mapSuffix
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
	subq	$144, %rsp
	leaq	-144(%rbp), %rsi
	movl	$inName, %edi
	callq	lstat
	testl	%eax, %eax
	je	.LBB33_1
# %bb.2:
	movb	$1, %al
	addq	$144, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB33_1:
	.cfi_def_cfa %rbp, 16
	movl	$61440, %eax                    # imm = 0xF000
	andl	-120(%rbp), %eax
	cmpl	$32768, %eax                    # imm = 0x8000
	setne	%al
	addq	$144, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end33:
	.size	notAStandardFile, .Lfunc_end33-notAStandardFile
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
	subq	$144, %rsp
	leaq	-144(%rbp), %rsi
	movl	$inName, %edi
	callq	lstat
	movl	-128(%rbp), %edx
	addl	$-1, %edx
	xorl	%ecx, %ecx
	testl	%eax, %eax
	cmovel	%edx, %ecx
	movl	%ecx, %eax
	addq	$144, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end34:
	.size	countHardLinks, .Lfunc_end34-countHardLinks
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
	movl	$inName, %edi
	movl	$fileMetaInfo, %esi
	callq	stat
	testl	%eax, %eax
	jne	.LBB35_2
# %bb.1:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB35_2:
	.cfi_def_cfa %rbp, 16
	callq	ioError
.Lfunc_end35:
	.size	saveInputFileMetaInfo, .Lfunc_end35-saveInputFileMetaInfo
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
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	xorl	%ebx, %ebx
	movl	$outName, %edi
	movl	$193, %esi
	movl	$384, %edx                      # imm = 0x180
	xorl	%eax, %eax
	callq	open
	cmpl	$-1, %eax
	je	.LBB36_3
# %bb.1:
	movl	%eax, %r14d
	movl	$.L.str.67, %esi
	movl	%eax, %edi
	callq	fdopen
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.LBB36_3
# %bb.2:
	movl	%r14d, %edi
	callq	close
	xorl	%ebx, %ebx
.LBB36_3:
	movq	%rbx, %rax
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end36:
	.size	fopen_output_safely, .Lfunc_end36-fopen_output_safely
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
	subq	$10040, %rsp                    # imm = 0x2738
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$0, -48(%rbp)
	movq	%rsi, %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB37_50
# %bb.1:
	movq	%r14, %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB37_50
# %bb.2:                                # %.preheader
	movl	verbosity(%rip), %edx
	movzbl	smallMode(%rip), %ecx
	leaq	-44(%rbp), %rdi
	leaq	-5072(%rbp), %r8
	movq	%r14, %rsi
	xorl	%r9d, %r9d
	callq	BZ2_bzReadOpen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB37_3
# %bb.4:                                # %.preheader
	cmpl	$0, -44(%rbp)
	jne	.LBB37_3
# %bb.5:                                # %.lr.ph109
	xorl	%eax, %eax
	movq	%rax, -56(%rbp)                 # 8-byte Spill
	leaq	-44(%rbp), %r15
	leaq	-10080(%rbp), %r13
.LBB37_6:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB37_7 Depth 2
                                        #     Child Loop BB37_19 Depth 2
                                        #     Child Loop BB37_22 Depth 2
	movq	-56(%rbp), %rax                 # 8-byte Reload
	addl	$1, %eax
	movq	%rax, -56(%rbp)                 # 8-byte Spill
	.p2align	4, 0x90
.LBB37_7:                               #   Parent Loop BB37_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	movl	$5000, %ecx                     # imm = 0x1388
	callq	BZ2_bzRead
	movl	-44(%rbp), %ecx
	cmpl	$-5, %ecx
	je	.LBB37_43
# %bb.8:                                #   in Loop: Header=BB37_7 Depth=2
	testl	%eax, %eax
	jle	.LBB37_11
# %bb.9:                                #   in Loop: Header=BB37_7 Depth=2
	andl	$-5, %ecx
	jne	.LBB37_11
# %bb.10:                               #   in Loop: Header=BB37_7 Depth=2
	movl	%eax, %edx
	movl	$1, %esi
	movq	%r13, %rdi
	movq	%r12, %rcx
	callq	fwrite
.LBB37_11:                              #   in Loop: Header=BB37_7 Depth=2
	movq	%r12, %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB37_50
# %bb.12:                               #   in Loop: Header=BB37_7 Depth=2
	movl	-44(%rbp), %eax
	testl	%eax, %eax
	je	.LBB37_7
# %bb.13:                               #   in Loop: Header=BB37_6 Depth=1
	cmpl	$4, %eax
	jne	.LBB37_29
# %bb.14:                               #   in Loop: Header=BB37_6 Depth=1
	movq	%r15, %rdi
	movq	%rbx, %rsi
	leaq	-64(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	callq	BZ2_bzReadGetUnused
	cmpl	$0, -44(%rbp)
	jne	.LBB37_63
# %bb.15:                               #   in Loop: Header=BB37_6 Depth=1
	movl	-48(%rbp), %edx
	testl	%edx, %edx
	jle	.LBB37_23
# %bb.16:                               # %.lr.ph
                                        #   in Loop: Header=BB37_6 Depth=1
	testq	%rdx, %rdx
	movl	$1, %eax
	cmoveq	%rax, %rdx
	movq	-64(%rbp), %rax
	leaq	-1(%rdx), %rsi
	movl	%edx, %edi
	andl	$3, %edi
	cmpq	$3, %rsi
	jae	.LBB37_18
# %bb.17:                               #   in Loop: Header=BB37_6 Depth=1
	xorl	%esi, %esi
	jmp	.LBB37_20
.LBB37_18:                              # %.lr.ph.new
                                        #   in Loop: Header=BB37_6 Depth=1
	andl	$-4, %edx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB37_19:                              #   Parent Loop BB37_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rax,%rsi), %ecx
	movb	%cl, -5072(%rbp,%rsi)
	movzbl	1(%rax,%rsi), %ecx
	movb	%cl, -5071(%rbp,%rsi)
	movzbl	2(%rax,%rsi), %ecx
	movb	%cl, -5070(%rbp,%rsi)
	movzbl	3(%rax,%rsi), %ecx
	movb	%cl, -5069(%rbp,%rsi)
	addq	$4, %rsi
	cmpq	%rsi, %rdx
	jne	.LBB37_19
.LBB37_20:                              # %._crit_edge.loopexit.unr-lcssa
                                        #   in Loop: Header=BB37_6 Depth=1
	testq	%rdi, %rdi
	je	.LBB37_23
# %bb.21:                               # %.epil.preheader.preheader
                                        #   in Loop: Header=BB37_6 Depth=1
	leaq	(%rsi,%rbp), %rdx
	addq	$-5072, %rdx                    # imm = 0xEC30
	addq	%rsi, %rax
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB37_22:                              # %.epil.preheader
                                        #   Parent Loop BB37_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rax,%rsi), %ecx
	movb	%cl, (%rdx,%rsi)
	addq	$1, %rsi
	cmpq	%rsi, %rdi
	jne	.LBB37_22
.LBB37_23:                              # %._crit_edge
                                        #   in Loop: Header=BB37_6 Depth=1
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	BZ2_bzReadClose
	cmpl	$0, -44(%rbp)
	jne	.LBB37_63
# %bb.24:                               #   in Loop: Header=BB37_6 Depth=1
	movl	-48(%rbp), %r9d
	testl	%r9d, %r9d
	jne	.LBB37_27
# %bb.25:                               #   in Loop: Header=BB37_6 Depth=1
	movq	%r14, %rdi
	callq	myfeof
	testb	%al, %al
	jne	.LBB37_32
# %bb.26:                               # %._crit_edge127
                                        #   in Loop: Header=BB37_6 Depth=1
	movl	-48(%rbp), %r9d
.LBB37_27:                              #   in Loop: Header=BB37_6 Depth=1
	movl	verbosity(%rip), %edx
	movzbl	smallMode(%rip), %ecx
	movq	%r15, %rdi
	movq	%r14, %rsi
	leaq	-5072(%rbp), %r8
	callq	BZ2_bzReadOpen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB37_29
# %bb.28:                               #   in Loop: Header=BB37_6 Depth=1
	cmpl	$0, -44(%rbp)
	je	.LBB37_6
	jmp	.LBB37_29
.LBB37_3:
	xorl	%eax, %eax
	movq	%rax, -56(%rbp)                 # 8-byte Spill
.LBB37_29:                              # %.loopexit49
	leaq	-68(%rbp), %rdi
	movq	%rbx, %rsi
	callq	BZ2_bzReadClose
	movl	-44(%rbp), %eax
	cmpl	$-5, %eax
	jne	.LBB37_30
# %bb.54:
	cmpq	%r14, stdin(%rip)
	movq	-56(%rbp), %rbx                 # 8-byte Reload
	je	.LBB37_56
# %bb.55:
	movq	%r14, %rdi
	callq	fclose
.LBB37_56:
	cmpq	%r12, stdout(%rip)
	je	.LBB37_58
# %bb.57:
	movq	%r12, %rdi
	callq	fclose
.LBB37_58:
	cmpl	$1, %ebx
	jne	.LBB37_60
# %bb.59:
	xorl	%ebx, %ebx
	jmp	.LBB37_62
.LBB37_60:
	movb	$1, %bl
	cmpb	$0, noisy(%rip)
	je	.LBB37_62
# %bb.61:
	movq	stderr(%rip), %rdi
	movq	progName(%rip), %rdx
	movl	$.L.str.90, %esi
	movl	$inName, %ecx
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB37_62
.LBB37_43:
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB37_29
# %bb.44:
	movq	%r14, %rdi
	callq	rewind
	leaq	-10080(%rbp), %r15
	jmp	.LBB37_45
	.p2align	4, 0x90
.LBB37_49:                              #   in Loop: Header=BB37_45 Depth=1
	movq	%r12, %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB37_50
.LBB37_45:                              # =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	callq	myfeof
	testb	%al, %al
	jne	.LBB37_32
# %bb.46:                               #   in Loop: Header=BB37_45 Depth=1
	movl	$1, %esi
	movl	$5000, %edx                     # imm = 0x1388
	movq	%r15, %rdi
	movq	%r14, %rcx
	callq	fread
	movq	%rax, %rbx
	movq	%r14, %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB37_50
# %bb.47:                               #   in Loop: Header=BB37_45 Depth=1
	testl	%ebx, %ebx
	jle	.LBB37_49
# %bb.48:                               #   in Loop: Header=BB37_45 Depth=1
	movslq	%ebx, %rdx
	movl	$1, %esi
	movq	%r15, %rdi
	movq	%r12, %rcx
	callq	fwrite
	jmp	.LBB37_49
.LBB37_32:                              # %.loopexit
	movq	%r14, %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB37_50
# %bb.33:
	cmpq	%r12, stdout(%rip)
	je	.LBB37_36
# %bb.34:
	movq	%r12, %rdi
	callq	fileno
	testl	%eax, %eax
	js	.LBB37_50
# %bb.35:
	movl	%eax, %edi
	callq	applySavedFileAttrToOutputFile
.LBB37_36:
	movq	%r14, %rdi
	callq	fclose
	cmpl	$-1, %eax
	je	.LBB37_50
# %bb.37:
	movq	%r12, %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB37_50
# %bb.38:
	movq	%r12, %rdi
	callq	fflush
	testl	%eax, %eax
	jne	.LBB37_50
# %bb.39:
	cmpq	%r12, stdout(%rip)
	je	.LBB37_41
# %bb.40:
	movq	%r12, %rdi
	callq	fclose
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$-1, %eax
	je	.LBB37_50
.LBB37_41:
	movq	$0, outputHandleJustInCase(%rip)
	movb	$1, %bl
	cmpl	$2, verbosity(%rip)
	jge	.LBB37_42
.LBB37_62:
	movl	%ebx, %eax
	addq	$10040, %rsp                    # imm = 0x2738
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB37_42:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rcx
	movl	$.L.str.89, %edi
	movl	$5, %esi
	movl	$1, %edx
	callq	fwrite
	jmp	.LBB37_62
.LBB37_30:                              # %.loopexit49
	addl	$9, %eax
	cmpl	$6, %eax
	ja	.LBB37_65
# %bb.31:                               # %.loopexit49
	jmpq	*.LJTI37_0(,%rax,8)
.LBB37_64:
	callq	configError
.LBB37_50:                              # %.loopexit47
	callq	ioError
.LBB37_53:
	callq	compressedStreamEOF
.LBB37_51:
	callq	crcError
.LBB37_52:
	callq	outOfMemory
.LBB37_65:
	movl	$.L.str.91, %edi
	callq	panic
.LBB37_63:
	movl	$.L.str.88, %edi
	callq	panic
.Lfunc_end37:
	.size	uncompressStream, .Lfunc_end37-uncompressStream
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI37_0:
	.quad	.LBB37_64
	.quad	.LBB37_65
	.quad	.LBB37_53
	.quad	.LBB37_50
	.quad	.LBB37_65
	.quad	.LBB37_51
	.quad	.LBB37_52
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
	subq	$16, %rsp
	movq	fileMetaInfo+72(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	fileMetaInfo+88(%rip), %rax
	movq	%rax, -8(%rbp)
	leaq	-16(%rbp), %rsi
	movl	$outName, %edi
	callq	utime
	testl	%eax, %eax
	jne	.LBB38_2
# %bb.1:
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB38_2:
	.cfi_def_cfa %rbp, 16
	callq	ioError
.Lfunc_end38:
	.size	applySavedTimeInfoToOutputFile, .Lfunc_end38-applySavedTimeInfoToOutputFile
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	%edi, %ebx
	movl	fileMetaInfo+24(%rip), %esi
	callq	fchmod
	testl	%eax, %eax
	jne	.LBB39_1
# %bb.2:
	movl	fileMetaInfo+28(%rip), %esi
	movl	fileMetaInfo+32(%rip), %edx
	movl	%ebx, %edi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	fchown                          # TAILCALL
.LBB39_1:
	.cfi_def_cfa %rbp, 16
	callq	ioError
.Lfunc_end39:
	.size	applySavedFileAttrToOutputFile, .Lfunc_end39-applySavedFileAttrToOutputFile
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
.Lfunc_end40:
	.size	crcError, .Lfunc_end40-crcError
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
	je	.LBB41_2
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
.LBB41_2:
	movl	$2, %edi
	callq	cleanUpAndFail
.Lfunc_end41:
	.size	compressedStreamEOF, .Lfunc_end41-compressedStreamEOF
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
	jne	.LBB42_2
# %bb.1:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB42_2:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rcx
	movl	$.L.str.46, %edi
	movl	$240, %esi
	movl	$1, %edx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	fwrite                          # TAILCALL
.Lfunc_end42:
	.size	cadvise, .Lfunc_end42-cadvise
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	callq	strlen
	movq	%rax, %r15
	movq	%r14, %rdi
	callq	strlen
	cmpl	%eax, %r15d
	jge	.LBB43_1
# %bb.2:
	xorl	%eax, %eax
	jmp	.LBB43_3
.LBB43_1:
	movslq	%r15d, %rcx
	addq	%rcx, %rbx
	cltq
	subq	%rax, %rbx
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	strcmp
	testl	%eax, %eax
	sete	%al
.LBB43_3:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end43:
	.size	hasSuffix, .Lfunc_end43-hasSuffix
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function compressStream
.LCPI44_0:
	.quad	0x4020000000000000              # double 8
.LCPI44_1:
	.quad	0x3ff0000000000000              # double 1
.LCPI44_2:
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
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$5160, %rsp                     # imm = 0x1428
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, -56(%rbp)                 # 8-byte Spill
	movq	%rdi, %rbx
	callq	ferror
	testl	%eax, %eax
	jne	.LBB44_29
# %bb.1:
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	callq	ferror
	testl	%eax, %eax
	jne	.LBB44_29
# %bb.2:
	movl	blockSize100k(%rip), %edx
	movl	verbosity(%rip), %ecx
	movl	workFactor(%rip), %r8d
	leaq	-44(%rbp), %rdi
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	callq	BZ2_bzWriteOpen
	movq	%rax, %r15
	cmpl	$0, -44(%rbp)
	jne	.LBB44_11
# %bb.3:
	cmpl	$2, verbosity(%rip)
	jl	.LBB44_5
# %bb.4:
	movq	stderr(%rip), %rsi
	movl	$10, %edi
	callq	fputc@PLT
.LBB44_5:
	leaq	-5184(%rbp), %r12
	leaq	-44(%rbp), %r13
	jmp	.LBB44_6
	.p2align	4, 0x90
.LBB44_10:                              #   in Loop: Header=BB44_6 Depth=1
	cmpl	$0, -44(%rbp)
	jne	.LBB44_11
.LBB44_6:                               # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	myfeof
	testb	%al, %al
	jne	.LBB44_15
# %bb.7:                                #   in Loop: Header=BB44_6 Depth=1
	movl	$1, %esi
	movl	$5000, %edx                     # imm = 0x1388
	movq	%r12, %rdi
	movq	%rbx, %rcx
	callq	fread
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB44_29
# %bb.8:                                #   in Loop: Header=BB44_6 Depth=1
	testl	%r14d, %r14d
	jle	.LBB44_10
# %bb.9:                                #   in Loop: Header=BB44_6 Depth=1
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	movl	%r14d, %ecx
	callq	BZ2_bzWrite
	jmp	.LBB44_10
.LBB44_15:
	leaq	-60(%rbp), %rax
	movq	%rax, (%rsp)
	leaq	-44(%rbp), %rdi
	leaq	-72(%rbp), %rcx
	leaq	-68(%rbp), %r8
	leaq	-64(%rbp), %r9
	movq	%r15, %rsi
	xorl	%edx, %edx
	callq	BZ2_bzWriteClose64
	cmpl	$0, -44(%rbp)
	jne	.LBB44_11
# %bb.16:
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	callq	ferror
	testl	%eax, %eax
	jne	.LBB44_29
# %bb.17:
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	callq	fflush
	cmpl	$-1, %eax
	je	.LBB44_29
# %bb.18:
	movq	-56(%rbp), %rax                 # 8-byte Reload
	cmpq	%rax, stdout(%rip)
	je	.LBB44_21
# %bb.19:
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	callq	fileno
	testl	%eax, %eax
	js	.LBB44_29
# %bb.20:
	movl	%eax, %edi
	callq	applySavedFileAttrToOutputFile
	movq	-56(%rbp), %rdi                 # 8-byte Reload
	callq	fclose
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$-1, %eax
	je	.LBB44_29
.LBB44_21:
	movq	$0, outputHandleJustInCase(%rip)
	movq	%rbx, %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB44_29
# %bb.22:
	movq	%rbx, %rdi
	callq	fclose
	cmpl	$-1, %eax
	je	.LBB44_29
# %bb.23:
	cmpl	$0, verbosity(%rip)
	jg	.LBB44_24
.LBB44_27:
	addq	$5160, %rsp                     # imm = 0x1428
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB44_24:
	.cfi_def_cfa %rbp, 16
	movl	-72(%rbp), %esi
	movl	-68(%rbp), %edx
	movl	%edx, %eax
	orl	%esi, %eax
	jne	.LBB44_26
# %bb.25:
	movq	stderr(%rip), %rcx
	movl	$.L.str.74, %edi
	movl	$21, %esi
	movl	$1, %edx
	callq	fwrite
	jmp	.LBB44_27
.LBB44_26:
	leaq	-104(%rbp), %r14
	movq	%r14, %rdi
	callq	uInt64_from_UInt32s
	movl	-64(%rbp), %esi
	movl	-60(%rbp), %edx
	leaq	-96(%rbp), %rbx
	movq	%rbx, %rdi
	callq	uInt64_from_UInt32s
	movq	%r14, %rdi
	callq	uInt64_to_double
	movsd	%xmm0, -56(%rbp)                # 8-byte Spill
	movq	%rbx, %rdi
	callq	uInt64_to_double
	movsd	%xmm0, -80(%rbp)                # 8-byte Spill
	leaq	-176(%rbp), %r15
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	uInt64_toAscii
	leaq	-144(%rbp), %r14
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	uInt64_toAscii
	movq	stderr(%rip), %rdi
	movsd	-56(%rbp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	movapd	%xmm2, %xmm0
	movsd	-80(%rbp), %xmm3                # 8-byte Reload
                                        # xmm3 = mem[0],zero
	divsd	%xmm3, %xmm0
	movsd	.LCPI44_0(%rip), %xmm1          # xmm1 = mem[0],zero
	mulsd	%xmm3, %xmm1
	divsd	%xmm2, %xmm1
	divsd	%xmm2, %xmm3
	movsd	.LCPI44_1(%rip), %xmm2          # xmm2 = mem[0],zero
	subsd	%xmm3, %xmm2
	mulsd	.LCPI44_2(%rip), %xmm2
	movl	$.L.str.75, %esi
	movq	%r15, %rdx
	movq	%r14, %rcx
	movb	$3, %al
	callq	fprintf
	jmp	.LBB44_27
.LBB44_11:                              # %.loopexit28
	leaq	-60(%rbp), %rax
	movq	%rax, (%rsp)
	leaq	-84(%rbp), %rdi
	leaq	-72(%rbp), %rcx
	leaq	-68(%rbp), %r8
	leaq	-64(%rbp), %r9
	movq	%r15, %rsi
	movl	$1, %edx
	callq	BZ2_bzWriteClose64
	movl	-44(%rbp), %eax
	cmpl	$-3, %eax
	je	.LBB44_28
# %bb.12:                               # %.loopexit28
	cmpl	$-6, %eax
	je	.LBB44_29
# %bb.13:                               # %.loopexit28
	cmpl	$-9, %eax
	jne	.LBB44_30
# %bb.14:
	callq	configError
.LBB44_29:                              # %.loopexit
	callq	ioError
.LBB44_28:
	callq	outOfMemory
.LBB44_30:
	movl	$.L.str.76, %edi
	callq	panic
.Lfunc_end44:
	.size	compressStream, .Lfunc_end44-compressStream
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
	movl	%esi, %eax
	movl	%edx, 4(%rdi)
	movl	%esi, %ecx
	shrl	$24, %ecx
	movb	%cl, 3(%rdi)
	movl	%esi, %ecx
	shrl	$16, %ecx
	movb	%cl, 2(%rdi)
	movb	%ah, 1(%rdi)
	movb	%al, (%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end45:
	.size	uInt64_from_UInt32s, .Lfunc_end45-uInt64_from_UInt32s
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function uInt64_to_double
.LCPI46_0:
	.quad	0x4070000000000000              # double 256
.LCPI46_1:
	.quad	0x40f0000000000000              # double 65536
.LCPI46_2:
	.quad	0x4170000000000000              # double 16777216
.LCPI46_3:
	.quad	0x41f0000000000000              # double 4294967296
.LCPI46_4:
	.quad	0x4270000000000000              # double 1099511627776
.LCPI46_5:
	.quad	0x42f0000000000000              # double 281474976710656
.LCPI46_6:
	.quad	0x4370000000000000              # double 72057594037927936
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
	movzbl	(%rdi), %eax
	cvtsi2sd	%eax, %xmm0
	movzbl	1(%rdi), %eax
	cvtsi2sd	%eax, %xmm1
	mulsd	.LCPI46_0(%rip), %xmm1
	movzbl	2(%rdi), %eax
	cvtsi2sd	%eax, %xmm2
	mulsd	.LCPI46_1(%rip), %xmm2
	addsd	%xmm0, %xmm1
	movzbl	3(%rdi), %eax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	addsd	%xmm1, %xmm2
	mulsd	.LCPI46_2(%rip), %xmm0
	movzbl	4(%rdi), %eax
	xorps	%xmm1, %xmm1
	cvtsi2sd	%eax, %xmm1
	mulsd	.LCPI46_3(%rip), %xmm1
	addsd	%xmm2, %xmm0
	movzbl	5(%rdi), %eax
	xorps	%xmm2, %xmm2
	cvtsi2sd	%eax, %xmm2
	addsd	%xmm0, %xmm1
	mulsd	.LCPI46_4(%rip), %xmm2
	movzbl	6(%rdi), %eax
	cvtsi2sd	%eax, %xmm3
	mulsd	.LCPI46_5(%rip), %xmm3
	addsd	%xmm1, %xmm2
	movzbl	7(%rdi), %eax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	addsd	%xmm2, %xmm3
	mulsd	.LCPI46_6(%rip), %xmm0
	addsd	%xmm3, %xmm0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end46:
	.size	uInt64_to_double, .Lfunc_end46-uInt64_to_double
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, -48(%rbp)                 # 8-byte Spill
	movabsq	$-4294967296, %rbx              # imm = 0xFFFFFFFF00000000
	movabsq	$-8589934592, %r13              # imm = 0xFFFFFFFE00000000
	movq	(%rsi), %rax
	movq	%rax, -56(%rbp)
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB47_1:                               # =>This Inner Loop Header: Depth=1
	leaq	-56(%rbp), %r12
	movq	%r12, %rdi
	callq	uInt64_qrm10
	addb	$48, %al
	movb	%al, -96(%rbp,%r15)
	addq	$1, %r15
	movq	%r12, %rdi
	callq	uInt64_isZero
	movabsq	$4294967296, %rcx               # imm = 0x100000000
	addq	%rcx, %rbx
	addq	%rcx, %r14
	addq	%rcx, %r13
	testb	%al, %al
	je	.LBB47_1
# %bb.2:
	sarq	$32, %r14
	movq	-48(%rbp), %rdi                 # 8-byte Reload
	movb	$0, (%rdi,%r14)
	testl	%r15d, %r15d
	jle	.LBB47_10
# %bb.3:
	movl	%r15d, %eax
	testq	%rax, %rax
	je	.LBB47_10
# %bb.4:                                # %.lr.ph.preheader
	cmpl	$1, %eax
	jne	.LBB47_6
# %bb.5:
	xorl	%eax, %eax
	jmp	.LBB47_8
.LBB47_6:                               # %.lr.ph.preheader.new
	movl	%r15d, %r8d
	movl	%r15d, %eax
	andl	$1, %eax
	subq	%rax, %r8
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movabsq	$-8589934592, %r9               # imm = 0xFFFFFFFE00000000
	.p2align	4, 0x90
.LBB47_7:                               # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movq	%rdx, %rsi
	sarq	$32, %rsi
	movzbl	-96(%rbp,%rsi), %ecx
	movb	%cl, (%rdi,%rax)
	movq	%r13, %rcx
	sarq	$32, %rcx
	movzbl	-96(%rbp,%rcx), %ecx
	movb	%cl, 1(%rdi,%rax)
	addq	$2, %rax
	addq	%r9, %r13
	addq	%r9, %rdx
	cmpq	%rax, %r8
	jne	.LBB47_7
.LBB47_8:                               # %._crit_edge.loopexit.unr-lcssa
	testb	$1, %r15b
	je	.LBB47_10
# %bb.9:                                # %.lr.ph.epil.preheader
	movabsq	$-4294967296, %rcx              # imm = 0xFFFFFFFF00000000
	imulq	%rax, %rcx
	addq	%rbx, %rcx
	sarq	$32, %rcx
	movb	-96(%rbp,%rcx), %cl
	movb	%cl, (%rdi,%rax)
.LBB47_10:                              # %._crit_edge
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end47:
	.size	uInt64_toAscii, .Lfunc_end47-uInt64_toAscii
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
	movzbl	7(%rdi), %eax
	imull	$205, %eax, %ecx
	shrl	$11, %ecx
	movb	%cl, 7(%rdi)
	addl	%ecx, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subb	%cl, %al
	movzbl	%al, %eax
	shll	$8, %eax
	movzbl	6(%rdi), %edx
	orl	%eax, %edx
	movl	$3435973837, %ecx               # imm = 0xCCCCCCCD
	movq	%rdx, %rax
	imulq	%rcx, %rax
	shrq	$35, %rax
	movb	%al, 6(%rdi)
	addl	%eax, %eax
	leal	(%rax,%rax,4), %eax
	subl	%eax, %edx
	shll	$8, %edx
	movzbl	5(%rdi), %eax
	orl	%edx, %eax
	movq	%rax, %rdx
	imulq	%rcx, %rdx
	shrq	$35, %rdx
	movb	%dl, 5(%rdi)
	addl	%edx, %edx
	leal	(%rdx,%rdx,4), %edx
	subl	%edx, %eax
	shll	$8, %eax
	movzbl	4(%rdi), %edx
	orl	%eax, %edx
	movq	%rdx, %rax
	imulq	%rcx, %rax
	shrq	$35, %rax
	movb	%al, 4(%rdi)
	addl	%eax, %eax
	leal	(%rax,%rax,4), %eax
	subl	%eax, %edx
	shll	$8, %edx
	movzbl	3(%rdi), %eax
	orl	%edx, %eax
	movq	%rax, %rdx
	imulq	%rcx, %rdx
	shrq	$35, %rdx
	movb	%dl, 3(%rdi)
	addl	%edx, %edx
	leal	(%rdx,%rdx,4), %edx
	subl	%edx, %eax
	shll	$8, %eax
	movzbl	2(%rdi), %edx
	orl	%eax, %edx
	movq	%rdx, %rax
	imulq	%rcx, %rax
	shrq	$35, %rax
	movb	%al, 2(%rdi)
	addl	%eax, %eax
	leal	(%rax,%rax,4), %eax
	subl	%eax, %edx
	shll	$8, %edx
	movzbl	1(%rdi), %esi
	orl	%edx, %esi
	movq	%rsi, %rax
	imulq	%rcx, %rax
	shrq	$35, %rax
	movb	%al, 1(%rdi)
	addl	%eax, %eax
	leal	(%rax,%rax,4), %eax
	subl	%eax, %esi
	shll	$8, %esi
	movzbl	(%rdi), %eax
	orl	%esi, %eax
	imulq	%rax, %rcx
	shrq	$35, %rcx
	movb	%cl, (%rdi)
	addl	%ecx, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
                                        # kill: def $eax killed $eax killed $rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end48:
	.size	uInt64_qrm10, .Lfunc_end48-uInt64_qrm10
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
	cmpb	$0, (%rdi)
	jne	.LBB49_8
# %bb.1:
	cmpb	$0, 1(%rdi)
	jne	.LBB49_8
# %bb.2:
	cmpb	$0, 2(%rdi)
	jne	.LBB49_8
# %bb.3:
	cmpb	$0, 3(%rdi)
	jne	.LBB49_8
# %bb.4:
	cmpb	$0, 4(%rdi)
	jne	.LBB49_8
# %bb.5:
	cmpb	$0, 5(%rdi)
	jne	.LBB49_8
# %bb.6:
	cmpb	$0, 6(%rdi)
	je	.LBB49_7
.LBB49_8:
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB49_7:
	.cfi_def_cfa %rbp, 16
	cmpb	$0, 7(%rdi)
	sete	%al
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end49:
	.size	uInt64_isZero, .Lfunc_end49-uInt64_isZero
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
	movl	$16, %edi
	callq	myMalloc
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rax)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end50:
	.size	mkCell, .Lfunc_end50-mkCell
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
	movslq	%edi, %rdi
	callq	malloc
	testq	%rax, %rax
	je	.LBB51_2
# %bb.1:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB51_2:
	.cfi_def_cfa %rbp, 16
	callq	outOfMemory
.Lfunc_end51:
	.size	myMalloc, .Lfunc_end51-myMalloc
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	%edi, %ebx
	movq	stderr(%rip), %rdi
	movl	$.L.str.105, %esi
	movl	$.L.str.5.107, %ecx
	movl	%ebx, %edx
	xorl	%eax, %eax
	callq	fprintf
	cmpl	$1007, %ebx                     # imm = 0x3EF
	jne	.LBB52_2
# %bb.1:
	movq	stderr(%rip), %rcx
	movl	$.L.str.1.106, %edi
	movl	$1056, %esi                     # imm = 0x420
	movl	$1, %edx
	callq	fwrite
.LBB52_2:
	movl	$3, %edi
	callq	exit
.Lfunc_end52:
	.size	BZ2_bz__AssertH__fail, .Lfunc_end52-BZ2_bz__AssertH__fail
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
.Lfunc_end53:
	.size	BZ2_bzlibVersion, .Lfunc_end53-BZ2_bzlibVersion
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	$-2, %r14d
	cmpl	$250, %ecx
	ja	.LBB54_18
# %bb.1:
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.LBB54_18
# %bb.2:
	movl	%esi, %r13d
	leal	-1(%r13), %eax
	cmpl	$8, %eax
	ja	.LBB54_18
# %bb.3:
	movl	%edx, %r12d
	testl	%ecx, %ecx
	movl	$30, %eax
	cmovnel	%ecx, %eax
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	movq	56(%rbx), %rax
	testq	%rax, %rax
	je	.LBB54_4
# %bb.5:
	cmpq	$0, 64(%rbx)
	jne	.LBB54_7
.LBB54_6:
	movq	$default_bzfree, 64(%rbx)
.LBB54_7:
	movq	72(%rbx), %rdi
	movl	$55768, %esi                    # imm = 0xD9D8
	movl	$1, %edx
	callq	*%rax
	movl	$-3, %r14d
	testq	%rax, %rax
	je	.LBB54_18
# %bb.8:
	movq	%rax, %r15
	movl	%r12d, -44(%rbp)                # 4-byte Spill
	movq	%rbx, (%rax)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 24(%rax)
	movq	$0, 40(%rax)
	movq	72(%rbx), %rdi
	imull	$400000, %r13d, %r12d           # imm = 0x61A80
	movl	%r12d, %esi
	movl	$1, %edx
	callq	*56(%rbx)
	movq	%rax, 24(%r15)
	movq	72(%rbx), %rdi
	addl	$136, %r12d
	movl	%r12d, %esi
	movl	$1, %edx
	callq	*56(%rbx)
	movq	%rax, 32(%r15)
	movq	72(%rbx), %rdi
	movl	$262148, %esi                   # imm = 0x40004
	movl	$1, %edx
	callq	*56(%rbx)
	movq	%rax, 40(%r15)
	movq	24(%r15), %rsi
	testq	%rsi, %rsi
	je	.LBB54_12
# %bb.9:
	testq	%rax, %rax
	je	.LBB54_11
# %bb.10:
	movq	32(%r15), %rax
	testq	%rax, %rax
	je	.LBB54_11
# %bb.17:
	imull	$100000, %r13d, %ecx            # imm = 0x186A0
	movl	$0, 660(%r15)
	movabsq	$8589934594, %rdx               # imm = 0x200000002
	movq	%rdx, 8(%r15)
	movl	$0, 652(%r15)
	movl	%r13d, 664(%r15)
	addl	$-19, %ecx
	movl	%ecx, 112(%r15)
	movl	-44(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, 656(%r15)
	movl	-48(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, 88(%r15)
	movq	%rax, 64(%r15)
	movq	%rsi, 72(%r15)
	movq	$0, 80(%r15)
	movq	%rsi, 56(%r15)
	movq	%r15, 48(%rbx)
	movq	$0, 12(%rbx)
	movq	$0, 36(%rbx)
	movq	%r15, %rdi
	callq	init_RL
	movq	%r15, %rdi
	callq	prepare_new_block
	xorl	%r14d, %r14d
	jmp	.LBB54_18
.LBB54_4:
	movq	$default_bzalloc, 56(%rbx)
	movl	$default_bzalloc, %eax
	cmpq	$0, 64(%rbx)
	jne	.LBB54_7
	jmp	.LBB54_6
.LBB54_11:
	movq	72(%rbx), %rdi
	callq	*64(%rbx)
.LBB54_12:                              # %.thread
	movq	32(%r15), %rsi
	testq	%rsi, %rsi
	je	.LBB54_14
# %bb.13:
	movq	72(%rbx), %rdi
	callq	*64(%rbx)
.LBB54_14:
	movq	40(%r15), %rsi
	testq	%rsi, %rsi
	je	.LBB54_16
# %bb.15:
	movq	72(%rbx), %rdi
	callq	*64(%rbx)
.LBB54_16:
	movq	72(%rbx), %rdi
	movq	%r15, %rsi
	callq	*64(%rbx)
.LBB54_18:
	movl	%r14d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end54:
	.size	BZ2_bzCompressInit, .Lfunc_end54-BZ2_bzCompressInit
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
	imull	%edx, %esi
	movslq	%esi, %rdi
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	malloc                          # TAILCALL
.Lfunc_end55:
	.size	default_bzalloc, .Lfunc_end55-default_bzalloc
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
	testq	%rsi, %rsi
	je	.LBB56_1
# %bb.2:
	movq	%rsi, %rdi
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	free                            # TAILCALL
.LBB56_1:
	.cfi_def_cfa %rbp, 16
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end56:
	.size	default_bzfree, .Lfunc_end56-default_bzfree
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
	movq	$256, 92(%rdi)                  # imm = 0x100
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end57:
	.size	init_RL, .Lfunc_end57-init_RL
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
	movl	$0, 108(%rdi)
	movq	$0, 116(%rdi)
	movl	$-1, 648(%rdi)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 128(%rdi)
	movups	%xmm0, 144(%rdi)
	movups	%xmm0, 160(%rdi)
	movups	%xmm0, 176(%rdi)
	movups	%xmm0, 192(%rdi)
	movups	%xmm0, 208(%rdi)
	movups	%xmm0, 224(%rdi)
	movups	%xmm0, 240(%rdi)
	movups	%xmm0, 256(%rdi)
	movups	%xmm0, 272(%rdi)
	movups	%xmm0, 288(%rdi)
	movups	%xmm0, 304(%rdi)
	movups	%xmm0, 320(%rdi)
	movups	%xmm0, 336(%rdi)
	movups	%xmm0, 352(%rdi)
	movups	%xmm0, 368(%rdi)
	addl	$1, 660(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end58:
	.size	prepare_new_block, .Lfunc_end58-prepare_new_block
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
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	$-2, %r14d
	testq	%rdi, %rdi
	je	.LBB59_38
# %bb.1:
	movq	48(%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB59_38
# %bb.2:
	cmpq	%rdi, (%rbx)
	je	.LBB59_3
.LBB59_38:                              # %.loopexit
	movl	%r14d, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB59_3:                               # %.preheader
	.cfi_def_cfa %rbp, 16
	testl	%esi, %esi
	je	.LBB59_16
# %bb.4:                                # %.preheader
	cmpl	$1, %esi
	je	.LBB59_20
# %bb.5:                                # %.preheader
	cmpl	$2, %esi
	jne	.LBB59_33
# %bb.6:                                # %.preheader.split.split.split.us.preheader
	movl	8(%rbx), %eax
	cmpl	$2, %eax
	jne	.LBB59_8
	.p2align	4, 0x90
.LBB59_32:                              # %.backedge.us58
                                        # =>This Inner Loop Header: Depth=1
	movl	8(%rdi), %eax
	movl	%eax, 16(%rbx)
	movl	$4, 8(%rbx)
	movl	$4, %eax
	cmpl	$2, %eax
	je	.LBB59_32
.LBB59_8:                               # %.preheader.split.split.split.us
	cmpl	$1, %eax
	je	.LBB59_23
# %bb.9:                                # %.preheader.split.split.split.us
	cmpl	$3, %eax
	je	.LBB59_10
# %bb.24:                               # %.preheader.split.split.us
	cmpl	$4, %eax
	jne	.LBB59_37
# %bb.25:                               # %.us-lcssa53.us
	movl	$-1, %r14d
	cmpl	$2, %esi
	jne	.LBB59_38
# %bb.26:
	movl	16(%rbx), %eax
	cmpl	8(%rdi), %eax
	jne	.LBB59_38
# %bb.27:
	callq	handle_compress
	testb	%al, %al
	je	.LBB59_38
# %bb.28:
	movl	$3, %r14d
	cmpl	$0, 16(%rbx)
	jne	.LBB59_38
# %bb.29:
	movq	%rbx, %rdi
	callq	isempty_RL
	testb	%al, %al
	je	.LBB59_38
# %bb.30:
	movl	120(%rbx), %eax
	cmpl	116(%rbx), %eax
	jl	.LBB59_38
# %bb.31:
	movl	$1, 8(%rbx)
	movl	$4, %r14d
	jmp	.LBB59_38
.LBB59_16:                              # %.preheader.split.us
	movl	8(%rbx), %eax
	movl	$-1, %r14d
	leal	-3(%rax), %ecx
	cmpl	$2, %ecx
	jb	.LBB59_38
# %bb.17:                               # %.preheader.split.us
	cmpl	$1, %eax
	je	.LBB59_38
# %bb.18:                               # %.preheader.split.us
	cmpl	$2, %eax
	jne	.LBB59_37
# %bb.19:                               # %.us-lcssa54.us
	callq	handle_compress
	xorl	%ecx, %ecx
	testb	%al, %al
	setne	%cl
	leal	(%rcx,%rcx,2), %r14d
	addl	$-2, %r14d
	jmp	.LBB59_38
.LBB59_20:                              # %.preheader.split.split.us.preheader
	movl	8(%rbx), %eax
	cmpl	$2, %eax
	jne	.LBB59_8
	.p2align	4, 0x90
.LBB59_22:                              # %.backedge.us55
                                        # =>This Inner Loop Header: Depth=1
	movl	8(%rdi), %eax
	movl	%eax, 16(%rbx)
	movl	$3, 8(%rbx)
	movl	$3, %eax
	cmpl	$2, %eax
	je	.LBB59_22
	jmp	.LBB59_8
.LBB59_33:                              # %.preheader.split.split.split
	movl	8(%rbx), %eax
	movl	$-1, %r14d
	leal	-3(%rax), %ecx
	cmpl	$2, %ecx
	jb	.LBB59_38
# %bb.34:                               # %.preheader.split.split.split
	cmpl	$1, %eax
	je	.LBB59_38
# %bb.35:                               # %.preheader.split.split.split
	cmpl	$2, %eax
	jne	.LBB59_37
# %bb.36:
	movl	$-2, %r14d
	jmp	.LBB59_38
.LBB59_37:                              # %.loopexit48
	xorl	%r14d, %r14d
	jmp	.LBB59_38
.LBB59_23:                              # %.loopexit.loopexit2
	movl	$-1, %r14d
	jmp	.LBB59_38
.LBB59_10:                              # %.us-lcssa.us
	movl	$-1, %r14d
	cmpl	$1, %esi
	jne	.LBB59_38
# %bb.11:
	movl	16(%rbx), %eax
	cmpl	8(%rdi), %eax
	jne	.LBB59_38
# %bb.12:
	callq	handle_compress
	movl	$2, %r14d
	cmpl	$0, 16(%rbx)
	jne	.LBB59_38
# %bb.13:
	movq	%rbx, %rdi
	callq	isempty_RL
	testb	%al, %al
	je	.LBB59_38
# %bb.14:
	movl	120(%rbx), %eax
	cmpl	116(%rbx), %eax
	jl	.LBB59_38
# %bb.15:
	movl	$2, 8(%rbx)
	movl	$1, %r14d
	jmp	.LBB59_38
.Lfunc_end59:
	.size	BZ2_bzCompress, .Lfunc_end59-BZ2_bzCompress
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
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	48(%rdi), %rbx
	xorl	%r12d, %r12d
	xorl	%r15d, %r15d
	jmp	.LBB60_1
	.p2align	4, 0x90
.LBB60_17:                              #   in Loop: Header=BB60_1 Depth=1
	movq	(%rbx), %rax
	cmpl	$0, 8(%rax)
	movl	%r14d, %r12d
	je	.LBB60_18
.LBB60_1:                               # =>This Inner Loop Header: Depth=1
	movl	12(%rbx), %eax
	cmpl	$2, %eax
	je	.LBB60_2
# %bb.3:                                #   in Loop: Header=BB60_1 Depth=1
	cmpl	$1, %eax
	jne	.LBB60_1
# %bb.4:                                #   in Loop: Header=BB60_1 Depth=1
	movq	%rbx, %rdi
	callq	copy_output_until_stop
	movl	%eax, %r14d
	orb	%r12b, %r14b
	movl	120(%rbx), %eax
	cmpl	116(%rbx), %eax
	jl	.LBB60_18
# %bb.5:                                #   in Loop: Header=BB60_1 Depth=1
	cmpl	$4, 8(%rbx)
	jne	.LBB60_8
# %bb.6:                                #   in Loop: Header=BB60_1 Depth=1
	cmpl	$0, 16(%rbx)
	jne	.LBB60_8
# %bb.7:                                #   in Loop: Header=BB60_1 Depth=1
	movq	%rbx, %rdi
	callq	isempty_RL
	testb	%al, %al
	jne	.LBB60_18
	.p2align	4, 0x90
.LBB60_8:                               #   in Loop: Header=BB60_1 Depth=1
	movq	%rbx, %rdi
	callq	prepare_new_block
	movl	$2, 12(%rbx)
	cmpl	$3, 8(%rbx)
	jne	.LBB60_11
# %bb.9:                                #   in Loop: Header=BB60_1 Depth=1
	cmpl	$0, 16(%rbx)
	jne	.LBB60_11
# %bb.10:                               #   in Loop: Header=BB60_1 Depth=1
	movq	%rbx, %rdi
	callq	isempty_RL
	testb	%al, %al
	je	.LBB60_11
	jmp	.LBB60_18
	.p2align	4, 0x90
.LBB60_2:                               #   in Loop: Header=BB60_1 Depth=1
	movl	%r12d, %r14d
.LBB60_11:                              # %.thread
                                        #   in Loop: Header=BB60_1 Depth=1
	movq	%rbx, %rdi
	callq	copy_input_until_stop
	orb	%al, %r15b
	cmpl	$2, 8(%rbx)
	je	.LBB60_14
# %bb.12:                               #   in Loop: Header=BB60_1 Depth=1
	cmpl	$0, 16(%rbx)
	je	.LBB60_13
.LBB60_14:                              #   in Loop: Header=BB60_1 Depth=1
	movl	108(%rbx), %eax
	cmpl	112(%rbx), %eax
	jl	.LBB60_17
# %bb.15:                               #   in Loop: Header=BB60_1 Depth=1
	movq	%rbx, %rdi
	xorl	%esi, %esi
	jmp	.LBB60_16
.LBB60_13:                              #   in Loop: Header=BB60_1 Depth=1
	movq	%rbx, %rdi
	callq	flush_RL
	xorl	%esi, %esi
	cmpl	$4, 8(%rbx)
	sete	%sil
	movq	%rbx, %rdi
.LBB60_16:                              #   in Loop: Header=BB60_1 Depth=1
	callq	BZ2_compressBlock
	movl	$1, 12(%rbx)
	movl	%r14d, %r12d
	jmp	.LBB60_1
.LBB60_18:
	orb	%r15b, %r14b
	setne	%al
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end60:
	.size	handle_compress, .Lfunc_end60-handle_compress
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
	cmpl	$255, 92(%rdi)
	ja	.LBB61_3
# %bb.1:
	cmpl	$0, 96(%rdi)
	jle	.LBB61_3
# %bb.2:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB61_3:
	.cfi_def_cfa %rbp, 16
	movb	$1, %al
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end61:
	.size	isempty_RL, .Lfunc_end61-isempty_RL
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
	movq	(%rdi), %rcx
	cmpl	$0, 32(%rcx)
	je	.LBB62_8
# %bb.1:                                # %.lr.ph
	movl	120(%rdi), %edx
	cmpl	116(%rdi), %edx
	jge	.LBB62_8
	.p2align	4, 0x90
.LBB62_2:                               # %.lr.ph17
                                        # =>This Inner Loop Header: Depth=1
	movq	80(%rdi), %rax
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %eax
	movq	24(%rcx), %rcx
	movb	%al, (%rcx)
	addl	$1, 120(%rdi)
	movq	(%rdi), %rax
	addl	$-1, 32(%rax)
	movq	(%rdi), %rax
	addq	$1, 24(%rax)
	movq	(%rdi), %rax
	addl	$1, 36(%rax)
	movq	(%rdi), %rcx
	cmpl	$0, 36(%rcx)
	jne	.LBB62_4
# %bb.3:                                #   in Loop: Header=BB62_2 Depth=1
	addl	$1, 40(%rcx)
	movq	(%rdi), %rcx
.LBB62_4:                               #   in Loop: Header=BB62_2 Depth=1
	movb	$1, %al
	cmpl	$0, 32(%rcx)
	je	.LBB62_6
# %bb.5:                                #   in Loop: Header=BB62_2 Depth=1
	movl	120(%rdi), %edx
	cmpl	116(%rdi), %edx
	jl	.LBB62_2
.LBB62_6:                               # %._crit_edge
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB62_8:
	.cfi_def_cfa %rbp, 16
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end62:
	.size	copy_output_until_stop, .Lfunc_end62-copy_output_until_stop
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
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, %rbx
	cmpl	$2, 8(%rdi)
	jne	.LBB63_16
# %bb.1:
	movl	108(%rbx), %ecx
	cmpl	112(%rbx), %ecx
	jge	.LBB63_32
# %bb.2:                                # %.lr.ph
	movq	(%rbx), %rdx
	cmpl	$0, 8(%rdx)
	je	.LBB63_32
	.p2align	4, 0x90
.LBB63_3:                               # %.lr.ph103
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rdx), %rax
	movzbl	(%rax), %r14d
	movl	92(%rbx), %eax
	cmpl	%r14d, %eax
	jne	.LBB63_6
# %bb.4:                                #   in Loop: Header=BB63_3 Depth=1
	movl	96(%rbx), %ecx
	cmpl	$255, %ecx
	je	.LBB63_8
# %bb.5:                                #   in Loop: Header=BB63_3 Depth=1
	addl	$1, %ecx
	movl	%ecx, 96(%rbx)
	jmp	.LBB63_11
	.p2align	4, 0x90
.LBB63_6:                               #   in Loop: Header=BB63_3 Depth=1
	cmpl	$1, 96(%rbx)
	jne	.LBB63_8
# %bb.7:                                #   in Loop: Header=BB63_3 Depth=1
	movl	648(%rbx), %edx
	movl	%edx, %esi
	shll	$8, %esi
	shrl	$24, %edx
	movzbl	%al, %edi
	xorl	%edx, %edi
	xorl	BZ2_crc32Table(,%rdi,4), %esi
	movl	%esi, 648(%rbx)
	movb	$1, 128(%rbx,%rax)
	movq	64(%rbx), %rdx
	movslq	%ecx, %rcx
	movb	%al, (%rdx,%rcx)
	addl	$1, 108(%rbx)
	movl	%r14d, 92(%rbx)
	jmp	.LBB63_11
	.p2align	4, 0x90
.LBB63_8:                               #   in Loop: Header=BB63_3 Depth=1
	cmpl	$255, %eax
	ja	.LBB63_10
# %bb.9:                                #   in Loop: Header=BB63_3 Depth=1
	movq	%rbx, %rdi
	callq	add_pair_to_block
.LBB63_10:                              #   in Loop: Header=BB63_3 Depth=1
	movl	%r14d, 92(%rbx)
	movl	$1, 96(%rbx)
.LBB63_11:                              #   in Loop: Header=BB63_3 Depth=1
	movq	(%rbx), %rax
	addq	$1, (%rax)
	movq	(%rbx), %rax
	addl	$-1, 8(%rax)
	movq	(%rbx), %rax
	addl	$1, 12(%rax)
	movq	(%rbx), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB63_13
# %bb.12:                               #   in Loop: Header=BB63_3 Depth=1
	addl	$1, 16(%rax)
.LBB63_13:                              #   in Loop: Header=BB63_3 Depth=1
	movl	108(%rbx), %ecx
	movb	$1, %al
	cmpl	112(%rbx), %ecx
	jge	.LBB63_15
# %bb.14:                               #   in Loop: Header=BB63_3 Depth=1
	movq	(%rbx), %rdx
	cmpl	$0, 8(%rdx)
	jne	.LBB63_3
.LBB63_15:                              # %.loopexit
                                        # kill: def $al killed $al killed $eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB63_16:
	.cfi_def_cfa %rbp, 16
	movl	108(%rbx), %ecx
	cmpl	112(%rbx), %ecx
	jge	.LBB63_32
# %bb.17:                               # %.lr.ph91
	movq	(%rbx), %rdx
	cmpl	$0, 8(%rdx)
	je	.LBB63_32
# %bb.18:                               # %.lr.ph107.preheader
	cmpl	$0, 16(%rbx)
	je	.LBB63_32
	.p2align	4, 0x90
.LBB63_19:                              # %.lr.ph114
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rdx), %rax
	movzbl	(%rax), %r14d
	movl	92(%rbx), %eax
	cmpl	%r14d, %eax
	jne	.LBB63_22
# %bb.20:                               #   in Loop: Header=BB63_19 Depth=1
	movl	96(%rbx), %ecx
	cmpl	$255, %ecx
	je	.LBB63_24
# %bb.21:                               #   in Loop: Header=BB63_19 Depth=1
	addl	$1, %ecx
	movl	%ecx, 96(%rbx)
	jmp	.LBB63_27
	.p2align	4, 0x90
.LBB63_22:                              #   in Loop: Header=BB63_19 Depth=1
	cmpl	$1, 96(%rbx)
	jne	.LBB63_24
# %bb.23:                               #   in Loop: Header=BB63_19 Depth=1
	movl	648(%rbx), %edx
	movl	%edx, %esi
	shll	$8, %esi
	shrl	$24, %edx
	movzbl	%al, %edi
	xorl	%edx, %edi
	xorl	BZ2_crc32Table(,%rdi,4), %esi
	movl	%esi, 648(%rbx)
	movb	$1, 128(%rbx,%rax)
	movq	64(%rbx), %rdx
	movslq	%ecx, %rcx
	movb	%al, (%rdx,%rcx)
	addl	$1, 108(%rbx)
	movl	%r14d, 92(%rbx)
	jmp	.LBB63_27
	.p2align	4, 0x90
.LBB63_24:                              #   in Loop: Header=BB63_19 Depth=1
	cmpl	$255, %eax
	ja	.LBB63_26
# %bb.25:                               #   in Loop: Header=BB63_19 Depth=1
	movq	%rbx, %rdi
	callq	add_pair_to_block
.LBB63_26:                              #   in Loop: Header=BB63_19 Depth=1
	movl	%r14d, 92(%rbx)
	movl	$1, 96(%rbx)
.LBB63_27:                              #   in Loop: Header=BB63_19 Depth=1
	movq	(%rbx), %rax
	addq	$1, (%rax)
	movq	(%rbx), %rax
	addl	$-1, 8(%rax)
	movq	(%rbx), %rax
	addl	$1, 12(%rax)
	movq	(%rbx), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB63_29
# %bb.28:                               #   in Loop: Header=BB63_19 Depth=1
	addl	$1, 16(%rax)
.LBB63_29:                              #   in Loop: Header=BB63_19 Depth=1
	movl	16(%rbx), %edx
	movl	108(%rbx), %ecx
	addl	$-1, %edx
	movl	%edx, 16(%rbx)
	movb	$1, %al
	cmpl	112(%rbx), %ecx
	jge	.LBB63_15
# %bb.30:                               #   in Loop: Header=BB63_19 Depth=1
	testl	%edx, %edx
	je	.LBB63_15
# %bb.31:                               #   in Loop: Header=BB63_19 Depth=1
	movq	(%rbx), %rdx
	cmpl	$0, 8(%rdx)
	jne	.LBB63_19
	jmp	.LBB63_15
.LBB63_32:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end63:
	.size	copy_input_until_stop, .Lfunc_end63-copy_input_until_stop
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	cmpl	$255, 92(%rdi)
	ja	.LBB64_2
# %bb.1:
	movq	%rbx, %rdi
	callq	add_pair_to_block
.LBB64_2:
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	init_RL                         # TAILCALL
.Lfunc_end64:
	.size	flush_RL, .Lfunc_end64-flush_RL
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
	movl	92(%rdi), %r8d
	movslq	96(%rdi), %r10
	testq	%r10, %r10
	jle	.LBB65_9
# %bb.1:                                # %.lr.ph
	movzbl	%r8b, %edx
	cmpl	$1, %r10d
	jne	.LBB65_3
# %bb.2:                                # %.lr.ph..epil.preheader_crit_edge
	movl	648(%rdi), %ecx
	jmp	.LBB65_8
.LBB65_3:                               # %.lr.ph.new
	movl	%r10d, %eax
	andl	$-2, %eax
	movl	648(%rdi), %ecx
	leal	-2(%rax), %r9d
	testb	$2, %r9b
	jne	.LBB65_5
# %bb.4:                                # %.prol.preheader
	movl	%ecx, %eax
	shll	$8, %eax
	shrl	$24, %ecx
	xorl	%edx, %ecx
	xorl	BZ2_crc32Table(,%rcx,4), %eax
	movl	%eax, 648(%rdi)
	movl	%eax, %ecx
	shll	$8, %ecx
	shrl	$24, %eax
	xorl	%edx, %eax
	xorl	BZ2_crc32Table(,%rax,4), %ecx
	movl	%ecx, 648(%rdi)
	movl	%r9d, %eax
.LBB65_5:                               # %.prol.loopexit
	testl	%r9d, %r9d
	je	.LBB65_7
	.p2align	4, 0x90
.LBB65_6:                               # %.lr.ph.new.new
                                        # =>This Inner Loop Header: Depth=1
	movl	%ecx, %esi
	shll	$8, %esi
	shrl	$24, %ecx
	xorl	%edx, %ecx
	xorl	BZ2_crc32Table(,%rcx,4), %esi
	movl	%esi, 648(%rdi)
	movl	%esi, %ecx
	shll	$8, %ecx
	shrl	$24, %esi
	xorl	%edx, %esi
	xorl	BZ2_crc32Table(,%rsi,4), %ecx
	movl	%ecx, 648(%rdi)
	movl	%ecx, %esi
	shll	$8, %esi
	shrl	$24, %ecx
	xorl	%edx, %ecx
	xorl	BZ2_crc32Table(,%rcx,4), %esi
	movl	%esi, 648(%rdi)
	movl	%esi, %ecx
	shll	$8, %ecx
	shrl	$24, %esi
	xorl	%edx, %esi
	xorl	BZ2_crc32Table(,%rsi,4), %ecx
	movl	%ecx, 648(%rdi)
	addl	$-4, %eax
	jne	.LBB65_6
.LBB65_7:                               # %._crit_edge.loopexit.unr-lcssa
	testb	$1, %r10b
	je	.LBB65_9
.LBB65_8:                               # %.epil.preheader
	movl	%ecx, %eax
	shll	$8, %eax
	shrl	$24, %ecx
	xorl	%edx, %ecx
	xorl	BZ2_crc32Table(,%rcx,4), %eax
	movl	%eax, 648(%rdi)
.LBB65_9:                               # %._crit_edge
	movb	$1, 128(%rdi,%r8)
	cmpl	$3, %r10d
	je	.LBB65_15
# %bb.10:                               # %._crit_edge
	cmpl	$2, %r10d
	je	.LBB65_13
# %bb.11:                               # %._crit_edge
	cmpl	$1, %r10d
	jne	.LBB65_16
# %bb.12:
	movq	64(%rdi), %rax
	movslq	108(%rdi), %rcx
	movb	%r8b, (%rax,%rcx)
	addl	$1, 108(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB65_15:
	.cfi_def_cfa %rbp, 16
	movq	64(%rdi), %rax
	movslq	108(%rdi), %rcx
	movb	%r8b, (%rax,%rcx)
	movslq	108(%rdi), %rax
	leaq	1(%rax), %rcx
	movl	%ecx, 108(%rdi)
	movq	64(%rdi), %rcx
	movb	%r8b, 1(%rcx,%rax)
	jmp	.LBB65_14
.LBB65_13:
	movq	64(%rdi), %rax
	movslq	108(%rdi), %rcx
	movb	%r8b, (%rax,%rcx)
.LBB65_14:
	movslq	108(%rdi), %rax
	leaq	1(%rax), %rcx
	movl	%ecx, 108(%rdi)
	movq	64(%rdi), %rcx
	movb	%r8b, 1(%rcx,%rax)
	addl	$1, 108(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB65_16:
	.cfi_def_cfa %rbp, 16
	movb	$1, 124(%r10,%rdi)
	movq	64(%rdi), %rax
	movslq	108(%rdi), %rcx
	movb	%r8b, (%rax,%rcx)
	movslq	108(%rdi), %rax
	leaq	1(%rax), %rcx
	movl	%ecx, 108(%rdi)
	movq	64(%rdi), %rcx
	movb	%r8b, 1(%rcx,%rax)
	movslq	108(%rdi), %rax
	leaq	1(%rax), %rcx
	movl	%ecx, 108(%rdi)
	movq	64(%rdi), %rcx
	movb	%r8b, 1(%rcx,%rax)
	movslq	108(%rdi), %rax
	leaq	1(%rax), %rcx
	movl	%ecx, 108(%rdi)
	movq	64(%rdi), %rcx
	movb	%r8b, 1(%rcx,%rax)
	movslq	108(%rdi), %rax
	leaq	1(%rax), %rcx
	movl	%ecx, 108(%rdi)
	movb	96(%rdi), %cl
	addb	$-4, %cl
	movq	64(%rdi), %rdx
	movb	%cl, 1(%rdx,%rax)
	addl	$1, 108(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end65:
	.size	add_pair_to_block, .Lfunc_end65-add_pair_to_block
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
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	$-2, %eax
	testq	%rdi, %rdi
	je	.LBB66_10
# %bb.1:
	movq	%rdi, %rbx
	movq	48(%rdi), %r14
	testq	%r14, %r14
	je	.LBB66_10
# %bb.2:
	cmpq	%rbx, (%r14)
	je	.LBB66_3
.LBB66_10:
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB66_3:
	.cfi_def_cfa %rbp, 16
	movq	24(%r14), %rsi
	testq	%rsi, %rsi
	je	.LBB66_5
# %bb.4:
	movq	72(%rbx), %rdi
	callq	*64(%rbx)
.LBB66_5:
	movq	32(%r14), %rsi
	testq	%rsi, %rsi
	je	.LBB66_7
# %bb.6:
	movq	72(%rbx), %rdi
	callq	*64(%rbx)
.LBB66_7:
	movq	40(%r14), %rsi
	testq	%rsi, %rsi
	je	.LBB66_9
# %bb.8:
	movq	72(%rbx), %rdi
	callq	*64(%rbx)
.LBB66_9:
	movq	48(%rbx), %rsi
	movq	72(%rbx), %rdi
	callq	*64(%rbx)
	movq	$0, 48(%rbx)
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end66:
	.size	BZ2_bzCompressEnd, .Lfunc_end66-BZ2_bzCompressEnd
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	$-2, %eax
	cmpl	$4, %esi
	ja	.LBB67_10
# %bb.1:
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.LBB67_10
# %bb.2:
	movl	%edx, %r14d
	cmpl	$1, %edx
	ja	.LBB67_10
# %bb.3:
	movl	%esi, %r15d
	movq	56(%rbx), %rax
	testq	%rax, %rax
	je	.LBB67_4
# %bb.5:
	cmpq	$0, 64(%rbx)
	je	.LBB67_6
.LBB67_7:
	movq	72(%rbx), %rdi
	movl	$64144, %esi                    # imm = 0xFA90
	movl	$1, %edx
	callq	*%rax
	testq	%rax, %rax
	je	.LBB67_8
# %bb.9:
	movq	%rbx, (%rax)
	movq	%rax, 48(%rbx)
	movl	$10, 8(%rax)
	movq	$0, 32(%rax)
	movl	$0, 3188(%rax)
	movq	$0, 12(%rbx)
	movq	$0, 36(%rbx)
	movb	%r14b, 44(%rax)
	movl	$0, 48(%rax)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 3152(%rax)
	movq	$0, 3168(%rax)
	movl	%r15d, 52(%rax)
	xorl	%eax, %eax
	jmp	.LBB67_10
.LBB67_4:
	movq	$default_bzalloc, 56(%rbx)
	movl	$default_bzalloc, %eax
	cmpq	$0, 64(%rbx)
	jne	.LBB67_7
.LBB67_6:
	movq	$default_bzfree, 64(%rbx)
	jmp	.LBB67_7
.LBB67_8:
	movl	$-3, %eax
.LBB67_10:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end67:
	.size	BZ2_bzDecompressInit, .Lfunc_end67-BZ2_bzDecompressInit
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
	xorl	%eax, %eax
	movl	$256, %r8d                      # imm = 0x100
	jmp	.LBB68_1
	.p2align	4, 0x90
.LBB68_3:                               #   in Loop: Header=BB68_1 Depth=1
	movl	%edx, %eax
	movl	%r8d, %ecx
	subl	%eax, %ecx
	cmpl	$1, %ecx
	je	.LBB68_5
.LBB68_1:                               # =>This Inner Loop Header: Depth=1
	leal	(%rax,%r8), %edx
	sarl	%edx
	movslq	%edx, %rcx
	cmpl	%edi, (%rsi,%rcx,4)
	jle	.LBB68_3
# %bb.2:                                #   in Loop: Header=BB68_1 Depth=1
	movl	%edx, %r8d
	movl	%r8d, %ecx
	subl	%eax, %ecx
	cmpl	$1, %ecx
	jne	.LBB68_1
.LBB68_5:
                                        # kill: def $eax killed $eax killed $rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end68:
	.size	BZ2_indexIntoF, .Lfunc_end68-BZ2_indexIntoF
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	$-2, %eax
	testq	%rdi, %rdi
	je	.LBB69_25
# %bb.1:
	movq	48(%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB69_25
# %bb.2:
	cmpq	%rdi, (%rbx)
	je	.LBB69_3
.LBB69_25:                              # %.loopexit
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB69_3:                               # %.preheader
	.cfi_def_cfa %rbp, 16
	movl	8(%rbx), %ecx
	.p2align	4, 0x90
.LBB69_4:                               # =>This Inner Loop Header: Depth=1
	cmpl	$2, %ecx
	je	.LBB69_7
# %bb.5:                                #   in Loop: Header=BB69_4 Depth=1
	cmpl	$1, %ecx
	je	.LBB69_6
# %bb.19:                               #   in Loop: Header=BB69_4 Depth=1
	cmpl	$10, %ecx
	jl	.LBB69_4
	jmp	.LBB69_20
	.p2align	4, 0x90
.LBB69_7:                               #   in Loop: Header=BB69_4 Depth=1
	cmpb	$0, 44(%rbx)
	je	.LBB69_9
# %bb.8:                                #   in Loop: Header=BB69_4 Depth=1
	movq	%rbx, %rdi
	callq	unRLE_obuf_to_output_SMALL
	movl	%eax, %ecx
	movl	$-4, %eax
	testb	%cl, %cl
	je	.LBB69_11
	jmp	.LBB69_25
.LBB69_9:                               #   in Loop: Header=BB69_4 Depth=1
	movq	%rbx, %rdi
	callq	unRLE_obuf_to_output_FAST
	movl	%eax, %ecx
	movl	$-4, %eax
	testb	%cl, %cl
	jne	.LBB69_25
.LBB69_11:                              #   in Loop: Header=BB69_4 Depth=1
	movl	64080(%rbx), %ecx
	addl	$1, %ecx
	xorl	%eax, %eax
	cmpl	%ecx, 1092(%rbx)
	jne	.LBB69_25
# %bb.12:                               #   in Loop: Header=BB69_4 Depth=1
	cmpl	$0, 16(%rbx)
	jne	.LBB69_25
# %bb.13:                               #   in Loop: Header=BB69_4 Depth=1
	movl	3184(%rbx), %ecx
	notl	%ecx
	movl	%ecx, 3184(%rbx)
	movl	52(%rbx), %eax
	cmpl	$3, %eax
	jge	.LBB69_14
# %bb.15:                               #   in Loop: Header=BB69_4 Depth=1
	cmpl	$2, %eax
	jge	.LBB69_16
.LBB69_17:                              #   in Loop: Header=BB69_4 Depth=1
	movl	3184(%rbx), %ecx
	movl	$-4, %eax
	cmpl	3176(%rbx), %ecx
	je	.LBB69_18
	jmp	.LBB69_25
.LBB69_14:                              #   in Loop: Header=BB69_4 Depth=1
	movq	stderr(%rip), %rdi
	movl	3176(%rbx), %edx
	movl	$.L.str.2.108, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	52(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB69_17
	.p2align	4, 0x90
.LBB69_16:                              #   in Loop: Header=BB69_4 Depth=1
	movq	stderr(%rip), %rsi
	movl	$93, %edi
	callq	fputc@PLT
	movl	3184(%rbx), %ecx
	movl	$-4, %eax
	cmpl	3176(%rbx), %ecx
	jne	.LBB69_25
.LBB69_18:                              # %.thread
                                        #   in Loop: Header=BB69_4 Depth=1
	movl	3188(%rbx), %eax
	roll	%eax
	xorl	%ecx, %eax
	movl	%eax, 3188(%rbx)
	movl	$14, 8(%rbx)
.LBB69_20:                              #   in Loop: Header=BB69_4 Depth=1
	movq	%rbx, %rdi
	callq	BZ2_decompress
	cmpl	$4, %eax
	je	.LBB69_21
# %bb.24:                               #   in Loop: Header=BB69_4 Depth=1
	movl	$2, %ecx
	cmpl	$2, 8(%rbx)
	je	.LBB69_4
	jmp	.LBB69_25
.LBB69_21:
	cmpl	$3, 52(%rbx)
	jge	.LBB69_22
.LBB69_23:
	movl	3188(%rbx), %eax
	xorl	%ecx, %ecx
	cmpl	3180(%rbx), %eax
	sete	%cl
	leal	-4(,%rcx,8), %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB69_6:
	.cfi_def_cfa %rbp, 16
	movl	$-1, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB69_22:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rdi
	movl	3180(%rbx), %edx
	movl	3188(%rbx), %ecx
	movl	$.L.str.4.110, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB69_23
.Lfunc_end69:
	.size	BZ2_bzDecompress, .Lfunc_end69-BZ2_bzDecompress
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %rbx
	cmpb	$0, 20(%rdi)
	je	.LBB70_30
# %bb.1:                                # %.preheader254
	movq	(%rbx), %r14
	cmpl	$0, 32(%r14)
	je	.LBB70_52
# %bb.2:                                # %.lr.ph259.lr.ph
	leaq	1096(%rbx), %rsi
	jmp	.LBB70_4
	.p2align	4, 0x90
.LBB70_3:                               #   in Loop: Header=BB70_4 Depth=1
	cmpl	$0, 32(%r14)
	je	.LBB70_52
.LBB70_4:                               # =>This Inner Loop Header: Depth=1
	cmpl	$0, 16(%rbx)
	je	.LBB70_7
# %bb.5:                                #   in Loop: Header=BB70_4 Depth=1
	movzbl	12(%rbx), %eax
	movq	24(%r14), %rcx
	movb	%al, (%rcx)
	movl	3184(%rbx), %eax
	movl	%eax, %ecx
	shll	$8, %ecx
	shrl	$24, %eax
	movzbl	12(%rbx), %edx
	xorl	%eax, %edx
	xorl	BZ2_crc32Table(,%rdx,4), %ecx
	movl	%ecx, 3184(%rbx)
	addl	$-1, 16(%rbx)
	movq	(%rbx), %rax
	addq	$1, 24(%rax)
	movq	(%rbx), %rax
	addl	$-1, 32(%rax)
	movq	(%rbx), %rax
	addl	$1, 36(%rax)
	movq	(%rbx), %r14
	cmpl	$0, 36(%r14)
	jne	.LBB70_3
# %bb.6:                                #   in Loop: Header=BB70_4 Depth=1
	addl	$1, 40(%r14)
	movq	(%rbx), %r14
	jmp	.LBB70_3
.LBB70_7:                               #   in Loop: Header=BB70_4 Depth=1
	movl	1092(%rbx), %ecx
	movl	64080(%rbx), %edx
	leal	1(%rdx), %eax
	cmpl	%eax, %ecx
	je	.LBB70_52
# %bb.8:                                #   in Loop: Header=BB70_4 Depth=1
	jg	.LBB70_55
# %bb.9:                                #   in Loop: Header=BB70_4 Depth=1
	movq	%rdx, -72(%rbp)                 # 8-byte Spill
	movq	%rcx, -64(%rbp)                 # 8-byte Spill
	movl	$1, 16(%rbx)
	movl	60(%rbx), %r15d
	movl	64(%rbx), %eax
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	movb	%al, 12(%rbx)
	movl	%r15d, %edi
	movq	%rsi, -56(%rbp)                 # 8-byte Spill
	callq	BZ2_indexIntoF
	movq	3168(%rbx), %rsi
	movq	%r15, %rcx
	shrq	%rcx
	movzbl	(%rsi,%rcx), %r13d
	leal	(,%r15,4), %ecx
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrq	%cl, %r13
	movq	3160(%rbx), %rdi
	movzwl	(%rdi,%r15,2), %r12d
	andl	$15, %r13d
	shlq	$16, %r13
	orq	%r12, %r13
	movl	%r13d, 60(%rbx)
	movl	24(%rbx), %r15d
	testl	%r15d, %r15d
	jne	.LBB70_11
# %bb.10:                               #   in Loop: Header=BB70_4 Depth=1
	movslq	28(%rbx), %rcx
	movl	BZ2_rNums(,%rcx,4), %r15d
	addl	$1, %ecx
	cmpl	$512, %ecx                      # imm = 0x200
	movl	$0, %edx
	cmovel	%edx, %ecx
	movl	%ecx, 28(%rbx)
.LBB70_11:                              #   in Loop: Header=BB70_4 Depth=1
	addl	$-1, %r15d
	movl	%r15d, 24(%rbx)
	movq	-64(%rbp), %rcx                 # 8-byte Reload
	leal	1(%rcx), %edx
	movl	%edx, 1092(%rbx)
	cmpl	-72(%rbp), %ecx                 # 4-byte Folded Reload
	je	.LBB70_27
# %bb.12:                               #   in Loop: Header=BB70_4 Depth=1
	xorl	%ecx, %ecx
	cmpl	$1, %r15d
	sete	%cl
	movzbl	%al, %eax
	xorl	%ecx, %eax
	cmpl	-48(%rbp), %eax                 # 4-byte Folded Reload
	jne	.LBB70_26
# %bb.13:                               #   in Loop: Header=BB70_4 Depth=1
	movl	%edx, -44(%rbp)                 # 4-byte Spill
	movl	$2, 16(%rbx)
	movq	%rdi, -80(%rbp)                 # 8-byte Spill
	movl	%r13d, %edi
	movq	%rsi, -88(%rbp)                 # 8-byte Spill
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	callq	BZ2_indexIntoF
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	movzwl	(%rcx,%r13,2), %esi
	movl	%r13d, %ecx
	shrq	%rcx
	movq	-88(%rbp), %rdx                 # 8-byte Reload
	movzbl	(%rdx,%rcx), %r13d
	shll	$2, %r12d
	andb	$4, %r12b
	movl	%r12d, %ecx
	shrq	%cl, %r13
	andl	$15, %r13d
	shlq	$16, %r13
	orq	%rsi, %r13
	movl	%r13d, 60(%rbx)
	testl	%r15d, %r15d
	jne	.LBB70_15
# %bb.14:                               #   in Loop: Header=BB70_4 Depth=1
	movslq	28(%rbx), %rcx
	movl	BZ2_rNums(,%rcx,4), %r15d
	addl	$1, %ecx
	cmpl	$512, %ecx                      # imm = 0x200
	movl	$0, %edx
	cmovel	%edx, %ecx
	movl	%ecx, 28(%rbx)
.LBB70_15:                              #   in Loop: Header=BB70_4 Depth=1
	addl	$-1, %r15d
	movl	%r15d, 24(%rbx)
	movq	-64(%rbp), %rcx                 # 8-byte Reload
	leal	2(%rcx), %edx
	movl	%edx, 1092(%rbx)
	movl	-44(%rbp), %ecx                 # 4-byte Reload
	cmpl	-72(%rbp), %ecx                 # 4-byte Folded Reload
	je	.LBB70_27
# %bb.16:                               #   in Loop: Header=BB70_4 Depth=1
	xorl	%ecx, %ecx
	cmpl	$1, %r15d
	sete	%cl
	movzbl	%al, %eax
	xorl	%ecx, %eax
	cmpl	-48(%rbp), %eax                 # 4-byte Folded Reload
	jne	.LBB70_26
# %bb.17:                               #   in Loop: Header=BB70_4 Depth=1
	movl	%edx, -44(%rbp)                 # 4-byte Spill
	movl	$3, 16(%rbx)
	movl	%r13d, %edi
	movq	%rsi, %r12
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	callq	BZ2_indexIntoF
	movq	-80(%rbp), %rdi                 # 8-byte Reload
	movq	-88(%rbp), %rsi                 # 8-byte Reload
	movzwl	(%rdi,%r13,2), %r8d
	movl	%r13d, %ecx
	shrq	%rcx
	movzbl	(%rsi,%rcx), %r13d
	shll	$2, %r12d
	andb	$4, %r12b
	movl	%r12d, %ecx
	shrq	%cl, %r13
	andl	$15, %r13d
	shlq	$16, %r13
	orq	%r8, %r13
	movl	%r13d, 60(%rbx)
	testl	%r15d, %r15d
	jne	.LBB70_19
# %bb.18:                               #   in Loop: Header=BB70_4 Depth=1
	movslq	28(%rbx), %rcx
	movl	BZ2_rNums(,%rcx,4), %r15d
	addl	$1, %ecx
	cmpl	$512, %ecx                      # imm = 0x200
	movl	$0, %edx
	cmovel	%edx, %ecx
	movl	%ecx, 28(%rbx)
.LBB70_19:                              #   in Loop: Header=BB70_4 Depth=1
	addl	$-1, %r15d
	movl	%r15d, 24(%rbx)
	movq	-64(%rbp), %rcx                 # 8-byte Reload
	addl	$3, %ecx
	movl	%ecx, 1092(%rbx)
	movl	-44(%rbp), %ecx                 # 4-byte Reload
	cmpl	-72(%rbp), %ecx                 # 4-byte Folded Reload
	je	.LBB70_27
# %bb.20:                               #   in Loop: Header=BB70_4 Depth=1
	xorl	%ecx, %ecx
	cmpl	$1, %r15d
	sete	%cl
	movzbl	%al, %eax
	xorl	%ecx, %eax
	cmpl	-48(%rbp), %eax                 # 4-byte Folded Reload
	jne	.LBB70_26
# %bb.21:                               #   in Loop: Header=BB70_4 Depth=1
	movl	%r13d, %edi
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	movq	%r8, %r12
	callq	BZ2_indexIntoF
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	movzwl	(%rcx,%r13,2), %edx
	movl	%r13d, %ecx
	shrq	%rcx
	movq	-88(%rbp), %rsi                 # 8-byte Reload
	movzbl	(%rsi,%rcx), %r13d
	shll	$2, %r12d
	andb	$4, %r12b
	movl	%r12d, %ecx
	shrq	%cl, %r13
	andl	$15, %r13d
	shlq	$16, %r13
	movq	%rdx, -72(%rbp)                 # 8-byte Spill
	orq	%rdx, %r13
	movl	%r13d, 60(%rbx)
	testl	%r15d, %r15d
	jne	.LBB70_23
# %bb.22:                               #   in Loop: Header=BB70_4 Depth=1
	movslq	28(%rbx), %rcx
	movl	BZ2_rNums(,%rcx,4), %r15d
	addl	$1, %ecx
	cmpl	$512, %ecx                      # imm = 0x200
	movl	$0, %edx
	cmovel	%edx, %ecx
	movl	%ecx, 28(%rbx)
.LBB70_23:                              #   in Loop: Header=BB70_4 Depth=1
	leal	-1(%r15), %ecx
	movl	%ecx, 24(%rbx)
	xorl	%edx, %edx
	cmpl	$1, %ecx
	sete	%dl
	movq	-64(%rbp), %r12                 # 8-byte Reload
	leal	4(%r12), %ecx
	movl	%ecx, 1092(%rbx)
	movzbl	%al, %eax
	xorl	%edx, %eax
	addl	$4, %eax
	movl	%eax, 16(%rbx)
	movl	%r13d, %edi
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	callq	BZ2_indexIntoF
	movl	%eax, 64(%rbx)
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	movzwl	(%rcx,%r13,2), %edx
	movl	%r13d, %ecx
	shrq	%rcx
	movq	-88(%rbp), %rsi                 # 8-byte Reload
	movzbl	(%rsi,%rcx), %esi
	movq	-72(%rbp), %rcx                 # 8-byte Reload
	shll	$2, %ecx
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $rcx
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%rbx)
	addl	$-1, %r15d
	jne	.LBB70_25
# %bb.24:                               #   in Loop: Header=BB70_4 Depth=1
	movslq	28(%rbx), %rcx
	movl	BZ2_rNums(,%rcx,4), %r15d
	addl	$1, %ecx
	cmpl	$512, %ecx                      # imm = 0x200
	movl	$0, %edx
	cmovel	%edx, %ecx
	movl	%ecx, 28(%rbx)
.LBB70_25:                              #   in Loop: Header=BB70_4 Depth=1
	addl	$-1, %r15d
	movl	%r15d, 24(%rbx)
	xorl	%ecx, %ecx
	cmpl	$1, %r15d
	sete	%cl
	xorl	%eax, %ecx
	movl	%ecx, 64(%rbx)
	addl	$5, %r12d
	movl	%r12d, 1092(%rbx)
	jmp	.LBB70_27
.LBB70_26:                              #   in Loop: Header=BB70_4 Depth=1
	movl	%eax, 64(%rbx)
.LBB70_27:                              # %.backedge
                                        #   in Loop: Header=BB70_4 Depth=1
	xorl	%eax, %eax
	cmpl	$0, 32(%r14)
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	jne	.LBB70_4
	jmp	.LBB70_53
.LBB70_30:                              # %.preheader
	movq	(%rbx), %r14
	cmpl	$0, 32(%r14)
	je	.LBB70_52
# %bb.31:                               # %.lr.ph.lr.ph
	leaq	1096(%rbx), %rax
	movq	%rax, -56(%rbp)                 # 8-byte Spill
	jmp	.LBB70_33
	.p2align	4, 0x90
.LBB70_32:                              #   in Loop: Header=BB70_33 Depth=1
	cmpl	$0, 32(%r14)
	je	.LBB70_52
.LBB70_33:                              # =>This Inner Loop Header: Depth=1
	cmpl	$0, 16(%rbx)
	je	.LBB70_36
# %bb.34:                               #   in Loop: Header=BB70_33 Depth=1
	movzbl	12(%rbx), %eax
	movq	24(%r14), %rcx
	movb	%al, (%rcx)
	movl	3184(%rbx), %eax
	movl	%eax, %ecx
	shll	$8, %ecx
	shrl	$24, %eax
	movzbl	12(%rbx), %edx
	xorl	%eax, %edx
	xorl	BZ2_crc32Table(,%rdx,4), %ecx
	movl	%ecx, 3184(%rbx)
	addl	$-1, 16(%rbx)
	movq	(%rbx), %rax
	addq	$1, 24(%rax)
	movq	(%rbx), %rax
	addl	$-1, 32(%rax)
	movq	(%rbx), %rax
	addl	$1, 36(%rax)
	movq	(%rbx), %r14
	cmpl	$0, 36(%r14)
	jne	.LBB70_32
# %bb.35:                               #   in Loop: Header=BB70_33 Depth=1
	addl	$1, 40(%r14)
	movq	(%rbx), %r14
	jmp	.LBB70_32
.LBB70_36:                              #   in Loop: Header=BB70_33 Depth=1
	movl	1092(%rbx), %ecx
	movl	64080(%rbx), %edx
	leal	1(%rdx), %eax
	cmpl	%eax, %ecx
	je	.LBB70_52
# %bb.37:                               #   in Loop: Header=BB70_33 Depth=1
	jg	.LBB70_55
# %bb.38:                               #   in Loop: Header=BB70_33 Depth=1
	movl	$1, 16(%rbx)
	movl	60(%rbx), %r15d
	movl	64(%rbx), %eax
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	movb	%al, 12(%rbx)
	movl	%r15d, %edi
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	movq	%rcx, -64(%rbp)                 # 8-byte Spill
	movq	%rdx, -72(%rbp)                 # 8-byte Spill
	callq	BZ2_indexIntoF
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	movq	3160(%rbx), %rdi
	movq	3168(%rbx), %rsi
	movq	%r15, %rcx
	shrq	%rcx
	movzbl	(%rsi,%rcx), %r12d
	leal	(,%r15,4), %ecx
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrq	%cl, %r12
	movzwl	(%rdi,%r15,2), %r13d
	andl	$15, %r12d
	shlq	$16, %r12
	orq	%r13, %r12
	movl	%r12d, 60(%rbx)
	leal	1(%rdx), %ecx
	movl	%ecx, 1092(%rbx)
	cmpl	-72(%rbp), %edx                 # 4-byte Folded Reload
	je	.LBB70_47
# %bb.39:                               #   in Loop: Header=BB70_33 Depth=1
	movzbl	%al, %eax
	movl	-48(%rbp), %edx                 # 4-byte Reload
	cmpl	%edx, %eax
	jne	.LBB70_45
# %bb.40:                               #   in Loop: Header=BB70_33 Depth=1
	movl	$2, 16(%rbx)
	movq	%rdi, -80(%rbp)                 # 8-byte Spill
	movl	%r12d, %edi
	movq	%rsi, -88(%rbp)                 # 8-byte Spill
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	movl	%ecx, -44(%rbp)                 # 4-byte Spill
	callq	BZ2_indexIntoF
	movl	%r12d, %ecx
	shrq	%rcx
	movq	-88(%rbp), %rdx                 # 8-byte Reload
	movzbl	(%rdx,%rcx), %r15d
	movq	-72(%rbp), %rdx                 # 8-byte Reload
	shll	$2, %r13d
	andb	$4, %r13b
	movl	%r13d, %ecx
	shrq	%cl, %r15
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	movzwl	(%rcx,%r12,2), %r13d
	andl	$15, %r15d
	shlq	$16, %r15
	orq	%r13, %r15
	movl	%r15d, 60(%rbx)
	movq	-64(%rbp), %rcx                 # 8-byte Reload
	leal	2(%rcx), %esi
	movl	%esi, 1092(%rbx)
	cmpl	%edx, -44(%rbp)                 # 4-byte Folded Reload
	je	.LBB70_47
# %bb.41:                               #   in Loop: Header=BB70_33 Depth=1
	movzbl	%al, %eax
	movl	-48(%rbp), %ecx                 # 4-byte Reload
	cmpl	%ecx, %eax
	jne	.LBB70_46
# %bb.42:                               #   in Loop: Header=BB70_33 Depth=1
	movl	$3, 16(%rbx)
	movl	%r15d, %edi
	movl	%esi, -44(%rbp)                 # 4-byte Spill
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	callq	BZ2_indexIntoF
	movq	-80(%rbp), %rdi                 # 8-byte Reload
	movq	-88(%rbp), %rdx                 # 8-byte Reload
	movq	-64(%rbp), %r8                  # 8-byte Reload
	movl	%r15d, %ecx
	shrq	%rcx
	movzbl	(%rdx,%rcx), %r12d
	shll	$2, %r13d
	andb	$4, %r13b
	movl	%r13d, %ecx
	shrq	%cl, %r12
	movzwl	(%rdi,%r15,2), %r15d
	andl	$15, %r12d
	shlq	$16, %r12
	orq	%r15, %r12
	movl	%r12d, 60(%rbx)
	leal	3(%r8), %ecx
	movl	%ecx, 1092(%rbx)
	movq	-72(%rbp), %rcx                 # 8-byte Reload
	cmpl	%ecx, -44(%rbp)                 # 4-byte Folded Reload
	je	.LBB70_47
# %bb.43:                               #   in Loop: Header=BB70_33 Depth=1
	movzbl	%al, %eax
	cmpl	-48(%rbp), %eax                 # 4-byte Folded Reload
	jne	.LBB70_48
# %bb.44:                               #   in Loop: Header=BB70_33 Depth=1
	movl	%r12d, %edi
	movq	%rdx, %r13
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	callq	BZ2_indexIntoF
	movl	%r12d, %ecx
	shrq	%rcx
	movzbl	(%r13,%rcx), %edx
	shll	$2, %r15d
	andb	$4, %r15b
	movl	%r15d, %ecx
	shrq	%cl, %rdx
	movq	-80(%rbp), %r13                 # 8-byte Reload
	movzwl	(%r13,%r12,2), %r15d
	andl	$15, %edx
	shlq	$16, %rdx
	movzwl	%r15w, %r12d
	orq	%rdx, %r12
	movl	%r12d, 60(%rbx)
	movq	-64(%rbp), %rcx                 # 8-byte Reload
	addl	$4, %ecx
	movl	%ecx, 1092(%rbx)
	movzbl	%al, %eax
	addl	$4, %eax
	movl	%eax, 16(%rbx)
	movl	%r12d, %edi
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	callq	BZ2_indexIntoF
	movl	%eax, 64(%rbx)
	movzwl	(%r13,%r12,2), %eax
	shrq	%r12
	movq	-88(%rbp), %rcx                 # 8-byte Reload
	movzbl	(%rcx,%r12), %edx
	shll	$2, %r15d
	andb	$4, %r15b
	movl	%r15d, %ecx
	shrl	%cl, %edx
	andl	$15, %edx
	shll	$16, %edx
	orl	%eax, %edx
	movl	%edx, 60(%rbx)
	movq	-64(%rbp), %rax                 # 8-byte Reload
	addl	$5, %eax
	movl	%eax, 1092(%rbx)
	xorl	%eax, %eax
	cmpl	$0, 32(%r14)
	jne	.LBB70_33
	jmp	.LBB70_53
.LBB70_45:                              #   in Loop: Header=BB70_33 Depth=1
	movl	%eax, 64(%rbx)
	xorl	%eax, %eax
	cmpl	$0, 32(%r14)
	jne	.LBB70_33
	jmp	.LBB70_53
.LBB70_46:                              #   in Loop: Header=BB70_33 Depth=1
	movl	%eax, 64(%rbx)
.LBB70_47:                              # %.backedge228
                                        #   in Loop: Header=BB70_33 Depth=1
	xorl	%eax, %eax
	cmpl	$0, 32(%r14)
	jne	.LBB70_33
	jmp	.LBB70_53
.LBB70_48:                              #   in Loop: Header=BB70_33 Depth=1
	movl	%eax, 64(%rbx)
	xorl	%eax, %eax
	cmpl	$0, 32(%r14)
	jne	.LBB70_33
	jmp	.LBB70_53
.LBB70_52:
	xorl	%eax, %eax
.LBB70_53:                              # %.loopexit
                                        # kill: def $al killed $al killed $eax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB70_55:
	.cfi_def_cfa %rbp, 16
	movb	$1, %al
	jmp	.LBB70_53
.Lfunc_end70:
	.size	unRLE_obuf_to_output_SMALL, .Lfunc_end70-unRLE_obuf_to_output_SMALL
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	cmpb	$0, 20(%rdi)
	je	.LBB71_29
# %bb.1:                                # %.preheader299
	movq	(%rdi), %rdx
	xorl	%r8d, %r8d
	cmpl	$0, 32(%rdx)
	jne	.LBB71_5
	jmp	.LBB71_55
	.p2align	4, 0x90
.LBB71_2:                               #   in Loop: Header=BB71_5 Depth=1
	movzbl	12(%rdi), %eax
	movq	24(%rdx), %rcx
	movb	%al, (%rcx)
	movl	3184(%rdi), %eax
	movl	%eax, %ecx
	shll	$8, %ecx
	shrl	$24, %eax
	movzbl	12(%rdi), %edx
	xorl	%eax, %edx
	xorl	BZ2_crc32Table(,%rdx,4), %ecx
	movl	%ecx, 3184(%rdi)
	addl	$-1, 16(%rdi)
	movq	(%rdi), %rax
	addq	$1, 24(%rax)
	movq	(%rdi), %rax
	addl	$-1, 32(%rax)
	movq	(%rdi), %rax
	addl	$1, 36(%rax)
	movq	(%rdi), %rdx
	cmpl	$0, 36(%rdx)
	je	.LBB71_4
# %bb.3:                                # %.preheader299
                                        #   in Loop: Header=BB71_5 Depth=1
	cmpl	$0, 32(%rdx)
	jne	.LBB71_5
	jmp	.LBB71_55
	.p2align	4, 0x90
.LBB71_4:                               #   in Loop: Header=BB71_5 Depth=1
	addl	$1, 40(%rdx)
	movq	(%rdi), %rdx
	cmpl	$0, 32(%rdx)
	je	.LBB71_55
.LBB71_5:                               # =>This Inner Loop Header: Depth=1
	cmpl	$0, 16(%rdi)
	jne	.LBB71_2
# %bb.6:                                #   in Loop: Header=BB71_5 Depth=1
	movl	1092(%rdi), %r14d
	movl	64080(%rdi), %ebx
	leal	1(%rbx), %eax
	cmpl	%eax, %r14d
	je	.LBB71_55
# %bb.7:                                #   in Loop: Header=BB71_5 Depth=1
	jg	.LBB71_61
# %bb.8:                                #   in Loop: Header=BB71_5 Depth=1
	movl	$1, 16(%rdi)
	movl	64(%rdi), %r10d
	movb	%r10b, 12(%rdi)
	movq	3152(%rdi), %r9
	movl	24(%rdi), %r12d
	movl	60(%rdi), %eax
	movl	(%r9,%rax,4), %ecx
	movq	%rcx, %rax
	shrq	$8, %rax
	movl	%eax, 60(%rdi)
	testl	%r12d, %r12d
	jne	.LBB71_10
# %bb.9:                                #   in Loop: Header=BB71_5 Depth=1
	movslq	28(%rdi), %rsi
	movl	BZ2_rNums(,%rsi,4), %r12d
	addl	$1, %esi
	cmpl	$512, %esi                      # imm = 0x200
	cmovel	%r8d, %esi
	movl	%esi, 28(%rdi)
.LBB71_10:                              #   in Loop: Header=BB71_5 Depth=1
	addl	$-1, %r12d
	movl	%r12d, 24(%rdi)
	leal	1(%r14), %r15d
	movl	%r15d, 1092(%rdi)
	cmpl	%ebx, %r14d
	je	.LBB71_26
# %bb.11:                               #   in Loop: Header=BB71_5 Depth=1
	xorl	%esi, %esi
	cmpl	$1, %r12d
	sete	%sil
	movzbl	%cl, %ecx
	xorl	%esi, %ecx
	cmpl	%r10d, %ecx
	jne	.LBB71_25
# %bb.12:                               #   in Loop: Header=BB71_5 Depth=1
	movl	$2, 16(%rdi)
	movl	(%r9,%rax,4), %ecx
	movq	%rcx, %rax
	shrq	$8, %rax
	movl	%eax, 60(%rdi)
	testl	%r12d, %r12d
	jne	.LBB71_14
# %bb.13:                               #   in Loop: Header=BB71_5 Depth=1
	movslq	28(%rdi), %rsi
	movl	BZ2_rNums(,%rsi,4), %r12d
	addl	$1, %esi
	cmpl	$512, %esi                      # imm = 0x200
	cmovel	%r8d, %esi
	movl	%esi, 28(%rdi)
.LBB71_14:                              #   in Loop: Header=BB71_5 Depth=1
	addl	$-1, %r12d
	movl	%r12d, 24(%rdi)
	leal	2(%r14), %r11d
	movl	%r11d, 1092(%rdi)
	cmpl	%ebx, %r15d
	je	.LBB71_26
# %bb.15:                               #   in Loop: Header=BB71_5 Depth=1
	xorl	%esi, %esi
	cmpl	$1, %r12d
	sete	%sil
	movzbl	%cl, %ecx
	xorl	%esi, %ecx
	cmpl	%r10d, %ecx
	jne	.LBB71_25
# %bb.16:                               #   in Loop: Header=BB71_5 Depth=1
	movl	$3, 16(%rdi)
	movl	(%r9,%rax,4), %ecx
	movq	%rcx, %rax
	shrq	$8, %rax
	movl	%eax, 60(%rdi)
	testl	%r12d, %r12d
	jne	.LBB71_18
# %bb.17:                               #   in Loop: Header=BB71_5 Depth=1
	movslq	28(%rdi), %rsi
	movl	BZ2_rNums(,%rsi,4), %r12d
	addl	$1, %esi
	cmpl	$512, %esi                      # imm = 0x200
	cmovel	%r8d, %esi
	movl	%esi, 28(%rdi)
.LBB71_18:                              #   in Loop: Header=BB71_5 Depth=1
	addl	$-1, %r12d
	movl	%r12d, 24(%rdi)
	leal	3(%r14), %esi
	movl	%esi, 1092(%rdi)
	cmpl	%ebx, %r11d
	je	.LBB71_26
# %bb.19:                               #   in Loop: Header=BB71_5 Depth=1
	xorl	%esi, %esi
	cmpl	$1, %r12d
	sete	%sil
	movzbl	%cl, %ecx
	xorl	%esi, %ecx
	cmpl	%r10d, %ecx
	jne	.LBB71_25
# %bb.20:                               #   in Loop: Header=BB71_5 Depth=1
	movl	(%r9,%rax,4), %ecx
	movq	%rcx, %rax
	shrq	$8, %rax
	movl	%eax, 60(%rdi)
	testl	%r12d, %r12d
	jne	.LBB71_22
# %bb.21:                               #   in Loop: Header=BB71_5 Depth=1
	movslq	28(%rdi), %rsi
	movl	BZ2_rNums(,%rsi,4), %r12d
	addl	$1, %esi
	cmpl	$512, %esi                      # imm = 0x200
	cmovel	%r8d, %esi
	movl	%esi, 28(%rdi)
.LBB71_22:                              #   in Loop: Header=BB71_5 Depth=1
	leal	-1(%r12), %esi
	movl	%esi, 24(%rdi)
	xorl	%ebx, %ebx
	cmpl	$1, %esi
	sete	%bl
	leal	4(%r14), %esi
	movl	%esi, 1092(%rdi)
	movzbl	%cl, %ecx
	xorl	%ebx, %ecx
	addl	$4, %ecx
	movl	%ecx, 16(%rdi)
	movl	(%r9,%rax,4), %ecx
	movzbl	%cl, %eax
	shrl	$8, %ecx
	movl	%eax, 64(%rdi)
	movl	%ecx, 60(%rdi)
	addl	$-1, %r12d
	jne	.LBB71_24
# %bb.23:                               #   in Loop: Header=BB71_5 Depth=1
	movslq	28(%rdi), %rcx
	movl	BZ2_rNums(,%rcx,4), %r12d
	addl	$1, %ecx
	cmpl	$512, %ecx                      # imm = 0x200
	cmovel	%r8d, %ecx
	movl	%ecx, 28(%rdi)
.LBB71_24:                              #   in Loop: Header=BB71_5 Depth=1
	addl	$-1, %r12d
	movl	%r12d, 24(%rdi)
	xorl	%ecx, %ecx
	cmpl	$1, %r12d
	sete	%cl
	xorl	%eax, %ecx
	movl	%ecx, 64(%rdi)
	addl	$5, %r14d
	movl	%r14d, 1092(%rdi)
	jmp	.LBB71_26
.LBB71_25:                              #   in Loop: Header=BB71_5 Depth=1
	movl	%ecx, 64(%rdi)
.LBB71_26:                              # %.backedge
                                        #   in Loop: Header=BB71_5 Depth=1
	xorl	%eax, %eax
	cmpl	$0, 32(%rdx)
	jne	.LBB71_5
	jmp	.LBB71_56
.LBB71_29:
	movl	3184(%rdi), %r10d
	movb	12(%rdi), %r13b
	movl	16(%rdi), %edx
	movl	1092(%rdi), %r15d
	movl	64(%rdi), %r8d
	movq	3152(%rdi), %rax
	movq	%rax, -56(%rbp)                 # 8-byte Spill
	movl	60(%rdi), %r9d
	movq	(%rdi), %rax
	movq	24(%rax), %r12
	movl	32(%rax), %r14d
	movl	64080(%rdi), %eax
	movq	%rax, -72(%rbp)                 # 8-byte Spill
	leal	1(%rax), %ebx
	movl	%r14d, -48(%rbp)                # 4-byte Spill
	movl	%ebx, -60(%rbp)                 # 4-byte Spill
.LBB71_30:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB71_33 Depth 2
	testl	%edx, %edx
	jle	.LBB71_35
# %bb.31:                               # %.preheader
                                        #   in Loop: Header=BB71_30 Depth=1
	testl	%r14d, %r14d
	movl	%edx, -44(%rbp)                 # 4-byte Spill
	je	.LBB71_60
# %bb.32:                               # %.lr.ph
                                        #   in Loop: Header=BB71_30 Depth=1
	movzbl	%r13b, %ebx
	movl	%r14d, %r11d
	movl	%edx, %ecx
	addq	$-1, %rcx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB71_33:                              #   Parent Loop BB71_30 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	%eax, %ecx
	je	.LBB71_36
# %bb.34:                               #   in Loop: Header=BB71_33 Depth=2
	movb	%bl, (%r12,%rax)
	movl	%r10d, %edx
	shll	$8, %edx
	shrl	$24, %r10d
	movl	%r10d, %esi
	xorl	%ebx, %esi
	movl	%edx, %r10d
	xorl	BZ2_crc32Table(,%rsi,4), %r10d
	addq	$1, %rax
	cmpl	%eax, %r11d
	jne	.LBB71_33
	jmp	.LBB71_50
	.p2align	4, 0x90
.LBB71_35:                              #   in Loop: Header=BB71_30 Depth=1
	movl	%r15d, %r11d
	movl	%r8d, %eax
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	jmp	.LBB71_39
	.p2align	4, 0x90
.LBB71_36:                              # %.loopexit296.loopexit
                                        #   in Loop: Header=BB71_30 Depth=1
	subl	%eax, %r14d
	addq	%rax, %r12
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	movl	-60(%rbp), %ebx                 # 4-byte Reload
	testl	%r14d, %r14d
	je	.LBB71_57
	.p2align	4, 0x90
.LBB71_38:                              #   in Loop: Header=BB71_30 Depth=1
	movb	%r13b, (%r12)
	movl	%r10d, %ecx
	shll	$8, %ecx
	shrl	$24, %r10d
	movzbl	%r13b, %eax
	xorl	%r10d, %eax
	xorl	BZ2_crc32Table(,%rax,4), %ecx
	addq	$1, %r12
	addl	$-1, %r14d
	movl	%r15d, %r11d
	movl	%r8d, %eax
	movl	%ecx, %r10d
.LBB71_39:                              #   in Loop: Header=BB71_30 Depth=1
	cmpl	%ebx, %r11d
	jg	.LBB71_61
# %bb.40:                               #   in Loop: Header=BB71_30 Depth=1
	cmpl	%ebx, %r11d
	je	.LBB71_59
# %bb.41:                               #   in Loop: Header=BB71_30 Depth=1
	movl	%r9d, %ecx
	movl	(%rdx,%rcx,4), %r9d
	movzbl	%r9b, %r8d
	shrq	$8, %r9
	leal	1(%r11), %r15d
	cmpl	%eax, %r8d
	jne	.LBB71_44
# %bb.42:                               #   in Loop: Header=BB71_30 Depth=1
	cmpl	-72(%rbp), %r11d                # 4-byte Folded Reload
	jne	.LBB71_45
# %bb.43:                               #   in Loop: Header=BB71_30 Depth=1
	movl	%eax, %r8d
.LBB71_44:                              #   in Loop: Header=BB71_30 Depth=1
	movl	%eax, %r13d
	testl	%r14d, %r14d
	jne	.LBB71_38
	jmp	.LBB71_57
	.p2align	4, 0x90
.LBB71_45:                              #   in Loop: Header=BB71_30 Depth=1
	movl	(%rdx,%r9,4), %ecx
	movq	%rcx, %r9
	shrq	$8, %r9
	leal	2(%r11), %esi
	movl	$2, %edx
	movl	%ebx, %r15d
	movl	%eax, %r8d
	movl	%eax, %r13d
	cmpl	%ebx, %esi
	je	.LBB71_30
# %bb.46:                               #   in Loop: Header=BB71_30 Depth=1
	movzbl	%cl, %r8d
	movl	%esi, %r15d
	movl	%eax, %r13d
	cmpl	%eax, %r8d
	jne	.LBB71_30
# %bb.47:                               #   in Loop: Header=BB71_30 Depth=1
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	movl	(%rcx,%r9,4), %ecx
	movq	%rcx, %r9
	shrq	$8, %r9
	leal	3(%r11), %esi
	movl	$3, %edx
	movl	%ebx, %r15d
	movl	%eax, %r8d
	movl	%eax, %r13d
	cmpl	%ebx, %esi
	je	.LBB71_30
# %bb.48:                               #   in Loop: Header=BB71_30 Depth=1
	movzbl	%cl, %r8d
	movl	%esi, %r15d
	movl	%eax, %r13d
	cmpl	%eax, %r8d
	jne	.LBB71_30
# %bb.49:                               #   in Loop: Header=BB71_30 Depth=1
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	movl	(%rsi,%r9,4), %ecx
	movzbl	%cl, %edx
	shrq	$6, %rcx
	andl	$67108860, %ecx                 # imm = 0x3FFFFFC
	addl	$4, %edx
	movl	(%rsi,%rcx), %r9d
	movzbl	%r9b, %r8d
	shrl	$8, %r9d
	addl	$5, %r11d
	movl	%r11d, %r15d
	movl	%eax, %r13d
	jmp	.LBB71_30
.LBB71_50:                              # %.loopexit252.loopexit
	addq	%rax, %r12
	subl	%eax, -44(%rbp)                 # 4-byte Folded Spill
	xorl	%r14d, %r14d
	movq	-56(%rbp), %rdx                 # 8-byte Reload
.LBB71_51:                              # %.loopexit252
	movl	-48(%rbp), %esi                 # 4-byte Reload
.LBB71_52:                              # %.loopexit252
	movq	(%rdi), %rax
	movl	36(%rax), %ecx
	subl	%r14d, %esi
	addl	%ecx, %esi
	movl	%esi, 36(%rax)
	movq	(%rdi), %rax
	cmpl	%ecx, 36(%rax)
	jae	.LBB71_54
# %bb.53:
	addl	$1, 40(%rax)
	movq	(%rdi), %rax
.LBB71_54:
	movl	-44(%rbp), %ecx                 # 4-byte Reload
	movl	%r10d, 3184(%rdi)
	movb	%r13b, 12(%rdi)
	movl	%ecx, 16(%rdi)
	movl	%r15d, 1092(%rdi)
	movl	%r8d, 64(%rdi)
	movq	%rdx, 3152(%rdi)
	movl	%r9d, 60(%rdi)
	movq	%r12, 24(%rax)
	movq	(%rdi), %rax
	movl	%r14d, 32(%rax)
.LBB71_55:                              # %.loopexit
	xorl	%eax, %eax
.LBB71_56:                              # %.loopexit
                                        # kill: def $al killed $al killed $eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB71_61:
	.cfi_def_cfa %rbp, 16
	movb	$1, %al
	jmp	.LBB71_56
.LBB71_57:
	xorl	%r14d, %r14d
	movl	$1, -44(%rbp)                   # 4-byte Folded Spill
	jmp	.LBB71_51
.LBB71_59:
	movl	$0, -44(%rbp)                   # 4-byte Folded Spill
	movl	%ebx, %r15d
	movl	%eax, %r8d
	jmp	.LBB71_51
.LBB71_60:
	xorl	%r14d, %r14d
	movl	-48(%rbp), %esi                 # 4-byte Reload
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	jmp	.LBB71_52
.Lfunc_end71:
	.size	unRLE_obuf_to_output_FAST, .Lfunc_end71-unRLE_obuf_to_output_FAST
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
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	$-2, %eax
	testq	%rdi, %rdi
	je	.LBB72_10
# %bb.1:
	movq	%rdi, %rbx
	movq	48(%rdi), %r14
	testq	%r14, %r14
	je	.LBB72_10
# %bb.2:
	cmpq	%rbx, (%r14)
	je	.LBB72_3
.LBB72_10:
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB72_3:
	.cfi_def_cfa %rbp, 16
	movq	3152(%r14), %rsi
	testq	%rsi, %rsi
	je	.LBB72_5
# %bb.4:
	movq	72(%rbx), %rdi
	callq	*64(%rbx)
.LBB72_5:
	movq	3160(%r14), %rsi
	testq	%rsi, %rsi
	je	.LBB72_7
# %bb.6:
	movq	72(%rbx), %rdi
	callq	*64(%rbx)
.LBB72_7:
	movq	3168(%r14), %rsi
	testq	%rsi, %rsi
	je	.LBB72_9
# %bb.8:
	movq	72(%rbx), %rdi
	callq	*64(%rbx)
.LBB72_9:
	movq	48(%rbx), %rsi
	movq	72(%rbx), %rdi
	callq	*64(%rbx)
	movq	$0, 48(%rbx)
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end72:
	.size	BZ2_bzDecompressEnd, .Lfunc_end72-BZ2_bzDecompressEnd
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r8d, %r13d
	movl	%ecx, %r15d
	movl	%edx, %r14d
	movq	%rsi, %r12
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.LBB73_2
# %bb.1:
	movl	$0, (%rbx)
.LBB73_2:
	cmpl	$4, %r15d
	ja	.LBB73_9
# %bb.3:
	cmpl	$250, %r13d
	ja	.LBB73_9
# %bb.4:
	testq	%r12, %r12
	je	.LBB73_9
# %bb.5:
	leal	-1(%r14), %eax
	cmpl	$9, %eax
	jae	.LBB73_9
# %bb.6:
	movq	%r12, %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB73_11
# %bb.7:
	testq	%rbx, %rbx
	je	.LBB73_23
# %bb.8:
	movl	$-6, (%rbx)
	jmp	.LBB73_23
.LBB73_9:
	testq	%rbx, %rbx
	je	.LBB73_23
# %bb.10:
	movl	$-2, (%rbx)
.LBB73_23:
	xorl	%r14d, %r14d
.LBB73_24:
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB73_11:
	.cfi_def_cfa %rbp, 16
	movq	%r14, -48(%rbp)                 # 8-byte Spill
	movl	$5104, %edi                     # imm = 0x13F0
	callq	malloc
	testq	%rax, %rax
	je	.LBB73_20
# %bb.12:
	movq	%rax, %r14
	testq	%rbx, %rbx
	je	.LBB73_14
# %bb.13:
	movl	$0, (%rbx)
.LBB73_14:
	movl	$0, 5096(%r14)
	movb	$0, 5100(%r14)
	movl	$0, 5008(%r14)
	movq	%r12, (%r14)
	movq	%r14, %rdi
	addq	$5016, %rdi                     # imm = 0x1398
	testl	%r13d, %r13d
	movl	$30, %ecx
	cmovnel	%r13d, %ecx
	movb	$1, 5012(%r14)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 5072(%r14)
	movq	$0, 5088(%r14)
	movq	-48(%rbp), %rsi                 # 8-byte Reload
                                        # kill: def $esi killed $esi killed $rsi
	movl	%r15d, %edx
	callq	BZ2_bzCompressInit
	testl	%eax, %eax
	je	.LBB73_22
# %bb.15:
	testq	%rbx, %rbx
	je	.LBB73_17
# %bb.16:
	movl	%eax, (%rbx)
.LBB73_17:
	movq	%r14, %rdi
	callq	free
	jmp	.LBB73_23
.LBB73_20:
	testq	%rbx, %rbx
	je	.LBB73_23
# %bb.21:
	movl	$-3, (%rbx)
	jmp	.LBB73_23
.LBB73_22:
	movl	$0, 5024(%r14)
	movb	$1, 5100(%r14)
	jmp	.LBB73_24
.Lfunc_end73:
	.size	BZ2_bzWriteOpen, .Lfunc_end73-BZ2_bzWriteOpen
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%ecx, %r13d
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	%rdi, %r14
	testq	%rdi, %rdi
	je	.LBB74_2
# %bb.1:
	movl	$0, (%r14)
.LBB74_2:
	testq	%rbx, %rbx
	je	.LBB74_10
# %bb.3:
	movl	$0, 5096(%rbx)
	testq	%r12, %r12
	je	.LBB74_10
# %bb.4:
	testl	%r13d, %r13d
	js	.LBB74_10
# %bb.5:
	cmpb	$0, 5012(%rbx)
	je	.LBB74_14
# %bb.6:
	movq	(%rbx), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB74_17
.LBB74_7:
	testq	%r14, %r14
	je	.LBB74_9
# %bb.8:
	movl	$-6, (%r14)
.LBB74_9:
	movl	$-6, 5096(%rbx)
	jmp	.LBB74_31
.LBB74_10:                              # %.thread
	testq	%r14, %r14
	je	.LBB74_12
# %bb.11:
	movl	$-2, (%r14)
.LBB74_12:
	testq	%rbx, %rbx
	je	.LBB74_31
# %bb.13:
	movl	$-2, 5096(%rbx)
	jmp	.LBB74_31
.LBB74_14:
	testq	%r14, %r14
	je	.LBB74_16
# %bb.15:
	movl	$-1, (%r14)
.LBB74_16:
	movl	$-1, 5096(%rbx)
	jmp	.LBB74_31
.LBB74_17:
	testl	%r13d, %r13d
	je	.LBB74_25
# %bb.18:
	leaq	5016(%rbx), %r15
	movl	%r13d, 5024(%rbx)
	movq	%r12, 5016(%rbx)
	leaq	8(%rbx), %r12
	jmp	.LBB74_20
	.p2align	4, 0x90
.LBB74_19:                              #   in Loop: Header=BB74_20 Depth=1
	cmpl	$0, 5024(%rbx)
	je	.LBB74_25
.LBB74_20:                              # =>This Inner Loop Header: Depth=1
	movl	$5000, 5048(%rbx)               # imm = 0x1388
	movq	%r12, 5040(%rbx)
	movq	%r15, %rdi
	xorl	%esi, %esi
	callq	BZ2_bzCompress
	cmpl	$1, %eax
	jne	.LBB74_28
# %bb.21:                               #   in Loop: Header=BB74_20 Depth=1
	movl	5048(%rbx), %eax
	cmpq	$4999, %rax                     # imm = 0x1387
	ja	.LBB74_19
# %bb.22:                               #   in Loop: Header=BB74_20 Depth=1
	movl	$5000, %r13d                    # imm = 0x1388
	subq	%rax, %r13
	movq	(%rbx), %rcx
	movl	$1, %esi
	movq	%r12, %rdi
	movq	%r13, %rdx
	callq	fwrite
	cmpl	%eax, %r13d
	jne	.LBB74_7
# %bb.23:                               #   in Loop: Header=BB74_20 Depth=1
	movq	(%rbx), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB74_19
	jmp	.LBB74_7
.LBB74_25:
	testq	%r14, %r14
	je	.LBB74_27
# %bb.26:
	movl	$0, (%r14)
.LBB74_27:
	movl	$0, 5096(%rbx)
	jmp	.LBB74_31
.LBB74_28:
	testq	%r14, %r14
	je	.LBB74_30
# %bb.29:
	movl	%eax, (%r14)
.LBB74_30:
	movl	%eax, 5096(%rbx)
.LBB74_31:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end74:
	.size	BZ2_bzWrite, .Lfunc_end74-BZ2_bzWrite
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
	subq	$16, %rsp
	movq	%r8, %r9
	movq	$0, (%rsp)
	xorl	%r8d, %r8d
	callq	BZ2_bzWriteClose64
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end75:
	.size	BZ2_bzWriteClose, .Lfunc_end75-BZ2_bzWriteClose
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, -48(%rbp)                  # 8-byte Spill
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB76_1
# %bb.3:
	movq	%rsi, %rbx
	cmpb	$0, 5012(%rsi)
	je	.LBB76_4
# %bb.7:
	movl	%edx, %r15d
	movq	%rcx, -64(%rbp)                 # 8-byte Spill
	movq	%r8, %r12
	movq	16(%rbp), %r13
	movq	(%rbx), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB76_12
.LBB76_8:
	testq	%r14, %r14
	je	.LBB76_10
# %bb.9:
	movl	$-6, (%r14)
.LBB76_10:
	movl	$-6, 5096(%rbx)
	jmp	.LBB76_11
.LBB76_1:
	testq	%r14, %r14
	je	.LBB76_11
# %bb.2:
	movl	$0, (%r14)
	jmp	.LBB76_11
.LBB76_4:
	testq	%r14, %r14
	je	.LBB76_6
# %bb.5:
	movl	$-1, (%r14)
.LBB76_6:
	movl	$-1, 5096(%rbx)
.LBB76_11:
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB76_12:
	.cfi_def_cfa %rbp, 16
	movq	%r13, -56(%rbp)                 # 8-byte Spill
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	testq	%rdx, %rdx
	je	.LBB76_14
# %bb.13:
	movl	$0, (%rdx)
.LBB76_14:
	testq	%r12, %r12
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	je	.LBB76_16
# %bb.15:
	movl	$0, (%r12)
.LBB76_16:
	cmpq	$0, -48(%rbp)                   # 8-byte Folded Reload
	je	.LBB76_18
# %bb.17:
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movl	$0, (%rax)
.LBB76_18:
	testq	%rcx, %rcx
	je	.LBB76_20
# %bb.19:
	movl	$0, (%rcx)
.LBB76_20:
	testl	%r15d, %r15d
	jne	.LBB76_33
# %bb.21:
	movq	%r12, -80(%rbp)                 # 8-byte Spill
	cmpl	$0, 5096(%rbx)
	je	.LBB76_22
.LBB76_31:                              # %.thread76
	movq	(%rbx), %r15
	movq	%r15, %rdi
	callq	ferror
	testl	%eax, %eax
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	movq	-80(%rbp), %r12                 # 8-byte Reload
	je	.LBB76_32
.LBB76_33:                              # %.thread
	testq	%rdx, %rdx
	je	.LBB76_35
# %bb.34:
	movl	5028(%rbx), %eax
	movl	%eax, (%rdx)
.LBB76_35:
	testq	%r12, %r12
	je	.LBB76_37
# %bb.36:
	movl	5032(%rbx), %eax
	movl	%eax, (%r12)
.LBB76_37:
	cmpq	$0, -48(%rbp)                   # 8-byte Folded Reload
	je	.LBB76_39
# %bb.38:
	movl	5052(%rbx), %eax
	movq	-48(%rbp), %rdx                 # 8-byte Reload
	movl	%eax, (%rdx)
.LBB76_39:
	testq	%rcx, %rcx
	je	.LBB76_41
# %bb.40:
	movl	5056(%rbx), %eax
	movl	%eax, (%rcx)
.LBB76_41:
	testq	%r14, %r14
	je	.LBB76_43
# %bb.42:
	movl	$0, (%r14)
.LBB76_43:
	movl	$0, 5096(%rbx)
	leaq	5016(%rbx), %rdi
	callq	BZ2_bzCompressEnd
	movq	%rbx, %rdi
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	free                            # TAILCALL
.LBB76_22:                              # %.preheader
	.cfi_def_cfa %rbp, 16
	leaq	5016(%rbx), %r13
	leaq	8(%rbx), %rax
	movq	%rax, -72(%rbp)                 # 8-byte Spill
	jmp	.LBB76_23
	.p2align	4, 0x90
.LBB76_30:                              #   in Loop: Header=BB76_23 Depth=1
	cmpl	$4, %r15d
	je	.LBB76_31
.LBB76_23:                              # =>This Inner Loop Header: Depth=1
	movl	$5000, 5048(%rbx)               # imm = 0x1388
	movq	-72(%rbp), %rax                 # 8-byte Reload
	movq	%rax, 5040(%rbx)
	movq	%r13, %rdi
	movl	$2, %esi
	callq	BZ2_bzCompress
	movl	%eax, %r15d
	leal	-3(%r15), %eax
	cmpl	$2, %eax
	jae	.LBB76_24
# %bb.27:                               #   in Loop: Header=BB76_23 Depth=1
	movl	5048(%rbx), %eax
	cmpq	$4999, %rax                     # imm = 0x1387
	ja	.LBB76_30
# %bb.28:                               #   in Loop: Header=BB76_23 Depth=1
	movl	$5000, %r12d                    # imm = 0x1388
	subq	%rax, %r12
	movq	(%rbx), %rcx
	movl	$1, %esi
	movq	-72(%rbp), %rdi                 # 8-byte Reload
	movq	%r12, %rdx
	callq	fwrite
	cmpl	%eax, %r12d
	jne	.LBB76_8
# %bb.29:                               #   in Loop: Header=BB76_23 Depth=1
	movq	(%rbx), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB76_30
	jmp	.LBB76_8
.LBB76_32:
	movq	%r15, %rdi
	callq	fflush
	movq	(%rbx), %rdi
	callq	ferror
	movq	-64(%rbp), %rdx                 # 8-byte Reload
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	testl	%eax, %eax
	jne	.LBB76_8
	jmp	.LBB76_33
.LBB76_24:
	testq	%r14, %r14
	je	.LBB76_26
# %bb.25:
	movl	%r15d, (%r14)
.LBB76_26:
	movl	%r15d, 5096(%rbx)
	jmp	.LBB76_11
.Lfunc_end76:
	.size	BZ2_bzWriteClose64, .Lfunc_end76-BZ2_bzWriteClose64
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %r15d
	movq	%r8, %rbx
	movl	%ecx, %r13d
	movq	%rsi, %r12
	movq	%rdi, %r14
	testq	%rdi, %rdi
	je	.LBB77_2
# %bb.1:
	movl	$0, (%r14)
.LBB77_2:
	cmpl	$4, %edx
	ja	.LBB77_11
# %bb.3:
	testq	%r12, %r12
	je	.LBB77_11
# %bb.4:
	cmpl	$1, %r13d
	ja	.LBB77_11
# %bb.5:
	testq	%rbx, %rbx
	je	.LBB77_10
# %bb.6:
	cmpl	$5001, %r15d                    # imm = 0x1389
	jae	.LBB77_11
.LBB77_7:
	movl	%edx, -48(%rbp)                 # 4-byte Spill
	movq	%r12, %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB77_15
# %bb.8:
	testq	%r14, %r14
	je	.LBB77_13
# %bb.9:
	movl	$-6, (%r14)
	jmp	.LBB77_13
.LBB77_10:
	testl	%r15d, %r15d
	je	.LBB77_7
.LBB77_11:
	testq	%r14, %r14
	je	.LBB77_13
# %bb.12:
	movl	$-2, (%r14)
.LBB77_13:
	xorl	%r13d, %r13d
.LBB77_14:
	movq	%r13, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB77_15:
	.cfi_def_cfa %rbp, 16
	movl	%r13d, -44(%rbp)                # 4-byte Spill
	movl	$5104, %edi                     # imm = 0x13F0
	callq	malloc
	testq	%rax, %rax
	je	.LBB77_29
# %bb.16:
	movq	%rax, %r13
	testq	%r14, %r14
	je	.LBB77_18
# %bb.17:
	movl	$0, (%r14)
.LBB77_18:
	movl	$0, 5096(%r13)
	movb	$0, 5100(%r13)
	movq	%r12, (%r13)
	movl	$0, 5008(%r13)
	movb	$0, 5012(%r13)
	leaq	5016(%r13), %rdi
	xorps	%xmm0, %xmm0
	movups	%xmm0, 5072(%r13)
	movq	$0, 5088(%r13)
	testl	%r15d, %r15d
	movl	-48(%rbp), %esi                 # 4-byte Reload
	jle	.LBB77_24
# %bb.19:                               # %.lr.ph
	leal	-1(%r15), %ecx
	xorl	%eax, %eax
	testb	$1, %r15b
	je	.LBB77_21
# %bb.20:                               # %.prol.preheader
	movb	(%rbx), %al
	movb	%al, 8(%r13)
	movl	$1, 5008(%r13)
	addq	$1, %rbx
	movl	$1, %eax
	movl	%ecx, %r15d
.LBB77_21:                              # %.prol.loopexit
	testl	%ecx, %ecx
	je	.LBB77_24
# %bb.22:                               # %.lr.ph.new.preheader
	addl	$2, %r15d
	.p2align	4, 0x90
.LBB77_23:                              # %.lr.ph.new
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%rbx), %ecx
	cltq
	movb	%cl, 8(%r13,%rax)
	movslq	5008(%r13), %rax
	leal	1(%rax), %ecx
	movl	%ecx, 5008(%r13)
	movzbl	1(%rbx), %ecx
	movb	%cl, 9(%r13,%rax)
	movl	5008(%r13), %eax
	addl	$1, %eax
	movl	%eax, 5008(%r13)
	addl	$-2, %r15d
	addq	$2, %rbx
	cmpl	$2, %r15d
	jg	.LBB77_23
.LBB77_24:                              # %._crit_edge
	movl	-44(%rbp), %edx                 # 4-byte Reload
	callq	BZ2_bzDecompressInit
	testl	%eax, %eax
	je	.LBB77_31
# %bb.25:
	testq	%r14, %r14
	je	.LBB77_27
# %bb.26:
	movl	%eax, (%r14)
.LBB77_27:
	movq	%r13, %rdi
	callq	free
	jmp	.LBB77_13
.LBB77_29:
	testq	%r14, %r14
	je	.LBB77_13
# %bb.30:
	movl	$-3, (%r14)
	jmp	.LBB77_13
.LBB77_31:
	movl	5008(%r13), %eax
	movl	%eax, 5024(%r13)
	movq	%r13, %rax
	addq	$8, %rax
	movq	%rax, 5016(%r13)
	movb	$1, 5100(%r13)
	jmp	.LBB77_14
.Lfunc_end77:
	.size	BZ2_bzReadOpen, .Lfunc_end77-BZ2_bzReadOpen
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rsi, %rbx
	testq	%rdi, %rdi
	je	.LBB78_11
# %bb.1:
	movl	$0, (%rdi)
	testq	%rbx, %rbx
	je	.LBB78_2
# %bb.7:
	movl	$0, 5096(%rbx)
	cmpb	$0, 5012(%rbx)
	je	.LBB78_8
# %bb.5:
	addq	$5096, %rbx                     # imm = 0x13E8
	movl	$-1, (%rdi)
	movl	$-1, (%rbx)
.LBB78_12:                              # %.thread19
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB78_11:                              # %.thread18
	.cfi_def_cfa %rbp, 16
	testq	%rbx, %rbx
	je	.LBB78_12
# %bb.3:                                # %.thread20
	movl	$0, 5096(%rbx)
	cmpb	$0, 5012(%rbx)
	je	.LBB78_8
# %bb.4:
	addq	$5096, %rbx                     # imm = 0x13E8
	movl	$-1, (%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB78_2:
	.cfi_def_cfa %rbp, 16
	movl	$0, (%rdi)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB78_8:
	.cfi_def_cfa %rbp, 16
	cmpb	$0, 5100(%rbx)
	je	.LBB78_10
# %bb.9:
	leaq	5016(%rbx), %rdi
	callq	BZ2_bzDecompressEnd
.LBB78_10:
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	free                            # TAILCALL
.Lfunc_end78:
	.size	BZ2_bzReadClose, .Lfunc_end78-BZ2_bzReadClose
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%ecx, %r14d
	movq	%rsi, %rbx
	movq	%rdi, %r15
	testq	%rdi, %rdi
	je	.LBB79_2
# %bb.1:
	movl	$0, (%r15)
.LBB79_2:
	testq	%rbx, %rbx
	je	.LBB79_5
# %bb.3:
	movl	$0, 5096(%rbx)
	testq	%rdx, %rdx
	je	.LBB79_5
# %bb.4:
	testl	%r14d, %r14d
	js	.LBB79_5
# %bb.9:
	cmpb	$0, 5012(%rbx)
	je	.LBB79_13
# %bb.10:
	testq	%r15, %r15
	je	.LBB79_12
# %bb.11:
	movl	$-1, (%r15)
.LBB79_12:
	movl	$-1, 5096(%rbx)
	xorl	%r14d, %r14d
	jmp	.LBB79_44
.LBB79_5:                               # %.thread
	testq	%r15, %r15
	je	.LBB79_7
# %bb.6:
	movl	$-2, (%r15)
.LBB79_7:
	xorl	%r14d, %r14d
	testq	%rbx, %rbx
	je	.LBB79_44
# %bb.8:
	movl	$-2, 5096(%rbx)
.LBB79_44:
	movl	%r14d, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB79_13:
	.cfi_def_cfa %rbp, 16
	testl	%r14d, %r14d
	je	.LBB79_14
# %bb.17:
	leaq	5016(%rbx), %r12
	movl	%r14d, 5048(%rbx)
	movq	%rdx, 5040(%rbx)
	leaq	8(%rbx), %rax
	movq	%rax, -56(%rbp)                 # 8-byte Spill
	jmp	.LBB79_18
	.p2align	4, 0x90
.LBB79_40:                              #   in Loop: Header=BB79_18 Depth=1
	cmpl	$0, 5048(%rbx)
	je	.LBB79_41
.LBB79_18:                              # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r13
	movq	%r13, %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB79_19
# %bb.22:                               #   in Loop: Header=BB79_18 Depth=1
	cmpl	$0, 5024(%rbx)
	jne	.LBB79_26
# %bb.23:                               #   in Loop: Header=BB79_18 Depth=1
	movq	%r13, %rdi
	callq	myfeof.123
	testb	%al, %al
	jne	.LBB79_26
# %bb.24:                               #   in Loop: Header=BB79_18 Depth=1
	movq	%r12, -48(%rbp)                 # 8-byte Spill
	movq	(%rbx), %rcx
	movl	$1, %esi
	movl	$5000, %edx                     # imm = 0x1388
	movq	-56(%rbp), %r12                 # 8-byte Reload
	movq	%r12, %rdi
	callq	fread
	movq	%rax, %r13
	movq	(%rbx), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB79_19
# %bb.25:                               #   in Loop: Header=BB79_18 Depth=1
	movl	%r13d, 5008(%rbx)
	movl	%r13d, 5024(%rbx)
	movq	%r12, 5016(%rbx)
	movq	-48(%rbp), %r12                 # 8-byte Reload
	.p2align	4, 0x90
.LBB79_26:                              #   in Loop: Header=BB79_18 Depth=1
	movq	%r12, %rdi
	callq	BZ2_bzDecompress
	testl	%eax, %eax
	jne	.LBB79_27
# %bb.31:                               #   in Loop: Header=BB79_18 Depth=1
	movq	(%rbx), %rdi
	callq	myfeof.123
	testb	%al, %al
	je	.LBB79_40
# %bb.32:                               #   in Loop: Header=BB79_18 Depth=1
	cmpl	$0, 5024(%rbx)
	jne	.LBB79_40
# %bb.33:
	cmpl	$0, 5048(%rbx)
	je	.LBB79_41
# %bb.34:
	testq	%r15, %r15
	je	.LBB79_36
# %bb.35:
	movl	$-7, (%r15)
.LBB79_36:
	movl	$-7, 5096(%rbx)
	xorl	%r14d, %r14d
	jmp	.LBB79_44
.LBB79_14:
	testq	%r15, %r15
	je	.LBB79_16
# %bb.15:
	movl	$0, (%r15)
.LBB79_16:
	movl	$0, 5096(%rbx)
	xorl	%r14d, %r14d
	jmp	.LBB79_44
.LBB79_27:
	cmpl	$4, %eax
	jne	.LBB79_28
# %bb.37:
	testq	%r15, %r15
	je	.LBB79_39
# %bb.38:
	movl	$4, (%r15)
.LBB79_39:
	movl	$4, 5096(%rbx)
	subl	5048(%rbx), %r14d
	jmp	.LBB79_44
.LBB79_19:
	testq	%r15, %r15
	je	.LBB79_21
# %bb.20:
	movl	$-6, (%r15)
.LBB79_21:
	movl	$-6, 5096(%rbx)
	xorl	%r14d, %r14d
	jmp	.LBB79_44
.LBB79_41:                              # %.thread95
	testq	%r15, %r15
	je	.LBB79_43
# %bb.42:
	movl	$0, (%r15)
.LBB79_43:
	movl	$0, 5096(%rbx)
	jmp	.LBB79_44
.LBB79_28:
	testq	%r15, %r15
	je	.LBB79_30
# %bb.29:
	movl	%eax, (%r15)
.LBB79_30:
	movl	%eax, 5096(%rbx)
	xorl	%r14d, %r14d
	jmp	.LBB79_44
.Lfunc_end79:
	.size	BZ2_bzRead, .Lfunc_end79-BZ2_bzRead
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	callq	fgetc
	cmpl	$-1, %eax
	je	.LBB80_1
# %bb.2:
	movl	%eax, %edi
	movq	%rbx, %rsi
	callq	ungetc
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB80_1:
	.cfi_def_cfa %rbp, 16
	movb	$1, %al
                                        # kill: def $al killed $al killed $eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end80:
	.size	myfeof.123, .Lfunc_end80-myfeof.123
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
	testq	%rsi, %rsi
	je	.LBB81_7
# %bb.1:
	cmpl	$4, 5096(%rsi)
	jne	.LBB81_9
# %bb.2:
	testq	%rdx, %rdx
	je	.LBB81_13
# %bb.3:
	testq	%rcx, %rcx
	je	.LBB81_13
# %bb.4:
	testq	%rdi, %rdi
	je	.LBB81_6
# %bb.5:
	movl	$0, (%rdi)
.LBB81_6:
	movl	$0, 5096(%rsi)
	movl	5024(%rsi), %eax
	movl	%eax, (%rcx)
	movq	5016(%rsi), %rax
	movq	%rax, (%rdx)
.LBB81_12:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB81_7:
	.cfi_def_cfa %rbp, 16
	testq	%rdi, %rdi
	je	.LBB81_12
# %bb.8:
	movl	$-2, (%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB81_9:
	.cfi_def_cfa %rbp, 16
	testq	%rdi, %rdi
	je	.LBB81_11
# %bb.10:
	movl	$-1, (%rdi)
.LBB81_11:
	movl	$-1, 5096(%rsi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB81_13:
	.cfi_def_cfa %rbp, 16
	testq	%rdi, %rdi
	je	.LBB81_15
# %bb.14:
	movl	$-2, (%rdi)
.LBB81_15:
	movl	$-2, 5096(%rsi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end81:
	.size	BZ2_bzReadGetUnused, .Lfunc_end81-BZ2_bzReadGetUnused
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
                                        # kill: def $r8d killed $r8d def $r8
	movl	16(%rbp), %eax
	movl	$-2, %ebx
	cmpl	$250, %eax
	ja	.LBB82_12
# %bb.1:
	cmpl	$4, %r9d
	ja	.LBB82_12
# %bb.2:
	movq	%rdi, %r13
	testq	%rdi, %rdi
	je	.LBB82_12
# %bb.3:
	movq	%rsi, %r14
	testq	%rsi, %rsi
	je	.LBB82_12
# %bb.4:
	movq	%rdx, %r12
	testq	%rdx, %rdx
	je	.LBB82_12
# %bb.5:
	movl	%ecx, %r15d
	leal	-1(%r8), %ecx
	cmpl	$8, %ecx
	ja	.LBB82_12
# %bb.6:
	testl	%eax, %eax
	movl	$30, %ecx
	cmovnel	%eax, %ecx
	xorps	%xmm0, %xmm0
	movups	%xmm0, -64(%rbp)
	movq	$0, -48(%rbp)
	leaq	-120(%rbp), %rdi
	movl	%r8d, %esi
	movl	%r9d, %edx
	callq	BZ2_bzCompressInit
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.LBB82_7
.LBB82_12:
	movl	%ebx, %eax
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB82_7:
	.cfi_def_cfa %rbp, 16
	movq	%r12, -120(%rbp)
	movq	%r13, -96(%rbp)
	movl	%r15d, -112(%rbp)
	movl	(%r14), %eax
	movl	%eax, -88(%rbp)
	leaq	-120(%rbp), %rdi
	movl	$2, %esi
	callq	BZ2_bzCompress
	cmpl	$3, %eax
	je	.LBB82_10
# %bb.8:
	movl	%eax, %ebx
	cmpl	$4, %eax
	jne	.LBB82_11
# %bb.9:
	movl	-88(%rbp), %eax
	subl	%eax, (%r14)
	leaq	-120(%rbp), %rdi
	callq	BZ2_bzCompressEnd
	xorl	%ebx, %ebx
	jmp	.LBB82_12
.LBB82_10:
	leaq	-120(%rbp), %rdi
	callq	BZ2_bzCompressEnd
	movl	$-8, %ebx
	jmp	.LBB82_12
.LBB82_11:
	leaq	-120(%rbp), %rdi
	callq	BZ2_bzCompressEnd
	jmp	.LBB82_12
.Lfunc_end82:
	.size	BZ2_bzBuffToBuffCompress, .Lfunc_end82-BZ2_bzBuffToBuffCompress
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	$-2, %ebx
	testq	%rdi, %rdi
	je	.LBB83_13
# %bb.1:
	movq	%rsi, %r14
	testq	%rsi, %rsi
	je	.LBB83_13
# %bb.2:
	movq	%rdx, %r12
	testq	%rdx, %rdx
	je	.LBB83_13
# %bb.3:
	cmpl	$1, %r8d
	ja	.LBB83_13
# %bb.4:
	cmpl	$4, %r9d
	ja	.LBB83_13
# %bb.5:
	movl	%ecx, %r15d
	movq	%rdi, %r13
	xorps	%xmm0, %xmm0
	movups	%xmm0, -64(%rbp)
	movq	$0, -48(%rbp)
	leaq	-120(%rbp), %rdi
	movl	%r9d, %esi
	movl	%r8d, %edx
	callq	BZ2_bzDecompressInit
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.LBB83_6
.LBB83_13:
	movl	%ebx, %eax
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB83_6:
	.cfi_def_cfa %rbp, 16
	movq	%r12, -120(%rbp)
	movq	%r13, -96(%rbp)
	movl	%r15d, -112(%rbp)
	movl	(%r14), %eax
	movl	%eax, -88(%rbp)
	leaq	-120(%rbp), %rdi
	callq	BZ2_bzDecompress
	testl	%eax, %eax
	je	.LBB83_9
# %bb.7:
	movl	%eax, %ebx
	cmpl	$4, %eax
	jne	.LBB83_12
# %bb.8:
	movl	-88(%rbp), %eax
	subl	%eax, (%r14)
	leaq	-120(%rbp), %rdi
	callq	BZ2_bzDecompressEnd
	xorl	%ebx, %ebx
	jmp	.LBB83_13
.LBB83_9:
	cmpl	$0, -88(%rbp)
	je	.LBB83_11
# %bb.10:
	leaq	-120(%rbp), %rdi
	callq	BZ2_bzDecompressEnd
	movl	$-7, %ebx
	jmp	.LBB83_13
.LBB83_12:
	leaq	-120(%rbp), %rdi
	callq	BZ2_bzDecompressEnd
	jmp	.LBB83_13
.LBB83_11:
	leaq	-120(%rbp), %rdi
	callq	BZ2_bzDecompressEnd
	movl	$-8, %ebx
	jmp	.LBB83_13
.Lfunc_end83:
	.size	BZ2_bzBuffToBuffDecompress, .Lfunc_end83-BZ2_bzBuffToBuffDecompress
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
	movq	%rsi, %rdx
	movl	$-1, %esi
	xorl	%ecx, %ecx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	bzopen_or_bzdopen               # TAILCALL
.Lfunc_end84:
	.size	BZ2_bzopen, .Lfunc_end84-BZ2_bzopen
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$5048, %rsp                     # imm = 0x13B8
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movw	$0, -48(%rbp)
	movq	$0, -56(%rbp)
	xorl	%ebx, %ebx
	testq	%rdx, %rdx
	je	.LBB85_29
# %bb.1:                                # %.preheader
	movq	%rdx, %r12
	movl	%esi, -60(%rbp)                 # 4-byte Spill
	movb	(%rdx), %al
	testb	%al, %al
	movq	%rdi, -80(%rbp)                 # 8-byte Spill
	movl	%ecx, -64(%rbp)                 # 4-byte Spill
	je	.LBB85_2
# %bb.3:                                # %.lr.ph.preheader
	addq	$1, %r12
	movl	$9, %r13d
	xorl	%r14d, %r14d
	xorl	%ebx, %ebx
	jmp	.LBB85_4
	.p2align	4, 0x90
.LBB85_10:                              #   in Loop: Header=BB85_4 Depth=1
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movslq	%r15d, %rcx
	addl	$-48, %r15d
	testb	$8, 1(%rax,%rcx,2)
	cmovnel	%r15d, %r13d
.LBB85_11:                              #   in Loop: Header=BB85_4 Depth=1
	movzbl	(%r12), %eax
	addq	$1, %r12
	testb	%al, %al
	je	.LBB85_12
.LBB85_4:                               # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movsbl	%al, %r15d
	cmpl	$114, %r15d
	je	.LBB85_5
# %bb.6:                                # %.lr.ph
                                        #   in Loop: Header=BB85_4 Depth=1
	cmpl	$115, %r15d
	je	.LBB85_9
# %bb.7:                                # %.lr.ph
                                        #   in Loop: Header=BB85_4 Depth=1
	cmpl	$119, %r15d
	jne	.LBB85_10
# %bb.8:                                #   in Loop: Header=BB85_4 Depth=1
	movl	$1, %ebx
	jmp	.LBB85_11
	.p2align	4, 0x90
.LBB85_5:                               #   in Loop: Header=BB85_4 Depth=1
	xorl	%ebx, %ebx
	jmp	.LBB85_11
	.p2align	4, 0x90
.LBB85_9:                               #   in Loop: Header=BB85_4 Depth=1
	movl	$1, %r14d
	jmp	.LBB85_11
.LBB85_2:
	movl	$9, %r13d
	xorl	%r14d, %r14d
.LBB85_12:                              # %._crit_edge
	leaq	-56(%rbp), %r12
	movq	%r12, %rdi
	callq	strlen
	xorl	%ecx, %ecx
	testl	%ebx, %ebx
	setne	%cl
	leal	(%rcx,%rcx,4), %ecx
	addl	$114, %ecx
	movw	%cx, -56(%rbp,%rax)
	movq	%r12, %rdi
	callq	strlen
	movw	$98, -56(%rbp,%rax)
	cmpl	$0, -64(%rbp)                   # 4-byte Folded Reload
	je	.LBB85_13
# %bb.18:
	leaq	-56(%rbp), %rsi
	movl	-60(%rbp), %edi                 # 4-byte Reload
	callq	fdopen
	movq	%rax, %r15
	testq	%rax, %rax
	je	.LBB85_28
.LBB85_20:
	testl	%ebx, %ebx
	jne	.LBB85_21
	jmp	.LBB85_23
.LBB85_13:
	movq	-80(%rbp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB85_15
# %bb.14:
	cmpb	$0, (%rdi)
	je	.LBB85_15
# %bb.17:
	leaq	-56(%rbp), %rsi
	callq	fopen
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.LBB85_20
	jmp	.LBB85_28
.LBB85_15:
	testl	%ebx, %ebx
	je	.LBB85_22
# %bb.16:                               # %.thread58
	movq	stdout(%rip), %r15
	testq	%r15, %r15
	je	.LBB85_28
.LBB85_21:                              # %.thread45
	cmpl	$9, %r13d
	movl	$9, %eax
	cmovll	%r13d, %eax
	testl	%eax, %eax
	movl	$1, %edx
	cmovgl	%eax, %edx
	leaq	-68(%rbp), %rdi
	movq	%r15, %rsi
	xorl	%ecx, %ecx
	movl	$30, %r8d
	callq	BZ2_bzWriteOpen
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.LBB85_29
	jmp	.LBB85_25
.LBB85_22:                              # %.thread
	movq	stdin(%rip), %r15
	testq	%r15, %r15
	je	.LBB85_28
.LBB85_23:                              # %.thread42
	leaq	-68(%rbp), %rdi
	leaq	-5088(%rbp), %r8
	movq	%r15, %rsi
	xorl	%edx, %edx
	movl	%r14d, %ecx
	xorl	%r9d, %r9d
	callq	BZ2_bzReadOpen
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.LBB85_29
.LBB85_25:
	xorl	%ebx, %ebx
	cmpq	stdin(%rip), %r15
	je	.LBB85_29
# %bb.26:
	cmpq	stdout(%rip), %r15
	je	.LBB85_29
# %bb.27:
	movq	%r15, %rdi
	callq	fclose
.LBB85_28:
	xorl	%ebx, %ebx
.LBB85_29:
	movq	%rbx, %rax
	addq	$5048, %rsp                     # imm = 0x13B8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end85:
	.size	bzopen_or_bzdopen, .Lfunc_end85-bzopen_or_bzdopen
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
	movq	%rsi, %rdx
	movl	%edi, %esi
	xorl	%edi, %edi
	movl	$1, %ecx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	bzopen_or_bzdopen               # TAILCALL
.Lfunc_end86:
	.size	BZ2_bzdopen, .Lfunc_end86-BZ2_bzdopen
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
	subq	$16, %rsp
	cmpl	$4, 5096(%rdi)
	jne	.LBB87_1
# %bb.2:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB87_1:
	.cfi_def_cfa %rbp, 16
	movl	%edx, %ecx
	movq	%rsi, %rdx
	movq	%rdi, %rsi
	leaq	-4(%rbp), %rdi
	callq	BZ2_bzRead
	movl	-4(%rbp), %ecx
	andl	$-5, %ecx
	xorl	%edx, %edx
	cmpl	$1, %ecx
	sbbl	%edx, %edx
	notl	%edx
	orl	%edx, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end87:
	.size	BZ2_bzread, .Lfunc_end87-BZ2_bzread
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	%edx, %ebx
	movq	%rsi, %rdx
	movq	%rdi, %rsi
	leaq	-12(%rbp), %rdi
	movl	%ebx, %ecx
	callq	BZ2_bzWrite
	xorl	%eax, %eax
	cmpl	$1, -12(%rbp)
	sbbl	%eax, %eax
	notl	%eax
	orl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end88:
	.size	BZ2_bzwrite, .Lfunc_end88-BZ2_bzwrite
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
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end89:
	.size	BZ2_bzflush, .Lfunc_end89-BZ2_bzflush
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
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	testq	%rdi, %rdi
	je	.LBB90_8
# %bb.1:
	movq	%rdi, %rbx
	movq	(%rdi), %r14
	cmpb	$0, 5012(%rdi)
	je	.LBB90_4
# %bb.2:
	leaq	-20(%rbp), %rdi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	callq	BZ2_bzWriteClose
	cmpl	$0, -20(%rbp)
	je	.LBB90_5
# %bb.3:
	xorl	%edi, %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	callq	BZ2_bzWriteClose
.LBB90_5:
	cmpq	stdin(%rip), %r14
	jne	.LBB90_6
	jmp	.LBB90_8
.LBB90_4:
	leaq	-20(%rbp), %rdi
	movq	%rbx, %rsi
	callq	BZ2_bzReadClose
	cmpq	stdin(%rip), %r14
	je	.LBB90_8
.LBB90_6:
	cmpq	stdout(%rip), %r14
	je	.LBB90_8
# %bb.7:
	movq	%r14, %rdi
	callq	fclose
.LBB90_8:
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end90:
	.size	BZ2_bzclose, .Lfunc_end90-BZ2_bzclose
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
	movl	5096(%rdi), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	andl	%eax, %ecx
	movl	%ecx, (%rsi)
	negl	%ecx
	movslq	%ecx, %rax
	movq	bzerrorstrings(,%rax,8), %rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end91:
	.size	BZ2_bzerror, .Lfunc_end91-BZ2_bzerror
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
	movq	$0, 640(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end92:
	.size	BZ2_bsInitWrite, .Lfunc_end92-BZ2_bsInitWrite
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
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	%esi, %r14d
	movq	%rdi, %rbx
	movl	108(%rdi), %r9d
	testl	%r9d, %r9d
	jle	.LBB93_6
# %bb.1:
	movl	648(%rbx), %ecx
	movl	652(%rbx), %r8d
	notl	%ecx
	movl	%ecx, 648(%rbx)
	roll	%r8d
	xorl	%ecx, %r8d
	movl	%r8d, 652(%rbx)
	movl	660(%rbx), %edx
	cmpl	$2, %edx
	jl	.LBB93_3
# %bb.2:
	movl	$0, 116(%rbx)
.LBB93_3:
	cmpl	$2, 656(%rbx)
	jge	.LBB93_4
.LBB93_5:
	movq	%rbx, %rdi
	callq	BZ2_blockSort
	movl	108(%rbx), %r9d
.LBB93_6:
	movslq	%r9d, %rax
	addq	32(%rbx), %rax
	movq	%rax, 80(%rbx)
	cmpl	$1, 660(%rbx)
	jne	.LBB93_8
# %bb.7:
	movq	%rbx, %rdi
	callq	BZ2_bsInitWrite
	movq	%rbx, %rdi
	movl	$66, %esi
	callq	bsPutUChar
	movq	%rbx, %rdi
	movl	$90, %esi
	callq	bsPutUChar
	movq	%rbx, %rdi
	movl	$104, %esi
	callq	bsPutUChar
	movb	664(%rbx), %al
	addb	$48, %al
	movzbl	%al, %esi
	movq	%rbx, %rdi
	callq	bsPutUChar
	movl	108(%rbx), %r9d
.LBB93_8:
	testl	%r9d, %r9d
	jle	.LBB93_10
# %bb.9:
	movq	%rbx, %rdi
	movl	$49, %esi
	callq	bsPutUChar
	movq	%rbx, %rdi
	movl	$65, %esi
	callq	bsPutUChar
	movq	%rbx, %rdi
	movl	$89, %esi
	callq	bsPutUChar
	movq	%rbx, %rdi
	movl	$38, %esi
	callq	bsPutUChar
	movq	%rbx, %rdi
	movl	$83, %esi
	callq	bsPutUChar
	movq	%rbx, %rdi
	movl	$89, %esi
	callq	bsPutUChar
	movl	648(%rbx), %esi
	movq	%rbx, %rdi
	callq	bsPutUInt32
	movq	%rbx, %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	movl	48(%rbx), %edx
	movq	%rbx, %rdi
	movl	$24, %esi
	callq	bsW
	movq	%rbx, %rdi
	callq	generateMTFValues
	movq	%rbx, %rdi
	callq	sendMTFValues
.LBB93_10:
	testb	%r14b, %r14b
	je	.LBB93_14
# %bb.11:
	movq	%rbx, %rdi
	movl	$23, %esi
	callq	bsPutUChar
	movq	%rbx, %rdi
	movl	$114, %esi
	callq	bsPutUChar
	movq	%rbx, %rdi
	movl	$69, %esi
	callq	bsPutUChar
	movq	%rbx, %rdi
	movl	$56, %esi
	callq	bsPutUChar
	movq	%rbx, %rdi
	movl	$80, %esi
	callq	bsPutUChar
	movq	%rbx, %rdi
	movl	$144, %esi
	callq	bsPutUChar
	movl	652(%rbx), %esi
	movq	%rbx, %rdi
	callq	bsPutUInt32
	cmpl	$2, 656(%rbx)
	jge	.LBB93_12
.LBB93_13:
	movq	%rbx, %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	bsFinishWrite                   # TAILCALL
.LBB93_14:
	.cfi_def_cfa %rbp, 16
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB93_4:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rdi
	movl	$.L.str.143, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB93_5
.LBB93_12:
	movq	stderr(%rip), %rdi
	movl	652(%rbx), %edx
	movl	$.L.str.1.144, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB93_13
.Lfunc_end93:
	.size	BZ2_compressBlock, .Lfunc_end93-BZ2_compressBlock
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
	movl	%esi, %edx
	movl	$8, %esi
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	bsW                             # TAILCALL
.Lfunc_end94:
	.size	bsPutUChar, .Lfunc_end94-bsPutUChar
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
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	%esi, %ebx
	movq	%rdi, %r14
	movl	%esi, %edx
	shrl	$24, %edx
	movl	$8, %esi
	callq	bsW
	movl	%ebx, %eax
	shrl	$16, %eax
	movzbl	%al, %edx
	movq	%r14, %rdi
	movl	$8, %esi
	callq	bsW
	movzbl	%bh, %edx
	movq	%r14, %rdi
	movl	$8, %esi
	callq	bsW
	movzbl	%bl, %edx
	movq	%r14, %rdi
	movl	$8, %esi
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	bsW                             # TAILCALL
.Lfunc_end95:
	.size	bsPutUInt32, .Lfunc_end95-bsPutUInt32
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
	movl	644(%rdi), %r8d
	cmpl	$7, %r8d
	jle	.LBB96_1
# %bb.2:                                # %.lr.ph
	movl	640(%rdi), %eax
	movl	116(%rdi), %ecx
	.p2align	4, 0x90
.LBB96_3:                               # =>This Inner Loop Header: Depth=1
	shrl	$24, %eax
	movq	80(%rdi), %r8
	movslq	%ecx, %rcx
	movb	%al, (%r8,%rcx)
	movl	116(%rdi), %ecx
	addl	$1, %ecx
	movl	%ecx, 116(%rdi)
	movl	640(%rdi), %eax
	shll	$8, %eax
	movl	%eax, 640(%rdi)
	movl	644(%rdi), %r9d
	leal	-8(%r9), %r8d
	movl	%r8d, 644(%rdi)
	cmpl	$15, %r9d
	jg	.LBB96_3
	jmp	.LBB96_4
.LBB96_1:                               # %.._crit_edge_crit_edge
	movl	640(%rdi), %eax
.LBB96_4:                               # %._crit_edge
	addl	%esi, %r8d
	movl	%r8d, %ecx
	negb	%cl
	shll	%cl, %edx
	orl	%eax, %edx
	movl	%edx, 640(%rdi)
	movl	%r8d, 644(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end96:
	.size	bsW, .Lfunc_end96-bsW
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function generateMTFValues
.LCPI97_0:
	.quad	6                               # 0x6
	.quad	7                               # 0x7
.LCPI97_1:
	.quad	4                               # 0x4
	.quad	5                               # 0x5
.LCPI97_2:
	.quad	2                               # 0x2
	.quad	3                               # 0x3
.LCPI97_3:
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
.LCPI97_4:
	.quad	-9223372034707292160            # 0x8000000080000000
	.quad	-9223372034707292160            # 0x8000000080000000
	.text
	.p2align	4, 0x90
	.type	generateMTFValues,@function
generateMTFValues:                      # @generateMTFValues
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
	subq	$280, %rsp                      # imm = 0x118
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movq	56(%rdi), %r12
	movq	64(%rdi), %r13
	movq	72(%rdi), %rax
	movq	%rax, -56(%rbp)                 # 8-byte Spill
	callq	makeMaps_e
	movslq	124(%r14), %r15
	movl	%r15d, %ecx
	addl	$1, %ecx
	movl	$-1, %eax
	movl	%ecx, -44(%rbp)                 # 4-byte Spill
	cmovnsl	%ecx, %eax
	incl	%eax
	je	.LBB97_2
# %bb.1:                                # %.lr.ph113.preheader
	movl	%eax, %edx
	leaq	672(%r14), %rdi
	shlq	$2, %rdx
	xorl	%esi, %esi
	callq	memset@PLT
.LBB97_2:                               # %.preheader96
	testl	%r15d, %r15d
	jle	.LBB97_24
# %bb.3:                                # %.lr.ph109.preheader
	leaq	-1(%r15), %rax
	movl	%r15d, %edx
	andl	$7, %edx
	cmpq	$7, %rax
	jae	.LBB97_26
# %bb.4:
	xorl	%eax, %eax
	jmp	.LBB97_5
.LBB97_26:                              # %.lr.ph109.preheader.new
	andq	$-8, %r15
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB97_27:                              # %.lr.ph109
                                        # =>This Inner Loop Header: Depth=1
	movb	%al, -320(%rbp,%rax)
	leal	1(%rax), %ecx
	movb	%cl, -319(%rbp,%rax)
	leal	2(%rax), %ecx
	movb	%cl, -318(%rbp,%rax)
	leal	3(%rax), %ecx
	movb	%cl, -317(%rbp,%rax)
	leal	4(%rax), %ecx
	movb	%cl, -316(%rbp,%rax)
	leal	5(%rax), %ecx
	movb	%cl, -315(%rbp,%rax)
	leal	6(%rax), %ecx
	movb	%cl, -314(%rbp,%rax)
	leal	7(%rax), %ecx
	movb	%cl, -313(%rbp,%rax)
	addq	$8, %rax
	cmpq	%rax, %r15
	jne	.LBB97_27
.LBB97_5:                               # %.preheader.loopexit.unr-lcssa
	testq	%rdx, %rdx
	je	.LBB97_24
# %bb.6:                                # %vector.ph
	leal	7(%rdx), %ecx
	andl	$-8, %ecx
	addq	$-1, %rdx
	movq	%rdx, %xmm0
	pshufd	$68, %xmm0, %xmm0               # xmm0 = xmm0[0,1,0,1]
	leaq	-320(%rbp), %rdx
	addq	%rax, %rdx
	addq	$7, %rdx
	xorl	%esi, %esi
	movdqa	.LCPI97_0(%rip), %xmm8          # xmm8 = [6,7]
	movdqa	.LCPI97_1(%rip), %xmm9          # xmm9 = [4,5]
	movdqa	.LCPI97_2(%rip), %xmm10         # xmm10 = [2,3]
	movdqa	.LCPI97_3(%rip), %xmm4          # xmm4 = [0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
	movdqa	.LCPI97_4(%rip), %xmm5          # xmm5 = [9223372039002259456,9223372039002259456]
	pxor	%xmm5, %xmm0
	pcmpeqd	%xmm6, %xmm6
	jmp	.LBB97_7
	.p2align	4, 0x90
.LBB97_23:                              # %pred.store.continue147
                                        #   in Loop: Header=BB97_7 Depth=1
	addq	$8, %rsi
	cmpq	%rsi, %rcx
	je	.LBB97_24
.LBB97_7:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rsi, %xmm1
	pshufd	$68, %xmm1, %xmm7               # xmm7 = xmm1[0,1,0,1]
	movdqa	%xmm7, %xmm1
	por	%xmm4, %xmm1
	pxor	%xmm5, %xmm1
	movdqa	%xmm1, %xmm2
	pcmpgtd	%xmm0, %xmm2
	pcmpeqd	%xmm0, %xmm1
	pshufd	$245, %xmm1, %xmm3              # xmm3 = xmm1[1,1,3,3]
	pand	%xmm2, %xmm3
	pshufd	$245, %xmm2, %xmm1              # xmm1 = xmm2[1,1,3,3]
	por	%xmm3, %xmm1
	movd	%xmm1, %edi
	notl	%edi
	testb	$1, %dil
	je	.LBB97_9
# %bb.8:                                # %pred.store.if
                                        #   in Loop: Header=BB97_7 Depth=1
	leaq	(%rax,%rsi), %rdi
	movb	%dil, -7(%rdx,%rsi)
.LBB97_9:                               # %pred.store.continue
                                        #   in Loop: Header=BB97_7 Depth=1
	pxor	%xmm6, %xmm1
	psrldq	$6, %xmm1                       # xmm1 = xmm1[6,7,8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero
	movd	%xmm1, %edi
	shrl	$16, %edi
	testb	$1, %dil
	je	.LBB97_11
# %bb.10:                               # %pred.store.if134
                                        #   in Loop: Header=BB97_7 Depth=1
	leal	(%rax,%rsi), %edi
	addb	$1, %dil
	movb	%dil, -6(%rdx,%rsi)
.LBB97_11:                              # %pred.store.continue135
                                        #   in Loop: Header=BB97_7 Depth=1
	movdqa	%xmm7, %xmm1
	por	%xmm10, %xmm1
	pxor	%xmm5, %xmm1
	movdqa	%xmm1, %xmm2
	pcmpgtd	%xmm0, %xmm2
	pcmpeqd	%xmm0, %xmm1
	pshufd	$245, %xmm1, %xmm3              # xmm3 = xmm1[1,1,3,3]
	pand	%xmm2, %xmm3
	pshufd	$245, %xmm2, %xmm1              # xmm1 = xmm2[1,1,3,3]
	por	%xmm3, %xmm1
	pxor	%xmm6, %xmm1
	pextrw	$0, %xmm1, %edi
	testb	$1, %dil
	je	.LBB97_13
# %bb.12:                               # %pred.store.if136
                                        #   in Loop: Header=BB97_7 Depth=1
	leal	(%rax,%rsi), %edi
	addb	$2, %dil
	movb	%dil, -5(%rdx,%rsi)
.LBB97_13:                              # %pred.store.continue137
                                        #   in Loop: Header=BB97_7 Depth=1
	pextrw	$4, %xmm1, %edi
	testb	$1, %dil
	je	.LBB97_15
# %bb.14:                               # %pred.store.if138
                                        #   in Loop: Header=BB97_7 Depth=1
	leal	(%rax,%rsi), %edi
	addb	$3, %dil
	movb	%dil, -4(%rdx,%rsi)
.LBB97_15:                              # %pred.store.continue139
                                        #   in Loop: Header=BB97_7 Depth=1
	movdqa	%xmm7, %xmm1
	por	%xmm9, %xmm1
	pxor	%xmm5, %xmm1
	movdqa	%xmm1, %xmm2
	pcmpgtd	%xmm0, %xmm2
	pcmpeqd	%xmm0, %xmm1
	pshufd	$245, %xmm1, %xmm3              # xmm3 = xmm1[1,1,3,3]
	pand	%xmm2, %xmm3
	pshufd	$245, %xmm2, %xmm1              # xmm1 = xmm2[1,1,3,3]
	por	%xmm3, %xmm1
	pshufd	$68, %xmm1, %xmm2               # xmm2 = xmm1[0,1,0,1]
	pxor	%xmm6, %xmm2
	pextrw	$4, %xmm2, %edi
	testb	$1, %dil
	je	.LBB97_17
# %bb.16:                               # %pred.store.if140
                                        #   in Loop: Header=BB97_7 Depth=1
	leal	(%rax,%rsi), %edi
	addb	$4, %dil
	movb	%dil, -3(%rdx,%rsi)
.LBB97_17:                              # %pred.store.continue141
                                        #   in Loop: Header=BB97_7 Depth=1
	pxor	%xmm6, %xmm1
	pextrw	$4, %xmm1, %edi
	testb	$1, %dil
	je	.LBB97_19
# %bb.18:                               # %pred.store.if142
                                        #   in Loop: Header=BB97_7 Depth=1
	leal	(%rax,%rsi), %edi
	addb	$5, %dil
	movb	%dil, -2(%rdx,%rsi)
.LBB97_19:                              # %pred.store.continue143
                                        #   in Loop: Header=BB97_7 Depth=1
	por	%xmm8, %xmm7
	pxor	%xmm5, %xmm7
	movdqa	%xmm7, %xmm1
	pcmpgtd	%xmm0, %xmm1
	pcmpeqd	%xmm0, %xmm7
	pshufd	$245, %xmm7, %xmm2              # xmm2 = xmm7[1,1,3,3]
	pand	%xmm1, %xmm2
	pshufd	$245, %xmm1, %xmm1              # xmm1 = xmm1[1,1,3,3]
	por	%xmm2, %xmm1
	pxor	%xmm6, %xmm1
	pextrw	$0, %xmm1, %edi
	testb	$1, %dil
	jne	.LBB97_20
# %bb.21:                               # %pred.store.continue145
                                        #   in Loop: Header=BB97_7 Depth=1
	pextrw	$4, %xmm1, %edi
	testb	$1, %dil
	je	.LBB97_23
	jmp	.LBB97_22
	.p2align	4, 0x90
.LBB97_20:                              # %pred.store.if144
                                        #   in Loop: Header=BB97_7 Depth=1
	leal	(%rax,%rsi), %edi
	addb	$6, %dil
	movb	%dil, -1(%rdx,%rsi)
	pextrw	$4, %xmm1, %edi
	testb	$1, %dil
	je	.LBB97_23
.LBB97_22:                              # %pred.store.if146
                                        #   in Loop: Header=BB97_7 Depth=1
	leal	(%rax,%rsi), %edi
	addb	$7, %dil
	movb	%dil, (%rdx,%rsi)
	jmp	.LBB97_23
.LBB97_24:                              # %.preheader
	movl	108(%r14), %esi
	testl	%esi, %esi
	jle	.LBB97_25
# %bb.28:                               # %.lr.ph104
	xorl	%ecx, %ecx
	leaq	-319(%rbp), %r9
	leaq	-320(%rbp), %r8
	xorl	%eax, %eax
	xorl	%r11d, %r11d
	jmp	.LBB97_29
	.p2align	4, 0x90
.LBB97_42:                              # %._crit_edge
                                        #   in Loop: Header=BB97_29 Depth=1
	subq	%r8, %rdi
	movb	%r15b, -320(%rbp)
	leal	1(%rdi), %edx
	cltq
	movq	-56(%rbp), %rsi                 # 8-byte Reload
	movw	%dx, (%rsi,%rax,2)
	addl	$1, %eax
	movslq	%edi, %rdx
	addl	$1, 676(%r14,%rdx,4)
	movl	108(%r14), %esi
	addq	$1, %r11
	movslq	%esi, %rdx
	cmpq	%rdx, %r11
	jge	.LBB97_44
.LBB97_29:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB97_41 Depth 2
	movl	(%r12,%r11,4), %edx
	leal	-1(%rdx), %edi
	sarl	$31, %edi
	andl	%esi, %edi
	addl	%edi, %edx
	addl	$-1, %edx
	movslq	%edx, %rdx
	movzbl	(%r13,%rdx), %edx
	movb	384(%r14,%rdx), %r15b
	movb	-320(%rbp), %r10b
	cmpb	%r15b, %r10b
	jne	.LBB97_31
# %bb.30:                               #   in Loop: Header=BB97_29 Depth=1
	addl	$1, %ecx
	addq	$1, %r11
	movslq	%esi, %rdx
	cmpq	%rdx, %r11
	jl	.LBB97_29
	jmp	.LBB97_44
	.p2align	4, 0x90
.LBB97_31:                              #   in Loop: Header=BB97_29 Depth=1
	testl	%ecx, %ecx
	jle	.LBB97_39
# %bb.32:                               #   in Loop: Header=BB97_29 Depth=1
	addl	$-1, %ecx
	cltq
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	leaq	(%rdx,%rax,2), %rsi
	addl	$1, %eax
	testb	$1, %cl
	jne	.LBB97_34
	.p2align	4, 0x90
.LBB97_35:                              #   in Loop: Header=BB97_29 Depth=1
	movw	$0, (%rsi)
	addl	$1, 672(%r14)
	cmpl	$2, %ecx
	jge	.LBB97_37
	jmp	.LBB97_38
	.p2align	4, 0x90
.LBB97_34:                              #   in Loop: Header=BB97_29 Depth=1
	movw	$1, (%rsi)
	addl	$1, 676(%r14)
	cmpl	$2, %ecx
	jl	.LBB97_38
.LBB97_37:                              #   in Loop: Header=BB97_29 Depth=1
	movl	%ecx, %edi
	addl	$-2, %edi
	shrl	$31, %edi
	addl	%edi, %ecx
	addl	$-2, %ecx
	sarl	%ecx
	addq	$2, %rsi
	addl	$1, %eax
	testb	$1, %cl
	jne	.LBB97_34
	jmp	.LBB97_35
	.p2align	4, 0x90
.LBB97_38:                              # %.loopexit88.loopexit
                                        #   in Loop: Header=BB97_29 Depth=1
	xorl	%ecx, %ecx
	movb	-320(%rbp), %r10b
.LBB97_39:                              # %.loopexit88
                                        #   in Loop: Header=BB97_29 Depth=1
	movb	-319(%rbp), %dl
	movb	%r10b, -319(%rbp)
	movq	%r9, %rdi
	cmpb	%dl, %r15b
	je	.LBB97_42
# %bb.40:                               # %.lr.ph.preheader
                                        #   in Loop: Header=BB97_29 Depth=1
	movq	%r9, %rsi
	.p2align	4, 0x90
.LBB97_41:                              # %.lr.ph
                                        #   Parent Loop BB97_29 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	1(%rsi), %rdi
	movzbl	1(%rsi), %ebx
	movb	%dl, 1(%rsi)
	movq	%rdi, %rsi
	movl	%ebx, %edx
	cmpb	%bl, %r15b
	jne	.LBB97_41
	jmp	.LBB97_42
.LBB97_44:                              # %._crit_edge105
	testl	%ecx, %ecx
	jle	.LBB97_50
# %bb.45:
	addl	$-1, %ecx
	cltq
	movq	-56(%rbp), %rdx                 # 8-byte Reload
	leaq	(%rdx,%rax,2), %rdx
	addl	$1, %eax
	testb	$1, %cl
	jne	.LBB97_47
	.p2align	4, 0x90
.LBB97_48:
	movw	$0, (%rdx)
	addl	$1, 672(%r14)
	cmpl	$2, %ecx
	jge	.LBB97_51
	jmp	.LBB97_50
	.p2align	4, 0x90
.LBB97_47:
	movw	$1, (%rdx)
	addl	$1, 676(%r14)
	cmpl	$2, %ecx
	jl	.LBB97_50
.LBB97_51:
	movl	%ecx, %esi
	addl	$-2, %esi
	shrl	$31, %esi
	addl	%esi, %ecx
	addl	$-2, %ecx
	sarl	%ecx
	addq	$2, %rdx
	addl	$1, %eax
	testb	$1, %cl
	jne	.LBB97_47
	jmp	.LBB97_48
.LBB97_25:
	xorl	%eax, %eax
.LBB97_50:
	movl	-44(%rbp), %edx                 # 4-byte Reload
	cltq
	movq	-56(%rbp), %rcx                 # 8-byte Reload
	movw	%dx, (%rcx,%rax,2)
	addl	$1, %eax
	movslq	%edx, %rcx
	addl	$1, 672(%r14,%rcx,4)
	movl	%eax, 668(%r14)
	addq	$280, %rsp                      # imm = 0x118
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end97:
	.size	generateMTFValues, .Lfunc_end97-generateMTFValues
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function sendMTFValues
.LCPI98_0:
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$280, %rsp                      # imm = 0x118
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movq	72(%rdi), %r15
	cmpl	$3, 656(%rdi)
	jge	.LBB98_175
.LBB98_1:
	movl	124(%r14), %eax
	movq	%rax, %rbx
	leal	2(%rax), %r12d
	xorl	%r9d, %r9d
	testl	%r12d, %r12d
	cmovnsl	%r12d, %r9d
	movq	%r9, -112(%rbp)                 # 8-byte Spill
	jle	.LBB98_3
# %bb.2:                                # %.split1775.preheader
	leaq	37708(%r14), %rdi
	movl	$15, %esi
	movq	%r9, %rdx
	callq	memset@PLT
	leaq	37966(%r14), %rdi
	movl	$15, %esi
	movq	-112(%rbp), %rdx                # 8-byte Reload
	callq	memset@PLT
	leaq	38224(%r14), %rdi
	movl	$15, %esi
	movq	-112(%rbp), %rdx                # 8-byte Reload
	callq	memset@PLT
	leaq	38482(%r14), %rdi
	movl	$15, %esi
	movq	-112(%rbp), %rdx                # 8-byte Reload
	callq	memset@PLT
	leaq	38740(%r14), %rdi
	movl	$15, %esi
	movq	-112(%rbp), %rdx                # 8-byte Reload
	callq	memset@PLT
	leaq	38998(%r14), %rdi
	movl	$15, %esi
	movq	-112(%rbp), %rdx                # 8-byte Reload
	callq	memset@PLT
	movq	-112(%rbp), %r9                 # 8-byte Reload
.LBB98_3:                               # %.us-lcssa1776.us
	movl	668(%r14), %r11d
	testl	%r11d, %r11d
	jle	.LBB98_202
# %bb.4:
	movl	$2, %eax
	cmpl	$200, %r11d
	jl	.LBB98_7
# %bb.5:
	movl	$3, %eax
	cmpl	$600, %r11d                     # imm = 0x258
	jl	.LBB98_7
# %bb.6:
	xorl	%eax, %eax
	cmpl	$2400, %r11d                    # imm = 0x960
	setl	%al
	movl	$6, %ecx
	subl	%eax, %ecx
	cmpl	$1200, %r11d                    # imm = 0x4B0
	movl	$4, %eax
	cmovgel	%ecx, %eax
.LBB98_7:
	movq	%r15, -48(%rbp)                 # 8-byte Spill
	movq	%rbx, %rcx
	addl	$1, %ecx
	movl	%r9d, %ebx
	andl	$2147483646, %ebx               # imm = 0x7FFFFFFE
	movl	%eax, %r8d
	movslq	%ecx, %rdi
	movl	%r12d, -52(%rbp)                # 4-byte Spill
	testl	%r12d, %r12d
	movq	%r8, -88(%rbp)                  # 8-byte Spill
	movq	%rbx, -152(%rbp)                # 8-byte Spill
	movq	%rcx, -64(%rbp)                 # 8-byte Spill
	movq	%rdi, -120(%rbp)                # 8-byte Spill
	jle	.LBB98_31
# %bb.8:                                # %..split2114_crit_edge.preheader
	movq	%r8, %rax
	shlq	$8, %rax
	leaq	(%rax,%r8,2), %rax
	leaq	(%r14,%rax), %r13
	addq	$37451, %r13                    # imm = 0x924B
	xorl	%esi, %esi
	jmp	.LBB98_11
	.p2align	4, 0x90
.LBB98_9:                               #   in Loop: Header=BB98_11 Depth=1
	movq	%r8, %rax
	shlq	$8, %rax
	leaq	(%rax,%r8,2), %rax
	addq	%r14, %rax
	movb	$15, 37708(%rcx,%rax)
.LBB98_10:                              # %._crit_edge1760
                                        #   in Loop: Header=BB98_11 Depth=1
	addl	$1, %r12d
	subl	%r15d, %r11d
	addq	$-258, %r13                     # imm = 0xFEFE
	movl	%r12d, %esi
	cmpq	$1, %r10
	jle	.LBB98_45
.LBB98_11:                              # %..split2114_crit_edge
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_13 Depth 2
                                        #     Child Loop BB98_25 Depth 2
	movq	%r8, %r10
	movl	%r11d, %eax
	cltd
	idivl	%r10d
	leal	-1(%rsi), %ecx
	movslq	%ecx, %r12
	cmpl	-64(%rbp), %esi                 # 4-byte Folded Reload
	jg	.LBB98_16
# %bb.12:                               # %..split2114_crit_edge
                                        #   in Loop: Header=BB98_11 Depth=1
	xorl	%r15d, %r15d
	testl	%eax, %eax
	jle	.LBB98_15
	.p2align	4, 0x90
.LBB98_13:                              # %.lr.ph1752
                                        #   Parent Loop BB98_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addl	676(%r14,%r12,4), %r15d
	addq	$1, %r12
	cmpq	%rdi, %r12
	jge	.LBB98_15
# %bb.14:                               # %.lr.ph1752
                                        #   in Loop: Header=BB98_13 Depth=2
	cmpl	%eax, %r15d
	jl	.LBB98_13
.LBB98_15:                              # %.thread
                                        #   in Loop: Header=BB98_11 Depth=1
	cmpq	$1, %r10
	jne	.LBB98_17
	jmp	.LBB98_21
	.p2align	4, 0x90
.LBB98_16:                              #   in Loop: Header=BB98_11 Depth=1
	xorl	%r15d, %r15d
	cmpq	$1, %r10
	je	.LBB98_21
.LBB98_17:                              # %.thread
                                        #   in Loop: Header=BB98_11 Depth=1
	cmpq	-88(%rbp), %r10                 # 8-byte Folded Reload
	je	.LBB98_21
# %bb.18:                               # %.thread
                                        #   in Loop: Header=BB98_11 Depth=1
	cmpl	%r12d, %esi
	jge	.LBB98_21
# %bb.19:                               #   in Loop: Header=BB98_11 Depth=1
	movq	-88(%rbp), %rax                 # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	subl	%r10d, %eax
	testb	$1, %al
	je	.LBB98_21
# %bb.20:                               #   in Loop: Header=BB98_11 Depth=1
	movslq	%r12d, %rax
	leal	-1(%r12), %ecx
	subl	672(%r14,%rax,4), %r15d
	movl	%ecx, %r12d
.LBB98_21:                              #   in Loop: Header=BB98_11 Depth=1
	cmpl	$3, 656(%r14)
	jge	.LBB98_30
.LBB98_22:                              # %.lr.ph1759
                                        #   in Loop: Header=BB98_11 Depth=1
	leaq	-1(%r10), %r8
	movslq	%esi, %rsi
	movslq	%r12d, %rdx
	cmpl	$1, %r9d
	jne	.LBB98_24
# %bb.23:                               #   in Loop: Header=BB98_11 Depth=1
	xorl	%ecx, %ecx
	jmp	.LBB98_27
	.p2align	4, 0x90
.LBB98_24:                              # %.lr.ph1759.new.preheader
                                        #   in Loop: Header=BB98_11 Depth=1
	movq	%r10, -104(%rbp)                # 8-byte Spill
	movl	$15, %r10d
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB98_25:                              # %.lr.ph1759.new
                                        #   Parent Loop BB98_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	1(%rcx), %rdi
	cmpq	%rsi, %rdi
	movl	$15, %edi
	cmovgel	%r9d, %edi
	cmpq	%rdx, %rcx
	movl	$15, %eax
	cmovlel	%r9d, %eax
	cmovgel	%r10d, %edi
	cmpq	%rsi, %rcx
	cmovll	%r10d, %eax
	movb	%al, -1(%r13,%rcx)
	movb	%dil, (%r13,%rcx)
	addq	$2, %rcx
	cmpq	%rcx, %rbx
	jne	.LBB98_25
# %bb.26:                               # %._crit_edge1760.loopexit.unr-lcssa
                                        #   in Loop: Header=BB98_11 Depth=1
	movq	-112(%rbp), %r9                 # 8-byte Reload
	testb	$1, %r9b
	movq	-120(%rbp), %rdi                # 8-byte Reload
	movq	-104(%rbp), %r10                # 8-byte Reload
	je	.LBB98_10
.LBB98_27:                              # %.epil.preheader1794
                                        #   in Loop: Header=BB98_11 Depth=1
	cmpq	%rsi, %rcx
	jl	.LBB98_9
# %bb.28:                               # %.epil.preheader1794
                                        #   in Loop: Header=BB98_11 Depth=1
	cmpq	%rdx, %rcx
	jg	.LBB98_9
# %bb.29:                               #   in Loop: Header=BB98_11 Depth=1
	movq	%r8, %rax
	shlq	$8, %rax
	leaq	(%rax,%r8,2), %rax
	addq	%r14, %rax
	movb	$0, 37708(%rcx,%rax)
	jmp	.LBB98_10
.LBB98_30:                              #   in Loop: Header=BB98_11 Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2ss	%r15d, %xmm0
	movq	stderr(%rip), %rdi
	xorps	%xmm1, %xmm1
	cvtsi2ssl	668(%r14), %xmm1
	cvtss2sd	%xmm0, %xmm0
	mulsd	.LCPI98_0(%rip), %xmm0
	cvtss2sd	%xmm1, %xmm1
	divsd	%xmm1, %xmm0
	movq	%rsi, %rbx
	movl	$.L.str.3.146, %esi
	movl	%r10d, %edx
	movl	%ebx, %ecx
	movl	%r12d, %r8d
	movl	%r15d, %r9d
	movb	$1, %al
	movl	%r11d, -96(%rbp)                # 4-byte Spill
	movq	%r10, -104(%rbp)                # 8-byte Spill
	callq	fprintf
	movq	%rbx, %rsi
	movq	-104(%rbp), %r10                # 8-byte Reload
	movq	-120(%rbp), %rdi                # 8-byte Reload
	movl	-96(%rbp), %r11d                # 4-byte Reload
	movq	-152(%rbp), %rbx                # 8-byte Reload
	movq	-112(%rbp), %r9                 # 8-byte Reload
	jmp	.LBB98_22
.LBB98_31:                              # %.split2114.us.preheader
	xorl	%ecx, %ecx
	movq	%r8, %r15
	jmp	.LBB98_34
	.p2align	4, 0x90
.LBB98_32:                              #   in Loop: Header=BB98_34 Depth=1
	cmpl	$3, 656(%r14)
	jge	.LBB98_44
.LBB98_33:                              # %.._crit_edge1760_crit_edge.us
                                        #   in Loop: Header=BB98_34 Depth=1
	leaq	-1(%r15), %rax
	addl	$1, %r12d
	subl	%r13d, %r11d
	movl	%r12d, %ecx
	cmpq	$1, %r15
	movq	%rax, %r15
	jle	.LBB98_45
.LBB98_34:                              # %.split2114.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_36 Depth 2
	movl	%r11d, %eax
	cltd
	idivl	%r15d
	leal	-1(%rcx), %edx
	movslq	%edx, %r12
	cmpl	-64(%rbp), %ecx                 # 4-byte Folded Reload
	jg	.LBB98_43
# %bb.35:                               # %.split2114.us
                                        #   in Loop: Header=BB98_34 Depth=1
	xorl	%r13d, %r13d
	testl	%eax, %eax
	jle	.LBB98_38
	.p2align	4, 0x90
.LBB98_36:                              # %.lr.ph1752.us
                                        #   Parent Loop BB98_34 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addl	676(%r14,%r12,4), %r13d
	addq	$1, %r12
	cmpq	%rdi, %r12
	jge	.LBB98_38
# %bb.37:                               # %.lr.ph1752.us
                                        #   in Loop: Header=BB98_36 Depth=2
	cmpl	%eax, %r13d
	jl	.LBB98_36
.LBB98_38:                              # %.thread.us
                                        #   in Loop: Header=BB98_34 Depth=1
	cmpq	$1, %r15
	je	.LBB98_32
.LBB98_39:                              # %.thread.us
                                        #   in Loop: Header=BB98_34 Depth=1
	cmpq	-88(%rbp), %r15                 # 8-byte Folded Reload
	je	.LBB98_32
# %bb.40:                               # %.thread.us
                                        #   in Loop: Header=BB98_34 Depth=1
	cmpl	%r12d, %ecx
	jge	.LBB98_32
# %bb.41:                               #   in Loop: Header=BB98_34 Depth=1
	movq	-88(%rbp), %rax                 # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	subl	%r15d, %eax
	testb	$1, %al
	je	.LBB98_32
# %bb.42:                               #   in Loop: Header=BB98_34 Depth=1
	movslq	%r12d, %rax
	leal	-1(%r12), %edx
	subl	672(%r14,%rax,4), %r13d
	movl	%edx, %r12d
	jmp	.LBB98_32
	.p2align	4, 0x90
.LBB98_43:                              #   in Loop: Header=BB98_34 Depth=1
	xorl	%r13d, %r13d
	cmpq	$1, %r15
	jne	.LBB98_39
	jmp	.LBB98_32
.LBB98_44:                              #   in Loop: Header=BB98_34 Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2ss	%r13d, %xmm0
	movq	stderr(%rip), %rdi
	xorps	%xmm1, %xmm1
	cvtsi2ssl	668(%r14), %xmm1
	cvtss2sd	%xmm0, %xmm0
	mulsd	.LCPI98_0(%rip), %xmm0
	cvtss2sd	%xmm1, %xmm1
	divsd	%xmm1, %xmm0
	movl	$.L.str.3.146, %esi
	movl	%r15d, %edx
                                        # kill: def $ecx killed $ecx killed $rcx
	movl	%r12d, %r8d
	movl	%r13d, %r9d
	movb	$1, %al
	movl	%r11d, %ebx
	callq	fprintf
	movq	-120(%rbp), %rdi                # 8-byte Reload
	movl	%ebx, %r11d
	movq	-112(%rbp), %r9                 # 8-byte Reload
	jmp	.LBB98_33
.LBB98_45:                              # %.preheader1647
	movl	-52(%rbp), %r13d                # 4-byte Reload
	testl	%r13d, %r13d
	setg	%al
	movq	-88(%rbp), %r12                 # 8-byte Reload
	cmpl	$6, %r12d
	sete	%cl
	leaq	(,%r12,4), %rdx
	movq	%rdx, -248(%rbp)                # 8-byte Spill
	leaq	(,%r9,4), %rdx
	movq	%rdx, -136(%rbp)                # 8-byte Spill
	leaq	(%r12,%r12), %rdx
	movq	%rdx, -264(%rbp)                # 8-byte Spill
	leaq	45448(%r14), %rdx
	movq	%rdx, -176(%rbp)                # 8-byte Spill
	leaq	46480(%r14), %rdx
	movq	%rdx, -240(%rbp)                # 8-byte Spill
	leaq	47512(%r14), %rdx
	movq	%rdx, -224(%rbp)                # 8-byte Spill
	leaq	48544(%r14), %rdx
	movq	%rdx, -216(%rbp)                # 8-byte Spill
	leaq	49576(%r14), %rdx
	movq	%rdx, -208(%rbp)                # 8-byte Spill
	leaq	50608(%r14), %rdx
	movq	%rdx, -200(%rbp)                # 8-byte Spill
	leaq	51640(%r14), %rdx
	movq	%rdx, -192(%rbp)                # 8-byte Spill
	andb	%al, %cl
	movb	%cl, -77(%rbp)                  # 1-byte Spill
	leaq	51648(%r14), %rax
	movq	%rax, -232(%rbp)                # 8-byte Spill
	leaq	37708(%r14), %rax
	movq	%rax, -168(%rbp)                # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -160(%rbp)                # 8-byte Spill
	movq	%r14, -184(%rbp)                # 8-byte Spill
	.p2align	4, 0x90
.LBB98_46:                              # %.preheader1646
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_54 Depth 2
                                        #     Child Loop BB98_59 Depth 2
                                        #       Child Loop BB98_89 Depth 3
                                        #       Child Loop BB98_87 Depth 3
                                        #       Child Loop BB98_83 Depth 3
                                        #       Child Loop BB98_74 Depth 3
                                        #       Child Loop BB98_66 Depth 3
                                        #       Child Loop BB98_77 Depth 3
                                        #       Child Loop BB98_103 Depth 3
                                        #     Child Loop BB98_111 Depth 2
                                        #     Child Loop BB98_108 Depth 2
	leaq	-320(%rbp), %rdi
	xorl	%esi, %esi
	movq	-248(%rbp), %rdx                # 8-byte Reload
	callq	memset@PLT
	testl	%r13d, %r13d
	movq	-48(%rbp), %r15                 # 8-byte Reload
	jle	.LBB98_52
# %bb.47:                               # %.preheader1645.split.1
                                        #   in Loop: Header=BB98_46 Depth=1
	movq	-176(%rbp), %rdi                # 8-byte Reload
	xorl	%esi, %esi
	movq	-136(%rbp), %rbx                # 8-byte Reload
	movq	%rbx, %rdx
	callq	memset@PLT
	movq	-240(%rbp), %rdi                # 8-byte Reload
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	memset@PLT
	cmpl	$2, %r12d
	je	.LBB98_52
# %bb.48:                               # %.preheader1645.split.2
                                        #   in Loop: Header=BB98_46 Depth=1
	movq	-224(%rbp), %rdi                # 8-byte Reload
	xorl	%esi, %esi
	movq	-136(%rbp), %rdx                # 8-byte Reload
	callq	memset@PLT
	cmpl	$3, %r12d
	je	.LBB98_52
# %bb.49:                               # %.preheader1645.split.3
                                        #   in Loop: Header=BB98_46 Depth=1
	movq	-216(%rbp), %rdi                # 8-byte Reload
	xorl	%esi, %esi
	movq	-136(%rbp), %rdx                # 8-byte Reload
	callq	memset@PLT
	cmpl	$4, %r12d
	je	.LBB98_52
# %bb.50:                               # %.preheader1645.split.4
                                        #   in Loop: Header=BB98_46 Depth=1
	movq	-208(%rbp), %rdi                # 8-byte Reload
	xorl	%esi, %esi
	movq	-136(%rbp), %rdx                # 8-byte Reload
	callq	memset@PLT
	cmpl	$5, %r12d
	je	.LBB98_52
# %bb.51:                               # %.preheader1645.split.5
                                        #   in Loop: Header=BB98_46 Depth=1
	movq	-200(%rbp), %rdi                # 8-byte Reload
	xorl	%esi, %esi
	movq	-136(%rbp), %rdx                # 8-byte Reload
	callq	memset@PLT
	cmpl	$6, %r12d
	jne	.LBB98_104
	.p2align	4, 0x90
.LBB98_52:                              # %.us-lcssa1774.us
                                        #   in Loop: Header=BB98_46 Depth=1
	cmpb	$0, -77(%rbp)                   # 1-byte Folded Reload
	movq	-112(%rbp), %rdi                # 8-byte Reload
	je	.LBB98_55
# %bb.53:                               # %.lr.ph1718.preheader
                                        #   in Loop: Header=BB98_46 Depth=1
	movq	-232(%rbp), %rax                # 8-byte Reload
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB98_54:                              # %.lr.ph1718
                                        #   Parent Loop BB98_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	37966(%r14,%rcx), %edx
	shll	$16, %edx
	movzbl	37708(%r14,%rcx), %esi
	orl	%edx, %esi
	movl	%esi, -8(%rax)
	movzbl	38482(%r14,%rcx), %edx
	shll	$16, %edx
	movzbl	38224(%r14,%rcx), %esi
	orl	%edx, %esi
	movl	%esi, -4(%rax)
	movzbl	38998(%r14,%rcx), %edx
	shll	$16, %edx
	movzbl	38740(%r14,%rcx), %esi
	orl	%edx, %esi
	movl	%esi, (%rax)
	addq	$1, %rcx
	addq	$16, %rax
	cmpq	%rcx, %rdi
	jne	.LBB98_54
.LBB98_55:                              # %.loopexit1497
                                        #   in Loop: Header=BB98_46 Depth=1
	movl	668(%r14), %ebx
	xorl	%eax, %eax
	testl	%ebx, %ebx
	jle	.LBB98_105
.LBB98_56:                              # %.lr.ph1740.preheader
                                        #   in Loop: Header=BB98_46 Depth=1
	movq	%rax, -120(%rbp)                # 8-byte Spill
	xorl	%eax, %eax
	xorl	%r10d, %r10d
	xorl	%ecx, %ecx
	movq	%rcx, -104(%rbp)                # 8-byte Spill
	jmp	.LBB98_59
	.p2align	4, 0x90
.LBB98_57:                              #   in Loop: Header=BB98_59 Depth=2
	movslq	%r9d, %rdx
	movzwl	(%r15,%rdx,2), %edi
	movq	%rbx, %rcx
	shlq	$10, %rcx
	leaq	(%rcx,%rbx,8), %rcx
	addq	%r14, %rcx
	addl	$1, 45448(%rcx,%rdi,4)
	movzwl	2(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	4(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	6(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	8(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	10(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	12(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	14(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	16(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	18(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	20(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	22(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	24(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	26(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	28(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	30(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	32(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	34(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	36(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	38(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	40(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	42(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	44(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	46(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	48(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	50(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	52(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	54(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	56(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	58(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	60(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	62(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	64(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	66(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	68(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	70(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	72(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	74(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	76(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	78(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	80(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	82(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	84(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	86(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	88(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	90(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	92(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	94(%r15,%rdx,2), %esi
	addl	$1, 45448(%rcx,%rsi,4)
	movzwl	96(%r15,%rdx,2), %edx
	addl	$1, 45448(%rcx,%rdx,4)
	movslq	-140(%rbp), %rdx                # 4-byte Folded Reload
	movzwl	(%r15,%rdx,2), %edx
	addl	$1, 45448(%rcx,%rdx,4)
.LBB98_58:                              # %.loopexit1495
                                        #   in Loop: Header=BB98_59 Depth=2
	movzwl	%ax, %eax
	addl	%eax, %r10d
	addq	$1, %r11
	movq	%r11, -104(%rbp)                # 8-byte Spill
	leal	1(%r8), %eax
	notl	%r8d
	movl	668(%r14), %ebx
                                        # kill: def $r8d killed $r8d killed $r8 def $r8
	movq	%r8, -120(%rbp)                 # 8-byte Spill
	cmpl	%ebx, %eax
	jge	.LBB98_106
.LBB98_59:                              # %.lr.ph1740
                                        #   Parent Loop BB98_46 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB98_89 Depth 3
                                        #       Child Loop BB98_87 Depth 3
                                        #       Child Loop BB98_83 Depth 3
                                        #       Child Loop BB98_74 Depth 3
                                        #       Child Loop BB98_66 Depth 3
                                        #       Child Loop BB98_77 Depth 3
                                        #       Child Loop BB98_103 Depth 3
	movq	%r10, -96(%rbp)                 # 8-byte Spill
	movq	%r12, %r14
	movq	%rax, -64(%rbp)                 # 8-byte Spill
	leal	49(%rax), %r12d
	leal	-1(%rbx), %r13d
	leaq	-76(%rbp), %rdi
	xorl	%esi, %esi
	movq	-264(%rbp), %rdx                # 8-byte Reload
	callq	memset@PLT
	movq	%r13, %r8
	cmpl	%ebx, %r12d
	movl	%r12d, -140(%rbp)               # 4-byte Spill
	cmovll	%r12d, %r8d
	movq	%r14, %r12
	cmpl	$6, %r12d
	jne	.LBB98_62
# %bb.60:                               #   in Loop: Header=BB98_59 Depth=2
	movq	-120(%rbp), %rax                # 8-byte Reload
	addl	%r8d, %eax
	cmpl	$49, %eax
	jne	.LBB98_62
# %bb.61:                               #   in Loop: Header=BB98_59 Depth=2
	movq	-64(%rbp), %r9                  # 8-byte Reload
	movslq	%r9d, %rsi
	movzwl	(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	movzwl	2(%r15,%rsi,2), %ecx
	shlq	$4, %rcx
	movq	-184(%rbp), %r14                # 8-byte Reload
	movl	51640(%r14,%rcx), %eax
	movl	51644(%r14,%rcx), %edx
	movl	51648(%r14,%rcx), %ecx
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	4(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	6(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	8(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	10(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	12(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	14(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	16(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	18(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	20(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	22(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	24(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	26(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	28(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	30(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	32(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	34(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	36(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	38(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	40(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	42(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	44(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	46(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	48(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	50(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	52(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	54(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	56(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	58(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	60(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	62(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	64(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	66(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	68(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	70(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	72(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	74(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	76(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	78(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	80(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	82(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	84(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	86(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	88(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	90(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	92(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	94(%r15,%rsi,2), %edi
	shlq	$4, %rdi
	addl	51640(%r14,%rdi), %eax
	addl	51644(%r14,%rdi), %edx
	addl	51648(%r14,%rdi), %ecx
	movzwl	96(%r15,%rsi,2), %esi
	shlq	$4, %rsi
	addl	51640(%r14,%rsi), %eax
	addl	51644(%r14,%rsi), %edx
	addl	51648(%r14,%rsi), %ecx
	movslq	-140(%rbp), %rsi                # 4-byte Folded Reload
	movzwl	(%r15,%rsi,2), %esi
	shlq	$4, %rsi
	addl	51640(%r14,%rsi), %eax
	addl	51644(%r14,%rsi), %edx
	addl	51648(%r14,%rsi), %ecx
	movw	%ax, -76(%rbp)
	movl	%eax, %esi
	shrl	$16, %esi
	movw	%si, -74(%rbp)
	movw	%dx, -72(%rbp)
	shrl	$16, %edx
	movw	%dx, -70(%rbp)
	movw	%cx, -68(%rbp)
	shrl	$16, %ecx
	movw	%cx, -66(%rbp)
	movq	-96(%rbp), %r10                 # 8-byte Reload
	movq	-104(%rbp), %r11                # 8-byte Reload
	jmp	.LBB98_91
	.p2align	4, 0x90
.LBB98_62:                              #   in Loop: Header=BB98_59 Depth=2
	movq	-64(%rbp), %r9                  # 8-byte Reload
	cmpl	%r8d, %r9d
	movq	-184(%rbp), %r14                # 8-byte Reload
	movq	-104(%rbp), %r11                # 8-byte Reload
	jle	.LBB98_64
# %bb.63:                               # %..loopexit1496_crit_edge
                                        #   in Loop: Header=BB98_59 Depth=2
	movzwl	-76(%rbp), %eax
	movzwl	-74(%rbp), %esi
	movq	-96(%rbp), %r10                 # 8-byte Reload
	jmp	.LBB98_91
	.p2align	4, 0x90
.LBB98_64:                              # %.lr.ph1724.preheader
                                        #   in Loop: Header=BB98_59 Depth=2
	movslq	%r9d, %rcx
	movq	%r9, %rdi
	movslq	%r8d, %r9
	movzwl	-76(%rbp), %eax
	movzwl	-74(%rbp), %esi
	movzwl	-72(%rbp), %ebx
	movzwl	-70(%rbp), %r13d
	movzwl	-68(%rbp), %r11d
	movq	%r8, %rdx
	movzwl	-66(%rbp), %r8d
	cmpl	$2, %r12d
	movq	%rdx, -256(%rbp)                # 8-byte Spill
	jne	.LBB98_69
# %bb.65:                               # %.lr.ph1724.preheader.split.us.preheader
                                        #   in Loop: Header=BB98_59 Depth=2
                                        # kill: def $edx killed $edx killed $rdx def $rdx
	subl	%edi, %edx
	addl	$1, %edx
	movq	%r9, %r10
	subq	%rcx, %r10
	andq	$3, %rdx
	je	.LBB98_67
	.p2align	4, 0x90
.LBB98_66:                              # %.lr.ph1724.preheader.split.us.prol
                                        #   Parent Loop BB98_46 Depth=1
                                        #     Parent Loop BB98_59 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-48(%rbp), %rdi                 # 8-byte Reload
	movzwl	(%rdi,%rcx,2), %r12d
	movzbl	37708(%r14,%r12), %r15d
	addl	%r15d, %eax
	movzbl	37966(%r14,%r12), %edi
	movq	-48(%rbp), %r15                 # 8-byte Reload
	addl	%edi, %esi
	addq	$1, %rcx
	addq	$-1, %rdx
	jne	.LBB98_66
.LBB98_67:                              # %.lr.ph1724.preheader.split.us.prol.loopexit
                                        #   in Loop: Header=BB98_59 Depth=2
	cmpq	$3, %r10
	jae	.LBB98_76
# %bb.68:                               #   in Loop: Header=BB98_59 Depth=2
	movq	-88(%rbp), %r12                 # 8-byte Reload
	movq	-96(%rbp), %r10                 # 8-byte Reload
	jmp	.LBB98_90
.LBB98_69:                              # %.lr.ph1724.preheader..lr.ph1724.preheader.split_crit_edge
                                        #   in Loop: Header=BB98_59 Depth=2
	cmpl	$3, %r12d
	jne	.LBB98_78
# %bb.70:                               # %.lr.ph1724.preheader.split.split.us.preheader
                                        #   in Loop: Header=BB98_59 Depth=2
	leaq	1(%r9), %r10
	movl	%r10d, %edx
	subl	-64(%rbp), %edx                 # 4-byte Folded Reload
	subq	%rcx, %r9
	testb	$1, %dl
	je	.LBB98_72
# %bb.71:                               # %.lr.ph1724.preheader.split.split.us.prol
                                        #   in Loop: Header=BB98_59 Depth=2
	movzwl	(%r15,%rcx,2), %edx
	movzbl	37708(%r14,%rdx), %edi
	addl	%edi, %eax
	movzbl	37966(%r14,%rdx), %edi
	addl	%edi, %esi
	movzbl	38224(%r14,%rdx), %edx
	addl	%edx, %ebx
	addq	$1, %rcx
.LBB98_72:                              # %.lr.ph1724.preheader.split.split.us.prol.loopexit
                                        #   in Loop: Header=BB98_59 Depth=2
	testq	%r9, %r9
	je	.LBB98_73
	.p2align	4, 0x90
.LBB98_74:                              # %.lr.ph1724.preheader.split.split.us
                                        #   Parent Loop BB98_46 Depth=1
                                        #     Parent Loop BB98_59 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movzwl	(%r15,%rcx,2), %edx
	movzbl	37708(%r14,%rdx), %edi
	addl	%edi, %eax
	movzbl	37966(%r14,%rdx), %edi
	addl	%edi, %esi
	movzbl	38224(%r14,%rdx), %edx
	addl	%edx, %ebx
	movzwl	2(%r15,%rcx,2), %edx
	movzbl	37708(%r14,%rdx), %edi
	addl	%eax, %edi
	movl	%edi, %eax
	movzbl	37966(%r14,%rdx), %edi
	addl	%esi, %edi
	movl	%edi, %esi
	movzbl	38224(%r14,%rdx), %edx
	addl	%ebx, %edx
	movl	%edx, %ebx
	addq	$2, %rcx
	cmpq	%rcx, %r10
	jne	.LBB98_74
	jmp	.LBB98_73
.LBB98_76:                              # %.lr.ph1724.preheader.split.us.preheader12
                                        #   in Loop: Header=BB98_59 Depth=2
	addq	$-1, %rcx
	movq	-88(%rbp), %r12                 # 8-byte Reload
	movq	-96(%rbp), %r10                 # 8-byte Reload
	.p2align	4, 0x90
.LBB98_77:                              # %.lr.ph1724.preheader.split.us
                                        #   Parent Loop BB98_46 Depth=1
                                        #     Parent Loop BB98_59 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movzwl	2(%r15,%rcx,2), %edx
	movzbl	37708(%r14,%rdx), %edi
	addl	%edi, %eax
	movzbl	37966(%r14,%rdx), %edx
	addl	%edx, %esi
	movzwl	4(%r15,%rcx,2), %edx
	movzbl	37708(%r14,%rdx), %edi
	addl	%eax, %edi
	movzbl	37966(%r14,%rdx), %eax
	addl	%esi, %eax
	movzwl	6(%r15,%rcx,2), %edx
	movzbl	37708(%r14,%rdx), %esi
	addl	%edi, %esi
	movzbl	37966(%r14,%rdx), %edx
	addl	%eax, %edx
	movzwl	8(%r15,%rcx,2), %edi
	movzbl	37708(%r14,%rdi), %eax
	addl	%esi, %eax
	movzbl	37966(%r14,%rdi), %esi
	addl	%edx, %esi
	addq	$4, %rcx
	cmpq	%rcx, %r9
	jne	.LBB98_77
	jmp	.LBB98_90
.LBB98_78:                              # %.lr.ph1724.preheader.split..lr.ph1724.preheader.split.split_crit_edge
                                        #   in Loop: Header=BB98_59 Depth=2
	cmpl	$4, %r12d
	jne	.LBB98_85
# %bb.79:                               # %.lr.ph1724.preheader.split.split.split.us.preheader
                                        #   in Loop: Header=BB98_59 Depth=2
	leaq	1(%r9), %r10
	movl	%r10d, %edx
	subl	-64(%rbp), %edx                 # 4-byte Folded Reload
	subq	%rcx, %r9
	testb	$1, %dl
	je	.LBB98_81
# %bb.80:                               # %.lr.ph1724.preheader.split.split.split.us.prol
                                        #   in Loop: Header=BB98_59 Depth=2
	movzwl	(%r15,%rcx,2), %edx
	movzbl	37708(%r14,%rdx), %edi
	addl	%edi, %eax
	movzbl	37966(%r14,%rdx), %edi
	addl	%edi, %esi
	movzbl	38224(%r14,%rdx), %edi
	addl	%edi, %ebx
	movzbl	38482(%r14,%rdx), %edx
	addl	%edx, %r13d
	addq	$1, %rcx
.LBB98_81:                              # %.lr.ph1724.preheader.split.split.split.us.prol.loopexit
                                        #   in Loop: Header=BB98_59 Depth=2
	testq	%r9, %r9
	je	.LBB98_73
	.p2align	4, 0x90
.LBB98_83:                              # %.lr.ph1724.preheader.split.split.split.us
                                        #   Parent Loop BB98_46 Depth=1
                                        #     Parent Loop BB98_59 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movzwl	(%r15,%rcx,2), %edx
	movzbl	37708(%r14,%rdx), %edi
	addl	%edi, %eax
	movzbl	37966(%r14,%rdx), %edi
	addl	%edi, %esi
	movzbl	38224(%r14,%rdx), %edi
	addl	%edi, %ebx
	movzbl	38482(%r14,%rdx), %edx
	addl	%edx, %r13d
	movzwl	2(%r15,%rcx,2), %edx
	movzbl	37708(%r14,%rdx), %edi
	addl	%eax, %edi
	movl	%edi, %eax
	movzbl	37966(%r14,%rdx), %edi
	addl	%esi, %edi
	movl	%edi, %esi
	movzbl	38224(%r14,%rdx), %edi
	addl	%ebx, %edi
	movl	%edi, %ebx
	movzbl	38482(%r14,%rdx), %edx
	addl	%r13d, %edx
	movl	%edx, %r13d
	addq	$2, %rcx
	cmpq	%rcx, %r10
	jne	.LBB98_83
.LBB98_73:                              #   in Loop: Header=BB98_59 Depth=2
	movq	-96(%rbp), %r10                 # 8-byte Reload
.LBB98_90:                              # %.loopexit1496.loopexit
                                        #   in Loop: Header=BB98_59 Depth=2
	movw	%ax, -76(%rbp)
	movw	%si, -74(%rbp)
	movw	%bx, -72(%rbp)
	movw	%r13w, -70(%rbp)
	movw	%r11w, -68(%rbp)
	movw	%r8w, -66(%rbp)
	movq	-104(%rbp), %r11                # 8-byte Reload
	movq	-256(%rbp), %r8                 # 8-byte Reload
	movq	-64(%rbp), %r9                  # 8-byte Reload
.LBB98_91:                              # %.loopexit1496
                                        #   in Loop: Header=BB98_59 Depth=2
	xorl	%ecx, %ecx
	cmpw	%si, %ax
	seta	%cl
	cmoval	%esi, %eax
	cmpl	$2, %r12d
	je	.LBB98_97
# %bb.92:                               #   in Loop: Header=BB98_59 Depth=2
	movzwl	-72(%rbp), %edx
	cmpw	%dx, %ax
	cmovael	%edx, %eax
	movl	$2, %edx
	cmoval	%edx, %ecx
	cmpl	$3, %r12d
	je	.LBB98_97
# %bb.93:                               #   in Loop: Header=BB98_59 Depth=2
	movzwl	-70(%rbp), %edx
	cmpw	%dx, %ax
	cmovael	%edx, %eax
	movl	$3, %edx
	cmoval	%edx, %ecx
	cmpl	$4, %r12d
	je	.LBB98_97
# %bb.94:                               #   in Loop: Header=BB98_59 Depth=2
	movzwl	-68(%rbp), %edx
	cmpw	%dx, %ax
	cmovael	%edx, %eax
	movl	$4, %edx
	cmoval	%edx, %ecx
	cmpl	$5, %r12d
	je	.LBB98_97
# %bb.95:                               #   in Loop: Header=BB98_59 Depth=2
	movzwl	-66(%rbp), %edx
	cmpw	%dx, %ax
	cmovael	%edx, %eax
	movl	$5, %edx
	cmoval	%edx, %ecx
	cmpl	$6, %r12d
	je	.LBB98_97
# %bb.96:                               #   in Loop: Header=BB98_59 Depth=2
	testw	%ax, %ax
	movl	$6, %eax
	cmovnel	%eax, %ecx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB98_97:                              #   in Loop: Header=BB98_59 Depth=2
	movl	%ecx, %ebx
	addl	$1, -320(%rbp,%rbx,4)
	movb	%cl, 1704(%r14,%r11)
	cmpl	$6, %r12d
	jne	.LBB98_99
# %bb.98:                               #   in Loop: Header=BB98_59 Depth=2
	movq	-120(%rbp), %rcx                # 8-byte Reload
	addl	%r8d, %ecx
	cmpl	$49, %ecx
	je	.LBB98_57
.LBB98_99:                              #   in Loop: Header=BB98_59 Depth=2
	cmpl	%r8d, %r9d
	jg	.LBB98_58
# %bb.100:                              # %.lr.ph1731.preheader
                                        #   in Loop: Header=BB98_59 Depth=2
	movslq	%r9d, %rcx
	movslq	%r8d, %rdx
	addq	$1, %rdx
	movl	%edx, %edi
	subl	%r9d, %edi
	testb	$1, %dil
	je	.LBB98_102
# %bb.101:                              # %.lr.ph1731.prol.preheader
                                        #   in Loop: Header=BB98_59 Depth=2
	movzwl	(%r15,%rcx,2), %edi
	movq	%rbx, %rsi
	shlq	$10, %rsi
	leaq	(%rsi,%rbx,8), %rsi
	addq	%r14, %rsi
	addl	$1, 45448(%rsi,%rdi,4)
	addq	$1, %rcx
.LBB98_102:                             # %.lr.ph1731.prol.loopexit.unr-lcssa
                                        #   in Loop: Header=BB98_59 Depth=2
	cmpl	%r9d, %r8d
	je	.LBB98_58
	.p2align	4, 0x90
.LBB98_103:                             # %.lr.ph1731
                                        #   Parent Loop BB98_46 Depth=1
                                        #     Parent Loop BB98_59 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movzwl	(%r15,%rcx,2), %esi
	movq	%rbx, %rdi
	shlq	$10, %rdi
	leaq	(%rdi,%rbx,8), %rdi
	addq	%r14, %rdi
	addl	$1, 45448(%rdi,%rsi,4)
	movzwl	2(%r15,%rcx,2), %esi
	addl	$1, 45448(%rdi,%rsi,4)
	addq	$2, %rcx
	cmpq	%rcx, %rdx
	jne	.LBB98_103
	jmp	.LBB98_58
.LBB98_85:                              # %.lr.ph1724.preheader.split.split..lr.ph1724.preheader.split.split.split_crit_edge.preheader
                                        #   in Loop: Header=BB98_59 Depth=2
	addq	$1, %r9
	cmpl	$5, %r12d
	jne	.LBB98_88
# %bb.86:                               # %.lr.ph1724.preheader.split.split..lr.ph1724.preheader.split.split.split_crit_edge.us.preheader
                                        #   in Loop: Header=BB98_59 Depth=2
	movq	-96(%rbp), %r10                 # 8-byte Reload
	.p2align	4, 0x90
.LBB98_87:                              # %.lr.ph1724.preheader.split.split..lr.ph1724.preheader.split.split.split_crit_edge.us
                                        #   Parent Loop BB98_46 Depth=1
                                        #     Parent Loop BB98_59 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movzwl	(%r15,%rcx,2), %edx
	movzbl	37708(%r14,%rdx), %edi
	addl	%edi, %eax
	movzbl	37966(%r14,%rdx), %edi
	addl	%edi, %esi
	movzbl	38224(%r14,%rdx), %edi
	addl	%edi, %ebx
	movzbl	38482(%r14,%rdx), %edi
	addl	%edi, %r13d
	movzbl	38740(%r14,%rdx), %edx
	addl	%edx, %r11d
	addq	$1, %rcx
	cmpq	%rcx, %r9
	jne	.LBB98_87
	jmp	.LBB98_90
.LBB98_88:                              # %.lr.ph1724.preheader.split.split..lr.ph1724.preheader.split.split.split_crit_edge.preheader18
                                        #   in Loop: Header=BB98_59 Depth=2
	movq	-96(%rbp), %r10                 # 8-byte Reload
	.p2align	4, 0x90
.LBB98_89:                              # %.lr.ph1724.preheader.split.split..lr.ph1724.preheader.split.split.split_crit_edge
                                        #   Parent Loop BB98_46 Depth=1
                                        #     Parent Loop BB98_59 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movzwl	(%r15,%rcx,2), %edx
	movzbl	37708(%r14,%rdx), %edi
	addl	%edi, %eax
	movzbl	37966(%r14,%rdx), %edi
	addl	%edi, %esi
	movzbl	38224(%r14,%rdx), %edi
	addl	%edi, %ebx
	movzbl	38482(%r14,%rdx), %edi
	addl	%edi, %r13d
	movzbl	38740(%r14,%rdx), %edi
	addl	%edi, %r11d
	movzbl	38998(%r14,%rdx), %edx
	addl	%edx, %r8d
	addq	$1, %rcx
	cmpq	%rcx, %r9
	jne	.LBB98_89
	jmp	.LBB98_90
.LBB98_104:                             # %.us-lcssa1774.us.thread
                                        #   in Loop: Header=BB98_46 Depth=1
	movq	-192(%rbp), %rdi                # 8-byte Reload
	xorl	%esi, %esi
	movq	-136(%rbp), %rdx                # 8-byte Reload
	callq	memset@PLT
	movl	668(%r14), %ebx
	xorl	%eax, %eax
	testl	%ebx, %ebx
	jg	.LBB98_56
	.p2align	4, 0x90
.LBB98_105:                             #   in Loop: Header=BB98_46 Depth=1
	movq	%rax, -104(%rbp)                # 8-byte Spill
	xorl	%r10d, %r10d
.LBB98_106:                             # %._crit_edge1741
                                        #   in Loop: Header=BB98_46 Depth=1
	cmpl	$3, 656(%r14)
	jge	.LBB98_110
.LBB98_107:                             #   in Loop: Header=BB98_46 Depth=1
	movq	%r12, %r15
	movq	-176(%rbp), %r12                # 8-byte Reload
	movq	-168(%rbp), %rbx                # 8-byte Reload
	movl	-52(%rbp), %r13d                # 4-byte Reload
	.p2align	4, 0x90
.LBB98_108:                             #   Parent Loop BB98_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movl	%r13d, %edx
	movl	$17, %ecx
	callq	BZ2_hbMakeCodeLengths
	addq	$258, %rbx                      # imm = 0x102
	addq	$1032, %r12                     # imm = 0x408
	addq	$-1, %r15
	jne	.LBB98_108
# %bb.109:                              #   in Loop: Header=BB98_46 Depth=1
	movq	-160(%rbp), %rax                # 8-byte Reload
	addl	$1, %eax
	movq	%rax, -160(%rbp)                # 8-byte Spill
	cmpl	$4, %eax
	movq	-88(%rbp), %r12                 # 8-byte Reload
	jne	.LBB98_46
	jmp	.LBB98_113
.LBB98_110:                             #   in Loop: Header=BB98_46 Depth=1
	movq	stderr(%rip), %rdi
	movq	-160(%rbp), %rax                # 8-byte Reload
	leal	1(%rax), %edx
	leal	7(%r10), %ecx
	testl	%r10d, %r10d
	cmovnsl	%r10d, %ecx
	sarl	$3, %ecx
	movl	$.L.str.4.147, %esi
	xorl	%eax, %eax
	callq	fprintf
	xorl	%ebx, %ebx
.LBB98_111:                             #   Parent Loop BB98_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	stderr(%rip), %rdi
	movl	-320(%rbp,%rbx,4), %edx
	movl	$.L.str.5.148, %esi
	xorl	%eax, %eax
	callq	fprintf
	addq	$1, %rbx
	cmpq	%rbx, %r12
	jne	.LBB98_111
# %bb.112:                              #   in Loop: Header=BB98_46 Depth=1
	movq	stderr(%rip), %rsi
	movl	$10, %edi
	callq	fputc@PLT
	jmp	.LBB98_107
.LBB98_113:
	movq	-104(%rbp), %rax                # 8-byte Reload
	cmpl	$18003, %eax                    # imm = 0x4653
	jge	.LBB98_203
# %bb.114:                              # %.preheader1644.1
	movw	$256, -126(%rbp)                # imm = 0x100
	cmpl	$2, %r12d
	je	.LBB98_119
# %bb.115:                              # %.preheader1644.2
	movb	$2, -124(%rbp)
	cmpl	$3, %r12d
	je	.LBB98_119
# %bb.116:                              # %.preheader1644.3
	movb	$3, -123(%rbp)
	cmpl	$4, %r12d
	je	.LBB98_119
# %bb.117:                              # %.preheader1644.4
	movb	$4, -122(%rbp)
	cmpl	$5, %r12d
	je	.LBB98_119
# %bb.118:                              # %.preheader1644.5
	movb	$5, -121(%rbp)
.LBB98_119:
	xorl	%r9d, %r9d
	testl	%eax, %eax
	movl	%eax, %eax
	cmovgq	%rax, %r9
	testq	%r9, %r9
	movq	-112(%rbp), %r8                 # 8-byte Reload
	movq	-168(%rbp), %r15                # 8-byte Reload
	je	.LBB98_126
# %bb.120:                              # %.lr.ph1704.preheader
	xorl	%edx, %edx
	xorl	%eax, %eax
	jmp	.LBB98_123
	.p2align	4, 0x90
.LBB98_121:                             #   in Loop: Header=BB98_123 Depth=1
	xorl	%esi, %esi
.LBB98_122:                             # %._crit_edge1698
                                        #   in Loop: Header=BB98_123 Depth=1
	movb	%cl, -126(%rbp)
	movb	%sil, 19706(%r14,%rax)
	addq	$1, %rax
	movl	%ecx, %edx
	cmpq	%r9, %rax
	je	.LBB98_126
.LBB98_123:                             # %.lr.ph1704
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_125 Depth 2
	movb	1704(%r14,%rax), %cl
	cmpb	%dl, %cl
	je	.LBB98_121
# %bb.124:                              # %.lr.ph1697.preheader
                                        #   in Loop: Header=BB98_123 Depth=1
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB98_125:                             # %.lr.ph1697
                                        #   Parent Loop BB98_123 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	1(%rdi), %rsi
	movzbl	-125(%rbp,%rdi), %ebx
	movb	%dl, -125(%rbp,%rdi)
	movl	%ebx, %edx
	movq	%rsi, %rdi
	cmpb	%bl, %cl
	jne	.LBB98_125
	jmp	.LBB98_122
.LBB98_126:                             # %.preheader1643
	cmpl	$0, -52(%rbp)                   # 4-byte Folded Reload
	movq	%r9, -64(%rbp)                  # 8-byte Spill
	jle	.LBB98_132
# %bb.127:                              # %.preheader1643.split.preheader
	cmpl	$1, %r8d
	jne	.LBB98_134
# %bb.128:                              # %.preheader1643.split.us.preheader2
	leaq	39256(%r14), %rbx
	.p2align	4, 0x90
.LBB98_129:                             # %.preheader1643.split.us
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%r15), %ecx
	cmpl	$32, %ecx
	movl	$32, %edx
	cmovbl	%ecx, %edx
	cmpl	$17, %ecx
	jg	.LBB98_199
# %bb.130:                              #   in Loop: Header=BB98_129 Depth=1
	testl	%edx, %edx
	jle	.LBB98_200
# %bb.131:                              #   in Loop: Header=BB98_129 Depth=1
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movl	-52(%rbp), %r8d                 # 4-byte Reload
	callq	BZ2_hbAssignCodes
	addq	$1032, %rbx                     # imm = 0x408
	addq	$258, %r15                      # imm = 0x102
	addq	$-1, %r12
	jne	.LBB98_129
	jmp	.LBB98_145
.LBB98_132:                             # %.preheader1643.split.us.preheader.preheader
	movq	%r12, %r13
	leaq	39256(%r14), %r12
	leaq	37708(%r14), %rbx
	movl	-52(%rbp), %r15d                # 4-byte Reload
	.p2align	4, 0x90
.LBB98_133:                             # %.preheader1643.split.us.preheader
                                        # =>This Inner Loop Header: Depth=1
	movq	%r12, %rdi
	movq	%rbx, %rsi
	movl	$32, %edx
	xorl	%ecx, %ecx
	movl	%r15d, %r8d
	callq	BZ2_hbAssignCodes
	addq	$1032, %r12                     # imm = 0x408
	addq	$258, %rbx                      # imm = 0x102
	addq	$-1, %r13
	jne	.LBB98_133
	jmp	.LBB98_145
.LBB98_134:                             # %.preheader1643.split.preheader..preheader1643.split.preheader.split_crit_edge
	leaq	37709(%r14), %rbx
	xorl	%r12d, %r12d
	testb	$1, %r8b
	jne	.LBB98_140
	.p2align	4, 0x90
.LBB98_135:                             # %.preheader1643.split.us1970
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_136 Depth 2
	movl	$32, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	movq	-152(%rbp), %rdi                # 8-byte Reload
	.p2align	4, 0x90
.LBB98_136:                             # %.preheader1643.split.new.us1973
                                        #   Parent Loop BB98_135 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	-1(%rbx,%rax), %esi
	cmpl	%esi, %ecx
	cmovbl	%esi, %ecx
	cmpl	%esi, %edx
	cmovgl	%esi, %edx
	movzbl	(%rbx,%rax), %esi
	cmpl	%esi, %ecx
	cmovbl	%esi, %ecx
	cmpl	%esi, %edx
	cmovgl	%esi, %edx
	addq	$2, %rax
	cmpq	%rax, %rdi
	jne	.LBB98_136
# %bb.137:                              # %._crit_edge1688.us1995
                                        #   in Loop: Header=BB98_135 Depth=1
	cmpl	$17, %ecx
	jg	.LBB98_199
# %bb.138:                              #   in Loop: Header=BB98_135 Depth=1
	testl	%edx, %edx
	jle	.LBB98_200
# %bb.139:                              #   in Loop: Header=BB98_135 Depth=1
	movq	%r12, %rax
	shlq	$10, %rax
	leaq	(%rax,%r12,8), %rax
	leaq	(%r14,%rax), %rdi
	addq	$39256, %rdi                    # imm = 0x9958
	movq	%r12, %rax
	shlq	$8, %rax
	leaq	(%rax,%r12,2), %rax
	leaq	(%r14,%rax), %rsi
	addq	$37708, %rsi                    # imm = 0x934C
	movl	-52(%rbp), %r8d                 # 4-byte Reload
	callq	BZ2_hbAssignCodes
	addq	$1, %r12
	addq	$258, %rbx                      # imm = 0x102
	cmpq	-88(%rbp), %r12                 # 8-byte Folded Reload
	jne	.LBB98_135
	jmp	.LBB98_145
	.p2align	4, 0x90
.LBB98_140:                             # %.preheader1643.split
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_141 Depth 2
	movl	$32, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	movq	-152(%rbp), %rdi                # 8-byte Reload
	.p2align	4, 0x90
.LBB98_141:                             # %.preheader1643.split.new
                                        #   Parent Loop BB98_140 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	-1(%rbx,%rax), %esi
	cmpl	%esi, %ecx
	cmovbl	%esi, %ecx
	cmpl	%esi, %edx
	cmovgl	%esi, %edx
	movzbl	(%rbx,%rax), %esi
	cmpl	%esi, %ecx
	cmovbl	%esi, %ecx
	cmpl	%esi, %edx
	cmovgl	%esi, %edx
	addq	$2, %rax
	cmpq	%rax, %rdi
	jne	.LBB98_141
# %bb.142:                              # %.epil.preheader
                                        #   in Loop: Header=BB98_140 Depth=1
	movq	%r12, %rax
	shlq	$8, %rax
	leaq	(%rax,%r12,2), %rax
	leaq	(%r14,%rax), %rsi
	movzbl	37708(%rdi,%rsi), %esi
	cmpl	%esi, %ecx
	cmovbl	%esi, %ecx
	cmpl	%esi, %edx
	cmovgl	%esi, %edx
	cmpl	$18, %ecx
	jge	.LBB98_199
# %bb.143:                              #   in Loop: Header=BB98_140 Depth=1
	testl	%edx, %edx
	jle	.LBB98_200
# %bb.144:                              #   in Loop: Header=BB98_140 Depth=1
	movq	%r12, %rsi
	shlq	$10, %rsi
	leaq	(%rsi,%r12,8), %rsi
	leaq	(%r14,%rsi), %rdi
	addq	$39256, %rdi                    # imm = 0x9958
	leaq	(%r14,%rax), %rsi
	addq	$37708, %rsi                    # imm = 0x934C
	movl	-52(%rbp), %r8d                 # 4-byte Reload
	callq	BZ2_hbAssignCodes
	addq	$1, %r12
	addq	$258, %rbx                      # imm = 0x102
	cmpq	-88(%rbp), %r12                 # 8-byte Folded Reload
	jne	.LBB98_140
.LBB98_145:                             # %.preheader1642
	movl	$143, %eax
	leaq	-288(%rbp), %rcx
	.p2align	4, 0x90
.LBB98_146:                             # =>This Inner Loop Header: Depth=1
	movzbl	-14(%r14,%rax), %edx
	orb	-15(%r14,%rax), %dl
	orb	-13(%r14,%rax), %dl
	orb	-12(%r14,%rax), %dl
	orb	-11(%r14,%rax), %dl
	orb	-10(%r14,%rax), %dl
	orb	-9(%r14,%rax), %dl
	orb	-8(%r14,%rax), %dl
	orb	-7(%r14,%rax), %dl
	orb	-6(%r14,%rax), %dl
	orb	-5(%r14,%rax), %dl
	orb	-4(%r14,%rax), %dl
	orb	-3(%r14,%rax), %dl
	orb	-2(%r14,%rax), %dl
	orb	-1(%r14,%rax), %dl
	orb	(%r14,%rax), %dl
	setne	(%rcx)
	addq	$16, %rax
	addq	$1, %rcx
	cmpq	$399, %rax                      # imm = 0x18F
	jne	.LBB98_146
# %bb.147:
	movl	116(%r14), %r15d
	xorl	%ebx, %ebx
	jmp	.LBB98_149
	.p2align	4, 0x90
.LBB98_148:                             #   in Loop: Header=BB98_149 Depth=1
	movq	%r14, %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	addq	$1, %rbx
	cmpq	$16, %rbx
	je	.LBB98_151
.LBB98_149:                             # =>This Inner Loop Header: Depth=1
	cmpb	$0, -288(%rbp,%rbx)
	je	.LBB98_148
# %bb.150:                              #   in Loop: Header=BB98_149 Depth=1
	movq	%r14, %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	bsW
	addq	$1, %rbx
	cmpq	$16, %rbx
	jne	.LBB98_149
.LBB98_151:                             # %.preheader1641.preheader
	leaq	128(%r14), %rbx
	xorl	%r13d, %r13d
	jmp	.LBB98_153
	.p2align	4, 0x90
.LBB98_152:                             # %.loopexit1494
                                        #   in Loop: Header=BB98_153 Depth=1
	addq	$1, %r13
	addq	$16, %rbx
	cmpq	$16, %r13
	je	.LBB98_158
.LBB98_153:                             # %.preheader1641
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_156 Depth 2
	cmpb	$0, -288(%rbp,%r13)
	je	.LBB98_152
# %bb.154:                              # %.preheader1640
                                        #   in Loop: Header=BB98_153 Depth=1
	xorl	%r12d, %r12d
	jmp	.LBB98_156
	.p2align	4, 0x90
.LBB98_157:                             #   in Loop: Header=BB98_156 Depth=2
	movq	%r14, %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	addq	$1, %r12
	cmpq	$16, %r12
	je	.LBB98_152
.LBB98_156:                             #   Parent Loop BB98_153 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$0, (%rbx,%r12)
	je	.LBB98_157
# %bb.155:                              #   in Loop: Header=BB98_156 Depth=2
	movq	%r14, %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	bsW
	addq	$1, %r12
	cmpq	$16, %r12
	jne	.LBB98_156
	jmp	.LBB98_152
.LBB98_158:
	cmpl	$3, 656(%r14)
	jge	.LBB98_176
.LBB98_159:
	movl	116(%r14), %r12d
	movq	%r14, %rdi
	movl	$3, %esi
	movq	-88(%rbp), %rdx                 # 8-byte Reload
                                        # kill: def $edx killed $edx killed $rdx
	callq	bsW
	movq	%r14, %rdi
	movl	$15, %esi
	movq	-104(%rbp), %rdx                # 8-byte Reload
                                        # kill: def $edx killed $edx killed $rdx
	callq	bsW
	movq	-64(%rbp), %r15                 # 8-byte Reload
	testq	%r15, %r15
	je	.LBB98_165
# %bb.160:                              # %.preheader1639.preheader
	xorl	%r13d, %r13d
	jmp	.LBB98_162
	.p2align	4, 0x90
.LBB98_161:                             # %._crit_edge1672
                                        #   in Loop: Header=BB98_162 Depth=1
	movq	%r14, %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	addq	$1, %r13
	cmpq	%r15, %r13
	je	.LBB98_165
.LBB98_162:                             # %.preheader1639
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_164 Depth 2
	cmpb	$0, 19706(%r14,%r13)
	je	.LBB98_161
# %bb.163:                              # %.lr.ph1671.preheader
                                        #   in Loop: Header=BB98_162 Depth=1
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB98_164:                             # %.lr.ph1671
                                        #   Parent Loop BB98_162 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r14, %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	bsW
	addl	$1, %ebx
	movzbl	19706(%r14,%r13), %eax
	cmpl	%eax, %ebx
	jb	.LBB98_164
	jmp	.LBB98_161
.LBB98_165:                             # %._crit_edge1675
	cmpl	$3, 656(%r14)
	jge	.LBB98_177
# %bb.166:
	movl	116(%r14), %eax
	movl	%eax, -120(%rbp)                # 4-byte Spill
	cmpl	$0, -52(%rbp)                   # 4-byte Folded Reload
	jle	.LBB98_178
.LBB98_167:                             # %.split.preheader
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB98_168:                             # %.split
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_169 Depth 2
                                        #       Child Loop BB98_170 Depth 3
                                        #       Child Loop BB98_172 Depth 3
	movq	%rcx, %rax
	shlq	$8, %rax
	movq	%rcx, -64(%rbp)                 # 8-byte Spill
	leaq	(%rax,%rcx,2), %r13
	movzbl	37708(%r14,%r13), %ebx
	movq	%r14, %rdi
	movl	$5, %esi
	movl	%ebx, %edx
	callq	bsW
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB98_169:                             # %.preheader1638
                                        #   Parent Loop BB98_168 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB98_170 Depth 3
                                        #       Child Loop BB98_172 Depth 3
	leaq	(%r14,%r13), %rax
	leaq	(%r15,%rax), %r12
	addq	$37708, %r12                    # imm = 0x934C
	movzbl	37708(%r15,%rax), %eax
	cmpl	%eax, %ebx
	jge	.LBB98_172
	.p2align	4, 0x90
.LBB98_170:                             # %.lr.ph1657
                                        #   Parent Loop BB98_168 Depth=1
                                        #     Parent Loop BB98_169 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	%r14, %rdi
	movl	$2, %esi
	movl	$2, %edx
	callq	bsW
	addl	$1, %ebx
	movzbl	(%r12), %eax
	cmpl	%eax, %ebx
	jl	.LBB98_170
	jmp	.LBB98_172
	.p2align	4, 0x90
.LBB98_171:                             # %.lr.ph1661
                                        #   in Loop: Header=BB98_172 Depth=3
	movl	$2, %esi
	movl	$3, %edx
	callq	bsW
	addl	$-1, %ebx
	movzbl	(%r12), %eax
.LBB98_172:                             # %.lr.ph1661
                                        #   Parent Loop BB98_168 Depth=1
                                        #     Parent Loop BB98_169 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	%r14, %rdi
	cmpl	%eax, %ebx
	jg	.LBB98_171
# %bb.173:                              # %._crit_edge1662
                                        #   in Loop: Header=BB98_169 Depth=2
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	addq	$1, %r15
	cmpq	-112(%rbp), %r15                # 8-byte Folded Reload
	jne	.LBB98_169
# %bb.174:                              # %._crit_edge1667
                                        #   in Loop: Header=BB98_168 Depth=1
	movq	-64(%rbp), %rcx                 # 8-byte Reload
	addq	$1, %rcx
	cmpq	-88(%rbp), %rcx                 # 8-byte Folded Reload
	jne	.LBB98_168
	jmp	.LBB98_180
.LBB98_175:
	movq	stderr(%rip), %rdi
	movl	668(%r14), %ecx
	movl	108(%r14), %edx
	movl	124(%r14), %r8d
	movl	$.L.str.2.145, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB98_1
.LBB98_176:
	movq	stderr(%rip), %rdi
	movl	116(%r14), %edx
	subl	%r15d, %edx
	movl	$.L.str.7.150, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB98_159
.LBB98_177:
	movq	stderr(%rip), %rdi
	movl	116(%r14), %edx
	subl	%r12d, %edx
	movl	$.L.str.8.151, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	116(%r14), %eax
	movl	%eax, -120(%rbp)                # 4-byte Spill
	cmpl	$0, -52(%rbp)                   # 4-byte Folded Reload
	jg	.LBB98_167
.LBB98_178:                             # %.split.us.preheader
	movq	-88(%rbp), %rcx                 # 8-byte Reload
	movq	%rcx, %rax
	shlq	$8, %rax
	leaq	(%rax,%rcx,2), %r15
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB98_179:                             # %.split.us
                                        # =>This Inner Loop Header: Depth=1
	movzbl	37708(%r14,%rbx), %edx
	movq	%r14, %rdi
	movl	$5, %esi
	callq	bsW
	addq	$258, %rbx                      # imm = 0x102
	cmpq	%rbx, %r15
	jne	.LBB98_179
.LBB98_180:                             # %.us-lcssa.us
	cmpl	$3, 656(%r14)
	jge	.LBB98_197
.LBB98_181:
	movl	116(%r14), %eax
	movl	%eax, -96(%rbp)                 # 4-byte Spill
	movl	668(%r14), %eax
	testl	%eax, %eax
	movq	-48(%rbp), %r12                 # 8-byte Reload
	movq	-104(%rbp), %rcx                # 8-byte Reload
	jle	.LBB98_195
# %bb.182:                              # %.lr.ph1655.preheader
	movq	%rcx, -104(%rbp)                # 8-byte Spill
	xorl	%r15d, %r15d
	xorl	%edx, %edx
	jmp	.LBB98_185
	.p2align	4, 0x90
.LBB98_183:                             #   in Loop: Header=BB98_185 Depth=1
	movslq	%r15d, %r12
	movq	-48(%rbp), %rcx                 # 8-byte Reload
	movzwl	(%rcx,%r12,2), %ecx
	movq	%rdx, -120(%rbp)                # 8-byte Spill
	movq	%rax, %rdx
	shlq	$8, %rdx
	leaq	(%rdx,%rax,2), %r15
	addq	%r14, %r15
	movzbl	37708(%rcx,%r15), %esi
	movq	%rax, %rdx
	shlq	$10, %rdx
	leaq	(%rdx,%rax,8), %r13
	addq	%r14, %r13
	movl	39256(%r13,%rcx,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	2(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	4(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	6(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	8(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	10(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	12(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	14(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	16(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	18(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	20(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	22(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	24(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	26(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	28(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	30(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	32(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	34(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	36(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	38(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	40(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	42(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	44(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	46(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	48(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	50(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	52(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	54(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	56(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	58(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	60(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	62(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	64(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	66(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	68(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	70(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	72(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	74(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	76(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	78(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	80(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	82(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	84(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	86(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	88(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	90(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	92(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	94(%rax,%r12,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movzwl	96(%rax,%r12,2), %eax
	movq	-48(%rbp), %r12                 # 8-byte Reload
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movslq	%ebx, %rax
	movzwl	(%r12,%rax,2), %eax
	movzbl	37708(%rax,%r15), %esi
	movl	39256(%r13,%rax,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	-120(%rbp), %rdx                # 8-byte Reload
.LBB98_184:                             # %.loopexit
                                        #   in Loop: Header=BB98_185 Depth=1
	movl	-64(%rbp), %ecx                 # 4-byte Reload
	addl	$1, %ecx
	addq	$1, %rdx
	movl	668(%r14), %eax
	movl	%ecx, %r15d
	cmpl	%eax, %ecx
	jge	.LBB98_192
.LBB98_185:                             # %.lr.ph1655
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_191 Depth 2
	leal	49(%r15), %ebx
	leal	-1(%rax), %esi
	cmpl	%eax, %ebx
	cmovll	%ebx, %esi
	movzbl	1704(%r14,%rdx), %eax
	movq	-88(%rbp), %rcx                 # 8-byte Reload
	cmpl	%eax, %ecx
	jbe	.LBB98_201
# %bb.186:                              #   in Loop: Header=BB98_185 Depth=1
	cmpl	$6, %ecx
	movl	%esi, -64(%rbp)                 # 4-byte Spill
	jne	.LBB98_188
# %bb.187:                              #   in Loop: Header=BB98_185 Depth=1
	movl	%esi, %ecx
	subl	%r15d, %ecx
	cmpl	$49, %ecx
	je	.LBB98_183
.LBB98_188:                             #   in Loop: Header=BB98_185 Depth=1
	cmpl	%esi, %r15d
	jg	.LBB98_184
# %bb.189:                              # %.lr.ph.preheader
                                        #   in Loop: Header=BB98_185 Depth=1
	movslq	%r15d, %rbx
	movzwl	(%r12,%rbx,2), %ecx
	movq	%rdx, %r13
	movq	%rax, %rdx
	shlq	$8, %rdx
	leaq	(%rdx,%rax,2), %rdx
	addq	%r14, %rdx
	movzbl	37708(%rcx,%rdx), %esi
	movq	%rax, %rdx
	shlq	$10, %rdx
	leaq	(%rdx,%rax,8), %rax
	addq	%r14, %rax
	movl	39256(%rax,%rcx,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	%r13, %rdx
	cmpl	-64(%rbp), %r15d                # 4-byte Folded Reload
	je	.LBB98_184
# %bb.190:                              # %.lr.ph..lr.ph_crit_edge.preheader
                                        #   in Loop: Header=BB98_185 Depth=1
	movslq	-64(%rbp), %r15                 # 4-byte Folded Reload
	.p2align	4, 0x90
.LBB98_191:                             # %.lr.ph..lr.ph_crit_edge
                                        #   Parent Loop BB98_185 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	1704(%r14,%rdx), %eax
	movzwl	2(%r12,%rbx,2), %ecx
	addq	$1, %rbx
	movq	%rax, %rdx
	shlq	$8, %rdx
	leaq	(%rdx,%rax,2), %rdx
	addq	%r14, %rdx
	movzbl	37708(%rcx,%rdx), %esi
	movq	%rax, %rdx
	shlq	$10, %rdx
	leaq	(%rdx,%rax,8), %rax
	addq	%r14, %rax
	movl	39256(%rax,%rcx,4), %edx
	movq	%r14, %rdi
	callq	bsW
	movq	%r13, %rdx
	cmpq	%rbx, %r15
	jne	.LBB98_191
	jmp	.LBB98_184
.LBB98_192:                             # %._crit_edge.loopexit
	movq	-104(%rbp), %rcx                # 8-byte Reload
	cmpl	%ecx, %edx
	jne	.LBB98_196
.LBB98_193:
	cmpl	$3, 656(%r14)
	jge	.LBB98_198
# %bb.194:
	addq	$280, %rsp                      # imm = 0x118
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB98_195:
	.cfi_def_cfa %rbp, 16
	xorl	%edx, %edx
	cmpl	%ecx, %edx
	je	.LBB98_193
.LBB98_196:
	movl	$3007, %edi                     # imm = 0xBBF
	callq	BZ2_bz__AssertH__fail
.LBB98_197:
	movq	stderr(%rip), %rdi
	movl	116(%r14), %edx
	subl	-120(%rbp), %edx                # 4-byte Folded Reload
	movl	$.L.str.9.152, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB98_181
.LBB98_198:
	movq	stderr(%rip), %rdi
	movl	116(%r14), %edx
	subl	-96(%rbp), %edx                 # 4-byte Folded Reload
	movl	$.L.str.10.153, %esi
	xorl	%eax, %eax
	addq	$280, %rsp                      # imm = 0x118
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	fprintf                         # TAILCALL
.LBB98_199:                             # %.us-lcssa1772.us
	.cfi_def_cfa %rbp, 16
	movl	$3004, %edi                     # imm = 0xBBC
	callq	BZ2_bz__AssertH__fail
.LBB98_200:                             # %.us-lcssa1773.us
	movl	$3005, %edi                     # imm = 0xBBD
	callq	BZ2_bz__AssertH__fail
.LBB98_201:
	movl	$3006, %edi                     # imm = 0xBBE
	callq	BZ2_bz__AssertH__fail
.LBB98_202:
	movl	$3001, %edi                     # imm = 0xBB9
	callq	BZ2_bz__AssertH__fail
.LBB98_203:
	movl	$3003, %edi                     # imm = 0xBBB
	callq	BZ2_bz__AssertH__fail
.Lfunc_end98:
	.size	sendMTFValues, .Lfunc_end98-sendMTFValues
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
	cmpl	$0, 644(%rdi)
	jle	.LBB99_3
# %bb.1:                                # %.lr.ph
	movl	640(%rdi), %ecx
	movl	116(%rdi), %eax
	.p2align	4, 0x90
.LBB99_2:                               # =>This Inner Loop Header: Depth=1
	shrl	$24, %ecx
	movq	80(%rdi), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movl	116(%rdi), %eax
	addl	$1, %eax
	movl	%eax, 116(%rdi)
	movl	640(%rdi), %ecx
	shll	$8, %ecx
	movl	%ecx, 640(%rdi)
	movl	644(%rdi), %edx
	leal	-8(%rdx), %esi
	movl	%esi, 644(%rdi)
	cmpl	$8, %edx
	jg	.LBB99_2
.LBB99_3:                               # %._crit_edge
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end99:
	.size	bsFinishWrite, .Lfunc_end99-bsFinishWrite
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
	movl	$0, 124(%rdi)
	xorl	%eax, %eax
	movq	$-256, %rcx
	jmp	.LBB100_1
	.p2align	4, 0x90
.LBB100_5:                              #   in Loop: Header=BB100_1 Depth=1
	addq	$2, %rcx
	je	.LBB100_6
.LBB100_1:                              # =>This Inner Loop Header: Depth=1
	cmpb	$0, 384(%rdi,%rcx)
	je	.LBB100_3
# %bb.2:                                #   in Loop: Header=BB100_1 Depth=1
	movb	%al, 640(%rdi,%rcx)
	addl	$1, %eax
	movl	%eax, 124(%rdi)
.LBB100_3:                              #   in Loop: Header=BB100_1 Depth=1
	cmpb	$0, 385(%rdi,%rcx)
	je	.LBB100_5
# %bb.4:                                #   in Loop: Header=BB100_1 Depth=1
	movb	%al, 641(%rdi,%rcx)
	addl	$1, %eax
	movl	%eax, 124(%rdi)
	jmp	.LBB100_5
.LBB100_6:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end100:
	.size	makeMaps_e, .Lfunc_end100-makeMaps_e
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function BZ2_decompress
.LCPI101_0:
	.byte	0                               # 0x0
	.byte	1                               # 0x1
	.byte	2                               # 0x2
	.byte	3                               # 0x3
	.byte	4                               # 0x4
	.byte	5                               # 0x5
	.byte	6                               # 0x6
	.byte	7                               # 0x7
	.byte	8                               # 0x8
	.byte	9                               # 0x9
	.byte	10                              # 0xa
	.byte	11                              # 0xb
	.byte	12                              # 0xc
	.byte	13                              # 0xd
	.byte	14                              # 0xe
	.byte	15                              # 0xf
.LCPI101_1:
	.zero	16,16
.LCPI101_2:
	.zero	16,32
.LCPI101_3:
	.zero	16,48
.LCPI101_4:
	.zero	16,64
.LCPI101_5:
	.zero	16,80
.LCPI101_6:
	.zero	16,96
.LCPI101_7:
	.zero	16,112
.LCPI101_8:
	.zero	16,128
	.text
	.globl	BZ2_decompress
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$232, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r12
	movq	(%rdi), %rbx
	movl	8(%rdi), %eax
	cmpl	$10, %eax
	jne	.LBB101_8
# %bb.1:                                # %.thread
	pxor	%xmm0, %xmm0
	movdqu	%xmm0, 64128(%r12)
	movdqu	%xmm0, 64116(%r12)
	movdqu	%xmm0, 64100(%r12)
	movdqu	%xmm0, 64084(%r12)
	movdqu	%xmm0, 64068(%r12)
	movdqu	%xmm0, 64052(%r12)
	movdqu	%xmm0, 64036(%r12)
	movl	$10, 8(%r12)
	movl	36(%r12), %ecx
	cmpl	$7, %ecx
	jle	.LBB101_15
.LBB101_2:                              # %._crit_edge2467
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	movl	$-5, %eax
	xorl	%esi, %esi
	movq	%rsi, -80(%rbp)                 # 8-byte Spill
	movl	$0, -184(%rbp)                  # 4-byte Folded Spill
	movl	$0, -56(%rbp)                   # 4-byte Folded Spill
	movl	$0, -68(%rbp)                   # 4-byte Folded Spill
	movl	$0, -176(%rbp)                  # 4-byte Folded Spill
	movl	$0, -172(%rbp)                  # 4-byte Folded Spill
	movl	$0, -168(%rbp)                  # 4-byte Folded Spill
	movl	$0, -164(%rbp)                  # 4-byte Folded Spill
	movl	$0, -160(%rbp)                  # 4-byte Folded Spill
	movl	$0, -156(%rbp)                  # 4-byte Folded Spill
	movl	$0, -152(%rbp)                  # 4-byte Folded Spill
	movl	$0, -148(%rbp)                  # 4-byte Folded Spill
	movl	$0, -144(%rbp)                  # 4-byte Folded Spill
	movl	$0, -140(%rbp)                  # 4-byte Folded Spill
	movl	$0, -136(%rbp)                  # 4-byte Folded Spill
	movl	$0, %r15d
	movl	$0, -132(%rbp)                  # 4-byte Folded Spill
	movl	$0, -128(%rbp)                  # 4-byte Folded Spill
	movl	$0, -124(%rbp)                  # 4-byte Folded Spill
	movl	$0, %r14d
	movl	$0, %r13d
	movl	$0, %r10d
	movl	$0, %esi
	movq	%rsi, -256(%rbp)                # 8-byte Spill
	movl	$0, %edi
	movl	$0, %r8d
	movl	$0, %r9d
	movl	$0, %esi
	movq	%rsi, -232(%rbp)                # 8-byte Spill
	movl	$0, %esi
	movq	%rsi, -240(%rbp)                # 8-byte Spill
	movl	$0, %esi
	movq	%rsi, -104(%rbp)                # 8-byte Spill
	movl	$0, %r11d
	movl	$0, %esi
	movq	%rsi, -200(%rbp)                # 8-byte Spill
	movl	$0, %esi
	movq	%rsi, -248(%rbp)                # 8-byte Spill
	movl	$0, %esi
	movq	%rsi, -192(%rbp)                # 8-byte Spill
	movl	$0, %esi
	movq	%rsi, -96(%rbp)                 # 8-byte Spill
	movl	$0, -88(%rbp)                   # 4-byte Folded Spill
	movl	$0, %esi
	movq	%rsi, -112(%rbp)                # 8-byte Spill
	movl	$0, -52(%rbp)                   # 4-byte Folded Spill
	movl	$0, %esi
	movq	%rsi, -208(%rbp)                # 8-byte Spill
	movl	$0, -60(%rbp)                   # 4-byte Folded Spill
	movl	$0, -44(%rbp)                   # 4-byte Folded Spill
	movl	$0, %esi
	movq	%rsi, -120(%rbp)                # 8-byte Spill
	movl	$0, -48(%rbp)                   # 4-byte Folded Spill
	movl	$0, -84(%rbp)                   # 4-byte Folded Spill
	movl	$0, -64(%rbp)                   # 4-byte Folded Spill
	cmpb	$66, %dl
	jne	.LBB101_509
# %bb.3:
	movl	$11, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_12
.LBB101_4:                              # %._crit_edge2462
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	movl	$-5, %eax
	movl	%r15d, %r8d
	movl	%r13d, %r9d
	movl	%r14d, %esi
	movq	%rsi, -232(%rbp)                # 8-byte Spill
	movl	-124(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -240(%rbp)                # 8-byte Spill
	movl	-128(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -104(%rbp)                # 8-byte Spill
	movl	-132(%rbp), %r11d               # 4-byte Reload
	movl	-136(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -200(%rbp)                # 8-byte Spill
	movl	-140(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -248(%rbp)                # 8-byte Spill
	movl	-144(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -192(%rbp)                # 8-byte Spill
	movl	-148(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -96(%rbp)                 # 8-byte Spill
	movl	-152(%rbp), %esi                # 4-byte Reload
	movl	%esi, -88(%rbp)                 # 4-byte Spill
	movl	-156(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -112(%rbp)                # 8-byte Spill
	movl	-160(%rbp), %esi                # 4-byte Reload
	movl	%esi, -52(%rbp)                 # 4-byte Spill
	movl	-164(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -208(%rbp)                # 8-byte Spill
	movl	-168(%rbp), %esi                # 4-byte Reload
	movl	%esi, -60(%rbp)                 # 4-byte Spill
	movl	-172(%rbp), %esi                # 4-byte Reload
	movl	%esi, -44(%rbp)                 # 4-byte Spill
	movl	-176(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -120(%rbp)                # 8-byte Spill
	movl	-68(%rbp), %esi                 # 4-byte Reload
	movl	%esi, -48(%rbp)                 # 4-byte Spill
	movl	-56(%rbp), %esi                 # 4-byte Reload
	movl	%esi, -84(%rbp)                 # 4-byte Spill
	movl	-184(%rbp), %esi                # 4-byte Reload
	movl	%esi, -64(%rbp)                 # 4-byte Spill
	cmpb	$90, %dl
	jne	.LBB101_509
# %bb.5:
	movl	$12, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_24
.LBB101_6:                              # %._crit_edge2457
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	movl	$-5, %eax
	movl	%r15d, %r8d
	movl	%r13d, %r9d
	movl	%r14d, %esi
	movq	%rsi, -232(%rbp)                # 8-byte Spill
	movl	-124(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -240(%rbp)                # 8-byte Spill
	movl	-128(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -104(%rbp)                # 8-byte Spill
	movl	-132(%rbp), %r11d               # 4-byte Reload
	movl	-136(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -200(%rbp)                # 8-byte Spill
	movl	-140(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -248(%rbp)                # 8-byte Spill
	movl	-144(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -192(%rbp)                # 8-byte Spill
	movl	-148(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -96(%rbp)                 # 8-byte Spill
	movl	-152(%rbp), %esi                # 4-byte Reload
	movl	%esi, -88(%rbp)                 # 4-byte Spill
	movl	-156(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -112(%rbp)                # 8-byte Spill
	movl	-160(%rbp), %esi                # 4-byte Reload
	movl	%esi, -52(%rbp)                 # 4-byte Spill
	movl	-164(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -208(%rbp)                # 8-byte Spill
	movl	-168(%rbp), %esi                # 4-byte Reload
	movl	%esi, -60(%rbp)                 # 4-byte Spill
	movl	-172(%rbp), %esi                # 4-byte Reload
	movl	%esi, -44(%rbp)                 # 4-byte Spill
	movl	-176(%rbp), %esi                # 4-byte Reload
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, -120(%rbp)                # 8-byte Spill
	movl	-68(%rbp), %esi                 # 4-byte Reload
	movl	%esi, -48(%rbp)                 # 4-byte Spill
	movl	-56(%rbp), %esi                 # 4-byte Reload
	movl	%esi, -84(%rbp)                 # 4-byte Spill
	movl	-184(%rbp), %esi                # 4-byte Reload
	movl	%esi, -64(%rbp)                 # 4-byte Spill
	cmpb	$104, %dl
	jne	.LBB101_509
# %bb.7:
	movl	$13, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_31
	jmp	.LBB101_28
.LBB101_8:
	addl	$-11, %eax
	cmpl	$39, %eax
	ja	.LBB101_269
# %bb.9:
	movl	64036(%r12), %ecx
	movq	%rcx, -80(%rbp)                 # 8-byte Spill
	movl	64040(%r12), %ecx
	movl	%ecx, -64(%rbp)                 # 4-byte Spill
	movl	64044(%r12), %ecx
	movl	%ecx, -84(%rbp)                 # 4-byte Spill
	movl	64048(%r12), %ecx
	movl	%ecx, -48(%rbp)                 # 4-byte Spill
	movl	64052(%r12), %ecx
	movq	%rcx, -120(%rbp)                # 8-byte Spill
	movl	64056(%r12), %ecx
	movl	%ecx, -44(%rbp)                 # 4-byte Spill
	movl	64060(%r12), %ecx
	movl	%ecx, -60(%rbp)                 # 4-byte Spill
	movl	64064(%r12), %ecx
	movq	%rcx, -208(%rbp)                # 8-byte Spill
	movl	64068(%r12), %ecx
	movl	%ecx, -52(%rbp)                 # 4-byte Spill
	movl	64072(%r12), %ecx
	movq	%rcx, -112(%rbp)                # 8-byte Spill
	movl	64076(%r12), %ecx
	movl	%ecx, -88(%rbp)                 # 4-byte Spill
	movl	64080(%r12), %ecx
	movq	%rcx, -96(%rbp)                 # 8-byte Spill
	movl	64084(%r12), %ecx
	movq	%rcx, -192(%rbp)                # 8-byte Spill
	movl	64088(%r12), %ecx
	movq	%rcx, -248(%rbp)                # 8-byte Spill
	movl	64092(%r12), %ecx
	movq	%rcx, -200(%rbp)                # 8-byte Spill
	movl	64096(%r12), %r8d
	movl	64100(%r12), %r11d
	movl	64104(%r12), %ecx
	movq	%rcx, -104(%rbp)                # 8-byte Spill
	movl	64108(%r12), %ecx
	movq	%rcx, -240(%rbp)                # 8-byte Spill
	movl	64112(%r12), %ecx
	movq	%rcx, -232(%rbp)                # 8-byte Spill
	movl	64116(%r12), %r9d
	movq	64120(%r12), %r10
	movq	64128(%r12), %rcx
	movq	%rcx, -256(%rbp)                # 8-byte Spill
	movq	64136(%r12), %rdi
	jmpq	*.LJTI101_0(,%rax,8)
.LBB101_10:                             # %._crit_edge2625
	movl	-64(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -184(%rbp)                # 4-byte Spill
	movl	-84(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -56(%rbp)                 # 4-byte Spill
	movl	-48(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -68(%rbp)                 # 4-byte Spill
	movq	-120(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -176(%rbp)                # 4-byte Spill
	movl	-44(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -172(%rbp)                # 4-byte Spill
	movl	-60(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -168(%rbp)                # 4-byte Spill
	movq	-208(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -164(%rbp)                # 4-byte Spill
	movl	-52(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -160(%rbp)                # 4-byte Spill
	movq	-112(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -156(%rbp)                # 4-byte Spill
	movl	-88(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -152(%rbp)                # 4-byte Spill
	movq	-96(%rbp), %rax                 # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -148(%rbp)                # 4-byte Spill
	movq	-192(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -144(%rbp)                # 4-byte Spill
	movq	-248(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -140(%rbp)                # 4-byte Spill
	movq	-200(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -136(%rbp)                # 4-byte Spill
	movl	%r8d, %r15d
	movl	%r11d, -132(%rbp)               # 4-byte Spill
	movq	-104(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -128(%rbp)                # 4-byte Spill
	movq	-240(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -124(%rbp)                # 4-byte Spill
	movq	-232(%rbp), %rax                # 8-byte Reload
	movl	%eax, %r14d
	movl	%r9d, %r13d
	movl	36(%r12), %ecx
	movl	$11, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_12
	jmp	.LBB101_4
	.p2align	4, 0x90
.LBB101_11:                             #   in Loop: Header=BB101_12 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_4
.LBB101_12:                             # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_34
# %bb.13:                               #   in Loop: Header=BB101_12 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_11
# %bb.14:                               #   in Loop: Header=BB101_12 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_11
.LBB101_15:                             # %.lr.ph2466
	cmpl	$0, 8(%rbx)
	je	.LBB101_21
# %bb.16:                               # %.lr.ph2917.preheader
	movq	%rbx, %rax
	.p2align	4, 0x90
.LBB101_17:                             # %.lr.ph2917
                                        # =>This Inner Loop Header: Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_19
# %bb.18:                               #   in Loop: Header=BB101_17 Depth=1
	addl	$1, 16(%rax)
.LBB101_19:                             #   in Loop: Header=BB101_17 Depth=1
	movl	36(%r12), %ecx
	cmpl	$7, %ecx
	jg	.LBB101_2
# %bb.20:                               # %._crit_edge2623
                                        #   in Loop: Header=BB101_17 Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	jne	.LBB101_17
.LBB101_21:
	xorl	%r8d, %r8d
	xorl	%edi, %edi
	xorl	%eax, %eax
	movq	%rax, -256(%rbp)                # 8-byte Spill
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%eax, %eax
	movq	%rax, -232(%rbp)                # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -240(%rbp)                # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -104(%rbp)                # 8-byte Spill
	xorl	%r11d, %r11d
	xorl	%eax, %eax
	movq	%rax, -200(%rbp)                # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -248(%rbp)                # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -192(%rbp)                # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -96(%rbp)                 # 8-byte Spill
	movl	$0, -88(%rbp)                   # 4-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, -112(%rbp)                # 8-byte Spill
	movl	$0, -52(%rbp)                   # 4-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, -208(%rbp)                # 8-byte Spill
	movl	$0, -60(%rbp)                   # 4-byte Folded Spill
	movl	$0, -44(%rbp)                   # 4-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, -120(%rbp)                # 8-byte Spill
	movl	$0, -48(%rbp)                   # 4-byte Folded Spill
	movl	$0, -84(%rbp)                   # 4-byte Folded Spill
	movl	$0, -64(%rbp)                   # 4-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, -80(%rbp)                 # 8-byte Spill
	xorl	%eax, %eax
	jmp	.LBB101_509
.LBB101_22:                             # %._crit_edge2628
	movl	-64(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -184(%rbp)                # 4-byte Spill
	movl	-84(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -56(%rbp)                 # 4-byte Spill
	movl	-48(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -68(%rbp)                 # 4-byte Spill
	movq	-120(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -176(%rbp)                # 4-byte Spill
	movl	-44(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -172(%rbp)                # 4-byte Spill
	movl	-60(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -168(%rbp)                # 4-byte Spill
	movq	-208(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -164(%rbp)                # 4-byte Spill
	movl	-52(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -160(%rbp)                # 4-byte Spill
	movq	-112(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -156(%rbp)                # 4-byte Spill
	movl	-88(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -152(%rbp)                # 4-byte Spill
	movq	-96(%rbp), %rax                 # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -148(%rbp)                # 4-byte Spill
	movq	-192(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -144(%rbp)                # 4-byte Spill
	movq	-248(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -140(%rbp)                # 4-byte Spill
	movq	-200(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -136(%rbp)                # 4-byte Spill
	movl	%r8d, %r15d
	movl	%r11d, -132(%rbp)               # 4-byte Spill
	movq	-104(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -128(%rbp)                # 4-byte Spill
	movq	-240(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -124(%rbp)                # 4-byte Spill
	movq	-232(%rbp), %rax                # 8-byte Reload
	movl	%eax, %r14d
	movl	%r9d, %r13d
	movl	36(%r12), %ecx
	movl	$12, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_24
	jmp	.LBB101_6
	.p2align	4, 0x90
.LBB101_23:                             #   in Loop: Header=BB101_24 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_6
.LBB101_24:                             # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_34
# %bb.25:                               #   in Loop: Header=BB101_24 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_23
# %bb.26:                               #   in Loop: Header=BB101_24 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_23
.LBB101_27:                             # %._crit_edge2631
	movl	-64(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -184(%rbp)                # 4-byte Spill
	movl	-84(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -56(%rbp)                 # 4-byte Spill
	movl	-48(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -68(%rbp)                 # 4-byte Spill
	movq	-120(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -176(%rbp)                # 4-byte Spill
	movl	-44(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -172(%rbp)                # 4-byte Spill
	movl	-60(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -168(%rbp)                # 4-byte Spill
	movq	-208(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -164(%rbp)                # 4-byte Spill
	movl	-52(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -160(%rbp)                # 4-byte Spill
	movq	-112(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -156(%rbp)                # 4-byte Spill
	movl	-88(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -152(%rbp)                # 4-byte Spill
	movq	-96(%rbp), %rax                 # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -148(%rbp)                # 4-byte Spill
	movq	-192(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -144(%rbp)                # 4-byte Spill
	movq	-248(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -140(%rbp)                # 4-byte Spill
	movq	-200(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -136(%rbp)                # 4-byte Spill
	movl	%r8d, %r15d
	movl	%r11d, -132(%rbp)               # 4-byte Spill
	movq	-104(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -128(%rbp)                # 4-byte Spill
	movq	-240(%rbp), %rax                # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -124(%rbp)                # 4-byte Spill
	movq	-232(%rbp), %rax                # 8-byte Reload
	movl	%eax, %r14d
	movl	%r9d, %r13d
	movl	36(%r12), %ecx
	movl	$13, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_31
.LBB101_28:                             # %._crit_edge2452
	movl	32(%r12), %eax
	addl	$-8, %ecx
	shrl	%cl, %eax
	movzbl	%al, %edx
	movl	%ecx, 36(%r12)
	movl	%edx, 40(%r12)
	leal	-49(%rdx), %ecx
	movl	$-5, %eax
	cmpl	$8, %ecx
	jbe	.LBB101_35
# %bb.29:
	movl	%r15d, %r8d
	movl	%r13d, %r9d
	movl	%r14d, %ecx
	movq	%rcx, -232(%rbp)                # 8-byte Spill
	movl	-124(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -240(%rbp)                # 8-byte Spill
	movl	-128(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -104(%rbp)                # 8-byte Spill
	movl	-132(%rbp), %r11d               # 4-byte Reload
	movl	-136(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -200(%rbp)                # 8-byte Spill
	movl	-140(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -248(%rbp)                # 8-byte Spill
	movl	-144(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -192(%rbp)                # 8-byte Spill
	movl	-148(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -96(%rbp)                 # 8-byte Spill
	movl	-152(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -88(%rbp)                 # 4-byte Spill
	movl	-156(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -112(%rbp)                # 8-byte Spill
	movl	-160(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -52(%rbp)                 # 4-byte Spill
	movl	-164(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -208(%rbp)                # 8-byte Spill
	movl	-168(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -60(%rbp)                 # 4-byte Spill
	movl	-172(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -44(%rbp)                 # 4-byte Spill
	movl	-176(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -120(%rbp)                # 8-byte Spill
	movl	-68(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, -48(%rbp)                 # 4-byte Spill
	movl	-56(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, -84(%rbp)                 # 4-byte Spill
	movl	-184(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -64(%rbp)                 # 4-byte Spill
	jmp	.LBB101_509
	.p2align	4, 0x90
.LBB101_30:                             #   in Loop: Header=BB101_31 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_28
.LBB101_31:                             # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_34
# %bb.32:                               #   in Loop: Header=BB101_31 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_30
# %bb.33:                               #   in Loop: Header=BB101_31 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_30
.LBB101_34:
	movl	%r15d, %r8d
	movl	%r13d, %r9d
	movl	%r14d, %eax
	movq	%rax, -232(%rbp)                # 8-byte Spill
	movl	-124(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -240(%rbp)                # 8-byte Spill
	movl	-128(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -104(%rbp)                # 8-byte Spill
	movl	-132(%rbp), %r11d               # 4-byte Reload
	movl	-136(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -200(%rbp)                # 8-byte Spill
	movl	-140(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -248(%rbp)                # 8-byte Spill
	movl	-144(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -192(%rbp)                # 8-byte Spill
	movl	-148(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -96(%rbp)                 # 8-byte Spill
	movl	-152(%rbp), %eax                # 4-byte Reload
	movl	%eax, -88(%rbp)                 # 4-byte Spill
	movl	-156(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -112(%rbp)                # 8-byte Spill
	movl	-160(%rbp), %eax                # 4-byte Reload
	movl	%eax, -52(%rbp)                 # 4-byte Spill
	movl	-164(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -208(%rbp)                # 8-byte Spill
	movl	-168(%rbp), %eax                # 4-byte Reload
	movl	%eax, -60(%rbp)                 # 4-byte Spill
	movl	-172(%rbp), %eax                # 4-byte Reload
	movl	%eax, -44(%rbp)                 # 4-byte Spill
	movl	-176(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -120(%rbp)                # 8-byte Spill
	movl	-68(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	movl	-56(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -84(%rbp)                 # 4-byte Spill
	movl	-184(%rbp), %eax                # 4-byte Reload
	movl	%eax, -64(%rbp)                 # 4-byte Spill
	xorl	%eax, %eax
	jmp	.LBB101_509
.LBB101_35:
	movq	%rdi, -224(%rbp)                # 8-byte Spill
	movq	%r10, -264(%rbp)                # 8-byte Spill
	addl	$-48, %edx
	movl	%edx, 40(%r12)
	cmpb	$0, 44(%r12)
	je	.LBB101_84
# %bb.36:
	movq	72(%rbx), %rdi
	imull	$200000, %edx, %esi             # imm = 0x30D40
	movl	$1, %edx
	callq	*56(%rbx)
	movq	%rax, 3160(%r12)
	movq	72(%rbx), %rdi
	imull	$100000, 40(%r12), %esi         # imm = 0x186A0
	sarl	%esi
	movl	$1, %edx
	callq	*56(%rbx)
	movq	%rax, %rcx
	movq	%rax, 3168(%r12)
	movl	$-3, %eax
	testq	%rcx, %rcx
	je	.LBB101_239
# %bb.37:
	cmpq	$0, 3160(%r12)
	movl	-184(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -64(%rbp)                 # 4-byte Spill
	movl	-56(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, -84(%rbp)                 # 4-byte Spill
	movl	-68(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, -48(%rbp)                 # 4-byte Spill
	movl	-176(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -120(%rbp)                # 8-byte Spill
	movl	-172(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -44(%rbp)                 # 4-byte Spill
	movl	-168(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -60(%rbp)                 # 4-byte Spill
	movl	-164(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -208(%rbp)                # 8-byte Spill
	movl	-160(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -52(%rbp)                 # 4-byte Spill
	movl	-156(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -112(%rbp)                # 8-byte Spill
	movl	-152(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -88(%rbp)                 # 4-byte Spill
	movl	-148(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -96(%rbp)                 # 8-byte Spill
	movl	-144(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -192(%rbp)                # 8-byte Spill
	movl	-140(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -248(%rbp)                # 8-byte Spill
	movl	-136(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -200(%rbp)                # 8-byte Spill
	movl	%r15d, %r8d
	movl	-132(%rbp), %r11d               # 4-byte Reload
	movl	-128(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -104(%rbp)                # 8-byte Spill
	movl	-124(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -240(%rbp)                # 8-byte Spill
	movl	%r14d, %ecx
	movq	%rcx, -232(%rbp)                # 8-byte Spill
	movl	%r13d, %r9d
	movq	-264(%rbp), %r10                # 8-byte Reload
	movq	-224(%rbp), %rdi                # 8-byte Reload
	jne	.LBB101_86
	jmp	.LBB101_509
.LBB101_38:                             # %._crit_edge2634
	movl	36(%r12), %ecx
	jmp	.LBB101_89
.LBB101_39:                             # %._crit_edge2637
	movl	36(%r12), %ecx
	jmp	.LBB101_91
.LBB101_40:                             # %._crit_edge2640
	movl	36(%r12), %ecx
	jmp	.LBB101_93
.LBB101_41:                             # %._crit_edge2643
	movl	36(%r12), %ecx
	jmp	.LBB101_95
.LBB101_42:                             # %._crit_edge2646
	movl	36(%r12), %ecx
	jmp	.LBB101_97
.LBB101_43:                             # %._crit_edge2649
	movl	36(%r12), %ecx
	jmp	.LBB101_103
.LBB101_44:                             # %._crit_edge2652
	movl	36(%r12), %ecx
	jmp	.LBB101_105
.LBB101_45:                             # %._crit_edge2655
	movl	36(%r12), %ecx
	jmp	.LBB101_107
.LBB101_46:                             # %._crit_edge2658
	movl	36(%r12), %ecx
	jmp	.LBB101_109
.LBB101_47:                             # %._crit_edge2661
	movl	36(%r12), %ecx
	jmp	.LBB101_156
.LBB101_48:                             # %._crit_edge2664
	movl	36(%r12), %ecx
	jmp	.LBB101_158
.LBB101_49:                             # %._crit_edge2667
	movl	36(%r12), %ecx
	jmp	.LBB101_160
.LBB101_50:                             # %._crit_edge2670
	movl	36(%r12), %ecx
.LBB101_51:
	movl	$31, 8(%r12)
	cmpl	$14, %ecx
	jle	.LBB101_79
# %bb.52:
	movq	-120(%rbp), %rbx                # 8-byte Reload
.LBB101_53:                             # %._crit_edge2371
	movl	32(%r12), %r14d
	addl	$-15, %ecx
	shrl	%cl, %r14d
	movl	%ecx, 36(%r12)
	andl	$32767, %r14d                   # imm = 0x7FFF
	je	.LBB101_238
# %bb.54:
	xorl	%ecx, %ecx
	movq	%rcx, -80(%rbp)                 # 8-byte Spill
	cmpl	%r14d, %ecx
	movq	%rbx, -120(%rbp)                # 8-byte Spill
	jge	.LBB101_243
.LBB101_55:
	movl	%r14d, -44(%rbp)                # 4-byte Spill
	movl	$0, -64(%rbp)                   # 4-byte Folded Spill
.LBB101_56:                             # =>This Loop Header: Depth=1
                                        #     Child Loop BB101_62 Depth 2
	movl	$32, 8(%r12)
	movl	36(%r12), %eax
	testl	%eax, %eax
	jle	.LBB101_60
# %bb.57:                               #   in Loop: Header=BB101_56 Depth=1
	movq	-120(%rbp), %rbx                # 8-byte Reload
.LBB101_58:                             # %._crit_edge2233
                                        #   in Loop: Header=BB101_56 Depth=1
	movl	32(%r12), %ecx
	addl	$-1, %eax
	movl	%eax, 36(%r12)
	btl	%eax, %ecx
	jae	.LBB101_242
# %bb.59:                               #   in Loop: Header=BB101_56 Depth=1
	movl	-64(%rbp), %ecx                 # 4-byte Reload
	addl	$1, %ecx
	movl	$-4, %eax
	movl	%ecx, -64(%rbp)                 # 4-byte Spill
	cmpl	%ebx, %ecx
	jl	.LBB101_56
	jmp	.LBB101_509
.LBB101_60:                             # %.lr.ph2232
                                        #   in Loop: Header=BB101_56 Depth=1
	movq	-120(%rbp), %rbx                # 8-byte Reload
	jmp	.LBB101_62
	.p2align	4, 0x90
.LBB101_61:                             #   in Loop: Header=BB101_62 Depth=2
	movl	36(%r12), %eax
	testl	%eax, %eax
	jg	.LBB101_58
.LBB101_62:                             #   Parent Loop BB101_56 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%r12), %rcx
	cmpl	$0, 8(%rcx)
	je	.LBB101_474
# %bb.63:                               #   in Loop: Header=BB101_62 Depth=2
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rcx), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %eax
	movl	%eax, 36(%r12)
	addq	$1, (%rcx)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_61
# %bb.64:                               #   in Loop: Header=BB101_62 Depth=2
	addl	$1, 16(%rax)
	jmp	.LBB101_61
.LBB101_65:                             # %._crit_edge2686
	movl	36(%r12), %eax
	movq	-200(%rbp), %rbx                # 8-byte Reload
	jmp	.LBB101_66
.LBB101_67:                             # %._crit_edge2683
	movl	36(%r12), %edx
	movq	-104(%rbp), %r13                # 8-byte Reload
	jmp	.LBB101_360
.LBB101_68:                             # %._crit_edge2676
	movl	36(%r12), %edx
	movq	-104(%rbp), %r13                # 8-byte Reload
	jmp	.LBB101_480
.LBB101_69:                             # %._crit_edge2673
	movl	36(%r12), %edx
	movq	-104(%rbp), %r13                # 8-byte Reload
	jmp	.LBB101_70
.LBB101_182:                            # %._crit_edge2689
	movl	36(%r12), %ecx
	jmp	.LBB101_183
.LBB101_71:                             # %._crit_edge2692
	movl	36(%r12), %ecx
	jmp	.LBB101_185
.LBB101_72:                             # %._crit_edge2695
	movl	36(%r12), %ecx
	jmp	.LBB101_187
.LBB101_73:                             # %._crit_edge2698
	movl	36(%r12), %ecx
	jmp	.LBB101_189
.LBB101_74:                             # %._crit_edge2701
	movl	36(%r12), %ecx
	jmp	.LBB101_191
.LBB101_75:                             # %._crit_edge2704
	movl	36(%r12), %ecx
	jmp	.LBB101_194
.LBB101_76:                             # %._crit_edge2707
	movl	36(%r12), %ecx
	jmp	.LBB101_196
.LBB101_77:                             # %._crit_edge2710
	movl	36(%r12), %ecx
	jmp	.LBB101_198
.LBB101_78:                             # %._crit_edge2713
	movl	36(%r12), %ecx
	jmp	.LBB101_200
.LBB101_79:                             # %.lr.ph2370
	movq	-120(%rbp), %rbx                # 8-byte Reload
	jmp	.LBB101_81
.LBB101_80:                             #   in Loop: Header=BB101_81 Depth=1
	movl	36(%r12), %ecx
	cmpl	$15, %ecx
	jge	.LBB101_53
.LBB101_81:                             # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.82:                               #   in Loop: Header=BB101_81 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_80
# %bb.83:                               #   in Loop: Header=BB101_81 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_80
.LBB101_84:
	movq	72(%rbx), %rdi
	imull	$400000, %edx, %esi             # imm = 0x61A80
	movl	$1, %edx
	callq	*56(%rbx)
	movq	%rax, 3152(%r12)
	testq	%rax, %rax
	je	.LBB101_240
# %bb.85:
	movl	-184(%rbp), %eax                # 4-byte Reload
	movl	%eax, -64(%rbp)                 # 4-byte Spill
	movl	-56(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -84(%rbp)                 # 4-byte Spill
	movl	-68(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	movl	-176(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -120(%rbp)                # 8-byte Spill
	movl	-172(%rbp), %eax                # 4-byte Reload
	movl	%eax, -44(%rbp)                 # 4-byte Spill
	movl	-168(%rbp), %eax                # 4-byte Reload
	movl	%eax, -60(%rbp)                 # 4-byte Spill
	movl	-164(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -208(%rbp)                # 8-byte Spill
	movl	-160(%rbp), %eax                # 4-byte Reload
	movl	%eax, -52(%rbp)                 # 4-byte Spill
	movl	-156(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -112(%rbp)                # 8-byte Spill
	movl	-152(%rbp), %eax                # 4-byte Reload
	movl	%eax, -88(%rbp)                 # 4-byte Spill
	movl	-148(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -96(%rbp)                 # 8-byte Spill
	movl	-144(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -192(%rbp)                # 8-byte Spill
	movl	-140(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -248(%rbp)                # 8-byte Spill
	movl	-136(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -200(%rbp)                # 8-byte Spill
	movl	%r15d, %r8d
	movl	-132(%rbp), %r11d               # 4-byte Reload
	movl	-128(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -104(%rbp)                # 8-byte Spill
	movl	-124(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -240(%rbp)                # 8-byte Spill
	movl	%r14d, %eax
	movq	%rax, -232(%rbp)                # 8-byte Spill
	movl	%r13d, %r9d
	movq	-264(%rbp), %r10                # 8-byte Reload
	movq	-224(%rbp), %rdi                # 8-byte Reload
.LBB101_86:
	movl	$14, 8(%r12)
	movl	36(%r12), %ecx
	cmpl	$7, %ecx
	jle	.LBB101_128
.LBB101_87:                             # %._crit_edge2447
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	cmpb	$23, %dl
	je	.LBB101_183
# %bb.88:                               # %._crit_edge2447
	movl	$-4, %eax
	cmpb	$49, %dl
	jne	.LBB101_509
.LBB101_89:
	movl	$15, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_152
.LBB101_90:                             # %._crit_edge2442
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	movl	$-4, %eax
	cmpb	$65, %dl
	jne	.LBB101_509
.LBB101_91:
	movl	$16, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_148
.LBB101_92:                             # %._crit_edge2437
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	movl	$-4, %eax
	cmpb	$89, %dl
	jne	.LBB101_509
.LBB101_93:
	movl	$17, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_144
.LBB101_94:                             # %._crit_edge2432
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	movl	$-4, %eax
	cmpb	$38, %dl
	jne	.LBB101_509
.LBB101_95:
	movl	$18, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_140
.LBB101_96:                             # %._crit_edge2427
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	movl	$-4, %eax
	cmpb	$83, %dl
	jne	.LBB101_509
.LBB101_97:
	movl	$19, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_136
.LBB101_98:                             # %._crit_edge2422
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	movl	$-4, %eax
	cmpb	$89, %dl
	jne	.LBB101_509
# %bb.99:
	movl	48(%r12), %edx
	movl	52(%r12), %eax
	addl	$1, %edx
	movl	%edx, 48(%r12)
	cmpl	$2, %eax
	jge	.LBB101_268
.LBB101_100:
	movl	$0, 3176(%r12)
.LBB101_101:
	movl	$20, 8(%r12)
	movl	36(%r12), %ecx
	cmpl	$7, %ecx
	jle	.LBB101_132
.LBB101_102:                            # %._crit_edge2417
	movl	32(%r12), %eax
	addl	$-8, %ecx
	shrl	%cl, %eax
	movl	%ecx, 36(%r12)
	movl	3176(%r12), %edx
	shll	$8, %edx
	movzbl	%al, %eax
	orl	%edx, %eax
	movl	%eax, 3176(%r12)
.LBB101_103:
	movl	$21, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_124
.LBB101_104:                            # %._crit_edge2412
	movl	32(%r12), %eax
	addl	$-8, %ecx
	shrl	%cl, %eax
	movl	%ecx, 36(%r12)
	movl	3176(%r12), %edx
	shll	$8, %edx
	movzbl	%al, %eax
	orl	%edx, %eax
	movl	%eax, 3176(%r12)
.LBB101_105:
	movl	$22, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_115
.LBB101_106:                            # %._crit_edge2407
	movl	32(%r12), %eax
	addl	$-8, %ecx
	shrl	%cl, %eax
	movl	%ecx, 36(%r12)
	movl	3176(%r12), %edx
	shll	$8, %edx
	movzbl	%al, %eax
	orl	%edx, %eax
	movl	%eax, 3176(%r12)
.LBB101_107:
	movl	$23, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_111
.LBB101_108:                            # %._crit_edge2402
	movl	32(%r12), %eax
	addl	$-8, %ecx
	shrl	%cl, %eax
	movl	%ecx, 36(%r12)
	movl	3176(%r12), %edx
	shll	$8, %edx
	movzbl	%al, %eax
	orl	%edx, %eax
	movl	%eax, 3176(%r12)
.LBB101_109:
	movl	$24, 8(%r12)
	jmp	.LBB101_119
	.p2align	4, 0x90
.LBB101_110:                            #   in Loop: Header=BB101_111 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_108
.LBB101_111:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.112:                              #   in Loop: Header=BB101_111 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_110
# %bb.113:                              #   in Loop: Header=BB101_111 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_110
	.p2align	4, 0x90
.LBB101_114:                            #   in Loop: Header=BB101_115 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_106
.LBB101_115:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.116:                              #   in Loop: Header=BB101_115 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_114
# %bb.117:                              #   in Loop: Header=BB101_115 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_114
	.p2align	4, 0x90
.LBB101_118:                            #   in Loop: Header=BB101_119 Depth=1
	movl	36(%r12), %ecx
.LBB101_119:                            # =>This Inner Loop Header: Depth=1
	testl	%ecx, %ecx
	jg	.LBB101_155
# %bb.120:                              #   in Loop: Header=BB101_119 Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.121:                              #   in Loop: Header=BB101_119 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_118
# %bb.122:                              #   in Loop: Header=BB101_119 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_118
	.p2align	4, 0x90
.LBB101_123:                            #   in Loop: Header=BB101_124 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_104
.LBB101_124:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.125:                              #   in Loop: Header=BB101_124 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_123
# %bb.126:                              #   in Loop: Header=BB101_124 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_123
.LBB101_127:                            #   in Loop: Header=BB101_128 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_87
.LBB101_128:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.129:                              #   in Loop: Header=BB101_128 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_127
# %bb.130:                              #   in Loop: Header=BB101_128 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_127
.LBB101_131:                            #   in Loop: Header=BB101_132 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_102
.LBB101_132:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.133:                              #   in Loop: Header=BB101_132 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_131
# %bb.134:                              #   in Loop: Header=BB101_132 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_131
.LBB101_135:                            #   in Loop: Header=BB101_136 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_98
.LBB101_136:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.137:                              #   in Loop: Header=BB101_136 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_135
# %bb.138:                              #   in Loop: Header=BB101_136 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_135
.LBB101_139:                            #   in Loop: Header=BB101_140 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_96
.LBB101_140:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.141:                              #   in Loop: Header=BB101_140 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_139
# %bb.142:                              #   in Loop: Header=BB101_140 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_139
.LBB101_143:                            #   in Loop: Header=BB101_144 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_94
.LBB101_144:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.145:                              #   in Loop: Header=BB101_144 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_143
# %bb.146:                              #   in Loop: Header=BB101_144 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_143
.LBB101_147:                            #   in Loop: Header=BB101_148 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_92
.LBB101_148:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.149:                              #   in Loop: Header=BB101_148 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_147
# %bb.150:                              #   in Loop: Header=BB101_148 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_147
.LBB101_151:                            #   in Loop: Header=BB101_152 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_90
.LBB101_152:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.153:                              #   in Loop: Header=BB101_152 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_151
# %bb.154:                              #   in Loop: Header=BB101_152 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_151
.LBB101_155:                            # %._crit_edge2397
	movl	32(%r12), %eax
	addl	$-1, %ecx
	shrl	%cl, %eax
	movl	%ecx, 36(%r12)
	andb	$1, %al
	movb	%al, 20(%r12)
	movl	$0, 56(%r12)
.LBB101_156:
	movl	$25, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_179
.LBB101_157:                            # %._crit_edge2392
	addl	$-8, %ecx
	movl	32(%r12), %eax
	movl	56(%r12), %edx
	shrl	%cl, %eax
	movl	%ecx, 36(%r12)
	shll	$8, %edx
	movzbl	%al, %eax
	orl	%edx, %eax
	movl	%eax, 56(%r12)
.LBB101_158:
	movl	$26, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_175
.LBB101_159:                            # %._crit_edge2387
	addl	$-8, %ecx
	movl	32(%r12), %eax
	movl	56(%r12), %edx
	shrl	%cl, %eax
	movl	%ecx, 36(%r12)
	shll	$8, %edx
	movzbl	%al, %eax
	orl	%edx, %eax
	movl	%eax, 56(%r12)
.LBB101_160:
	movl	$27, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_171
.LBB101_161:                            # %._crit_edge2382
	addl	$-8, %ecx
	movl	32(%r12), %eax
	shrl	%cl, %eax
	movl	56(%r12), %esi
	movl	%ecx, 36(%r12)
	shll	$8, %esi
	movzbl	%al, %edx
	orl	%esi, %edx
	movl	%edx, 56(%r12)
	movl	$-4, %eax
	js	.LBB101_509
# %bb.162:
	imull	$100000, 40(%r12), %esi         # imm = 0x186A0
	orl	$10, %esi
	xorl	%ecx, %ecx
	cmpl	%esi, %edx
	jg	.LBB101_509
	jmp	.LBB101_163
	.p2align	4, 0x90
.LBB101_170:                            #   in Loop: Header=BB101_171 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_161
.LBB101_171:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.172:                              #   in Loop: Header=BB101_171 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_170
# %bb.173:                              #   in Loop: Header=BB101_171 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_170
	.p2align	4, 0x90
.LBB101_174:                            #   in Loop: Header=BB101_175 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_159
.LBB101_175:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.176:                              #   in Loop: Header=BB101_175 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_174
# %bb.177:                              #   in Loop: Header=BB101_175 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_174
	.p2align	4, 0x90
.LBB101_178:                            #   in Loop: Header=BB101_179 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_157
.LBB101_179:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.180:                              #   in Loop: Header=BB101_179 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_178
# %bb.181:                              #   in Loop: Header=BB101_179 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_178
.LBB101_183:
	movl	$42, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_235
.LBB101_184:                            # %._crit_edge2218
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	movl	$-4, %eax
	cmpb	$114, %dl
	jne	.LBB101_509
.LBB101_185:
	movl	$43, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_231
.LBB101_186:                            # %._crit_edge2213
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	movl	$-4, %eax
	cmpb	$69, %dl
	jne	.LBB101_509
.LBB101_187:
	movl	$44, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_227
.LBB101_188:                            # %._crit_edge2208
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	movl	$-4, %eax
	cmpb	$56, %dl
	jne	.LBB101_509
.LBB101_189:
	movl	$45, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_223
.LBB101_190:                            # %._crit_edge2203
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	movl	$-4, %eax
	cmpb	$80, %dl
	jne	.LBB101_509
.LBB101_191:
	movl	$46, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_219
.LBB101_192:                            # %._crit_edge2198
	movl	32(%r12), %edx
	addl	$-8, %ecx
	shrl	%cl, %edx
	movl	%ecx, 36(%r12)
	movl	$-4, %eax
	cmpb	$-112, %dl
	jne	.LBB101_509
# %bb.193:
	movl	$0, 3180(%r12)
.LBB101_194:
	movl	$47, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_215
.LBB101_195:                            # %._crit_edge2193
	movl	32(%r12), %eax
	addl	$-8, %ecx
	shrl	%cl, %eax
	movl	%ecx, 36(%r12)
	movl	3180(%r12), %edx
	shll	$8, %edx
	movzbl	%al, %eax
	orl	%edx, %eax
	movl	%eax, 3180(%r12)
.LBB101_196:
	movl	$48, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_211
.LBB101_197:                            # %._crit_edge2188
	movl	32(%r12), %eax
	addl	$-8, %ecx
	shrl	%cl, %eax
	movl	%ecx, 36(%r12)
	movl	3180(%r12), %edx
	shll	$8, %edx
	movzbl	%al, %eax
	orl	%edx, %eax
	movl	%eax, 3180(%r12)
.LBB101_198:
	movl	$49, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_207
.LBB101_199:                            # %._crit_edge2183
	movl	32(%r12), %eax
	addl	$-8, %ecx
	shrl	%cl, %eax
	movl	%ecx, 36(%r12)
	movl	3180(%r12), %edx
	shll	$8, %edx
	movzbl	%al, %eax
	orl	%edx, %eax
	movl	%eax, 3180(%r12)
.LBB101_200:
	movl	$50, 8(%r12)
	cmpl	$7, %ecx
	jle	.LBB101_203
.LBB101_201:                            # %._crit_edge
	movl	32(%r12), %eax
	addl	$-8, %ecx
	shrl	%cl, %eax
	movl	%ecx, 36(%r12)
	movl	3180(%r12), %ecx
	shll	$8, %ecx
	movzbl	%al, %eax
	orl	%ecx, %eax
	movl	%eax, 3180(%r12)
	movl	$1, 8(%r12)
	movl	$4, %eax
	jmp	.LBB101_509
	.p2align	4, 0x90
.LBB101_202:                            #   in Loop: Header=BB101_203 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_201
.LBB101_203:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.204:                              #   in Loop: Header=BB101_203 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_202
# %bb.205:                              #   in Loop: Header=BB101_203 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_202
	.p2align	4, 0x90
.LBB101_206:                            #   in Loop: Header=BB101_207 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_199
.LBB101_207:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.208:                              #   in Loop: Header=BB101_207 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_206
# %bb.209:                              #   in Loop: Header=BB101_207 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_206
	.p2align	4, 0x90
.LBB101_210:                            #   in Loop: Header=BB101_211 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_197
.LBB101_211:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.212:                              #   in Loop: Header=BB101_211 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_210
# %bb.213:                              #   in Loop: Header=BB101_211 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_210
.LBB101_214:                            #   in Loop: Header=BB101_215 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_195
.LBB101_215:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.216:                              #   in Loop: Header=BB101_215 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_214
# %bb.217:                              #   in Loop: Header=BB101_215 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_214
.LBB101_218:                            #   in Loop: Header=BB101_219 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_192
.LBB101_219:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.220:                              #   in Loop: Header=BB101_219 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_218
# %bb.221:                              #   in Loop: Header=BB101_219 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_218
.LBB101_222:                            #   in Loop: Header=BB101_223 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_190
.LBB101_223:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.224:                              #   in Loop: Header=BB101_223 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_222
# %bb.225:                              #   in Loop: Header=BB101_223 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_222
.LBB101_226:                            #   in Loop: Header=BB101_227 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_188
.LBB101_227:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.228:                              #   in Loop: Header=BB101_227 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_226
# %bb.229:                              #   in Loop: Header=BB101_227 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_226
.LBB101_230:                            #   in Loop: Header=BB101_231 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_186
.LBB101_231:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.232:                              #   in Loop: Header=BB101_231 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_230
# %bb.233:                              #   in Loop: Header=BB101_231 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_230
.LBB101_234:                            #   in Loop: Header=BB101_235 Depth=1
	movl	36(%r12), %ecx
	cmpl	$8, %ecx
	jge	.LBB101_184
.LBB101_235:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.236:                              #   in Loop: Header=BB101_235 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_234
# %bb.237:                              #   in Loop: Header=BB101_235 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_234
.LBB101_238:
	movl	$0, -44(%rbp)                   # 4-byte Folded Spill
	movl	$-4, %eax
	jmp	.LBB101_509
.LBB101_239:
	movl	%r15d, %r8d
	movl	%r13d, %r9d
	movl	%r14d, %ecx
	movq	%rcx, -232(%rbp)                # 8-byte Spill
	movl	-124(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -240(%rbp)                # 8-byte Spill
	movl	-128(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -104(%rbp)                # 8-byte Spill
	movl	-132(%rbp), %r11d               # 4-byte Reload
	movl	-136(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -200(%rbp)                # 8-byte Spill
	movl	-140(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -248(%rbp)                # 8-byte Spill
	movl	-144(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -192(%rbp)                # 8-byte Spill
	movl	-148(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -96(%rbp)                 # 8-byte Spill
	movl	-152(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -88(%rbp)                 # 4-byte Spill
	movl	-156(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -112(%rbp)                # 8-byte Spill
	movl	-160(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -52(%rbp)                 # 4-byte Spill
	movl	-164(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -208(%rbp)                # 8-byte Spill
	movl	-168(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -60(%rbp)                 # 4-byte Spill
	movl	-172(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -44(%rbp)                 # 4-byte Spill
	movl	-176(%rbp), %ecx                # 4-byte Reload
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -120(%rbp)                # 8-byte Spill
	movl	-68(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, -48(%rbp)                 # 4-byte Spill
	movl	-56(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, -84(%rbp)                 # 4-byte Spill
	movl	-184(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, -64(%rbp)                 # 4-byte Spill
	jmp	.LBB101_241
.LBB101_240:
	movl	%r15d, %r8d
	movl	%r13d, %r9d
	movl	%r14d, %eax
	movq	%rax, -232(%rbp)                # 8-byte Spill
	movl	-124(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -240(%rbp)                # 8-byte Spill
	movl	-128(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -104(%rbp)                # 8-byte Spill
	movl	-132(%rbp), %r11d               # 4-byte Reload
	movl	-136(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -200(%rbp)                # 8-byte Spill
	movl	-140(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -248(%rbp)                # 8-byte Spill
	movl	-144(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -192(%rbp)                # 8-byte Spill
	movl	-148(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -96(%rbp)                 # 8-byte Spill
	movl	-152(%rbp), %eax                # 4-byte Reload
	movl	%eax, -88(%rbp)                 # 4-byte Spill
	movl	-156(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -112(%rbp)                # 8-byte Spill
	movl	-160(%rbp), %eax                # 4-byte Reload
	movl	%eax, -52(%rbp)                 # 4-byte Spill
	movl	-164(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -208(%rbp)                # 8-byte Spill
	movl	-168(%rbp), %eax                # 4-byte Reload
	movl	%eax, -60(%rbp)                 # 4-byte Spill
	movl	-172(%rbp), %eax                # 4-byte Reload
	movl	%eax, -44(%rbp)                 # 4-byte Spill
	movl	-176(%rbp), %eax                # 4-byte Reload
                                        # kill: def $eax killed $eax def $rax
	movq	%rax, -120(%rbp)                # 8-byte Spill
	movl	-68(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	movl	-56(%rbp), %eax                 # 4-byte Reload
	movl	%eax, -84(%rbp)                 # 4-byte Spill
	movl	-184(%rbp), %eax                # 4-byte Reload
	movl	%eax, -64(%rbp)                 # 4-byte Spill
	movl	$-3, %eax
.LBB101_241:                            # %.loopexit
	movq	-264(%rbp), %r10                # 8-byte Reload
	movq	-224(%rbp), %rdi                # 8-byte Reload
	jmp	.LBB101_509
.LBB101_242:
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	movslq	%ecx, %rcx
	movl	-64(%rbp), %eax                 # 4-byte Reload
	movb	%al, 25886(%r12,%rcx)
	addl	$1, %ecx
	movl	-44(%rbp), %r14d                # 4-byte Reload
	movq	%rcx, -80(%rbp)                 # 8-byte Spill
	cmpl	%r14d, %ecx
	movq	%rbx, -120(%rbp)                # 8-byte Spill
	jl	.LBB101_55
.LBB101_243:                            # %.preheader1986
	testl	%ebx, %ebx
	jle	.LBB101_257
# %bb.244:                              # %.lr.ph2367.preheader
	cmpl	$32, %ebx
	jae	.LBB101_246
# %bb.245:
	xorl	%eax, %eax
	jmp	.LBB101_256
.LBB101_246:                            # %vector.scevcheck
	leal	-1(%rbx), %ecx
	xorl	%eax, %eax
	cmpl	$255, %ecx
	ja	.LBB101_256
# %bb.247:                              # %vector.scevcheck
	cmpb	$-1, %cl
	je	.LBB101_256
# %bb.248:                              # %vector.ph
	movl	%r14d, %r13d
	movq	%rdi, %r15
	movq	%rbx, %rax
                                        # kill: def $eax killed $eax killed $rax def $rax
	andl	$-32, %eax
	leal	-32(%rax), %edx
	movl	%edx, %esi
	shrl	$5, %esi
	addl	$1, %esi
	movl	%esi, %ecx
	andl	$3, %ecx
	cmpl	$96, %edx
	jae	.LBB101_250
# %bb.249:
	movdqa	.LCPI101_0(%rip), %xmm0         # xmm0 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	xorl	%edx, %edx
	jmp	.LBB101_252
.LBB101_250:                            # %vector.ph.new
	andl	$-4, %esi
	negl	%esi
	movdqa	.LCPI101_0(%rip), %xmm0         # xmm0 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
	xorl	%edx, %edx
	movdqa	.LCPI101_1(%rip), %xmm8         # xmm8 = [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16]
	movdqa	.LCPI101_2(%rip), %xmm9         # xmm9 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
	movdqa	.LCPI101_3(%rip), %xmm10        # xmm10 = [48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48]
	movdqa	.LCPI101_4(%rip), %xmm4         # xmm4 = [64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64]
	movdqa	.LCPI101_5(%rip), %xmm5         # xmm5 = [80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80]
	movdqa	.LCPI101_6(%rip), %xmm6         # xmm6 = [96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96]
	movdqa	.LCPI101_7(%rip), %xmm7         # xmm7 = [112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112]
	movdqa	.LCPI101_8(%rip), %xmm1         # xmm1 = [128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128]
.LBB101_251:                            # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, %xmm2
	paddb	%xmm8, %xmm2
	movl	%edx, %edi
	andl	$128, %edi
	movdqu	%xmm0, -214(%rbp,%rdi)
	movdqu	%xmm2, -198(%rbp,%rdi)
	movdqa	%xmm0, %xmm2
	paddb	%xmm9, %xmm2
	movdqa	%xmm0, %xmm3
	paddb	%xmm10, %xmm3
	movdqu	%xmm2, -182(%rbp,%rdi)
	movdqu	%xmm3, -166(%rbp,%rdi)
	movdqa	%xmm0, %xmm2
	paddb	%xmm4, %xmm2
	movdqa	%xmm0, %xmm3
	paddb	%xmm5, %xmm3
	movdqu	%xmm2, -150(%rbp,%rdi)
	movdqu	%xmm3, -134(%rbp,%rdi)
	movdqa	%xmm0, %xmm2
	paddb	%xmm6, %xmm2
	movdqa	%xmm0, %xmm3
	paddb	%xmm7, %xmm3
	movdqu	%xmm2, -118(%rbp,%rdi)
	movdqu	%xmm3, -102(%rbp,%rdi)
	subl	$-128, %edx
	pxor	%xmm1, %xmm0
	addl	$4, %esi
	jne	.LBB101_251
.LBB101_252:                            # %middle.block.unr-lcssa
	testl	%ecx, %ecx
	je	.LBB101_255
# %bb.253:                              # %vector.body.epil.preheader
	negl	%ecx
	movdqa	.LCPI101_1(%rip), %xmm1         # xmm1 = [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16]
	movdqa	.LCPI101_2(%rip), %xmm2         # xmm2 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
.LBB101_254:                            # %vector.body.epil
                                        # =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, %xmm3
	paddb	%xmm1, %xmm3
	movl	%edx, %esi
	andl	$224, %esi
	movdqu	%xmm0, -214(%rbp,%rsi)
	movdqu	%xmm3, -198(%rbp,%rsi)
	addl	$32, %edx
	paddb	%xmm2, %xmm0
	incl	%ecx
	jne	.LBB101_254
.LBB101_255:                            # %middle.block
	movq	-120(%rbp), %rcx                # 8-byte Reload
	cmpl	%eax, %ecx
	movq	%rcx, %rbx
	movq	%r15, %rdi
	movl	%r13d, %r14d
	je	.LBB101_257
.LBB101_256:                            # %.lr.ph2367
                                        # =>This Inner Loop Header: Depth=1
	movzbl	%al, %eax
	movb	%al, -214(%rbp,%rax)
	addb	$1, %al
	movzbl	%al, %ecx
	cmpl	%ecx, %ebx
	jg	.LBB101_256
.LBB101_257:                            # %._crit_edge2368
	xorl	%ecx, %ecx
	movl	$0, %eax
	testl	%r14d, %r14d
	cmovnsl	%r14d, %eax
	jle	.LBB101_267
# %bb.258:                              # %.lr.ph2363
	movq	%rdi, -224(%rbp)                # 8-byte Spill
	movq	%rax, -80(%rbp)                 # 8-byte Spill
	movl	%r11d, -56(%rbp)                # 4-byte Spill
	movl	%r9d, %r13d
	movq	%r8, %r15
	movl	$4294967295, %r8d               # imm = 0xFFFFFFFF
	xorl	%ecx, %ecx
	jmp	.LBB101_260
.LBB101_259:                            # %._crit_edge2359
                                        #   in Loop: Header=BB101_260 Depth=1
	movb	%r9b, -214(%rbp)
	movb	%r9b, 7884(%r12,%rcx)
	addq	$1, %rcx
	cmpq	-80(%rbp), %rcx                 # 8-byte Folded Reload
	je	.LBB101_296
.LBB101_260:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB101_266 Depth 2
	movzbl	25886(%r12,%rcx), %edx
	movb	-214(%rbp,%rdx), %r9b
	testq	%rdx, %rdx
	je	.LBB101_259
# %bb.261:                              # %.lr.ph2358.preheader
                                        #   in Loop: Header=BB101_260 Depth=1
	leal	-1(%rdx), %eax
	testb	$1, %dl
	jne	.LBB101_263
# %bb.262:                              #   in Loop: Header=BB101_260 Depth=1
	movl	%edx, %ebx
	jmp	.LBB101_264
.LBB101_263:                            # %.lr.ph2358.prol.preheader
                                        #   in Loop: Header=BB101_260 Depth=1
	leal	(%rdx,%r8), %esi
	movb	-214(%rbp,%rsi), %bl
	movb	%bl, -214(%rbp,%rdx)
	addq	$-1, %rdx
	movl	%eax, %ebx
.LBB101_264:                            # %.lr.ph2358.prol.loopexit.unr-lcssa
                                        #   in Loop: Header=BB101_260 Depth=1
	testb	%al, %al
	je	.LBB101_259
# %bb.265:                              # %.lr.ph2358.preheader29
                                        #   in Loop: Header=BB101_260 Depth=1
	leaq	(%rdx,%rbp), %rsi
	addq	$-214, %rsi
	addq	%r8, %rdx
	negb	%bl
	movzbl	%bl, %edi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB101_266:                            # %.lr.ph2358
                                        #   Parent Loop BB101_260 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%edx, %ebx
	movzbl	-214(%rbp,%rbx), %ebx
	movb	%bl, (%rsi,%rax)
	leal	-1(%rdx), %ebx
	movzbl	-214(%rbp,%rbx), %ebx
	movb	%bl, -1(%rsi,%rax)
	addq	$-2, %rdx
	addq	$-2, %rax
	cmpb	%al, %dil
	jne	.LBB101_266
	jmp	.LBB101_259
.LBB101_296:
	xorl	%ecx, %ecx
	movq	%r15, %r8
	movl	%r13d, %r9d
	movl	-56(%rbp), %r11d                # 4-byte Reload
	movq	-120(%rbp), %rbx                # 8-byte Reload
	movq	-224(%rbp), %rdi                # 8-byte Reload
	jmp	.LBB101_297
.LBB101_267:
	xorl	%eax, %eax
	movq	%rax, -80(%rbp)                 # 8-byte Spill
	jmp	.LBB101_297
.LBB101_268:
	movl	%r9d, -68(%rbp)                 # 4-byte Spill
	movl	%r11d, -56(%rbp)                # 4-byte Spill
	movq	%rdi, %rbx
	movq	stderr(%rip), %rdi
	movl	$.L.str.158, %esi
	xorl	%eax, %eax
	movq	%r10, %r14
	movq	%r8, %r13
	callq	fprintf
	movl	-56(%rbp), %r11d                # 4-byte Reload
	movl	-68(%rbp), %r9d                 # 4-byte Reload
	movq	%r13, %r8
	movq	%rbx, %rdi
	movq	%r14, %r10
	jmp	.LBB101_100
.LBB101_269:
	movl	$4001, %edi                     # imm = 0xFA1
	callq	BZ2_bz__AssertH__fail
.LBB101_66:
	movl	$35, 8(%r12)
	jmp	.LBB101_344
	.p2align	4, 0x90
.LBB101_343:                            #   in Loop: Header=BB101_344 Depth=1
	movl	36(%r12), %eax
.LBB101_344:                            # =>This Inner Loop Header: Depth=1
	testl	%eax, %eax
	jg	.LBB101_348
# %bb.345:                              #   in Loop: Header=BB101_344 Depth=1
	movq	(%r12), %rcx
	cmpl	$0, 8(%rcx)
	je	.LBB101_354
# %bb.346:                              #   in Loop: Header=BB101_344 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rcx), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %eax
	movl	%eax, 36(%r12)
	addq	$1, (%rcx)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_343
# %bb.347:                              #   in Loop: Header=BB101_344 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_343
.LBB101_348:                            # %._crit_edge2238
	movl	32(%r12), %ecx
	addl	$-1, %eax
	movl	%eax, 36(%r12)
	xorl	%edx, %edx
	btl	%eax, %ecx
	setae	%dl
	leal	(%rbx,%rdx,2), %ebx
	addl	$-1, %ebx
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	jmp	.LBB101_302
.LBB101_354:
	movq	%rbx, -200(%rbp)                # 8-byte Spill
	xorl	%eax, %eax
	jmp	.LBB101_509
.LBB101_70:
	movl	$41, 8(%r12)
	jmp	.LBB101_502
	.p2align	4, 0x90
.LBB101_501:                            #   in Loop: Header=BB101_502 Depth=1
	movl	36(%r12), %edx
.LBB101_502:                            # =>This Inner Loop Header: Depth=1
	testl	%edx, %edx
	jg	.LBB101_506
# %bb.503:                              #   in Loop: Header=BB101_502 Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_510
# %bb.504:                              #   in Loop: Header=BB101_502 Depth=1
	movl	32(%r12), %ecx
	shll	$8, %ecx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%ecx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %edx
	movl	%edx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_501
# %bb.505:                              #   in Loop: Header=BB101_502 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_501
.LBB101_506:                            # %._crit_edge2296
	movl	32(%r12), %eax
	addl	$-1, %edx
	movl	%edx, %ecx
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%edx, 36(%r12)
	movq	%rax, -240(%rbp)                # 8-byte Spill
	leal	(%rax,%r13,2), %r13d
	jmp	.LBB101_408
.LBB101_163:
	cmpl	$16, %ecx
	jge	.LBB101_273
# %bb.164:
	movl	%ecx, %eax
	movq	%rax, -80(%rbp)                 # 8-byte Spill
.LBB101_165:
	movl	$28, 8(%r12)
	.p2align	4, 0x90
.LBB101_166:                            # =>This Inner Loop Header: Depth=1
	movl	36(%r12), %eax
	testl	%eax, %eax
	jg	.LBB101_270
# %bb.167:                              #   in Loop: Header=BB101_166 Depth=1
	movq	(%r12), %rcx
	cmpl	$0, 8(%rcx)
	je	.LBB101_474
# %bb.168:                              #   in Loop: Header=BB101_166 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rcx), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %eax
	movl	%eax, 36(%r12)
	addq	$1, (%rcx)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_166
# %bb.169:                              #   in Loop: Header=BB101_166 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_166
.LBB101_270:                            # %._crit_edge2223
	movl	32(%r12), %ecx
	addl	$-1, %eax
	movl	%eax, 36(%r12)
	btl	%eax, %ecx
	jae	.LBB101_272
# %bb.271:
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	movslq	%ecx, %rax
	movb	$1, 3452(%r12,%rax)
	addl	$1, %ecx
                                        # kill: def $ecx killed $ecx killed $rcx
	jmp	.LBB101_163
.LBB101_272:
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	movslq	%ecx, %rax
	movb	$0, 3452(%r12,%rax)
	addl	$1, %ecx
                                        # kill: def $ecx killed $ecx killed $rcx
	jmp	.LBB101_163
.LBB101_273:                            # %.preheader1989.preheader
	pxor	%xmm0, %xmm0
	movdqu	%xmm0, 3436(%r12)
	movdqu	%xmm0, 3420(%r12)
	movdqu	%xmm0, 3404(%r12)
	movdqu	%xmm0, 3388(%r12)
	movdqu	%xmm0, 3372(%r12)
	movdqu	%xmm0, 3356(%r12)
	movdqu	%xmm0, 3340(%r12)
	movdqu	%xmm0, 3324(%r12)
	movdqu	%xmm0, 3308(%r12)
	movdqu	%xmm0, 3292(%r12)
	movdqu	%xmm0, 3276(%r12)
	movdqu	%xmm0, 3260(%r12)
	movdqu	%xmm0, 3244(%r12)
	movdqu	%xmm0, 3228(%r12)
	movdqu	%xmm0, 3212(%r12)
	movdqu	%xmm0, 3196(%r12)
	xorl	%eax, %eax
.LBB101_274:                            # %.loopexit1990
	cmpl	$15, %eax
	movq	%rax, -80(%rbp)                 # 8-byte Spill
	jg	.LBB101_286
# %bb.275:
	movslq	%eax, %rcx
	xorl	%eax, %eax
	cmpb	$0, 3452(%r12,%rcx)
	je	.LBB101_285
# %bb.276:
	movl	%eax, -64(%rbp)                 # 4-byte Spill
	cmpl	$15, %eax
	jg	.LBB101_285
.LBB101_277:                            # =>This Loop Header: Depth=1
                                        #     Child Loop BB101_281 Depth 2
	movl	$29, 8(%r12)
	jmp	.LBB101_281
	.p2align	4, 0x90
.LBB101_278:                            #   in Loop: Header=BB101_281 Depth=2
	movq	(%r12), %rcx
	cmpl	$0, 8(%rcx)
	je	.LBB101_474
# %bb.279:                              #   in Loop: Header=BB101_281 Depth=2
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rcx), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %eax
	movl	%eax, 36(%r12)
	addq	$1, (%rcx)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_281
# %bb.280:                              #   in Loop: Header=BB101_281 Depth=2
	addl	$1, 16(%rax)
.LBB101_281:                            #   Parent Loop BB101_277 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	36(%r12), %eax
	testl	%eax, %eax
	jle	.LBB101_278
# %bb.282:                              # %._crit_edge2228
                                        #   in Loop: Header=BB101_277 Depth=1
	movl	32(%r12), %ecx
	addl	$-1, %eax
	movl	%eax, 36(%r12)
	btl	%eax, %ecx
	movl	-64(%rbp), %ecx                 # 4-byte Reload
	jae	.LBB101_284
# %bb.283:                              #   in Loop: Header=BB101_277 Depth=1
	movq	-80(%rbp), %rax                 # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	shll	$4, %eax
	addl	%ecx, %eax
	cltq
	movb	$1, 3196(%r12,%rax)
.LBB101_284:                            #   in Loop: Header=BB101_277 Depth=1
	addl	$1, %ecx
	movl	%ecx, %eax
	movl	%eax, -64(%rbp)                 # 4-byte Spill
	cmpl	$15, %eax
	jle	.LBB101_277
.LBB101_285:
	movq	-80(%rbp), %rax                 # 8-byte Reload
	addl	$1, %eax
	jmp	.LBB101_274
.LBB101_286:
	movl	%r11d, -56(%rbp)                # 4-byte Spill
	movl	%r9d, %r13d
	movq	%r8, -184(%rbp)                 # 8-byte Spill
	movq	%rdi, %r14
	movq	%r10, %rbx
	movq	%r12, %rdi
	callq	makeMaps_d
	movl	3192(%r12), %eax
	testl	%eax, %eax
	je	.LBB101_295
# %bb.287:
	addl	$2, %eax
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	movq	%rbx, %r10
	movq	%r14, %rdi
	movq	-184(%rbp), %r8                 # 8-byte Reload
	movl	%r13d, %r9d
	movl	-56(%rbp), %r11d                # 4-byte Reload
.LBB101_288:
	movl	$30, 8(%r12)
	movl	36(%r12), %ecx
	cmpl	$2, %ecx
	jle	.LBB101_292
.LBB101_289:                            # %._crit_edge2376
	movl	32(%r12), %esi
	addl	$-3, %ecx
	shrl	%cl, %esi
	andl	$7, %esi
	movl	%ecx, 36(%r12)
	cmpl	$7, %esi
	movq	%rsi, -120(%rbp)                # 8-byte Spill
	ja	.LBB101_51
# %bb.290:                              # %._crit_edge2376
	movl	$-4, %eax
	movl	$131, %edx
	btl	%esi, %edx
	jb	.LBB101_509
	jmp	.LBB101_51
.LBB101_291:                            #   in Loop: Header=BB101_292 Depth=1
	movl	36(%r12), %ecx
	cmpl	$3, %ecx
	jge	.LBB101_289
.LBB101_292:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.293:                              #   in Loop: Header=BB101_292 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_291
# %bb.294:                              #   in Loop: Header=BB101_292 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_291
.LBB101_295:
	movl	$-4, %eax
	movq	%rbx, %r10
	movq	%r14, %rdi
	movq	-184(%rbp), %r8                 # 8-byte Reload
	movl	%r13d, %r9d
	movl	-56(%rbp), %r11d                # 4-byte Reload
	jmp	.LBB101_509
.LBB101_297:
	movq	%rbx, -120(%rbp)                # 8-byte Spill
	movl	%ecx, -84(%rbp)                 # 4-byte Spill
	cmpl	%ebx, %ecx
	jge	.LBB101_313
# %bb.298:
	movl	%r14d, -44(%rbp)                # 4-byte Spill
.LBB101_299:
	movl	$33, 8(%r12)
	movl	36(%r12), %ecx
	cmpl	$4, %ecx
	jle	.LBB101_310
.LBB101_300:                            # %._crit_edge2248
	movl	32(%r12), %ebx
	addl	$-5, %ecx
	shrl	%cl, %ebx
	andl	$31, %ebx
	movl	%ecx, 36(%r12)
	xorl	%ecx, %ecx
	movl	-48(%rbp), %eax                 # 4-byte Reload
	cmpl	%eax, %ecx
	jge	.LBB101_308
.LBB101_301:
	movl	%eax, -48(%rbp)                 # 4-byte Spill
.LBB101_302:
	leal	-1(%rbx), %eax
	cmpl	$19, %eax
	ja	.LBB101_355
# %bb.303:
	movq	%rcx, -80(%rbp)                 # 8-byte Spill
	movq	%rbx, -200(%rbp)                # 8-byte Spill
.LBB101_304:
	movl	$34, 8(%r12)
	movl	36(%r12), %eax
	testl	%eax, %eax
	jle	.LBB101_349
# %bb.305:
	movq	-200(%rbp), %rbx                # 8-byte Reload
.LBB101_306:                            # %._crit_edge2243
	movl	32(%r12), %ecx
	addl	$-1, %eax
	movl	%eax, 36(%r12)
	btl	%eax, %ecx
	jb	.LBB101_66
# %bb.307:
	movslq	-84(%rbp), %rax                 # 4-byte Folded Reload
	movq	-80(%rbp), %rdx                 # 8-byte Reload
	movslq	%edx, %rdx
	movq	%rax, %rcx
	shlq	$8, %rcx
	leaq	(%rcx,%rax,2), %rax
	movq	%rdx, %rcx
	addq	%r12, %rax
	movb	%bl, 43888(%rdx,%rax)
	addl	$1, %ecx
	movl	-48(%rbp), %eax                 # 4-byte Reload
	cmpl	%eax, %ecx
	jl	.LBB101_301
.LBB101_308:
	movq	%rcx, -80(%rbp)                 # 8-byte Spill
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	movq	%rbx, -200(%rbp)                # 8-byte Spill
	movl	-84(%rbp), %ecx                 # 4-byte Reload
	addl	$1, %ecx
	movl	-44(%rbp), %r14d                # 4-byte Reload
	movq	-120(%rbp), %rbx                # 8-byte Reload
	jmp	.LBB101_297
	.p2align	4, 0x90
.LBB101_309:                            #   in Loop: Header=BB101_310 Depth=1
	movl	36(%r12), %ecx
	cmpl	$5, %ecx
	jge	.LBB101_300
.LBB101_310:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.311:                              #   in Loop: Header=BB101_310 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %ecx
	movl	%ecx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_309
# %bb.312:                              #   in Loop: Header=BB101_310 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_309
.LBB101_349:                            # %.lr.ph2242
	movq	-200(%rbp), %rbx                # 8-byte Reload
	jmp	.LBB101_351
	.p2align	4, 0x90
.LBB101_350:                            #   in Loop: Header=BB101_351 Depth=1
	movl	36(%r12), %eax
	testl	%eax, %eax
	jg	.LBB101_306
.LBB101_351:                            # =>This Inner Loop Header: Depth=1
	movq	(%r12), %rcx
	cmpl	$0, 8(%rcx)
	je	.LBB101_474
# %bb.352:                              #   in Loop: Header=BB101_351 Depth=1
	movl	32(%r12), %edx
	shll	$8, %edx
	movq	(%rcx), %rsi
	movzbl	(%rsi), %esi
	orl	%edx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %eax
	movl	%eax, 36(%r12)
	addq	$1, (%rcx)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_350
# %bb.353:                              #   in Loop: Header=BB101_351 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_350
.LBB101_313:
	movl	%r11d, -56(%rbp)                # 4-byte Spill
	movl	%r9d, -68(%rbp)                 # 4-byte Spill
	movq	%r8, -184(%rbp)                 # 8-byte Spill
	movq	%rdi, -224(%rbp)                # 8-byte Spill
	movq	%r10, -264(%rbp)                # 8-byte Spill
	xorl	%ecx, %ecx
	movl	$0, %edx
	movq	-120(%rbp), %rax                # 8-byte Reload
	testl	%eax, %eax
	cmovnsl	%eax, %edx
	jle	.LBB101_332
# %bb.314:                              # %.lr.ph2352
	xorl	%eax, %eax
	movl	-48(%rbp), %ecx                 # 4-byte Reload
	testl	%ecx, %ecx
	cmovgl	%ecx, %eax
	movq	%rdx, -80(%rbp)                 # 8-byte Spill
	movl	%r14d, -44(%rbp)                # 4-byte Spill
	jle	.LBB101_320
# %bb.315:                              # %.lr.ph2352.split.preheader
	cmpl	$1, %eax
	jne	.LBB101_322
# %bb.316:                              # %.lr.ph2352.split.us3391.preheader
	leaq	43888(%r12), %r15
	leaq	57820(%r12), %rbx
	xorl	%r14d, %r14d
	testb	$1, %al
	jne	.LBB101_319
# %bb.317:                              # %.lr.ph2352.split.us3391.us.preheader
	movl	-48(%rbp), %r13d                # 4-byte Reload
.LBB101_318:                            # %.lr.ph2352.split.us3391.us
                                        # =>This Inner Loop Header: Depth=1
	leaq	-12384(%rbx), %rdi
	leaq	-6192(%rbx), %rsi
	movl	%r13d, (%rsp)
	movq	%rbx, %rdx
	movq	%r15, %rcx
	callq	BZ2_hbCreateDecodeTables
	movq	-80(%rbp), %rax                 # 8-byte Reload
	addq	$1, %r14
	addq	$258, %r15                      # imm = 0x102
	addq	$1032, %rbx                     # imm = 0x408
	cmpq	%r14, %rax
	jne	.LBB101_318
	jmp	.LBB101_331
.LBB101_319:                            # %.lr.ph2352.split.us3391
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%r15), %r9d
	cmpl	$32, %r9d
	movl	$32, %r13d
	cmovbl	%r9d, %r13d
	leaq	-12384(%rbx), %rdi
	leaq	-6192(%rbx), %rsi
	movl	-48(%rbp), %eax                 # 4-byte Reload
	movl	%eax, (%rsp)
	movq	%rbx, %rdx
	movq	%r15, %rcx
	movl	%r13d, %r8d
	callq	BZ2_hbCreateDecodeTables
	movq	-80(%rbp), %rax                 # 8-byte Reload
	movl	%r13d, 64012(%r12,%r14,4)
	addq	$1, %r14
	addq	$258, %r15                      # imm = 0x102
	addq	$1032, %rbx                     # imm = 0x408
	cmpq	%r14, %rax
	jne	.LBB101_319
	jmp	.LBB101_331
.LBB101_355:
	movq	%rcx, -80(%rbp)                 # 8-byte Spill
	movq	%rbx, -200(%rbp)                # 8-byte Spill
	movl	$-4, %eax
	jmp	.LBB101_509
.LBB101_320:                            # %.lr.ph2352.split.us.preheader
	leaq	43888(%r12), %r15
	leaq	57820(%r12), %rbx
	xorl	%r14d, %r14d
	movl	-48(%rbp), %r13d                # 4-byte Reload
.LBB101_321:                            # %.lr.ph2352.split.us
                                        # =>This Inner Loop Header: Depth=1
	leaq	-12384(%rbx), %rdi
	leaq	-6192(%rbx), %rsi
	movl	%r13d, (%rsp)
	movq	%rbx, %rdx
	movq	%r15, %rcx
	movl	$32, %r8d
	xorl	%r9d, %r9d
	callq	BZ2_hbCreateDecodeTables
	movq	-80(%rbp), %rax                 # 8-byte Reload
	movl	$32, 64012(%r12,%r14,4)
	addq	$1, %r14
	addq	$258, %r15                      # imm = 0x102
	addq	$1032, %rbx                     # imm = 0x408
	cmpq	%r14, %rax
	jne	.LBB101_321
	jmp	.LBB101_331
.LBB101_322:                            # %.lr.ph2352.split.preheader3653
	movl	%eax, %r15d
	andl	$2147483646, %r15d              # imm = 0x7FFFFFFE
	testb	$1, %al
	jne	.LBB101_327
# %bb.323:                              # %.lr.ph2352.split.us3726.preheader
	leaq	43889(%r12), %r14
	xorl	%r13d, %r13d
.LBB101_324:                            # %.lr.ph2352.split.us3726
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB101_325 Depth 2
	movl	$32, %ebx
	xorl	%r9d, %r9d
	xorl	%eax, %eax
.LBB101_325:                            # %.lr.ph2352.split.new.us
                                        #   Parent Loop BB101_324 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	-1(%r14,%rax), %ecx
	cmpl	%ecx, %r9d
	cmovbl	%ecx, %r9d
	cmpl	%ecx, %ebx
	cmovgl	%ecx, %ebx
	movzbl	(%r14,%rax), %ecx
	cmpl	%ecx, %r9d
	cmovbl	%ecx, %r9d
	cmpl	%ecx, %ebx
	cmovgl	%ecx, %ebx
	addq	$2, %rax
	cmpq	%rax, %r15
	jne	.LBB101_325
# %bb.326:                              # %._crit_edge2345.us3730
                                        #   in Loop: Header=BB101_324 Depth=1
	movq	%r13, %rax
	shlq	$10, %rax
	leaq	(%rax,%r13,8), %rax
	leaq	(%r12,%rax), %rdi
	addq	$45436, %rdi                    # imm = 0xB17C
	leaq	(%r12,%rax), %rsi
	addq	$51628, %rsi                    # imm = 0xC9AC
	leaq	(%r12,%rax), %rdx
	addq	$57820, %rdx                    # imm = 0xE1DC
	movq	%r13, %rax
	shlq	$8, %rax
	leaq	(%rax,%r13,2), %rax
	leaq	(%r12,%rax), %rcx
	addq	$43888, %rcx                    # imm = 0xAB70
	movl	-48(%rbp), %eax                 # 4-byte Reload
	movl	%eax, (%rsp)
	movl	%ebx, %r8d
	callq	BZ2_hbCreateDecodeTables
	movl	%ebx, 64012(%r12,%r13,4)
	addq	$1, %r13
	addq	$258, %r14                      # imm = 0x102
	movq	-80(%rbp), %rax                 # 8-byte Reload
	cmpq	%rax, %r13
	jne	.LBB101_324
	jmp	.LBB101_331
.LBB101_327:                            # %.lr.ph2352.split.preheader27
	leaq	43889(%r12), %r13
	xorl	%r14d, %r14d
.LBB101_328:                            # %.lr.ph2352.split
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB101_329 Depth 2
	movl	$32, %ebx
	xorl	%r9d, %r9d
	xorl	%eax, %eax
.LBB101_329:                            # %.lr.ph2352.split.new
                                        #   Parent Loop BB101_328 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	-1(%r13,%rax), %ecx
	cmpl	%ecx, %r9d
	cmovbl	%ecx, %r9d
	cmpl	%ecx, %ebx
	cmovgl	%ecx, %ebx
	movzbl	(%r13,%rax), %ecx
	cmpl	%ecx, %r9d
	cmovbl	%ecx, %r9d
	cmpl	%ecx, %ebx
	cmovgl	%ecx, %ebx
	addq	$2, %rax
	cmpq	%rax, %r15
	jne	.LBB101_329
# %bb.330:                              # %.epil.preheader
                                        #   in Loop: Header=BB101_328 Depth=1
	movq	%r14, %rax
	shlq	$8, %rax
	leaq	(%rax,%r14,2), %rax
	leaq	(%r12,%rax), %rcx
	addq	$43888, %rcx                    # imm = 0xAB70
	addq	%r12, %rax
	movzbl	43888(%r15,%rax), %eax
	cmpl	%eax, %r9d
	cmovbl	%eax, %r9d
	cmpl	%eax, %ebx
	cmovgl	%eax, %ebx
	movq	%r14, %rax
	shlq	$10, %rax
	leaq	(%rax,%r14,8), %rax
	leaq	(%r12,%rax), %rdi
	addq	$45436, %rdi                    # imm = 0xB17C
	leaq	51628(%r12,%rax), %rsi
	leaq	57820(%r12,%rax), %rdx
	movl	-48(%rbp), %eax                 # 4-byte Reload
	movl	%eax, (%rsp)
	movl	%ebx, %r8d
	callq	BZ2_hbCreateDecodeTables
	movl	%ebx, 64012(%r12,%r14,4)
	addq	$1, %r14
	addq	$258, %r13                      # imm = 0x102
	movq	-80(%rbp), %rax                 # 8-byte Reload
	cmpq	%rax, %r14
	jne	.LBB101_328
.LBB101_331:
	movl	%eax, %ecx
	movl	-44(%rbp), %r14d                # 4-byte Reload
.LBB101_332:                            # %._crit_edge2353
	movl	%ecx, -84(%rbp)                 # 4-byte Spill
	movl	3192(%r12), %eax
	movl	%eax, -60(%rbp)                 # 4-byte Spill
	movl	40(%r12), %ebx
	leaq	68(%r12), %rdi
	movl	$1024, %edx                     # imm = 0x400
	xorl	%esi, %esi
	callq	memset@PLT
	leaq	7880(%r12), %rax
	movl	$4095, %ecx                     # imm = 0xFFF
	movl	$256, %edx                      # imm = 0x100
.LBB101_333:                            # =>This Inner Loop Header: Depth=1
	movslq	%ecx, %rcx
	leaq	-16(%rdx), %rsi
	leal	-1(%rdx), %edi
	movb	%dil, 3724(%r12,%rcx)
	leal	-2(%rdx), %edi
	movb	%dil, 3723(%r12,%rcx)
	leal	-3(%rdx), %edi
	movb	%dil, 3722(%r12,%rcx)
	leal	-4(%rdx), %edi
	movb	%dil, 3721(%r12,%rcx)
	leal	-5(%rdx), %edi
	movb	%dil, 3720(%r12,%rcx)
	leal	-6(%rdx), %edi
	movb	%dil, 3719(%r12,%rcx)
	leal	-7(%rdx), %edi
	movb	%dil, 3718(%r12,%rcx)
	leal	-8(%rdx), %edi
	movb	%dil, 3717(%r12,%rcx)
	leal	-9(%rdx), %edi
	movb	%dil, 3716(%r12,%rcx)
	leal	-10(%rdx), %edi
	movb	%dil, 3715(%r12,%rcx)
	leal	-11(%rdx), %edi
	movb	%dil, 3714(%r12,%rcx)
	leal	-12(%rdx), %edi
	movb	%dil, 3713(%r12,%rcx)
	leal	-13(%rdx), %edi
	movb	%dil, 3712(%r12,%rcx)
	leal	-14(%rdx), %edi
	movb	%dil, 3711(%r12,%rcx)
	addb	$-15, %dl
	movb	%dl, 3710(%r12,%rcx)
	movb	%sil, 3709(%r12,%rcx)
	addq	$-16, %rcx
	leal	1(%rcx), %edx
	movl	%edx, (%rax)
	addq	$-4, %rax
	movq	%rsi, %rdx
	testq	%rsi, %rsi
	jne	.LBB101_333
# %bb.334:
	addl	$1, -60(%rbp)                   # 4-byte Folded Spill
	imull	$100000, %ebx, %eax             # imm = 0x186A0
	movl	%eax, -88(%rbp)                 # 4-byte Spill
	testl	%r14d, %r14d
	movq	-264(%rbp), %r10                # 8-byte Reload
	movq	-224(%rbp), %rdi                # 8-byte Reload
	movq	-256(%rbp), %rax                # 8-byte Reload
	movq	-184(%rbp), %r8                 # 8-byte Reload
	jle	.LBB101_341
# %bb.335:
	movzbl	7884(%r12), %ecx
	movl	64012(%r12,%rcx,4), %r9d
	movq	%rcx, %rax
	shlq	$10, %rax
	movq	%rcx, -232(%rbp)                # 8-byte Spill
	leaq	(%rax,%rcx,8), %rax
	leaq	(%r12,%rax), %r10
	addq	$45436, %r10                    # imm = 0xB17C
	leaq	57820(%r12,%rax), %rdi
	leaq	51628(%r12,%rax), %rax
	movq	%rax, -256(%rbp)                # 8-byte Spill
	movl	$256, %eax                      # imm = 0x100
	movq	%rax, -80(%rbp)                 # 8-byte Spill
	movl	$49, -52(%rbp)                  # 4-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, -96(%rbp)                 # 8-byte Spill
	movl	%r9d, %r11d
	xorl	%eax, %eax
	movq	%rax, -208(%rbp)                # 8-byte Spill
	movl	%r14d, -44(%rbp)                # 4-byte Spill
.LBB101_336:
	movl	$36, 8(%r12)
.LBB101_337:                            # =>This Inner Loop Header: Depth=1
	movl	36(%r12), %edx
	cmpl	%r11d, %edx
	jge	.LBB101_356
# %bb.338:                              #   in Loop: Header=BB101_337 Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.339:                              #   in Loop: Header=BB101_337 Depth=1
	movl	32(%r12), %ecx
	shll	$8, %ecx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%ecx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %edx
	movl	%edx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_337
# %bb.340:                              #   in Loop: Header=BB101_337 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_337
.LBB101_356:                            # %._crit_edge2331
	movl	32(%r12), %eax
	subl	%r11d, %edx
	movl	%edx, %ecx
	shrl	%cl, %eax
	movl	$-1, %r13d
	movl	%r11d, %ecx
	shll	%cl, %r13d
	notl	%r13d
	andl	%eax, %r13d
	movl	%edx, 36(%r12)
	jmp	.LBB101_357
.LBB101_341:
	movq	%rax, -256(%rbp)                # 8-byte Spill
	movl	$-4, %eax
	movl	$256, %ecx                      # imm = 0x100
	movq	%rcx, -80(%rbp)                 # 8-byte Spill
	xorl	%ecx, %ecx
	movq	%rcx, -96(%rbp)                 # 8-byte Spill
	movl	$0, -52(%rbp)                   # 4-byte Folded Spill
	xorl	%ecx, %ecx
	movq	%rcx, -208(%rbp)                # 8-byte Spill
	movl	%r14d, -44(%rbp)                # 4-byte Spill
.LBB101_342:                            # %.loopexit
	movl	-68(%rbp), %r9d                 # 4-byte Reload
	movl	-56(%rbp), %r11d                # 4-byte Reload
	jmp	.LBB101_509
.LBB101_357:
	movl	$-4, %eax
	cmpl	$20, %r11d
	jg	.LBB101_508
# %bb.358:
	movslq	%r11d, %rcx
	cmpl	(%r10,%rcx,4), %r13d
	jle	.LBB101_367
# %bb.359:
	addl	$1, %r11d
.LBB101_360:
	movl	$37, 8(%r12)
	jmp	.LBB101_362
	.p2align	4, 0x90
.LBB101_361:                            #   in Loop: Header=BB101_362 Depth=1
	movl	36(%r12), %edx
.LBB101_362:                            # =>This Inner Loop Header: Depth=1
	testl	%edx, %edx
	jg	.LBB101_366
# %bb.363:                              #   in Loop: Header=BB101_362 Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_510
# %bb.364:                              #   in Loop: Header=BB101_362 Depth=1
	movl	32(%r12), %ecx
	shll	$8, %ecx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%ecx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %edx
	movl	%edx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_361
# %bb.365:                              #   in Loop: Header=BB101_362 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_361
.LBB101_366:                            # %._crit_edge2253
	movl	32(%r12), %eax
	addl	$-1, %edx
	movl	%edx, %ecx
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%edx, 36(%r12)
	movq	%rax, -240(%rbp)                # 8-byte Spill
	leal	(%rax,%r13,2), %r13d
	jmp	.LBB101_357
.LBB101_367:
	movl	%r13d, %edx
	movq	-256(%rbp), %rsi                # 8-byte Reload
	subl	(%rsi,%rcx,4), %edx
	cmpl	$257, %edx                      # imm = 0x101
	ja	.LBB101_508
# %bb.368:
	movl	%edx, %eax
	movl	(%rdi,%rax,4), %ecx
.LBB101_369:
	cmpl	-60(%rbp), %ecx                 # 4-byte Folded Reload
	je	.LBB101_411
# %bb.370:
	cmpl	$1, %ecx
	ja	.LBB101_375
# %bb.371:
	movl	$-1, %eax
	movq	%rax, -192(%rbp)                # 8-byte Spill
	movl	$1, %eax
	jmp	.LBB101_372
.LBB101_375:
	movq	%r13, -104(%rbp)                # 8-byte Spill
	movl	$-4, %eax
	movq	-96(%rbp), %rdx                 # 8-byte Reload
	cmpl	-88(%rbp), %edx                 # 4-byte Folded Reload
	movq	%rcx, -112(%rbp)                # 8-byte Spill
	jge	.LBB101_509
# %bb.376:
	movq	%rdi, -224(%rbp)                # 8-byte Spill
	movl	%r9d, %r13d
	movq	%r8, -184(%rbp)                 # 8-byte Spill
	leal	-1(%rcx), %ebx
	cmpl	$15, %ebx
	ja	.LBB101_385
# %bb.377:
	movslq	7820(%r12), %r9
	leal	(%r9,%rbx), %ecx
	movb	3724(%r12,%rcx), %r8b
	cmpl	$4, %ebx
	jb	.LBB101_382
# %bb.378:                              # %.lr.ph2312.preheader
	leal	-1(%r9), %edi
	movq	-112(%rbp), %rbx                # 8-byte Reload
                                        # kill: def $ebx killed $ebx killed $rbx def $rbx
.LBB101_379:                            # %.lr.ph2312
                                        # =>This Inner Loop Header: Depth=1
	movl	%ebx, %esi
	leal	(%rdi,%rsi), %ebx
	leal	(%rdi,%rsi), %ecx
	addl	$-1, %ecx
	movslq	%ecx, %rcx
	movzbl	3724(%r12,%rcx), %edx
	movslq	%ebx, %rbx
	movb	%dl, 3724(%r12,%rbx)
	leal	-2(%rdi,%rsi), %edx
	movslq	%edx, %rdx
	movzbl	3724(%r12,%rdx), %ebx
	movb	%bl, 3724(%r12,%rcx)
	leal	-3(%rdi,%rsi), %ecx
	movslq	%ecx, %rcx
	movzbl	3724(%r12,%rcx), %ebx
	movb	%bl, 3724(%r12,%rdx)
	leal	-4(%rdi,%rsi), %edx
	movslq	%edx, %rdx
	movzbl	3724(%r12,%rdx), %edx
	movb	%dl, 3724(%r12,%rcx)
	leal	-4(%rsi), %ebx
	addl	$-5, %esi
	cmpl	$3, %esi
	ja	.LBB101_379
# %bb.380:                              # %._crit_edge2313
	cmpl	$1, %ebx
	je	.LBB101_384
# %bb.381:
	addl	$-1, %ebx
.LBB101_382:                            # %scalar.ph2923
	movl	%ebx, %edi
	negq	%rdi
	leal	(%r9,%rbx), %esi
	.p2align	4, 0x90
.LBB101_383:                            # %.lr.ph2308.prol
                                        # =>This Inner Loop Header: Depth=1
	movl	%esi, %ecx
	addl	$-1, %esi
	movzbl	3724(%r12,%rsi), %edx
	movb	%dl, 3724(%r12,%rcx)
                                        # kill: def $esi killed $esi killed $rsi def $rsi
	incq	%rdi
	jne	.LBB101_383
.LBB101_384:                            # %._crit_edge2309
	movb	%r8b, 3724(%r12,%r9)
	movl	%r13d, %r9d
	jmp	.LBB101_395
.LBB101_385:
	movl	%ebx, %edx
	shrl	$4, %edx
	andl	$15, %ebx
	movl	7820(%r12,%rdx,4), %edi
	addl	%edi, %ebx
	movslq	%ebx, %rsi
	movb	3724(%r12,%rsi), %r8b
	cmpl	%edi, %esi
	jle	.LBB101_387
.LBB101_386:                            # %.lr.ph2325
                                        # =>This Inner Loop Header: Depth=1
	movzbl	3723(%r12,%rsi), %ecx
	movb	%cl, 3724(%r12,%rsi)
	leaq	-1(%rsi), %rcx
	movslq	7820(%r12,%rdx,4), %rdi
	movq	%rcx, %rsi
	cmpq	%rdi, %rcx
	jg	.LBB101_386
.LBB101_387:                            # %.lr.ph2321.preheader
	leal	1(%rdi), %ecx
	movl	%ecx, 7820(%r12,%rdx,4)
	leaq	-1(%rdx), %rsi
	testb	$1, %dl
	je	.LBB101_389
# %bb.388:                              # %.lr.ph2321.prol.preheader
	movl	%edi, 7820(%r12,%rdx,4)
	movl	7816(%r12,%rdx,4), %ecx
	addl	$15, %ecx
	movslq	%ecx, %rcx
	movb	3724(%r12,%rcx), %cl
	movslq	%edi, %rdx
	movb	%cl, 3724(%r12,%rdx)
	movq	%rsi, %rdx
.LBB101_389:                            # %.lr.ph2321.prol.loopexit
	testq	%rsi, %rsi
	je	.LBB101_391
.LBB101_390:                            # %.lr.ph2321
                                        # =>This Inner Loop Header: Depth=1
	movslq	7820(%r12,%rdx,4), %rcx
	leaq	-1(%rcx), %rsi
	movl	%esi, 7820(%r12,%rdx,4)
	movl	7816(%r12,%rdx,4), %esi
	addl	$15, %esi
	movslq	%esi, %rsi
	movzbl	3724(%r12,%rsi), %ebx
	movb	%bl, 3723(%r12,%rcx)
	movslq	7816(%r12,%rdx,4), %rcx
	leaq	-1(%rcx), %rsi
	movl	%esi, 7816(%r12,%rdx,4)
	movl	7812(%r12,%rdx,4), %esi
	leaq	-2(%rdx), %rdi
	addl	$15, %esi
	movslq	%esi, %rsi
	movzbl	3724(%r12,%rsi), %ebx
	movb	%bl, 3723(%r12,%rcx)
	cmpq	$2, %rdx
	movq	%rdi, %rdx
	jg	.LBB101_390
.LBB101_391:                            # %._crit_edge2322
	movslq	7820(%r12), %rcx
	leaq	-1(%rcx), %rdx
	movl	%edx, 7820(%r12)
	movb	%r8b, 3723(%r12,%rcx)
	cmpl	$0, 7820(%r12)
	je	.LBB101_393
# %bb.392:
	movl	%r13d, %r9d
	jmp	.LBB101_395
.LBB101_393:                            # %.preheader1984.preheader
	movl	$4095, %edx                     # imm = 0xFFF
	xorl	%esi, %esi
	movl	%r13d, %r9d
.LBB101_394:                            # %.preheader1984
                                        # =>This Inner Loop Header: Depth=1
	movslq	%edx, %rdx
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3739(%rcx,%r12), %ecx
	movb	%cl, 3724(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3738(%rcx,%r12), %ecx
	movb	%cl, 3723(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3737(%rcx,%r12), %ecx
	movb	%cl, 3722(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3736(%rcx,%r12), %ecx
	movb	%cl, 3721(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3735(%rcx,%r12), %ecx
	movb	%cl, 3720(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3734(%rcx,%r12), %ecx
	movb	%cl, 3719(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3733(%rcx,%r12), %ecx
	movb	%cl, 3718(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3732(%rcx,%r12), %ecx
	movb	%cl, 3717(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3731(%rcx,%r12), %ecx
	movb	%cl, 3716(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3730(%rcx,%r12), %ecx
	movb	%cl, 3715(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3729(%rcx,%r12), %ecx
	movb	%cl, 3714(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3728(%rcx,%r12), %ecx
	movb	%cl, 3713(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3727(%rcx,%r12), %ecx
	movb	%cl, 3712(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3726(%rcx,%r12), %ecx
	movb	%cl, 3711(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3725(%rcx,%r12), %ecx
	movb	%cl, 3710(%r12,%rdx)
	movslq	7880(%r12,%rsi,4), %rcx
	movzbl	3724(%r12,%rcx), %ecx
	movb	%cl, 3709(%r12,%rdx)
	addq	$-16, %rdx
	leal	1(%rdx), %ecx
	movl	%ecx, 7880(%r12,%rsi,4)
	addq	$-1, %rsi
	cmpq	$-16, %rsi
	jne	.LBB101_394
.LBB101_395:
	movl	-52(%rbp), %edi                 # 4-byte Reload
	movzbl	%r8b, %ecx
	movzbl	3468(%r12,%rcx), %edx
	addl	$1, 68(%r12,%rdx,4)
	cmpb	$0, 44(%r12)
	je	.LBB101_397
# %bb.396:
	movzbl	3468(%r12,%rcx), %ecx
	movq	3160(%r12), %rdx
	movq	-96(%rbp), %rbx                 # 8-byte Reload
	movslq	%ebx, %rsi
	movw	%cx, (%rdx,%rsi,2)
	jmp	.LBB101_398
.LBB101_397:
	movzbl	3468(%r12,%rcx), %ecx
	movq	3152(%r12), %rdx
	movq	-96(%rbp), %rbx                 # 8-byte Reload
	movslq	%ebx, %rsi
	movl	%ecx, (%rdx,%rsi,4)
.LBB101_398:
	movq	-184(%rbp), %r8                 # 8-byte Reload
	addl	$1, %ebx
	movq	%rbx, -96(%rbp)                 # 8-byte Spill
	testl	%edi, %edi
	jne	.LBB101_401
# %bb.399:
	movq	-208(%rbp), %rcx                # 8-byte Reload
	movslq	%ecx, %rcx
	addq	$1, %rcx
	cmpl	-44(%rbp), %ecx                 # 4-byte Folded Reload
	movq	%rcx, -208(%rbp)                # 8-byte Spill
	jge	.LBB101_429
# %bb.400:
	movzbl	7884(%r12,%rcx), %ecx
	movl	64012(%r12,%rcx,4), %r9d
	movq	%rcx, %rax
	shlq	$10, %rax
	movq	%rcx, -232(%rbp)                # 8-byte Spill
	leaq	(%rax,%rcx,8), %rax
	leaq	(%r12,%rax), %r10
	addq	$45436, %r10                    # imm = 0xB17C
	leaq	57820(%r12,%rax), %rcx
	movq	%rcx, -224(%rbp)                # 8-byte Spill
	addq	%r12, %rax
	addq	$51628, %rax                    # imm = 0xC9AC
	movq	%rax, -256(%rbp)                # 8-byte Spill
	movl	$50, %edi
.LBB101_401:
	addl	$-1, %edi
	movl	%edi, -52(%rbp)                 # 4-byte Spill
	movl	%r9d, %r11d
	movq	-224(%rbp), %rdi                # 8-byte Reload
.LBB101_402:
	movl	$40, 8(%r12)
	jmp	.LBB101_406
	.p2align	4, 0x90
.LBB101_403:                            #   in Loop: Header=BB101_406 Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.404:                              #   in Loop: Header=BB101_406 Depth=1
	movl	32(%r12), %ecx
	shll	$8, %ecx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%ecx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %edx
	movl	%edx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_406
# %bb.405:                              #   in Loop: Header=BB101_406 Depth=1
	addl	$1, 16(%rax)
.LBB101_406:                            # =>This Inner Loop Header: Depth=1
	movl	36(%r12), %edx
	cmpl	%r11d, %edx
	jl	.LBB101_403
# %bb.407:                              # %._crit_edge2302
	movl	32(%r12), %eax
	subl	%r11d, %edx
	movl	%edx, %ecx
	shrl	%cl, %eax
	movl	$-1, %r13d
	movl	%r11d, %ecx
	shll	%cl, %r13d
	notl	%r13d
	andl	%eax, %r13d
	movl	%edx, 36(%r12)
.LBB101_408:
	movl	$-4, %eax
	cmpl	$20, %r11d
	jg	.LBB101_508
# %bb.409:
	movslq	%r11d, %rcx
	cmpl	(%r10,%rcx,4), %r13d
	jle	.LBB101_367
# %bb.410:
	addl	$1, %r11d
	jmp	.LBB101_70
.LBB101_411:
	movq	%rcx, -112(%rbp)                # 8-byte Spill
	movl	56(%r12), %ecx
	movl	$-4, %eax
	testl	%ecx, %ecx
	movq	%r13, -104(%rbp)                # 8-byte Spill
	js	.LBB101_448
# %bb.412:
	cmpl	-96(%rbp), %ecx                 # 4-byte Folded Reload
	jge	.LBB101_448
# %bb.413:
	leaq	1096(%r12), %r15
	movl	$0, 1096(%r12)
	movq	$-1024, %rcx                    # imm = 0xFC00
.LBB101_414:                            # =>This Inner Loop Header: Depth=1
	movdqu	1092(%r12,%rcx), %xmm0
	movdqu	1108(%r12,%rcx), %xmm1
	movdqu	1124(%r12,%rcx), %xmm2
	movdqu	1140(%r12,%rcx), %xmm3
	movdqu	%xmm0, 2124(%r12,%rcx)
	movdqu	%xmm1, 2140(%r12,%rcx)
	movdqu	%xmm2, 2156(%r12,%rcx)
	movdqu	%xmm3, 2172(%r12,%rcx)
	addq	$64, %rcx
	jne	.LBB101_414
# %bb.415:                              # %.preheader1978.preheader
	movl	1096(%r12), %ecx
	xorl	%edx, %edx
	movl	%ecx, %esi
.LBB101_416:                            # %.preheader1978
                                        # =>This Inner Loop Header: Depth=1
	addl	1100(%r12,%rdx,4), %esi
	movl	%esi, 1100(%r12,%rdx,4)
	addl	1104(%r12,%rdx,4), %esi
	movl	%esi, 1104(%r12,%rdx,4)
	addl	1108(%r12,%rdx,4), %esi
	movl	%esi, 1108(%r12,%rdx,4)
	addl	1112(%r12,%rdx,4), %esi
	movl	%esi, 1112(%r12,%rdx,4)
	addq	$4, %rdx
	cmpq	$256, %rdx                      # imm = 0x100
	jne	.LBB101_416
# %bb.417:                              # %.preheader1976.preheader
	xorl	%edx, %edx
	movq	%rdx, -80(%rbp)                 # 8-byte Spill
	testl	%ecx, %ecx
	js	.LBB101_448
# %bb.418:                              # %.preheader1976.preheader
	cmpl	-96(%rbp), %ecx                 # 4-byte Folded Reload
	jg	.LBB101_448
# %bb.419:                              # %.lr.ph2913.preheader
	xorl	%ecx, %ecx
	movq	%rcx, -80(%rbp)                 # 8-byte Spill
.LBB101_420:                            # %.lr.ph2913
                                        # =>This Inner Loop Header: Depth=1
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	cmpq	$256, %rcx                      # imm = 0x100
	je	.LBB101_430
# %bb.421:                              # %.preheader1976.1
                                        #   in Loop: Header=BB101_420 Depth=1
	movl	1100(%r12,%rcx,4), %ecx
	testl	%ecx, %ecx
	js	.LBB101_445
# %bb.422:                              # %.preheader1976.1
                                        #   in Loop: Header=BB101_420 Depth=1
	cmpl	-96(%rbp), %ecx                 # 4-byte Folded Reload
	jg	.LBB101_445
# %bb.423:                              # %.preheader1976.2
                                        #   in Loop: Header=BB101_420 Depth=1
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	movl	1104(%r12,%rcx,4), %ecx
	testl	%ecx, %ecx
	js	.LBB101_446
# %bb.424:                              # %.preheader1976.2
                                        #   in Loop: Header=BB101_420 Depth=1
	cmpl	-96(%rbp), %ecx                 # 4-byte Folded Reload
	jg	.LBB101_446
# %bb.425:                              # %.preheader1976.3
                                        #   in Loop: Header=BB101_420 Depth=1
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	movl	1108(%r12,%rcx,4), %ecx
	testl	%ecx, %ecx
	js	.LBB101_447
# %bb.426:                              # %.preheader1976.3
                                        #   in Loop: Header=BB101_420 Depth=1
	cmpl	-96(%rbp), %ecx                 # 4-byte Folded Reload
	jg	.LBB101_447
# %bb.427:                              # %.preheader1976
                                        #   in Loop: Header=BB101_420 Depth=1
	movq	-80(%rbp), %rdx                 # 8-byte Reload
	movl	1112(%r12,%rdx,4), %ecx
	addq	$4, %rdx
	movq	%rdx, -80(%rbp)                 # 8-byte Spill
	testl	%ecx, %ecx
	js	.LBB101_448
# %bb.428:                              # %.preheader1976
                                        #   in Loop: Header=BB101_420 Depth=1
	cmpl	-96(%rbp), %ecx                 # 4-byte Folded Reload
	jle	.LBB101_420
	jmp	.LBB101_448
.LBB101_429:
	movl	$0, -52(%rbp)                   # 4-byte Folded Spill
	movq	-224(%rbp), %rdi                # 8-byte Reload
	jmp	.LBB101_509
.LBB101_430:
	movl	%r11d, -56(%rbp)                # 4-byte Spill
	movl	%r9d, -68(%rbp)                 # 4-byte Spill
	movq	%r8, -184(%rbp)                 # 8-byte Spill
	movq	%rdi, -224(%rbp)                # 8-byte Spill
	movq	%r10, %r14
	movl	$0, 16(%r12)
	movb	$0, 12(%r12)
	movl	$-1, 3184(%r12)
	movl	$2, 8(%r12)
	cmpl	$2, 52(%r12)
	jge	.LBB101_453
# %bb.431:
	cmpb	$0, 44(%r12)
	je	.LBB101_454
.LBB101_432:                            # %.preheader.preheader
	movl	1096(%r12), %eax
	movl	%eax, 2124(%r12)
	movq	$-256, %rax
.LBB101_433:                            # %.preheader.1
                                        # =>This Inner Loop Header: Depth=1
	movdqu	2124(%r12,%rax,4), %xmm0
	movdqu	%xmm0, 3152(%r12,%rax,4)
	addq	$4, %rax
	jne	.LBB101_433
# %bb.434:
	cmpl	$0, -96(%rbp)                   # 4-byte Folded Reload
	je	.LBB101_439
# %bb.435:                              # %.lr.ph2265
	movl	-96(%rbp), %r8d                 # 4-byte Reload
	xorl	%ecx, %ecx
	jmp	.LBB101_437
.LBB101_436:                            #   in Loop: Header=BB101_437 Depth=1
	movq	3168(%r12), %rsi
	movl	%ecx, %edi
	sarl	%edi
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %ebx
	andb	$15, %bl
	movl	2124(%r12,%rdx,4), %eax
	shrl	$12, %eax
	andb	$-16, %al
	orb	%bl, %al
	movb	%al, (%rsi,%rdi)
	addl	$1, 2124(%r12,%rdx,4)
	addq	$1, %rcx
	cmpq	%rcx, %r8
	je	.LBB101_439
.LBB101_437:                            # =>This Inner Loop Header: Depth=1
	movq	3160(%r12), %rsi
	movzbl	(%rsi,%rcx,2), %edx
	movzwl	2124(%r12,%rdx,4), %edi
	movw	%di, (%rsi,%rcx,2)
	testb	$1, %cl
	jne	.LBB101_436
# %bb.438:                              #   in Loop: Header=BB101_437 Depth=1
	movq	3168(%r12), %rsi
	movl	%ecx, %edi
	sarl	%edi
	movslq	%edi, %rdi
	movzbl	(%rsi,%rdi), %ebx
	andb	$-16, %bl
	orb	2126(%r12,%rdx,4), %bl
	movb	%bl, (%rsi,%rdi)
	addl	$1, 2124(%r12,%rdx,4)
	addq	$1, %rcx
	cmpq	%rcx, %r8
	jne	.LBB101_437
.LBB101_439:                            # %._crit_edge2266
	movslq	56(%r12), %rax
	movq	3160(%r12), %rdx
	movq	3168(%r12), %rbx
	movl	%eax, %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movzbl	(%rbx,%rcx), %esi
	leal	(,%rax,4), %ecx
	andb	$4, %cl
                                        # kill: def $cl killed $cl killed $ecx
	shrl	%cl, %esi
	movzwl	(%rdx,%rax,2), %ecx
	andl	$15, %esi
	shll	$16, %esi
	orl	%ecx, %esi
.LBB101_440:                            # =>This Inner Loop Header: Depth=1
                                        # kill: def $esi killed $esi def $rsi
	movq	%rsi, %rcx
	movq	%rsi, -80(%rbp)                 # 8-byte Spill
	movslq	%esi, %rsi
	movzwl	(%rdx,%rsi,2), %r8d
	movl	%esi, %ecx
	sarl	%ecx
	movslq	%ecx, %rdi
	movzbl	(%rbx,%rdi), %ebx
	leal	(,%rsi,4), %r13d
	andl	$4, %r13d
	movl	%r13d, %ecx
	shrl	%cl, %ebx
	andl	$15, %ebx
	shll	$16, %ebx
	movw	%ax, (%rdx,%rsi,2)
	testb	$1, %sil
	jne	.LBB101_442
# %bb.441:                              #   in Loop: Header=BB101_440 Depth=1
	movq	3168(%r12), %rsi
	movzbl	(%rsi,%rdi), %edx
	andb	$-16, %dl
	shrl	$16, %eax
	jmp	.LBB101_443
.LBB101_442:                            #   in Loop: Header=BB101_440 Depth=1
	movq	3168(%r12), %rsi
	movzbl	(%rsi,%rdi), %edx
	andb	$15, %dl
	shrl	$12, %eax
	andb	$-16, %al
.LBB101_443:                            #   in Loop: Header=BB101_440 Depth=1
	orb	%dl, %al
	movb	%al, (%rsi,%rdi)
	movl	%ebx, %esi
	orl	%r8d, %esi
	movq	-80(%rbp), %rax                 # 8-byte Reload
	cmpl	56(%r12), %eax
	je	.LBB101_449
# %bb.444:                              # %._crit_edge2680
                                        #   in Loop: Header=BB101_440 Depth=1
	movq	3160(%r12), %rdx
	movq	3168(%r12), %rbx
                                        # kill: def $eax killed $eax killed $rax def $rax
	jmp	.LBB101_440
.LBB101_445:                            # %.preheader1976.1..loopexit.loopexit1977.loopexit_crit_edge
	addq	$1, -80(%rbp)                   # 8-byte Folded Spill
	jmp	.LBB101_448
.LBB101_446:                            # %.loopexit.loopexit1977.loopexitsplitsplitsplit
	addq	$2, -80(%rbp)                   # 8-byte Folded Spill
	jmp	.LBB101_448
.LBB101_447:                            # %.preheader1976.3..loopexit.loopexit1977.loopexitsplitsplit_crit_edge
	addq	$3, -80(%rbp)                   # 8-byte Folded Spill
.LBB101_448:                            # %.loopexit.loopexit1977
	movq	-112(%rbp), %rcx                # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx
	movl	%ecx, -60(%rbp)                 # 4-byte Spill
	jmp	.LBB101_509
.LBB101_449:
	movl	%esi, -64(%rbp)                 # 4-byte Spill
	movl	%eax, 60(%r12)
	movl	$0, 1092(%r12)
	cmpb	$0, 20(%r12)
	je	.LBB101_451
# %bb.450:
	movq	$0, 24(%r12)
	movq	-80(%rbp), %rbx                 # 8-byte Reload
	movl	%ebx, %edi
	movq	%r15, %rsi
	callq	BZ2_indexIntoF
	movl	%eax, 64(%r12)
	movl	%ebx, %ecx
	movq	3160(%r12), %rdx
	movq	3168(%r12), %rsi
	movzwl	(%rdx,%rcx,2), %edx
	shrq	%rcx
	movzbl	(%rsi,%rcx), %esi
	movl	%r13d, %ecx
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%r12)
	movl	$1, 1092(%r12)
	movl	BZ2_rNums(%rip), %ecx
	movl	$1, 28(%r12)
	addl	$-1, %ecx
	movl	%ecx, 24(%r12)
	xorl	%edx, %edx
	cmpl	$1, %ecx
	sete	%dl
	xorl	%eax, %edx
	movl	%edx, 64(%r12)
	jmp	.LBB101_452
.LBB101_451:
	movq	-80(%rbp), %rbx                 # 8-byte Reload
	movl	%ebx, %edi
	movq	%r15, %rsi
	callq	BZ2_indexIntoF
	movl	%eax, 64(%r12)
	movl	%ebx, %eax
	movq	3160(%r12), %rcx
	movq	3168(%r12), %rdx
	movzwl	(%rcx,%rax,2), %esi
	shrq	%rax
	movzbl	(%rdx,%rax), %eax
	movl	%r13d, %ecx
	shrl	%cl, %eax
	andl	$15, %eax
	shll	$16, %eax
	orl	%esi, %eax
	movl	%eax, 60(%r12)
	movl	$1, 1092(%r12)
.LBB101_452:                            # %.loopexit
	xorl	%eax, %eax
	movq	-112(%rbp), %rcx                # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx
	movl	%ecx, -60(%rbp)                 # 4-byte Spill
	jmp	.LBB101_461
.LBB101_453:
	movq	stderr(%rip), %rcx
	movl	$.L.str.1.159, %edi
	movl	$6, %esi
	movl	$1, %edx
	callq	fwrite
	cmpb	$0, 44(%r12)
	jne	.LBB101_432
.LBB101_454:
	cmpl	$0, -96(%rbp)                   # 4-byte Folded Reload
	je	.LBB101_457
# %bb.455:                              # %.lr.ph2259
	movl	-96(%rbp), %eax                 # 4-byte Reload
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.LBB101_456:                            # =>This Inner Loop Header: Depth=1
	movq	3152(%r12), %rsi
	movzbl	(%rsi,%rdx,4), %edi
	movslq	1096(%r12,%rdi,4), %rbx
	orl	%ecx, (%rsi,%rbx,4)
	addl	$1, 1096(%r12,%rdi,4)
	addq	$1, %rdx
	addl	$256, %ecx                      # imm = 0x100
	cmpq	%rdx, %rax
	jne	.LBB101_456
.LBB101_457:                            # %._crit_edge2260
	movq	3152(%r12), %rax
	movslq	56(%r12), %rcx
	movl	(%rax,%rcx,4), %ecx
	shrq	$8, %rcx
	movl	%ecx, 60(%r12)
	movl	$0, 1092(%r12)
	cmpb	$0, 20(%r12)
	je	.LBB101_459
# %bb.458:
	movq	$0, 24(%r12)
	movl	(%rax,%rcx,4), %eax
	movzbl	%al, %ecx
	shrl	$8, %eax
	movl	%eax, 60(%r12)
	movl	$1, 1092(%r12)
	movl	BZ2_rNums(%rip), %eax
	movl	$1, 28(%r12)
	addl	$-1, %eax
	movl	%eax, 24(%r12)
	xorl	%edx, %edx
	cmpl	$1, %eax
	sete	%dl
	xorl	%ecx, %edx
	movl	%edx, 64(%r12)
	jmp	.LBB101_460
.LBB101_459:
	movl	%ecx, %ecx
	movl	(%rax,%rcx,4), %eax
	movzbl	%al, %ecx
	movl	%ecx, 64(%r12)
	shrl	$8, %eax
	movl	%eax, 60(%r12)
	movl	$1, 1092(%r12)
.LBB101_460:                            # %.loopexit
	xorl	%eax, %eax
	movq	-112(%rbp), %rcx                # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx
	movl	%ecx, -60(%rbp)                 # 4-byte Spill
	movq	-96(%rbp), %rcx                 # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx def $rcx
	movq	%rcx, -80(%rbp)                 # 8-byte Spill
.LBB101_461:                            # %.loopexit
	movq	%r14, %r10
	movq	-224(%rbp), %rdi                # 8-byte Reload
	movq	-184(%rbp), %r8                 # 8-byte Reload
	jmp	.LBB101_342
.LBB101_372:
	cmpl	$1, %ecx
	movq	%r13, -104(%rbp)                # 8-byte Spill
	movq	%rcx, -112(%rbp)                # 8-byte Spill
	je	.LBB101_462
# %bb.373:
	testl	%ecx, %ecx
	jne	.LBB101_464
# %bb.374:
	movq	-192(%rbp), %rdx                # 8-byte Reload
	addl	%eax, %edx
	jmp	.LBB101_463
.LBB101_462:
	movq	-192(%rbp), %rdx                # 8-byte Reload
	leal	(%rdx,%rax,2), %edx
.LBB101_463:
	movq	%rdx, -192(%rbp)                # 8-byte Spill
.LBB101_464:
	addl	%eax, %eax
	cmpl	$0, -52(%rbp)                   # 4-byte Folded Reload
	movq	%rax, -248(%rbp)                # 8-byte Spill
	je	.LBB101_466
# %bb.465:
	movl	-52(%rbp), %eax                 # 4-byte Reload
	jmp	.LBB101_468
.LBB101_466:
	movq	-208(%rbp), %rax                # 8-byte Reload
	cltq
	addq	$1, %rax
	cmpl	-44(%rbp), %eax                 # 4-byte Folded Reload
	movq	%rax, -208(%rbp)                # 8-byte Spill
	jge	.LBB101_475
# %bb.467:
	movzbl	7884(%r12,%rax), %ecx
	movl	64012(%r12,%rcx,4), %r9d
	movq	%rcx, %rax
	shlq	$10, %rax
	movq	%rcx, -232(%rbp)                # 8-byte Spill
	leaq	(%rax,%rcx,8), %rax
	leaq	(%r12,%rax), %r10
	addq	$45436, %r10                    # imm = 0xB17C
	leaq	(%r12,%rax), %rdi
	addq	$57820, %rdi                    # imm = 0xE1DC
	addq	%r12, %rax
	addq	$51628, %rax                    # imm = 0xC9AC
	movq	%rax, -256(%rbp)                # 8-byte Spill
	movl	$50, %eax
.LBB101_468:
	addl	$-1, %eax
	movl	%eax, -52(%rbp)                 # 4-byte Spill
	movl	%r9d, %r11d
.LBB101_469:
	movl	$38, 8(%r12)
	.p2align	4, 0x90
.LBB101_470:                            # =>This Inner Loop Header: Depth=1
	movl	36(%r12), %edx
	cmpl	%r11d, %edx
	jge	.LBB101_476
# %bb.471:                              #   in Loop: Header=BB101_470 Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_474
# %bb.472:                              #   in Loop: Header=BB101_470 Depth=1
	movl	32(%r12), %ecx
	shll	$8, %ecx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%ecx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %edx
	movl	%edx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_470
# %bb.473:                              #   in Loop: Header=BB101_470 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_470
.LBB101_474:
	xorl	%eax, %eax
.LBB101_509:                            # %.loopexit
	movq	-80(%rbp), %rcx                 # 8-byte Reload
	movl	%ecx, 64036(%r12)
	movl	-64(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, 64040(%r12)
	movl	-84(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, 64044(%r12)
	movl	-48(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, 64048(%r12)
	movq	-120(%rbp), %rcx                # 8-byte Reload
	movl	%ecx, 64052(%r12)
	movl	-44(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, 64056(%r12)
	movl	-60(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, 64060(%r12)
	movq	-208(%rbp), %rcx                # 8-byte Reload
	movl	%ecx, 64064(%r12)
	movl	-52(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, 64068(%r12)
	movq	-112(%rbp), %rcx                # 8-byte Reload
	movl	%ecx, 64072(%r12)
	movl	-88(%rbp), %ecx                 # 4-byte Reload
	movl	%ecx, 64076(%r12)
	movq	-96(%rbp), %rcx                 # 8-byte Reload
	movl	%ecx, 64080(%r12)
	movq	-192(%rbp), %rcx                # 8-byte Reload
	movl	%ecx, 64084(%r12)
	movq	-248(%rbp), %rcx                # 8-byte Reload
	movl	%ecx, 64088(%r12)
	movq	-200(%rbp), %rcx                # 8-byte Reload
	movl	%ecx, 64092(%r12)
	movl	%r8d, 64096(%r12)
	movl	%r11d, 64100(%r12)
	movq	-104(%rbp), %rcx                # 8-byte Reload
	movl	%ecx, 64104(%r12)
	movq	-240(%rbp), %rcx                # 8-byte Reload
	movl	%ecx, 64108(%r12)
	movq	-232(%rbp), %rcx                # 8-byte Reload
	movl	%ecx, 64112(%r12)
	movl	%r9d, 64116(%r12)
	movq	%r10, 64120(%r12)
	movq	-256(%rbp), %rcx                # 8-byte Reload
	movq	%rcx, 64128(%r12)
	movq	%rdi, 64136(%r12)
	addq	$232, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB101_476:                            # %._crit_edge2291
	.cfi_def_cfa %rbp, 16
	movl	32(%r12), %eax
	subl	%r11d, %edx
	movl	%edx, %ecx
	shrl	%cl, %eax
	movl	$-1, %r13d
	movl	%r11d, %ecx
	shll	%cl, %r13d
	notl	%r13d
	andl	%eax, %r13d
	movl	%edx, 36(%r12)
	jmp	.LBB101_477
.LBB101_475:
	movl	$-4, %eax
	movl	$0, -52(%rbp)                   # 4-byte Folded Spill
	jmp	.LBB101_509
.LBB101_477:
	movl	$-4, %eax
	cmpl	$20, %r11d
	jg	.LBB101_508
# %bb.478:
	movslq	%r11d, %rcx
	cmpl	(%r10,%rcx,4), %r13d
	jle	.LBB101_487
# %bb.479:
	addl	$1, %r11d
.LBB101_480:
	movl	$39, 8(%r12)
	jmp	.LBB101_482
	.p2align	4, 0x90
.LBB101_481:                            #   in Loop: Header=BB101_482 Depth=1
	movl	36(%r12), %edx
.LBB101_482:                            # =>This Inner Loop Header: Depth=1
	testl	%edx, %edx
	jg	.LBB101_486
# %bb.483:                              #   in Loop: Header=BB101_482 Depth=1
	movq	(%r12), %rax
	cmpl	$0, 8(%rax)
	je	.LBB101_510
# %bb.484:                              #   in Loop: Header=BB101_482 Depth=1
	movl	32(%r12), %ecx
	shll	$8, %ecx
	movq	(%rax), %rsi
	movzbl	(%rsi), %esi
	orl	%ecx, %esi
	movl	%esi, 32(%r12)
	addl	$8, %edx
	movl	%edx, 36(%r12)
	addq	$1, (%rax)
	movq	(%r12), %rax
	addl	$-1, 8(%rax)
	movq	(%r12), %rax
	addl	$1, 12(%rax)
	movq	(%r12), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB101_481
# %bb.485:                              #   in Loop: Header=BB101_482 Depth=1
	addl	$1, 16(%rax)
	jmp	.LBB101_481
.LBB101_510:
	movq	%r13, -104(%rbp)                # 8-byte Spill
	xorl	%eax, %eax
	jmp	.LBB101_509
.LBB101_486:                            # %._crit_edge2273
	movl	32(%r12), %eax
	addl	$-1, %edx
	movl	%edx, %ecx
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%edx, 36(%r12)
	movq	%rax, -240(%rbp)                # 8-byte Spill
	leal	(%rax,%r13,2), %r13d
	jmp	.LBB101_477
.LBB101_487:
	movl	%r13d, %edx
	movq	-256(%rbp), %rsi                # 8-byte Reload
	subl	(%rsi,%rcx,4), %edx
	cmpl	$257, %edx                      # imm = 0x101
	ja	.LBB101_508
# %bb.488:
	movl	%edx, %ecx
	movl	(%rdi,%rcx,4), %ecx
	cmpl	$2, %ecx
	jae	.LBB101_490
# %bb.489:
	movq	-248(%rbp), %rax                # 8-byte Reload
	jmp	.LBB101_372
.LBB101_490:
	movq	%rdi, -224(%rbp)                # 8-byte Spill
	movq	%rcx, -112(%rbp)                # 8-byte Spill
	movq	-192(%rbp), %rdi                # 8-byte Reload
	leal	1(%rdi), %ecx
	movslq	7820(%r12), %rdx
	movzbl	3724(%r12,%rdx), %edx
	movzbl	3468(%r12,%rdx), %esi
	addl	%ecx, 68(%r12,%rsi,4)
	cmpb	$0, 44(%r12)
	movslq	-88(%rbp), %rdx                 # 4-byte Folded Reload
	je	.LBB101_494
# %bb.491:
	movq	-96(%rbp), %rbx                 # 8-byte Reload
	movslq	%ebx, %rbx
	cmpq	%rdx, %rbx
	cmovgq	%rbx, %rdx
	testl	%edi, %edi
	js	.LBB101_499
.LBB101_492:                            # =>This Inner Loop Header: Depth=1
	cmpq	%rbx, %rdx
	je	.LBB101_498
# %bb.493:                              #   in Loop: Header=BB101_492 Depth=1
	movq	3160(%r12), %rdi
	movw	%si, (%rdi,%rbx,2)
	addq	$1, %rbx
	leal	-1(%rcx), %edi
	cmpl	$1, %ecx
	movl	%edi, %ecx
	jg	.LBB101_492
	jmp	.LBB101_500
.LBB101_508:
	movq	%r13, -104(%rbp)                # 8-byte Spill
	jmp	.LBB101_509
.LBB101_494:
	movq	-96(%rbp), %rbx                 # 8-byte Reload
	movslq	%ebx, %rbx
	cmpq	%rdx, %rbx
	cmovgq	%rbx, %rdx
	testl	%edi, %edi
	js	.LBB101_499
# %bb.495:                              # %.lr.ph2279
	movzwl	%si, %esi
.LBB101_496:                            # =>This Inner Loop Header: Depth=1
	cmpq	%rbx, %rdx
	je	.LBB101_498
# %bb.497:                              #   in Loop: Header=BB101_496 Depth=1
	movq	3152(%r12), %rdi
	movl	%esi, (%rdi,%rbx,4)
	addq	$1, %rbx
	leal	-1(%rcx), %edi
	cmpl	$1, %ecx
	movl	%edi, %ecx
	jg	.LBB101_496
	jmp	.LBB101_500
.LBB101_499:
	movl	%ecx, %edi
.LBB101_500:                            # %.loopexit1746
	movq	%rbx, -96(%rbp)                 # 8-byte Spill
	movq	%rdi, -192(%rbp)                # 8-byte Spill
	movq	-112(%rbp), %rcx                # 8-byte Reload
	movq	-224(%rbp), %rdi                # 8-byte Reload
	jmp	.LBB101_369
.LBB101_498:                            # %.loopexit1749
	movq	%r13, -104(%rbp)                # 8-byte Spill
                                        # kill: def $ecx killed $ecx killed $rcx def $rcx
	movq	%rcx, -192(%rbp)                # 8-byte Spill
                                        # kill: def $edx killed $edx killed $rdx def $rdx
	movq	%rdx, -96(%rbp)                 # 8-byte Spill
	movq	-224(%rbp), %rdi                # 8-byte Reload
	jmp	.LBB101_509
.Lfunc_end101:
	.size	BZ2_decompress, .Lfunc_end101-BZ2_decompress
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI101_0:
	.quad	.LBB101_10
	.quad	.LBB101_22
	.quad	.LBB101_27
	.quad	.LBB101_86
	.quad	.LBB101_38
	.quad	.LBB101_39
	.quad	.LBB101_40
	.quad	.LBB101_41
	.quad	.LBB101_42
	.quad	.LBB101_101
	.quad	.LBB101_43
	.quad	.LBB101_44
	.quad	.LBB101_45
	.quad	.LBB101_46
	.quad	.LBB101_47
	.quad	.LBB101_48
	.quad	.LBB101_49
	.quad	.LBB101_165
	.quad	.LBB101_277
	.quad	.LBB101_288
	.quad	.LBB101_50
	.quad	.LBB101_56
	.quad	.LBB101_299
	.quad	.LBB101_304
	.quad	.LBB101_65
	.quad	.LBB101_336
	.quad	.LBB101_67
	.quad	.LBB101_469
	.quad	.LBB101_68
	.quad	.LBB101_402
	.quad	.LBB101_69
	.quad	.LBB101_182
	.quad	.LBB101_71
	.quad	.LBB101_72
	.quad	.LBB101_73
	.quad	.LBB101_74
	.quad	.LBB101_75
	.quad	.LBB101_76
	.quad	.LBB101_77
	.quad	.LBB101_78
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
	movl	$0, 3192(%rdi)
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.LBB102_1
	.p2align	4, 0x90
.LBB102_5:                              #   in Loop: Header=BB102_1 Depth=1
	addq	$2, %rax
	cmpq	$256, %rax                      # imm = 0x100
	je	.LBB102_6
.LBB102_1:                              # =>This Inner Loop Header: Depth=1
	cmpb	$0, 3196(%rdi,%rax)
	je	.LBB102_3
# %bb.2:                                #   in Loop: Header=BB102_1 Depth=1
	movslq	%ecx, %rcx
	movb	%al, 3468(%rdi,%rcx)
	movl	3192(%rdi), %ecx
	addl	$1, %ecx
	movl	%ecx, 3192(%rdi)
.LBB102_3:                              #   in Loop: Header=BB102_1 Depth=1
	cmpb	$0, 3197(%rdi,%rax)
	je	.LBB102_5
# %bb.4:                                #   in Loop: Header=BB102_1 Depth=1
	movslq	%ecx, %rcx
	leal	1(%rax), %edx
	movb	%dl, 3468(%rdi,%rcx)
	movl	3192(%rdi), %ecx
	addl	$1, %ecx
	movl	%ecx, 3192(%rdi)
	jmp	.LBB102_5
.LBB102_6:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end102:
	.size	makeMaps_d, .Lfunc_end102-makeMaps_d
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$5240, %rsp                     # imm = 0x1478
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	xorl	%r14d, %r14d
	testl	%edx, %edx
	movl	%edx, -44(%rbp)                 # 4-byte Spill
	cmovgl	%edx, %r14d
	jle	.LBB103_1
# %bb.2:                                # %.lr.ph198.preheader
	movl	%r14d, %r15d
	andl	$1, %r15d
	movq	%r14, %r10
	addq	$-1, %r10
	je	.LBB103_3
# %bb.5:                                # %.lr.ph198.preheader.new
	movl	%r14d, %r8d
	andl	$2147483646, %r8d               # imm = 0x7FFFFFFE
	xorl	%eax, %eax
	movl	$256, %r9d                      # imm = 0x100
	.p2align	4, 0x90
.LBB103_6:                              # %.lr.ph198
                                        # =>This Inner Loop Header: Depth=1
	movl	(%rsi,%rax,4), %edx
	movl	%edx, %ebx
	shll	$8, %ebx
	testl	%edx, %edx
	cmovel	%r9d, %ebx
	movl	%ebx, -3212(%rbp,%rax,4)
	movl	4(%rsi,%rax,4), %ebx
	movl	%ebx, %edx
	shll	$8, %edx
	testl	%ebx, %ebx
	cmovel	%r9d, %edx
	movl	%edx, -3208(%rbp,%rax,4)
	addq	$2, %rax
	cmpq	%rax, %r8
	jne	.LBB103_6
# %bb.7:                                # %._crit_edge199.loopexit.unr-lcssa
	testq	%r15, %r15
	jne	.LBB103_4
# %bb.8:
	movl	$1, %r10d
	xorl	%r15d, %r15d
	jmp	.LBB103_9
.LBB103_1:                              # %.._crit_edge199_crit_edge
	leaq	-1(%r14), %r10
	movl	%r14d, %r15d
	andl	$1, %r15d
	jmp	.LBB103_9
.LBB103_3:
	xorl	%eax, %eax
.LBB103_4:                              # %.lr.ph198.epil.preheader
	movl	(%rsi,%rax,4), %esi
	movl	%esi, %edx
	shll	$8, %edx
	testl	%esi, %esi
	movl	$256, %esi                      # imm = 0x100
	cmovnel	%edx, %esi
	movl	%esi, -3212(%rbp,%rax,4)
.LBB103_9:                              # %._crit_edge199
	movl	$0, -1152(%rbp)
	movl	$0, -3216(%rbp)
	movl	$-2, -5280(%rbp)
	cmpl	$0, -44(%rbp)                   # 4-byte Folded Reload
	jle	.LBB103_60
# %bb.10:                               # %.lr.ph157.preheader.preheader
	movq	%r10, -88(%rbp)                 # 8-byte Spill
	movq	%rdi, -96(%rbp)                 # 8-byte Spill
	movl	%ecx, -48(%rbp)                 # 4-byte Spill
	leaq	(,%r14,4), %rax
	movq	%rax, -112(%rbp)                # 8-byte Spill
	movl	%r14d, %eax
	andl	$2147483646, %eax               # imm = 0x7FFFFFFE
	movq	%rax, -72(%rbp)                 # 8-byte Spill
	movslq	-44(%rbp), %rax                 # 4-byte Folded Reload
	movq	%rax, -104(%rbp)                # 8-byte Spill
	movl	%r14d, %eax
	andl	$-2, %eax
	negq	%rax
	movq	%rax, -64(%rbp)                 # 8-byte Spill
	movq	%r14, -56(%rbp)                 # 8-byte Spill
	movq	%r15, -80(%rbp)                 # 8-byte Spill
	jmp	.LBB103_14
	.p2align	4, 0x90
.LBB103_13:                             # %.loopexit
                                        #   in Loop: Header=BB103_14 Depth=1
	movl	$0, -1152(%rbp)
	movl	$0, -3216(%rbp)
	movl	$-2, -5280(%rbp)
.LBB103_14:                             # %.lr.ph157.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB103_15 Depth 2
                                        #       Child Loop BB103_18 Depth 3
                                        #     Child Loop BB103_22 Depth 2
                                        #       Child Loop BB103_24 Depth 3
                                        #       Child Loop BB103_32 Depth 3
                                        #       Child Loop BB103_41 Depth 3
                                        #     Child Loop BB103_55 Depth 2
                                        #       Child Loop BB103_56 Depth 3
                                        #       Child Loop BB103_58 Depth 3
                                        #     Child Loop BB103_48 Depth 2
                                        #     Child Loop BB103_53 Depth 2
	leaq	-5276(%rbp), %rdi
	movl	$255, %esi
	movq	-112(%rbp), %rdx                # 8-byte Reload
	callq	memset@PLT
	movl	$1, %eax
	xorl	%r8d, %r8d
	jmp	.LBB103_15
	.p2align	4, 0x90
.LBB103_16:                             #   in Loop: Header=BB103_15 Depth=2
	movl	%r8d, %ecx
.LBB103_19:                             # %._crit_edge
                                        #   in Loop: Header=BB103_15 Depth=2
	movslq	%ecx, %rcx
	movl	%eax, -1152(%rbp,%rcx,4)
	addq	$1, %rax
	cmpq	%r14, %r8
	je	.LBB103_20
.LBB103_15:                             # %.lr.ph157
                                        #   Parent Loop BB103_14 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB103_18 Depth 3
	movl	%eax, -1148(%rbp,%r8,4)
	addq	$1, %r8
	movslq	%eax, %rcx
	movl	-3216(%rbp,%rcx,4), %edx
	movl	%r8d, %esi
	sarl	%esi
	movslq	%esi, %rcx
	movslq	-1152(%rbp,%rcx,4), %rdi
	cmpl	-3216(%rbp,%rdi,4), %edx
	jge	.LBB103_16
# %bb.17:                               # %.lr.ph.preheader
                                        #   in Loop: Header=BB103_15 Depth=2
	movl	%r8d, %ebx
	.p2align	4, 0x90
.LBB103_18:                             # %.lr.ph
                                        #   Parent Loop BB103_14 Depth=1
                                        #     Parent Loop BB103_15 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	%esi, %ecx
	movslq	%ebx, %rbx
	movl	%edi, -1152(%rbp,%rbx,4)
	sarl	%esi
	movslq	%esi, %rdi
	movslq	-1152(%rbp,%rdi,4), %rdi
	movl	%ecx, %ebx
	cmpl	-3216(%rbp,%rdi,4), %edx
	jl	.LBB103_18
	jmp	.LBB103_19
	.p2align	4, 0x90
.LBB103_20:                             # %._crit_edge158
                                        #   in Loop: Header=BB103_14 Depth=1
	cmpl	$259, %r14d                     # imm = 0x103
	jg	.LBB103_61
# %bb.21:                               # %.preheader151
                                        #   in Loop: Header=BB103_14 Depth=1
	movq	%r14, %r12
	movq	-104(%rbp), %r10                # 8-byte Reload
	movl	-44(%rbp), %eax                 # 4-byte Reload
	movl	%eax, %edi
	cmpl	$2, %r14d
	jae	.LBB103_22
.LBB103_43:                             # %._crit_edge183
                                        #   in Loop: Header=BB103_14 Depth=1
	cmpl	$516, %edi                      # imm = 0x204
	jge	.LBB103_62
# %bb.44:                               # %.lr.ph189.preheader
                                        #   in Loop: Header=BB103_14 Depth=1
	movq	-88(%rbp), %r10                 # 8-byte Reload
	testq	%r10, %r10
	movl	-48(%rbp), %r8d                 # 4-byte Reload
	movq	-96(%rbp), %r9                  # 8-byte Reload
	movq	-80(%rbp), %r15                 # 8-byte Reload
	movl	$1, %r11d
	movl	$1, %ecx
	je	.LBB103_45
# %bb.54:                               # %.lr.ph189.preheader2
                                        #   in Loop: Header=BB103_14 Depth=1
	xorl	%eax, %eax
	movq	-72(%rbp), %rdx                 # 8-byte Reload
	movq	-56(%rbp), %r14                 # 8-byte Reload
	.p2align	4, 0x90
.LBB103_55:                             # %.lr.ph189
                                        #   Parent Loop BB103_14 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB103_56 Depth 3
                                        #       Child Loop BB103_58 Depth 3
	movl	$-1, %esi
	movl	%ecx, %edi
	.p2align	4, 0x90
.LBB103_56:                             #   Parent Loop BB103_14 Depth=1
                                        #     Parent Loop BB103_55 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	%edi, %rdi
	movl	-5280(%rbp,%rdi,4), %edi
	addl	$1, %esi
	testl	%edi, %edi
	jns	.LBB103_56
# %bb.57:                               # %.lr.ph189.1
                                        #   in Loop: Header=BB103_55 Depth=2
	movb	%sil, -1(%rcx,%r9)
	leal	1(%rcx), %ebx
	movl	$-1, %edi
	.p2align	4, 0x90
.LBB103_58:                             #   Parent Loop BB103_14 Depth=1
                                        #     Parent Loop BB103_55 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	%ebx, %rbx
	movl	-5280(%rbp,%rbx,4), %ebx
	addl	$1, %edi
	testl	%ebx, %ebx
	jns	.LBB103_58
# %bb.59:                               #   in Loop: Header=BB103_55 Depth=2
	cmpl	%r8d, %edi
	movzbl	%al, %eax
	cmovgl	%r11d, %eax
	cmpl	%r8d, %esi
	movb	%dil, (%r9,%rcx)
	cmovgl	%r11d, %eax
	addq	$2, %rcx
	addq	$-2, %rdx
	jne	.LBB103_55
# %bb.46:                               # %._crit_edge190.loopexit.unr-lcssa
                                        #   in Loop: Header=BB103_14 Depth=1
	testq	%r15, %r15
	jne	.LBB103_47
	jmp	.LBB103_50
	.p2align	4, 0x90
.LBB103_39:                             #   in Loop: Header=BB103_22 Depth=2
	movl	%r13d, %ebx
.LBB103_42:                             # %._crit_edge178
                                        #   in Loop: Header=BB103_22 Depth=2
	movslq	%ebx, %rax
	movl	%edi, -1152(%rbp,%rax,4)
	movq	%rdi, %r10
	cmpq	$2, %r12
	movq	%r13, %r12
	jle	.LBB103_43
.LBB103_22:                             # %.lr.ph182
                                        #   Parent Loop BB103_14 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB103_24 Depth 3
                                        #       Child Loop BB103_32 Depth 3
                                        #       Child Loop BB103_41 Depth 3
	movslq	-1148(%rbp), %r8
	movl	-1152(%rbp,%r12,4), %r9d
	movl	%r9d, -1148(%rbp)
	leaq	-1(%r12), %r13
	movl	$1, %edi
	movl	$1, %ebx
	cmpq	$3, %r12
	jl	.LBB103_30
# %bb.23:                               # %.lr.ph163
                                        #   in Loop: Header=BB103_22 Depth=2
	movslq	%r9d, %rax
	movl	-3216(%rbp,%rax,4), %r11d
	movl	$1, %edx
	movl	$2, %ecx
	movl	$2, %eax
	.p2align	4, 0x90
.LBB103_24:                             #   Parent Loop BB103_14 Depth=1
                                        #     Parent Loop BB103_22 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpq	%rax, %r13
	jle	.LBB103_26
# %bb.25:                               #   in Loop: Header=BB103_24 Depth=3
	movl	%ecx, %ebx
	orl	$1, %ebx
	movslq	%ebx, %rsi
	movslq	-1152(%rbp,%rsi,4), %rsi
	movl	-3216(%rbp,%rsi,4), %esi
	movslq	-1152(%rbp,%rax,4), %rax
	cmpl	-3216(%rbp,%rax,4), %esi
	jl	.LBB103_27
.LBB103_26:                             #   in Loop: Header=BB103_24 Depth=3
	movl	%ecx, %ebx
.LBB103_27:                             #   in Loop: Header=BB103_24 Depth=3
	movslq	%ebx, %rax
	movslq	-1152(%rbp,%rax,4), %rax
	cmpl	-3216(%rbp,%rax,4), %r11d
	jl	.LBB103_28
# %bb.29:                               #   in Loop: Header=BB103_24 Depth=3
	movslq	%edx, %rcx
	movl	%eax, -1152(%rbp,%rcx,4)
	leal	(%rbx,%rbx), %ecx
	movslq	%ecx, %rax
	movl	%ebx, %edx
	cmpq	%rax, %r12
	jg	.LBB103_24
	jmp	.LBB103_30
	.p2align	4, 0x90
.LBB103_28:                             #   in Loop: Header=BB103_22 Depth=2
	movl	%edx, %ebx
.LBB103_30:                             # %._crit_edge164
                                        #   in Loop: Header=BB103_22 Depth=2
	movslq	%ebx, %rax
	movl	%r9d, -1152(%rbp,%rax,4)
	movslq	-1148(%rbp), %r9
	movl	-1156(%rbp,%r12,4), %r11d
	movl	%r11d, -1148(%rbp)
	cmpq	$4, %r12
	jl	.LBB103_38
# %bb.31:                               # %.lr.ph170
                                        #   in Loop: Header=BB103_22 Depth=2
	movslq	%r11d, %rax
	leaq	-2(%r12), %rbx
	movl	-3216(%rbp,%rax,4), %r14d
	movl	$1, %esi
	movl	$2, %ecx
	movl	$2, %eax
	.p2align	4, 0x90
.LBB103_32:                             #   Parent Loop BB103_14 Depth=1
                                        #     Parent Loop BB103_22 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpq	%rax, %rbx
	jle	.LBB103_34
# %bb.33:                               #   in Loop: Header=BB103_32 Depth=3
	movl	%ecx, %edi
	orl	$1, %edi
	movslq	%edi, %r15
	movslq	-1152(%rbp,%r15,4), %rdx
	movl	-3216(%rbp,%rdx,4), %edx
	movslq	-1152(%rbp,%rax,4), %rax
	cmpl	-3216(%rbp,%rax,4), %edx
	jl	.LBB103_35
.LBB103_34:                             #   in Loop: Header=BB103_32 Depth=3
	movl	%ecx, %edi
.LBB103_35:                             #   in Loop: Header=BB103_32 Depth=3
	movslq	%edi, %rax
	movslq	-1152(%rbp,%rax,4), %rax
	cmpl	-3216(%rbp,%rax,4), %r14d
	jl	.LBB103_36
# %bb.37:                               #   in Loop: Header=BB103_32 Depth=3
	movslq	%esi, %rcx
	movl	%eax, -1152(%rbp,%rcx,4)
	leal	(%rdi,%rdi), %ecx
	movslq	%ecx, %rax
	movl	%edi, %esi
	cmpq	%rax, %rbx
	jge	.LBB103_32
	jmp	.LBB103_38
	.p2align	4, 0x90
.LBB103_36:                             #   in Loop: Header=BB103_22 Depth=2
	movl	%esi, %edi
.LBB103_38:                             # %._crit_edge171
                                        #   in Loop: Header=BB103_22 Depth=2
	movslq	%edi, %rax
	movl	%r11d, -1152(%rbp,%rax,4)
	leaq	1(%r10), %rdi
	movl	%edi, -5280(%rbp,%r9,4)
	movl	%edi, -5280(%rbp,%r8,4)
	movl	-3216(%rbp,%r8,4), %eax
	movzbl	%al, %ecx
	andl	$-256, %eax
	movl	-3216(%rbp,%r9,4), %edx
	movzbl	%dl, %esi
	andl	$-256, %edx
	addl	%eax, %edx
	cmpl	%esi, %ecx
	cmoval	%ecx, %esi
	addl	$1, %esi
	orl	%edx, %esi
	movl	%esi, -3212(%rbp,%r10,4)
	movl	$-1, -5276(%rbp,%r10,4)
	movl	%edi, -1156(%rbp,%r12,4)
	movslq	%edi, %rax
	movl	-3216(%rbp,%rax,4), %ecx
	movl	%r13d, %edx
	sarl	%edx
	movslq	%edx, %rax
	movslq	-1152(%rbp,%rax,4), %rax
	cmpl	-3216(%rbp,%rax,4), %ecx
	jge	.LBB103_39
# %bb.40:                               # %.lr.ph177.preheader
                                        #   in Loop: Header=BB103_22 Depth=2
	movl	%r13d, %esi
	.p2align	4, 0x90
.LBB103_41:                             # %.lr.ph177
                                        #   Parent Loop BB103_14 Depth=1
                                        #     Parent Loop BB103_22 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	%edx, %ebx
	movslq	%esi, %rsi
	movl	%eax, -1152(%rbp,%rsi,4)
	sarl	%edx
	movslq	%edx, %rax
	movslq	-1152(%rbp,%rax,4), %rax
	movl	%ebx, %esi
	cmpl	-3216(%rbp,%rax,4), %ecx
	jl	.LBB103_41
	jmp	.LBB103_42
	.p2align	4, 0x90
.LBB103_45:                             #   in Loop: Header=BB103_14 Depth=1
	xorl	%eax, %eax
	movq	-56(%rbp), %r14                 # 8-byte Reload
	testq	%r15, %r15
	je	.LBB103_50
.LBB103_47:                             # %.lr.ph189.epil.preheader
                                        #   in Loop: Header=BB103_14 Depth=1
	movl	$-1, %edx
	movl	%ecx, %esi
	.p2align	4, 0x90
.LBB103_48:                             #   Parent Loop BB103_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	%esi, %rsi
	movl	-5280(%rbp,%rsi,4), %esi
	addl	$1, %edx
	testl	%esi, %esi
	jns	.LBB103_48
# %bb.49:                               # %._crit_edge190.loopexit.epilog-lcssa
                                        #   in Loop: Header=BB103_14 Depth=1
	movb	%dl, -1(%rcx,%r9)
	cmpl	%r8d, %edx
	jg	.LBB103_51
.LBB103_50:                             # %._crit_edge190
                                        #   in Loop: Header=BB103_14 Depth=1
	testb	%al, %al
	je	.LBB103_60
.LBB103_51:                             # %.lr.ph194.preheader
                                        #   in Loop: Header=BB103_14 Depth=1
	movl	$1, %eax
	testq	%r10, %r10
	je	.LBB103_11
# %bb.52:                               # %.lr.ph194.preheader1
                                        #   in Loop: Header=BB103_14 Depth=1
	movq	-64(%rbp), %rdi                 # 8-byte Reload
	.p2align	4, 0x90
.LBB103_53:                             # %.lr.ph194
                                        #   Parent Loop BB103_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-3216(%rbp,%rax,4), %ecx
	movl	-3212(%rbp,%rax,4), %edx
	movl	%ecx, %esi
	sarl	$8, %esi
	shrl	$31, %ecx
	addl	%esi, %ecx
	andl	$-2, %ecx
	shll	$7, %ecx
	addl	$256, %ecx                      # imm = 0x100
	movl	%ecx, -3216(%rbp,%rax,4)
	movl	%edx, %ecx
	sarl	$8, %ecx
	shrl	$31, %edx
	addl	%ecx, %edx
	andl	$-2, %edx
	shll	$7, %edx
	addl	$256, %edx                      # imm = 0x100
	movl	%edx, -3212(%rbp,%rax,4)
	leaq	(%rdi,%rax), %rcx
	addq	$2, %rcx
	addq	$2, %rax
	cmpq	$1, %rcx
	jne	.LBB103_53
.LBB103_11:                             # %.loopexit.loopexit.unr-lcssa
                                        #   in Loop: Header=BB103_14 Depth=1
	testq	%r15, %r15
	je	.LBB103_13
# %bb.12:                               # %.lr.ph194.epil.preheader
                                        #   in Loop: Header=BB103_14 Depth=1
	movl	-3216(%rbp,%rax,4), %ecx
	movl	%ecx, %edx
	sarl	$8, %edx
	shrl	$31, %ecx
	addl	%edx, %ecx
	andl	$-2, %ecx
	shll	$7, %ecx
	addl	$256, %ecx                      # imm = 0x100
	movl	%ecx, -3216(%rbp,%rax,4)
	jmp	.LBB103_13
.LBB103_60:                             # %._crit_edge190.thread
	addq	$5240, %rsp                     # imm = 0x1478
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB103_61:
	.cfi_def_cfa %rbp, 16
	movl	$2001, %edi                     # imm = 0x7D1
	callq	BZ2_bz__AssertH__fail
.LBB103_62:
	movl	$2002, %edi                     # imm = 0x7D2
	callq	BZ2_bz__AssertH__fail
.Lfunc_end103:
	.size	BZ2_hbMakeCodeLengths, .Lfunc_end103-BZ2_hbMakeCodeLengths
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
                                        # kill: def $ecx killed $ecx def $rcx
                                        # kill: def $edx killed $edx def $rdx
	movl	%ecx, %r10d
	subl	%edx, %r10d
	jl	.LBB104_38
# %bb.1:                                # %.lr.ph25
	xorl	%r9d, %r9d
	testl	%r8d, %r8d
	cmovnsl	%r8d, %r9d
	jle	.LBB104_38
# %bb.2:                                # %.lr.ph25.split.preheader
	cmpl	$1, %r9d
	jne	.LBB104_3
# %bb.22:                               # %.lr.ph25.split.preheader.split.us
	addl	$1, %r10d
	xorl	%eax, %eax
	cmpl	%edx, %ecx
	je	.LBB104_34
# %bb.23:                               # %.lr.ph25.split.preheader.split.us.new
	testb	$1, %r9b
	jne	.LBB104_24
# %bb.31:                               # %.lr.ph25.split.us.us.preheader
	movl	%r10d, %eax
	andl	$-2, %eax
	negl	%eax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB104_32:                             # %.lr.ph25.split.us.us
                                        # =>This Inner Loop Header: Depth=1
	addl	$-2, %ecx
	cmpl	%ecx, %eax
	jne	.LBB104_32
# %bb.33:                               # %._crit_edge26.loopexit.us-lcssa.us.unr-lcssa.loopexit
	subl	%ecx, %edx
	xorl	%eax, %eax
	movl	%edx, %ecx
	jmp	.LBB104_34
.LBB104_3:                              # %.lr.ph25.split.preheader35
	movl	%r9d, %r8d
	andl	$2147483646, %r8d               # imm = 0x7FFFFFFE
	testb	$1, %r9b
	jne	.LBB104_4
# %bb.14:                               # %.lr.ph25.split.us37.preheader
	xorl	%r9d, %r9d
	jmp	.LBB104_15
	.p2align	4, 0x90
.LBB104_21:                             # %._crit_edge.us41
                                        #   in Loop: Header=BB104_15 Depth=1
	addl	%r9d, %r9d
	leal	1(%rdx), %eax
	cmpl	%ecx, %edx
	movl	%eax, %edx
	je	.LBB104_38
.LBB104_15:                             # %.lr.ph25.split.us37
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB104_16 Depth 2
	xorl	%r10d, %r10d
	jmp	.LBB104_16
	.p2align	4, 0x90
.LBB104_20:                             #   in Loop: Header=BB104_16 Depth=2
	addq	$2, %r10
	cmpq	%r10, %r8
	je	.LBB104_21
.LBB104_16:                             # %.lr.ph25.split.new.us
                                        #   Parent Loop BB104_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rsi,%r10), %eax
	cmpl	%eax, %edx
	je	.LBB104_17
# %bb.18:                               #   in Loop: Header=BB104_16 Depth=2
	movzbl	1(%rsi,%r10), %eax
	cmpl	%eax, %edx
	jne	.LBB104_20
	jmp	.LBB104_19
	.p2align	4, 0x90
.LBB104_17:                             #   in Loop: Header=BB104_16 Depth=2
	movl	%r9d, (%rdi,%r10,4)
	addl	$1, %r9d
	movzbl	1(%rsi,%r10), %eax
	cmpl	%eax, %edx
	jne	.LBB104_20
.LBB104_19:                             #   in Loop: Header=BB104_16 Depth=2
	movl	%r9d, 4(%rdi,%r10,4)
	addl	$1, %r9d
	jmp	.LBB104_20
.LBB104_4:                              # %.lr.ph25.split.preheader2
	xorl	%r9d, %r9d
	jmp	.LBB104_5
	.p2align	4, 0x90
.LBB104_13:                             # %._crit_edge
                                        #   in Loop: Header=BB104_5 Depth=1
	addl	%r9d, %r9d
	leal	1(%rdx), %eax
	cmpl	%ecx, %edx
	movl	%eax, %edx
	je	.LBB104_38
.LBB104_5:                              # %.lr.ph25.split
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB104_6 Depth 2
	xorl	%eax, %eax
	jmp	.LBB104_6
	.p2align	4, 0x90
.LBB104_10:                             #   in Loop: Header=BB104_6 Depth=2
	leaq	2(%r10), %rax
	cmpq	%rax, %r8
	je	.LBB104_11
.LBB104_6:                              # %.lr.ph25.split.new
                                        #   Parent Loop BB104_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, %r10
	movzbl	(%rsi,%rax), %eax
	cmpl	%eax, %edx
	je	.LBB104_7
# %bb.8:                                #   in Loop: Header=BB104_6 Depth=2
	movzbl	1(%rsi,%r10), %eax
	cmpl	%eax, %edx
	jne	.LBB104_10
	jmp	.LBB104_9
	.p2align	4, 0x90
.LBB104_7:                              #   in Loop: Header=BB104_6 Depth=2
	movl	%r9d, (%rdi,%r10,4)
	addl	$1, %r9d
	movzbl	1(%rsi,%r10), %eax
	cmpl	%eax, %edx
	jne	.LBB104_10
.LBB104_9:                              #   in Loop: Header=BB104_6 Depth=2
	movl	%r9d, 4(%rdi,%r10,4)
	addl	$1, %r9d
	jmp	.LBB104_10
	.p2align	4, 0x90
.LBB104_11:                             # %.epil.preheader
                                        #   in Loop: Header=BB104_5 Depth=1
	movzbl	(%rsi,%rax), %eax
	cmpl	%eax, %edx
	jne	.LBB104_13
# %bb.12:                               #   in Loop: Header=BB104_5 Depth=1
	movl	%r9d, 8(%rdi,%r10,4)
	addl	$1, %r9d
	jmp	.LBB104_13
.LBB104_24:                             # %.lr.ph25.split.us.preheader
	movl	%r10d, %r8d
	andl	$-2, %r8d
	negl	%r8d
	xorl	%eax, %eax
	jmp	.LBB104_25
	.p2align	4, 0x90
.LBB104_29:                             # %._crit_edge.us.1
                                        #   in Loop: Header=BB104_25 Depth=1
	addl	%eax, %eax
	addl	$1, %edx
	addl	$2, %r8d
	je	.LBB104_30
.LBB104_25:                             # %.lr.ph25.split.us
                                        # =>This Inner Loop Header: Depth=1
	movl	%edx, %ecx
	movzbl	(%rsi), %r11d
	cmpl	%r11d, %edx
	je	.LBB104_26
# %bb.27:                               # %.epil.preheader.us.1
                                        #   in Loop: Header=BB104_25 Depth=1
	addl	%eax, %eax
	leal	1(%rcx), %edx
	cmpl	%r11d, %edx
	jne	.LBB104_29
	jmp	.LBB104_28
	.p2align	4, 0x90
.LBB104_26:                             #   in Loop: Header=BB104_25 Depth=1
	movl	%eax, (%rdi)
	orl	$1, %eax
	movzbl	(%rsi), %r11d
	addl	%eax, %eax
	leal	1(%rcx), %edx
	cmpl	%r11d, %edx
	jne	.LBB104_29
.LBB104_28:                             #   in Loop: Header=BB104_25 Depth=1
	movl	%eax, (%rdi)
	orl	$1, %eax
	jmp	.LBB104_29
.LBB104_30:
	addl	$2, %ecx
.LBB104_34:                             # %._crit_edge26.loopexit.us-lcssa.us.unr-lcssa
	testb	$1, %r10b
	je	.LBB104_38
# %bb.35:                               # %._crit_edge26.loopexit.us-lcssa.us.unr-lcssa
	andl	$1, %r9d
	testq	%r9, %r9
	je	.LBB104_38
# %bb.36:                               # %.epil.preheader.us.epil
	movzbl	(%rsi), %edx
	cmpl	%edx, %ecx
	jne	.LBB104_38
# %bb.37:
	movl	%eax, (%rdi)
.LBB104_38:                             # %._crit_edge26
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end104:
	.size	BZ2_hbAssignCodes, .Lfunc_end104-BZ2_hbAssignCodes
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	16(%rbp), %r10d
	xorl	%eax, %eax
	testl	%r10d, %r10d
	cmovnsl	%r10d, %eax
	movl	%r9d, %r14d
	movl	%eax, %r11d
	subl	%r8d, %r14d
	jge	.LBB105_1
.LBB105_50:                             # %.preheader83
	xorps	%xmm0, %xmm0
	movups	%xmm0, 76(%rsi)
	movups	%xmm0, 64(%rsi)
	movups	%xmm0, 48(%rsi)
	movups	%xmm0, 32(%rsi)
	movups	%xmm0, 16(%rsi)
	movups	%xmm0, (%rsi)
	testl	%r10d, %r10d
	jle	.LBB105_3
# %bb.51:                               # %.lr.ph97.preheader
	cmpl	$1, %r11d
	jne	.LBB105_55
# %bb.52:
	xorl	%eax, %eax
	jmp	.LBB105_54
.LBB105_1:                              # %.lr.ph111
	testl	%r10d, %r10d
	jle	.LBB105_2
# %bb.16:                               # %.lr.ph111.split.preheader
	cmpl	$1, %eax
	jne	.LBB105_17
# %bb.34:                               # %.lr.ph111.split.preheader.split.us
	addl	$1, %r14d
	xorl	%r15d, %r15d
	movl	%r9d, %r12d
	cmpl	%r8d, %r9d
	je	.LBB105_46
# %bb.35:                               # %.lr.ph111.split.preheader.split.us.new
	testb	$1, %r11b
	jne	.LBB105_36
# %bb.43:                               # %.lr.ph111.split.us.us.preheader
	movl	%r14d, %eax
	andl	$-2, %eax
	negl	%eax
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB105_44:                             # %.lr.ph111.split.us.us
                                        # =>This Inner Loop Header: Depth=1
	addl	$-2, %ebx
	cmpl	%ebx, %eax
	jne	.LBB105_44
# %bb.45:                               # %.preheader83.loopexit.us-lcssa.us.unr-lcssa.loopexit
	movl	%r8d, %r12d
	subl	%ebx, %r12d
                                        # implicit-def: $r15d
	jmp	.LBB105_46
.LBB105_55:                             # %.lr.ph97.preheader.new
	movl	%r11d, %edx
	andl	$-2, %edx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB105_56:                             # %.lr.ph97
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%rcx,%rax), %ebx
	addl	$1, 4(%rsi,%rbx,4)
	movzbl	1(%rcx,%rax), %ebx
	addl	$1, 4(%rsi,%rbx,4)
	addq	$2, %rax
	cmpq	%rax, %rdx
	jne	.LBB105_56
# %bb.53:                               # %.preheader82.loopexit.unr-lcssa
	testb	$1, %r11b
	je	.LBB105_3
.LBB105_54:                             # %.lr.ph97.epil.preheader
	movzbl	(%rcx,%rax), %eax
	addl	$1, 4(%rsi,%rax,4)
	jmp	.LBB105_3
.LBB105_2:                              # %.preheader83.thread
	xorps	%xmm0, %xmm0
	movups	%xmm0, 76(%rsi)
	movups	%xmm0, 64(%rsi)
	movups	%xmm0, 48(%rsi)
	movups	%xmm0, 32(%rsi)
	movups	%xmm0, 16(%rsi)
	movups	%xmm0, (%rsi)
.LBB105_3:                              # %.preheader.preheader
	movl	8(%rsi), %eax
	addl	4(%rsi), %eax
	movl	%eax, 8(%rsi)
	addl	12(%rsi), %eax
	movl	%eax, 12(%rsi)
	addl	16(%rsi), %eax
	movl	%eax, 16(%rsi)
	addl	20(%rsi), %eax
	movl	%eax, 20(%rsi)
	addl	24(%rsi), %eax
	movl	%eax, 24(%rsi)
	addl	28(%rsi), %eax
	movl	%eax, 28(%rsi)
	addl	32(%rsi), %eax
	movl	%eax, 32(%rsi)
	addl	36(%rsi), %eax
	movl	%eax, 36(%rsi)
	addl	40(%rsi), %eax
	movl	%eax, 40(%rsi)
	addl	44(%rsi), %eax
	movl	%eax, 44(%rsi)
	addl	48(%rsi), %eax
	movl	%eax, 48(%rsi)
	addl	52(%rsi), %eax
	movl	%eax, 52(%rsi)
	addl	56(%rsi), %eax
	movl	%eax, 56(%rsi)
	addl	60(%rsi), %eax
	movl	%eax, 60(%rsi)
	addl	64(%rsi), %eax
	movl	%eax, 64(%rsi)
	addl	68(%rsi), %eax
	movl	%eax, 68(%rsi)
	addl	72(%rsi), %eax
	movl	%eax, 72(%rsi)
	addl	76(%rsi), %eax
	movl	%eax, 76(%rsi)
	addl	80(%rsi), %eax
	movl	%eax, 80(%rsi)
	addl	84(%rsi), %eax
	movl	%eax, 84(%rsi)
	addl	%eax, 88(%rsi)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 76(%rdi)
	movups	%xmm0, 64(%rdi)
	movups	%xmm0, 48(%rdi)
	movups	%xmm0, 32(%rdi)
	movups	%xmm0, 16(%rdi)
	movups	%xmm0, (%rdi)
	movslq	%r9d, %r11
	cmpl	%r8d, %r9d
	jl	.LBB105_10
# %bb.4:                                # %.lr.ph90.preheader
	movslq	%r8d, %rbx
	movq	%r11, %r10
	subq	%rbx, %r10
	addq	$1, %r10
	movl	$-1, %edx
	cmpl	%r8d, %r9d
	je	.LBB105_8
# %bb.5:                                # %.lr.ph90.preheader.new
	movq	%r10, %rcx
	andq	$-2, %rcx
	negq	%rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB105_6:                              # %.lr.ph90
                                        # =>This Inner Loop Header: Depth=1
	movl	4(%rsi,%rbx,4), %eax
	subl	(%rsi,%rbx,4), %eax
	leal	(%rax,%rdx), %r14d
	addl	%edx, %eax
	addl	$-1, %eax
	movl	%eax, (%rdi,%rbx,4)
	movl	8(%rsi,%rbx,4), %eax
	subl	4(%rsi,%rbx,4), %eax
	leal	(%rax,%r14,2), %edx
	addl	$-1, %edx
	movl	%edx, 4(%rdi,%rbx,4)
	addq	$2, %rbx
	leal	(%rax,%r14,2), %edx
	addl	%edx, %edx
	addq	$2, %rcx
	jne	.LBB105_6
# %bb.7:                                # %._crit_edge91.loopexit.unr-lcssa.loopexit
	addl	$-1, %edx
.LBB105_8:                              # %._crit_edge91.loopexit.unr-lcssa
	testb	$1, %r10b
	je	.LBB105_10
# %bb.9:                                # %.lr.ph90.epil.preheader
	addl	4(%rsi,%rbx,4), %edx
	subl	(%rsi,%rbx,4), %edx
	movl	%edx, (%rdi,%rbx,4)
.LBB105_10:                             # %._crit_edge91
	addl	$1, %r8d
	cmpl	%r9d, %r8d
	jg	.LBB105_15
# %bb.11:                               # %.lr.ph.preheader
	movslq	%r8d, %rcx
	addq	$1, %r11
	movl	%r11d, %eax
	subl	%r8d, %eax
	testb	$1, %al
	je	.LBB105_13
# %bb.12:                               # %.lr.ph.prol.preheader
	movl	-4(%rdi,%rcx,4), %eax
	addl	%eax, %eax
	subl	(%rsi,%rcx,4), %eax
	addl	$2, %eax
	movl	%eax, (%rsi,%rcx,4)
	addq	$1, %rcx
.LBB105_13:                             # %.lr.ph.prol.loopexit
	cmpl	%r9d, %r8d
	je	.LBB105_15
	.p2align	4, 0x90
.LBB105_14:                             # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movl	-4(%rdi,%rcx,4), %eax
	addl	%eax, %eax
	subl	(%rsi,%rcx,4), %eax
	addl	$2, %eax
	movl	%eax, (%rsi,%rcx,4)
	movl	(%rdi,%rcx,4), %eax
	addl	%eax, %eax
	subl	4(%rsi,%rcx,4), %eax
	addl	$2, %eax
	movl	%eax, 4(%rsi,%rcx,4)
	addq	$2, %rcx
	cmpq	%rcx, %r11
	jne	.LBB105_14
.LBB105_15:                             # %._crit_edge
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB105_17:                             # %.lr.ph111.split.preheader155
	.cfi_def_cfa %rbp, 16
	movl	%r11d, %r14d
	andl	$2147483646, %r14d              # imm = 0x7FFFFFFE
	xorl	%r12d, %r12d
	movl	%r8d, %r15d
	testb	$1, %r11b
	je	.LBB105_27
	jmp	.LBB105_18
	.p2align	4, 0x90
.LBB105_33:                             # %._crit_edge105.us161
                                        #   in Loop: Header=BB105_27 Depth=1
	leal	1(%r15), %eax
	cmpl	%r9d, %r15d
	movl	%eax, %r15d
	je	.LBB105_50
.LBB105_27:                             # %.lr.ph111.split.us157
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB105_28 Depth 2
	xorl	%ebx, %ebx
	jmp	.LBB105_28
	.p2align	4, 0x90
.LBB105_32:                             #   in Loop: Header=BB105_28 Depth=2
	addq	$2, %rbx
	cmpq	%rbx, %r14
	je	.LBB105_33
.LBB105_28:                             # %.lr.ph111.split.new.us
                                        #   Parent Loop BB105_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rcx,%rbx), %eax
	cmpl	%eax, %r15d
	je	.LBB105_29
# %bb.30:                               #   in Loop: Header=BB105_28 Depth=2
	movzbl	1(%rcx,%rbx), %eax
	cmpl	%eax, %r15d
	jne	.LBB105_32
	jmp	.LBB105_31
	.p2align	4, 0x90
.LBB105_29:                             #   in Loop: Header=BB105_28 Depth=2
	movslq	%r12d, %rax
	addl	$1, %r12d
	movl	%ebx, (%rdx,%rax,4)
	movzbl	1(%rcx,%rbx), %eax
	cmpl	%eax, %r15d
	jne	.LBB105_32
.LBB105_31:                             #   in Loop: Header=BB105_28 Depth=2
	leal	1(%rbx), %r13d
	movslq	%r12d, %rax
	addl	$1, %r12d
	movl	%r13d, (%rdx,%rax,4)
	jmp	.LBB105_32
	.p2align	4, 0x90
.LBB105_26:                             # %._crit_edge105
                                        #   in Loop: Header=BB105_18 Depth=1
	leal	1(%r15), %eax
	cmpl	%r9d, %r15d
	movl	%eax, %r15d
	je	.LBB105_50
.LBB105_18:                             # %.lr.ph111.split
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB105_19 Depth 2
	xorl	%eax, %eax
	jmp	.LBB105_19
	.p2align	4, 0x90
.LBB105_23:                             #   in Loop: Header=BB105_19 Depth=2
	addq	$2, %rax
	cmpq	%rax, %r14
	je	.LBB105_24
.LBB105_19:                             # %.lr.ph111.split.new
                                        #   Parent Loop BB105_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rcx,%rax), %ebx
	cmpl	%ebx, %r15d
	je	.LBB105_20
# %bb.21:                               #   in Loop: Header=BB105_19 Depth=2
	movzbl	1(%rcx,%rax), %ebx
	cmpl	%ebx, %r15d
	jne	.LBB105_23
	jmp	.LBB105_22
	.p2align	4, 0x90
.LBB105_20:                             #   in Loop: Header=BB105_19 Depth=2
	movslq	%r12d, %rbx
	addl	$1, %r12d
	movl	%eax, (%rdx,%rbx,4)
	movzbl	1(%rcx,%rax), %ebx
	cmpl	%ebx, %r15d
	jne	.LBB105_23
.LBB105_22:                             #   in Loop: Header=BB105_19 Depth=2
	leal	1(%rax), %r13d
	movslq	%r12d, %rbx
	addl	$1, %r12d
	movl	%r13d, (%rdx,%rbx,4)
	jmp	.LBB105_23
	.p2align	4, 0x90
.LBB105_24:                             # %.epil.preheader
                                        #   in Loop: Header=BB105_18 Depth=1
	movzbl	(%rcx,%rax), %ebx
	cmpl	%ebx, %r15d
	jne	.LBB105_26
# %bb.25:                               #   in Loop: Header=BB105_18 Depth=1
	movslq	%r12d, %rbx
	addl	$1, %r12d
	movl	%eax, (%rdx,%rbx,4)
	jmp	.LBB105_26
.LBB105_36:                             # %.lr.ph111.split.us.preheader
	movl	%r14d, %r13d
	andl	$-2, %r13d
	negl	%r13d
	xorl	%r15d, %r15d
	movl	%r8d, %eax
	jmp	.LBB105_37
	.p2align	4, 0x90
.LBB105_41:                             # %._crit_edge105.us.1
                                        #   in Loop: Header=BB105_37 Depth=1
	addl	$1, %eax
	addl	$2, %r13d
	je	.LBB105_42
.LBB105_37:                             # %.lr.ph111.split.us
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, %r12d
	movzbl	(%rcx), %ebx
	cmpl	%ebx, %eax
	je	.LBB105_38
# %bb.39:                               # %.epil.preheader.us.1
                                        #   in Loop: Header=BB105_37 Depth=1
	leal	1(%r12), %eax
	cmpl	%ebx, %eax
	jne	.LBB105_41
	jmp	.LBB105_40
	.p2align	4, 0x90
.LBB105_38:                             #   in Loop: Header=BB105_37 Depth=1
	movslq	%r15d, %rax
	addl	$1, %r15d
	movl	$0, (%rdx,%rax,4)
	movzbl	(%rcx), %ebx
	leal	1(%r12), %eax
	cmpl	%ebx, %eax
	jne	.LBB105_41
.LBB105_40:                             #   in Loop: Header=BB105_37 Depth=1
	movslq	%r15d, %rbx
	addl	$1, %r15d
	movl	$0, (%rdx,%rbx,4)
	jmp	.LBB105_41
.LBB105_42:
	addl	$2, %r12d
.LBB105_46:                             # %.preheader83.loopexit.us-lcssa.us.unr-lcssa
	testb	$1, %r14b
	je	.LBB105_50
# %bb.47:                               # %.preheader83.loopexit.us-lcssa.us.unr-lcssa
	movl	%r11d, %eax
	andl	$1, %eax
	testq	%rax, %rax
	je	.LBB105_50
# %bb.48:                               # %.epil.preheader.us.epil
	movzbl	(%rcx), %eax
	cmpl	%eax, %r12d
	jne	.LBB105_50
# %bb.49:
	movslq	%r15d, %rax
	movl	$0, (%rdx,%rax,4)
	jmp	.LBB105_50
.Lfunc_end105:
	.size	BZ2_hbCreateDecodeTables, .Lfunc_end105-BZ2_hbCreateDecodeTables
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movl	%edi, %r13d
	movl	$.L.str.166, %edi
	movl	$.L.str.1.167, %esi
	callq	fopen
	testq	%rax, %rax
	je	.LBB106_1
# %bb.2:
	movq	%rax, %r12
	xorl	%r15d, %r15d
	leaq	-48(%rbp), %rdx
	movl	$.L.str.3.169, %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	__isoc99_fscanf
	movq	%r12, %rdi
	callq	fclose
	cmpq	$0, -48(%rbp)
	jle	.LBB106_5
# %bb.3:                                # %.lr.ph.preheader
	xorl	%r15d, %r15d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB106_4:                              # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	addq	$1, %rbx
	movl	%r13d, %edi
	movq	%r14, %rsi
	callq	main1
	cmpq	-48(%rbp), %rbx
	jl	.LBB106_4
.LBB106_5:                              # %.loopexit
	movl	%r15d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB106_1:
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rcx
	movl	$.L.str.2.168, %edi
	movl	$28, %esi
	movl	$1, %edx
	callq	fwrite
	movl	$1, %r15d
	jmp	.LBB106_5
.Lfunc_end106:
	.size	main, .Lfunc_end106-main
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
	.section	.rodata,"a",@progbits
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

	.type	.L.str.4.110,@object            # @.str.4.110
.L.str.4.110:
	.asciz	"\n    combined CRCs: stored = 0x%08x, computed = 0x%08x"
	.size	.L.str.4.110, 55

	.type	bzerrorstrings,@object          # @bzerrorstrings
	.section	.rodata,"a",@progbits
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
