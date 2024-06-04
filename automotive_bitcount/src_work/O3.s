	.text
	.file	"llvm-link"
	.globl	alloc_bit_array                 # -- Begin function alloc_bit_array
	.p2align	4, 0x90
	.type	alloc_bit_array,@function
alloc_bit_array:                        # @alloc_bit_array
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	addq	$7, %rdi
	shrq	$3, %rdi
	movl	$1, %esi
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	calloc                          # TAILCALL
.Lfunc_end0:
	.size	alloc_bit_array, .Lfunc_end0-alloc_bit_array
	.cfi_endproc
                                        # -- End function
	.globl	getbit                          # -- Begin function getbit
	.p2align	4, 0x90
	.type	getbit,@function
getbit:                                 # @getbit
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
                                        # kill: def $esi killed $esi def $rsi
	leal	7(%rsi), %eax
	testl	%esi, %esi
	cmovnsl	%esi, %eax
	sarl	$3, %eax
	cltq
	movzbl	(%rdi,%rax), %ecx
	andb	$7, %sil
	movzbl	%sil, %edx
	xorl	%eax, %eax
	btl	%edx, %ecx
	setb	%al
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	getbit, .Lfunc_end1-getbit
	.cfi_endproc
                                        # -- End function
	.globl	setbit                          # -- Begin function setbit
	.p2align	4, 0x90
	.type	setbit,@function
setbit:                                 # @setbit
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%esi, %ecx
	leal	7(%rcx), %eax
	testl	%esi, %esi
	cmovnsl	%esi, %eax
	andb	$7, %cl
	movl	$1, %esi
                                        # kill: def $cl killed $cl killed $rcx
	shll	%cl, %esi
	sarl	$3, %eax
	movslq	%eax, %r8
	movb	(%rdi,%r8), %cl
	movl	%esi, %eax
	notb	%al
	andb	%cl, %al
	orb	%sil, %cl
	testl	%edx, %edx
	movzbl	%al, %eax
	movzbl	%cl, %ecx
	cmovel	%eax, %ecx
	movb	%cl, (%rdi,%r8)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	setbit, .Lfunc_end2-setbit
	.cfi_endproc
                                        # -- End function
	.globl	flipbit                         # -- Begin function flipbit
	.p2align	4, 0x90
	.type	flipbit,@function
flipbit:                                # @flipbit
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%esi, %ecx
	leal	7(%rcx), %eax
	testl	%esi, %esi
	cmovnsl	%esi, %eax
	sarl	$3, %eax
	andb	$7, %cl
	movl	$1, %edx
                                        # kill: def $cl killed $cl killed $rcx
	shll	%cl, %edx
	cltq
	xorb	%dl, (%rdi,%rax)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	flipbit, .Lfunc_end3-flipbit
	.cfi_endproc
                                        # -- End function
	.globl	bit_count                       # -- Begin function bit_count
	.p2align	4, 0x90
	.type	bit_count,@function
bit_count:                              # @bit_count
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.LBB4_2
	.p2align	4, 0x90
.LBB4_1:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	addl	$1, %eax
	leaq	-1(%rdi), %rcx
	andq	%rcx, %rdi
	jne	.LBB4_1
.LBB4_2:                                # %if.end
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	bit_count, .Lfunc_end4-bit_count
	.cfi_endproc
                                        # -- End function
	.globl	bitcount                        # -- Begin function bitcount
	.p2align	4, 0x90
	.type	bitcount,@function
bitcount:                               # @bitcount
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, %rax
	shrq	%rax
	andl	$1431655765, %eax               # imm = 0x55555555
	andl	$1431655765, %edi               # imm = 0x55555555
	addq	%rax, %rdi
	movq	%rdi, %rax
	shrq	$2, %rax
	andl	$858993459, %eax                # imm = 0x33333333
	andl	$858993459, %edi                # imm = 0x33333333
	addq	%rax, %rdi
	movq	%rdi, %rax
	shrq	$4, %rax
	andl	$117901063, %eax                # imm = 0x7070707
	andl	$117901063, %edi                # imm = 0x7070707
	addq	%rax, %rdi
	movq	%rdi, %rax
	shrq	$8, %rax
	andl	$983055, %eax                   # imm = 0xF000F
	andl	$983055, %edi                   # imm = 0xF000F
	addq	%rax, %rdi
	movzwl	%di, %ecx
	movq	%rdi, %rax
	shrq	$16, %rax
	addl	%ecx, %eax
                                        # kill: def $eax killed $eax killed $rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	bitcount, .Lfunc_end5-bitcount
	.cfi_endproc
                                        # -- End function
	.globl	ntbl_bitcount                   # -- Begin function ntbl_bitcount
	.p2align	4, 0x90
	.type	ntbl_bitcount,@function
ntbl_bitcount:                          # @ntbl_bitcount
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, %eax
	andl	$15, %eax
	movsbl	bits.1(%rax), %eax
	movl	%edi, %ecx
	shrl	$4, %ecx
	andl	$15, %ecx
	movsbl	bits.1(%rcx), %ecx
	addl	%eax, %ecx
	movl	%edi, %eax
	shrl	$8, %eax
	andl	$15, %eax
	movsbl	bits.1(%rax), %eax
	addl	%ecx, %eax
	movl	%edi, %ecx
	shrl	$12, %ecx
	andl	$15, %ecx
	movsbl	bits.1(%rcx), %ecx
	addl	%eax, %ecx
	movl	%edi, %eax
	shrl	$16, %eax
	andl	$15, %eax
	movsbl	bits.1(%rax), %eax
	addl	%ecx, %eax
	movl	%edi, %ecx
	shrl	$20, %ecx
	andl	$15, %ecx
	movsbl	bits.1(%rcx), %ecx
	addl	%eax, %ecx
	movl	%edi, %eax
	shrl	$24, %eax
	andl	$15, %eax
	movsbl	bits.1(%rax), %edx
	addl	%ecx, %edx
	shrl	$28, %edi
	movsbl	bits.1(%rdi), %eax
	addl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end6:
	.size	ntbl_bitcount, .Lfunc_end6-ntbl_bitcount
	.cfi_endproc
                                        # -- End function
	.globl	BW_btbl_bitcount                # -- Begin function BW_btbl_bitcount
	.p2align	4, 0x90
	.type	BW_btbl_bitcount,@function
BW_btbl_bitcount:                       # @BW_btbl_bitcount
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, %rax
	movzbl	%ah, %ecx
	movl	%eax, %edx
	movzbl	%al, %esi
                                        # kill: def $eax killed $eax killed $rax
	shrl	$16, %eax
	movzbl	%al, %eax
	shrl	$24, %edx
	movsbl	bits.1(%rsi), %esi
	movsbl	bits.1(%rcx), %ecx
	addl	%esi, %ecx
	movsbl	bits.1(%rdx), %edx
	addl	%ecx, %edx
	movsbl	bits.1(%rax), %eax
	addl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end7:
	.size	BW_btbl_bitcount, .Lfunc_end7-BW_btbl_bitcount
	.cfi_endproc
                                        # -- End function
	.globl	AR_btbl_bitcount                # -- Begin function AR_btbl_bitcount
	.p2align	4, 0x90
	.type	AR_btbl_bitcount,@function
AR_btbl_bitcount:                       # @AR_btbl_bitcount
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, %rax
	movzbl	%ah, %ecx
	movl	%eax, %edx
	movzbl	%al, %esi
                                        # kill: def $eax killed $eax killed $rax
	shrl	$16, %eax
	movzbl	%al, %eax
	shrl	$24, %edx
	movsbl	bits.1(%rsi), %esi
	movsbl	bits.1(%rcx), %ecx
	addl	%esi, %ecx
	movsbl	bits.1(%rax), %esi
	addl	%ecx, %esi
	movsbl	bits.1(%rdx), %eax
	addl	%esi, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end8:
	.size	AR_btbl_bitcount, .Lfunc_end8-AR_btbl_bitcount
	.cfi_endproc
                                        # -- End function
	.globl	ntbl_bitcnt                     # -- Begin function ntbl_bitcnt
	.p2align	4, 0x90
	.type	ntbl_bitcnt,@function
ntbl_bitcnt:                            # @ntbl_bitcnt
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB9_1:                                # %tailrecurse
                                        # =>This Inner Loop Header: Depth=1
	movl	%edi, %ecx
	andl	$15, %ecx
	movsbl	bits.1(%rcx), %ecx
	addl	%ecx, %eax
	sarq	$4, %rdi
	testq	%rdi, %rdi
	jne	.LBB9_1
# %bb.2:                                # %if.end
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end9:
	.size	ntbl_bitcnt, .Lfunc_end9-ntbl_bitcnt
	.cfi_endproc
                                        # -- End function
	.globl	btbl_bitcnt                     # -- Begin function btbl_bitcnt
	.p2align	4, 0x90
	.type	btbl_bitcnt,@function
btbl_bitcnt:                            # @btbl_bitcnt
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB10_1:                               # %tailrecurse
                                        # =>This Inner Loop Header: Depth=1
	movzbl	%dil, %ecx
	movsbl	bits.1(%rcx), %ecx
	addl	%ecx, %eax
	sarq	$8, %rdi
	testq	%rdi, %rdi
	jne	.LBB10_1
# %bb.2:                                # %if.end
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end10:
	.size	btbl_bitcnt, .Lfunc_end10-btbl_bitcnt
	.cfi_endproc
                                        # -- End function
	.globl	main1                           # -- Begin function main1
	.p2align	4, 0x90
	.type	main1,@function
main1:                                  # @main1
	.cfi_startproc
# %bb.0:                                # %entry
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
	cmpl	$1, %edi
	jle	.LBB11_34
# %bb.1:                                # %if.end
	movl	%edx, %r14d
	movq	8(%rsi), %rdi
	callq	atoi
	movl	%eax, %ebx
	testl	%r14d, %r14d
	je	.LBB11_2
# %bb.3:                                # %if.end4.thread
	movl	$.L.str.8, %edi
	callq	puts
	testl	%ebx, %ebx
	jg	.LBB11_4
# %bb.31:                               # %for.cond6.preheader.preheader
	movl	$.L.str.9, %edi
	movl	$.L.str, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.9, %edi
	movl	$.L.str.1, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.9, %edi
	movl	$.L.str.2, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.9, %edi
	movl	$.L.str.3, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.9, %edi
	movl	$.L.str.4, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.9, %edi
	movl	$.L.str.5, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.9, %edi
	movl	$.L.str.6, %esi
	xorl	%edx, %edx
	jmp	.LBB11_32
.LBB11_2:                               # %if.end4
	testl	%ebx, %ebx
	jle	.LBB11_33
.LBB11_4:                               # %for.cond6.preheader.us.preheader
	movl	%ebx, %r12d
	movl	$1, %ebx
	xorl	%r15d, %r15d
	movq	%r12, %r13
	.p2align	4, 0x90
.LBB11_5:                               # %for.body9.us
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	bit_count
	cltq
	addq	%rax, %r15
	addq	$13, %rbx
	addq	$-1, %r13
	jne	.LBB11_5
# %bb.6:                                # %for.cond6.for.end_crit_edge.us
	testl	%r14d, %r14d
	je	.LBB11_7
# %bb.35:                               # %if.then15.us
	movl	$.L.str.9, %edi
	movl	$.L.str, %esi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	printf
.LBB11_7:                               # %for.body9.us.1.preheader
	movl	$1, %ebx
	xorl	%r15d, %r15d
	movq	%r12, %r13
	.p2align	4, 0x90
.LBB11_8:                               # %for.body9.us.1
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	bitcount
	movl	%eax, %eax
	addq	%rax, %r15
	addq	$13, %rbx
	addq	$-1, %r13
	jne	.LBB11_8
# %bb.9:                                # %for.cond6.for.end_crit_edge.us.1
	testl	%r14d, %r14d
	je	.LBB11_11
# %bb.10:                               # %if.then15.us.1
	movl	$.L.str.9, %edi
	movl	$.L.str.1, %esi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	printf
.LBB11_11:                              # %for.body9.us.2.preheader
	movl	$1, %ebx
	xorl	%r15d, %r15d
	movq	%r12, %r13
	.p2align	4, 0x90
.LBB11_12:                              # %for.body9.us.2
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	ntbl_bitcnt
	cltq
	addq	%rax, %r15
	addq	$13, %rbx
	addq	$-1, %r13
	jne	.LBB11_12
# %bb.13:                               # %for.cond6.for.end_crit_edge.us.2
	testl	%r14d, %r14d
	je	.LBB11_15
# %bb.14:                               # %if.then15.us.2
	movl	$.L.str.9, %edi
	movl	$.L.str.2, %esi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	printf
.LBB11_15:                              # %for.body9.us.3.preheader
	movl	$1, %ebx
	xorl	%r15d, %r15d
	movq	%r12, %r13
	.p2align	4, 0x90
.LBB11_16:                              # %for.body9.us.3
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	ntbl_bitcount
	cltq
	addq	%rax, %r15
	addq	$13, %rbx
	addq	$-1, %r13
	jne	.LBB11_16
# %bb.17:                               # %for.cond6.for.end_crit_edge.us.3
	testl	%r14d, %r14d
	je	.LBB11_19
# %bb.18:                               # %if.then15.us.3
	movl	$.L.str.9, %edi
	movl	$.L.str.3, %esi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	printf
.LBB11_19:                              # %for.body9.us.4.preheader
	movl	$1, %ebx
	xorl	%r15d, %r15d
	movq	%r12, %r13
	.p2align	4, 0x90
.LBB11_20:                              # %for.body9.us.4
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	BW_btbl_bitcount
	cltq
	addq	%rax, %r15
	addq	$13, %rbx
	addq	$-1, %r13
	jne	.LBB11_20
# %bb.21:                               # %for.cond6.for.end_crit_edge.us.4
	testl	%r14d, %r14d
	je	.LBB11_23
# %bb.22:                               # %if.then15.us.4
	movl	$.L.str.9, %edi
	movl	$.L.str.4, %esi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	printf
.LBB11_23:                              # %for.body9.us.5.preheader
	movl	$1, %ebx
	xorl	%r15d, %r15d
	movq	%r12, %r13
	.p2align	4, 0x90
.LBB11_24:                              # %for.body9.us.5
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	AR_btbl_bitcount
	cltq
	addq	%rax, %r15
	addq	$13, %rbx
	addq	$-1, %r13
	jne	.LBB11_24
# %bb.25:                               # %for.cond6.for.end_crit_edge.us.5
	testl	%r14d, %r14d
	je	.LBB11_27
# %bb.26:                               # %if.then15.us.5
	movl	$.L.str.9, %edi
	movl	$.L.str.5, %esi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	printf
.LBB11_27:                              # %for.body9.us.6.preheader
	movl	$1, %ebx
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB11_28:                              # %for.body9.us.6
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	bit_shifter
	cltq
	addq	%rax, %r15
	addq	$13, %rbx
	addq	$-1, %r12
	jne	.LBB11_28
# %bb.29:                               # %for.cond6.for.end_crit_edge.us.6
	testl	%r14d, %r14d
	je	.LBB11_33
# %bb.30:                               # %if.then15.us.6
	movl	$.L.str.9, %edi
	movl	$.L.str.6, %esi
	movq	%r15, %rdx
.LBB11_32:                              # %for.end22
	xorl	%eax, %eax
	callq	printf
.LBB11_33:                              # %for.end22
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB11_34:                              # %if.then
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rcx
	movl	$.L.str.7, %edi
	movl	$28, %esi
	movl	$1, %edx
	callq	fwrite@PLT
	movl	$1, %edi
	callq	exit
.Lfunc_end11:
	.size	main1, .Lfunc_end11-main1
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function bit_shifter
	.type	bit_shifter,@function
bit_shifter:                            # @bit_shifter
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.LBB12_4
# %bb.1:                                # %for.body.preheader
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB12_2:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, %edx
	movl	%edi, %eax
	andl	$1, %eax
	addl	%edx, %eax
	sarq	%rdi
	je	.LBB12_4
# %bb.3:                                # %for.body
                                        #   in Loop: Header=BB12_2 Depth=1
	leal	1(%rcx), %edx
	cmpl	$63, %ecx
	movl	%edx, %ecx
	jb	.LBB12_2
.LBB12_4:                               # %for.end
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end12:
	.size	bit_shifter, .Lfunc_end12-bit_shifter
	.cfi_endproc
                                        # -- End function
	.globl	bfopen                          # -- Begin function bfopen
	.p2align	4, 0x90
	.type	bfopen,@function
bfopen:                                 # @bfopen
	.cfi_startproc
# %bb.0:                                # %entry
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
	movl	$16, %edi
	callq	malloc
	testq	%rax, %rax
	je	.LBB13_5
# %bb.1:                                # %if.end
	movq	%rax, %rbx
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	fopen
	movq	%rax, (%rbx)
	testq	%rax, %rax
	je	.LBB13_4
# %bb.2:                                # %if.end5
	movb	$0, 9(%rbx)
	movb	$0, 11(%rbx)
	jmp	.LBB13_6
.LBB13_4:                               # %if.then4
	movq	%rbx, %rdi
	callq	free
.LBB13_5:                               # %return
	xorl	%ebx, %ebx
.LBB13_6:                               # %return
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end13:
	.size	bfopen, .Lfunc_end13-bfopen
	.cfi_endproc
                                        # -- End function
	.globl	bfread                          # -- Begin function bfread
	.p2align	4, 0x90
	.type	bfread,@function
bfread:                                 # @bfread
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movb	9(%rdi), %cl
	testb	%cl, %cl
	je	.LBB14_2
# %bb.1:                                # %entry.if.end_crit_edge
	movb	8(%rbx), %al
	addb	$-1, %cl
	jmp	.LBB14_3
.LBB14_2:                               # %if.then
	movq	(%rbx), %rdi
	callq	fgetc
	movb	%al, 8(%rbx)
	movb	$7, %cl
.LBB14_3:                               # %if.end
	movb	%cl, 9(%rbx)
	movsbl	%al, %edx
	movzbl	%cl, %ecx
	xorl	%eax, %eax
	btl	%ecx, %edx
	setb	%al
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end14:
	.size	bfread, .Lfunc_end14-bfread
	.cfi_endproc
                                        # -- End function
	.globl	bfwrite                         # -- Begin function bfwrite
	.p2align	4, 0x90
	.type	bfwrite,@function
bfwrite:                                # @bfwrite
	.cfi_startproc
# %bb.0:                                # %entry
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
	movl	%edi, %ebx
	movb	11(%rsi), %al
	cmpb	$8, %al
	jne	.LBB15_2
# %bb.1:                                # %if.then
	movsbl	10(%r14), %edi
	movq	(%r14), %rsi
	callq	fputc
	xorl	%eax, %eax
.LBB15_2:                               # %if.end
	addb	$1, %al
	movb	%al, 11(%r14)
	movb	10(%r14), %al
	addb	%al, %al
	andb	$1, %bl
	orb	%al, %bl
	movb	%bl, 10(%r14)
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end15:
	.size	bfwrite, .Lfunc_end15-bfwrite
	.cfi_endproc
                                        # -- End function
	.globl	bfclose                         # -- Begin function bfclose
	.p2align	4, 0x90
	.type	bfclose,@function
bfclose:                                # @bfclose
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	callq	fclose
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	free                            # TAILCALL
.Lfunc_end16:
	.size	bfclose, .Lfunc_end16-bfclose
	.cfi_endproc
                                        # -- End function
	.globl	bitstring                       # -- Begin function bitstring
	.p2align	4, 0x90
	.type	bitstring,@function
bitstring:                              # @bitstring
	.cfi_startproc
# %bb.0:                                # %entry
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
	movl	%edx, %r15d
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	%edx, %ebx
	sarl	$2, %ebx
	xorl	%eax, %eax
	testb	$3, %r15b
	sete	%al
	addl	%edx, %ebx
	movl	%ecx, %edx
	subl	%ebx, %edx
	addl	%eax, %edx
	testl	%edx, %edx
	jle	.LBB17_2
# %bb.1:                                # %for.body.preheader
	addl	%ecx, %eax
	notl	%ebx
	addl	%eax, %ebx
	leaq	1(%rbx), %rdx
	movq	%r14, %rdi
	movl	$32, %esi
	callq	memset@PLT
	addq	%rbx, %r14
	addq	$1, %r14
.LBB17_2:                               # %while.cond.preheader
	testl	%r15d, %r15d
	jle	.LBB17_3
# %bb.4:                                # %while.body.preheader
	movl	%r15d, %edx
	testb	$1, %dl
	jne	.LBB17_6
# %bb.5:
	movl	%r15d, %eax
                                        # implicit-def: $rsi
	cmpl	$1, %r15d
	je	.LBB17_19
	jmp	.LBB17_11
.LBB17_3:
	movq	%r14, %rsi
	jmp	.LBB17_19
.LBB17_6:                               # %while.body.prol
	leal	-1(%r15), %eax
	movq	%r12, %rdi
	movl	%eax, %ecx
	shrq	%cl, %rdi
	andb	$1, %dil
	orb	$48, %dil
	leaq	1(%r14), %rsi
	movb	%dil, (%r14)
	testl	%eax, %eax
	je	.LBB17_9
# %bb.7:                                # %while.body.prol
	movl	%eax, %ecx
	andl	$3, %ecx
	jne	.LBB17_9
# %bb.8:                                # %if.then.prol
	movb	$32, 1(%r14)
	addq	$2, %r14
	movq	%r14, %rsi
.LBB17_9:                               # %if.end.prol
	addq	$-1, %rdx
	movq	%rsi, %r14
	cmpl	$1, %r15d
	jne	.LBB17_11
.LBB17_19:                              # %while.end
	movb	$0, (%rsi)
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB17_11:                              # %while.body.preheader1
	.cfi_def_cfa %rbp, 16
	addq	$2, %rdx
	addl	$-2, %eax
	movq	%r14, %rsi
	jmp	.LBB17_12
	.p2align	4, 0x90
.LBB17_18:                              # %if.end.1
                                        #   in Loop: Header=BB17_12 Depth=1
	addq	$-2, %rdx
	addl	$-2, %eax
	cmpq	$2, %rdx
	jle	.LBB17_19
.LBB17_12:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	leal	1(%rax), %ecx
	movq	%r12, %rbx
	shrq	%cl, %rbx
	andb	$1, %bl
	orb	$48, %bl
	leaq	1(%rsi), %rdi
	movb	%bl, (%rsi)
	cmpl	$-1, %eax
	je	.LBB17_15
# %bb.13:                               # %while.body
                                        #   in Loop: Header=BB17_12 Depth=1
	andl	$3, %ecx
	jne	.LBB17_15
# %bb.14:                               # %if.then
                                        #   in Loop: Header=BB17_12 Depth=1
	movb	$32, 1(%rsi)
	addq	$2, %rsi
	movq	%rsi, %rdi
.LBB17_15:                              # %if.end
                                        #   in Loop: Header=BB17_12 Depth=1
	movq	%r12, %rbx
	movl	%eax, %ecx
	shrq	%cl, %rbx
	andb	$1, %bl
	orb	$48, %bl
	leaq	1(%rdi), %rsi
	movb	%bl, (%rdi)
	testl	%eax, %eax
	je	.LBB17_18
# %bb.16:                               # %if.end
                                        #   in Loop: Header=BB17_12 Depth=1
	movl	%eax, %ecx
	andl	$3, %ecx
	jne	.LBB17_18
# %bb.17:                               # %if.then.1
                                        #   in Loop: Header=BB17_12 Depth=1
	movb	$32, 1(%rdi)
	addq	$2, %rdi
	movq	%rdi, %rsi
	jmp	.LBB17_18
.Lfunc_end17:
	.size	bitstring, .Lfunc_end17-bitstring
	.cfi_endproc
                                        # -- End function
	.globl	bstr_i                          # -- Begin function bstr_i
	.p2align	4, 0x90
	.type	bstr_i,@function
bstr_i:                                 # @bstr_i
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.LBB18_6
# %bb.1:                                # %land.lhs.true.preheader
	movb	(%rdi), %cl
	testb	%cl, %cl
	je	.LBB18_6
# %bb.2:                                # %land.rhs.preheader
	addq	$1, %rdi
	xorl	%eax, %eax
	movabsq	$844424930131969, %rdx          # imm = 0x3000000000001
	.p2align	4, 0x90
.LBB18_3:                               # %land.rhs
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, %esi
	shlq	%cl, %rsi
	cmpb	$63, %cl
	ja	.LBB18_6
# %bb.4:                                # %land.rhs
                                        #   in Loop: Header=BB18_3 Depth=1
	andq	%rdx, %rsi
	je	.LBB18_6
# %bb.5:                                # %while.body
                                        #   in Loop: Header=BB18_3 Depth=1
	andb	$1, %cl
	movzbl	%cl, %ecx
	leal	(%rcx,%rax,2), %eax
	movzbl	(%rdi), %ecx
	addq	$1, %rdi
	testb	%cl, %cl
	jne	.LBB18_3
.LBB18_6:                               # %while.end
                                        # kill: def $eax killed $eax killed $rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end18:
	.size	bstr_i, .Lfunc_end18-bstr_i
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
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
	movl	$.L.str.11, %edi
	movl	$.L.str.1.12, %esi
	callq	fopen
	testq	%rax, %rax
	je	.LBB19_1
# %bb.2:                                # %if.end
	movq	%rax, %r12
	xorl	%r15d, %r15d
	leaq	-48(%rbp), %rdx
	movl	$.L.str.3.14, %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	__isoc99_fscanf
	movq	%r12, %rdi
	callq	fclose
	movq	-48(%rbp), %rax
	testq	%rax, %rax
	jle	.LBB19_5
# %bb.3:                                # %for.body.preheader
	xorl	%r15d, %r15d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB19_4:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	addq	$1, %rbx
	xorl	%edx, %edx
	cmpq	%rax, %rbx
	sete	%dl
	movl	%r13d, %edi
	movq	%r14, %rsi
	callq	main1
	movq	-48(%rbp), %rax
	cmpq	%rax, %rbx
	jl	.LBB19_4
.LBB19_5:                               # %return
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
.LBB19_1:                               # %if.then
	.cfi_def_cfa %rbp, 16
	movq	stderr(%rip), %rcx
	movl	$.L.str.2.13, %edi
	movl	$28, %esi
	movl	$1, %edx
	callq	fwrite@PLT
	movl	$1, %r15d
	jmp	.LBB19_5
.Lfunc_end19:
	.size	main, .Lfunc_end19-main
	.cfi_endproc
                                        # -- End function
	.type	bits.1,@object                  # @bits.1
	.section	.rodata,"a",@progbits
	.p2align	4
bits.1:
	.ascii	"\000\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\004\005\005\006\005\006\006\007\005\006\006\007\006\007\007\b"
	.size	bits.1, 256

	.type	.L.str.7,@object                # @.str.7
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.7:
	.asciz	"Usage: bitcnts <iterations>\n"
	.size	.L.str.7, 29

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"Bit counter algorithm benchmark\n"
	.size	.L.str.8, 33

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"%-38s> Bits: %ld\n"
	.size	.L.str.9, 18

	.type	.L.str,@object                  # @.str
.L.str:
	.asciz	"Optimized 1 bit/loop counter"
	.size	.L.str, 29

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Ratko's mystery algorithm"
	.size	.L.str.1, 26

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Recursive bit count by nybbles"
	.size	.L.str.2, 31

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Non-recursive bit count by nybbles"
	.size	.L.str.3, 35

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Non-recursive bit count by bytes (BW)"
	.size	.L.str.4, 38

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Non-recursive bit count by bytes (AR)"
	.size	.L.str.5, 38

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Shift and count bits"
	.size	.L.str.6, 21

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"_finfo_dataset"
	.size	.L.str.11, 15

	.type	.L.str.1.12,@object             # @.str.1.12
.L.str.1.12:
	.asciz	"rt"
	.size	.L.str.1.12, 3

	.type	.L.str.2.13,@object             # @.str.2.13
.L.str.2.13:
	.asciz	"\nError: Can't find dataset!\n"
	.size	.L.str.2.13, 29

	.type	.L.str.3.14,@object             # @.str.3.14
.L.str.3.14:
	.asciz	"%ld"
	.size	.L.str.3.14, 4

	.ident	"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"
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
