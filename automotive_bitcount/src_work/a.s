	.text
	.file	"llvm-link"
	.globl	alloc_bit_array                 # -- Begin function alloc_bit_array
	.p2align	4, 0x90
	.type	alloc_bit_array,@function
alloc_bit_array:                        # @alloc_bit_array
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	addq	$7, %rdi
	shrq	$3, %rdi
	movl	$1, %esi
	callq	calloc
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
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
                                        # kill: def $esi killed $esi def $rsi
	movl	%esi, -12(%rsp)
	leal	7(%rsi), %eax
	testl	%esi, %esi
	cmovnsl	%esi, %eax
	movl	%eax, %ecx
	sarl	$3, %ecx
	movslq	%ecx, %rcx
	leaq	(%rdi,%rcx), %rdx
	movq	%rdx, -8(%rsp)
	movsbl	(%rdi,%rcx), %ecx
	andl	$24, %eax
	subl	%eax, %esi
	xorl	%eax, %eax
	btl	%esi, %ecx
	setb	%al
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
                                        # kill: def $esi killed $esi def $rsi
	movl	%esi, -20(%rsp)
	movl	%edx, -4(%rsp)
	leal	7(%rsi), %eax
	testl	%esi, %esi
	cmovnsl	%esi, %eax
	sarl	$3, %eax
	cltq
	addq	%rdi, %rax
	movq	%rax, -16(%rsp)
	testl	%edx, %edx
	je	.LBB2_2
# %bb.1:                                # %if.then
	movl	-20(%rsp), %eax
	leal	7(%rax), %ecx
	testl	%eax, %eax
	cmovnsl	%eax, %ecx
	andl	$248, %ecx
	subl	%ecx, %eax
	movq	-16(%rsp), %rcx
	movzbl	(%rcx), %edx
	btsl	%eax, %edx
	movb	%dl, (%rcx)
	retq
.LBB2_2:                                # %if.else
	movl	-20(%rsp), %eax
	leal	7(%rax), %ecx
	testl	%eax, %eax
	cmovnsl	%eax, %ecx
	andl	$24, %ecx
	subl	%ecx, %eax
	movq	-16(%rsp), %rcx
	movzbl	(%rcx), %edx
	btrl	%eax, %edx
	movb	%dl, (%rcx)
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
                                        # kill: def $esi killed $esi def $rsi
	movl	%esi, -12(%rsp)
	leal	7(%rsi), %eax
	testl	%esi, %esi
	cmovnsl	%esi, %eax
	movl	%eax, %ecx
	sarl	$3, %ecx
	movslq	%ecx, %rcx
	leaq	(%rdi,%rcx), %rdx
	movq	%rdx, -8(%rsp)
	andl	$248, %eax
	subl	%eax, %esi
	movzbl	(%rdi,%rcx), %eax
	btcl	%esi, %eax
	movb	%al, (%rdi,%rcx)
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
	movq	%rdi, -8(%rsp)
	movl	$0, -12(%rsp)
	testq	%rdi, %rdi
	je	.LBB4_2
	.p2align	4, 0x90
.LBB4_1:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	addl	$1, -12(%rsp)
	movq	-8(%rsp), %rax
	leaq	-1(%rax), %rcx
	andq	%rax, %rcx
	movq	%rcx, -8(%rsp)
	jne	.LBB4_1
.LBB4_2:                                # %if.end
	movl	-12(%rsp), %eax
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
	movl	%edi, %eax
	andl	$1886417008, %eax               # imm = 0x70707070
	shrq	$4, %rax
	andl	$117901063, %edi                # imm = 0x7070707
	addq	%rax, %rdi
	movl	%edi, %eax
	andl	$251662080, %eax                # imm = 0xF000F00
	shrq	$8, %rax
	andl	$983055, %edi                   # imm = 0xF000F
	addq	%rax, %rdi
	movzwl	%di, %eax
	shrq	$16, %rdi
	addq	%rdi, %rax
	movq	%rax, -8(%rsp)
                                        # kill: def $eax killed $eax killed $rax
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
	movq	%rdi, -8(%rsp)
	movl	%edi, %eax
	andl	$15, %eax
	movsbl	bits(%rax), %eax
	movzbl	%dil, %ecx
	shrq	$4, %rcx
	movsbl	bits(%rcx), %ecx
	addl	%eax, %ecx
	movl	%edi, %eax
	shrl	$8, %eax
	andl	$15, %eax
	movsbl	bits(%rax), %eax
	addl	%ecx, %eax
	movzwl	%di, %ecx
	shrq	$12, %rcx
	movsbl	bits(%rcx), %ecx
	addl	%eax, %ecx
	movl	%edi, %eax
	shrl	$16, %eax
	andl	$15, %eax
	movsbl	bits(%rax), %eax
	addl	%ecx, %eax
	movl	%edi, %ecx
	shrl	$20, %ecx
	andl	$15, %ecx
	movsbl	bits(%rcx), %ecx
	addl	%eax, %ecx
	movl	%edi, %eax
	shrl	$24, %edi
	andl	$15, %edi
	movsbl	bits(%rdi), %edx
	addl	%ecx, %edx
	shrq	$28, %rax
	movsbl	bits(%rax), %eax
	addl	%edx, %eax
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
	movq	%rdi, -8(%rsp)
	movq	%rdi, -16(%rsp)
	movzbl	%dil, %eax
	movsbl	bits(%rax), %eax
	movzbl	-15(%rsp), %ecx
	movsbl	bits(%rcx), %ecx
	addl	%eax, %ecx
	movzbl	-13(%rsp), %eax
	movsbl	bits(%rax), %edx
	addl	%ecx, %edx
	movzbl	-14(%rsp), %eax
	movsbl	bits(%rax), %eax
	addl	%edx, %eax
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
	movq	%rdi, -24(%rsp)
	leaq	-24(%rsp), %rax
	movq	%rax, -8(%rsp)
	movzbl	%dil, %eax
	movsbl	bits(%rax), %eax
	movzbl	-23(%rsp), %ecx
	movsbl	bits(%rcx), %ecx
	addl	%eax, %ecx
	movl	%ecx, -12(%rsp)
	leaq	-21(%rsp), %rax
	movq	%rax, -8(%rsp)
	movzbl	-22(%rsp), %eax
	movsbl	bits(%rax), %edx
	addl	%ecx, %edx
	movl	%edx, -12(%rsp)
	movzbl	-21(%rsp), %eax
	movsbl	bits(%rax), %eax
	addl	%edx, %eax
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movl	%edi, %eax
	andl	$15, %eax
	movsbl	bits.1(%rax), %eax
	movl	%eax, 12(%rsp)
	sarq	$4, %rdi
	movq	%rdi, 16(%rsp)
	je	.LBB9_2
# %bb.1:                                # %if.then
	movq	16(%rsp), %rdi
	callq	ntbl_bitcnt
	addl	%eax, 12(%rsp)
.LBB9_2:                                # %if.end
	movl	12(%rsp), %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movzbl	%dil, %eax
	movsbl	bits.1(%rax), %eax
	movl	%eax, 12(%rsp)
	sarq	$8, %rdi
	movq	%rdi, 16(%rsp)
	je	.LBB10_2
# %bb.1:                                # %if.then
	movq	16(%rsp), %rdi
	callq	btbl_bitcnt
	addl	%eax, 12(%rsp)
.LBB10_2:                               # %if.end
	movl	12(%rsp), %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movl	%edi, 52(%rsp)
	movq	%rsi, 40(%rsp)
	movl	%edx, 8(%rsp)
	cmpl	$1, %edi
	jle	.LBB11_12
# %bb.1:                                # %if.end
	movq	40(%rsp), %rax
	movq	8(%rax), %rdi
	callq	atoi
	movl	%eax, 12(%rsp)
	cmpl	$0, 8(%rsp)
	je	.LBB11_3
# %bb.2:                                # %if.then2
	movl	$.L.str.8, %edi
	callq	puts
.LBB11_3:                               # %if.end4
	movl	$0, 4(%rsp)
	jmp	.LBB11_4
	.p2align	4, 0x90
.LBB11_10:                              # %if.end19
                                        #   in Loop: Header=BB11_4 Depth=1
	addl	$1, 4(%rsp)
.LBB11_4:                               # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_7 Depth 2
	cmpl	$6, 4(%rsp)
	jg	.LBB11_11
# %bb.5:                                # %for.body
                                        #   in Loop: Header=BB11_4 Depth=1
	movq	$0, 24(%rsp)
	movq	$0, 32(%rsp)
	movq	$1, 16(%rsp)
	movslq	12(%rsp), %rax
	cmpq	%rax, 32(%rsp)
	jge	.LBB11_8
	.p2align	4, 0x90
.LBB11_7:                               # %for.body9
                                        #   Parent Loop BB11_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	4(%rsp), %rax
	movq	16(%rsp), %rdi
	callq	*main1.pBitCntFunc(,%rax,8)
	cltq
	addq	%rax, 24(%rsp)
	addq	$1, 32(%rsp)
	addq	$13, 16(%rsp)
	movslq	12(%rsp), %rax
	cmpq	%rax, 32(%rsp)
	jl	.LBB11_7
.LBB11_8:                               # %for.end
                                        #   in Loop: Header=BB11_4 Depth=1
	cmpl	$0, 8(%rsp)
	je	.LBB11_10
# %bb.9:                                # %if.then15
                                        #   in Loop: Header=BB11_4 Depth=1
	movslq	4(%rsp), %rax
	movq	main1.text(,%rax,8), %rsi
	movq	24(%rsp), %rdx
	movl	$.L.str.9, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB11_10
.LBB11_11:                              # %for.end22
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB11_12:                              # %if.then
	.cfi_def_cfa_offset 64
	movq	stderr(%rip), %rdi
	movl	$.L.str.7, %esi
	xorl	%eax, %eax
	callq	fprintf
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
	movq	%rdi, -8(%rsp)
	movl	$0, -16(%rsp)
	movl	$0, -12(%rsp)
	cmpq	$0, -8(%rsp)
	je	.LBB12_2
	.p2align	4, 0x90
.LBB12_3:                               # %land.rhs
	movslq	-12(%rsp), %rax
	cmpq	$64, %rax
	setb	%al
	testb	%al, %al
	jne	.LBB12_5
	jmp	.LBB12_6
	.p2align	4, 0x90
.LBB12_2:
	xorl	%eax, %eax
	testb	%al, %al
	je	.LBB12_6
.LBB12_5:                               # %for.body
	movl	-8(%rsp), %eax
	andl	$1, %eax
	addl	%eax, -16(%rsp)
	addl	$1, -12(%rsp)
	sarq	-8(%rsp)
	cmpq	$0, -8(%rsp)
	jne	.LBB12_3
	jmp	.LBB12_2
.LBB12_6:                               # %for.end
	movl	-16(%rsp), %eax
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movl	$16, %edi
	callq	malloc
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.LBB13_3
# %bb.1:                                # %if.end
	movq	32(%rsp), %rdi
	movq	24(%rsp), %rsi
	callq	fopen
	movq	(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB13_4
# %bb.2:                                # %if.end5
	movq	(%rsp), %rax
	movb	$0, 9(%rax)
	movq	(%rsp), %rax
	movb	$0, 11(%rax)
	movq	(%rsp), %rax
	movq	%rax, 16(%rsp)
	movl	$1, 12(%rsp)
	movq	16(%rsp), %rax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB13_4:                               # %if.then4
	.cfi_def_cfa_offset 48
	movq	(%rsp), %rdi
	callq	free
.LBB13_3:                               # %if.then
	movq	$0, 16(%rsp)
	movl	$1, 12(%rsp)
	movq	16(%rsp), %rax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
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
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	cmpb	$0, 9(%rdi)
	jne	.LBB14_2
# %bb.1:                                # %if.then
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	fgetc
	movq	(%rsp), %rcx
	movb	%al, 8(%rcx)
	movq	(%rsp), %rax
	movb	$8, 9(%rax)
.LBB14_2:                               # %if.end
	movq	(%rsp), %rax
	addb	$-1, 9(%rax)
	movq	(%rsp), %rax
	movsbl	8(%rax), %ecx
	movzbl	9(%rax), %edx
	xorl	%eax, %eax
	btl	%edx, %ecx
	setb	%al
	popq	%rcx
	.cfi_def_cfa_offset 8
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, 20(%rsp)
	movq	%rsi, 8(%rsp)
	cmpb	$8, 11(%rsi)
	jne	.LBB15_2
# %bb.1:                                # %if.then
	movq	8(%rsp), %rax
	movsbl	10(%rax), %edi
	movq	(%rax), %rsi
	callq	fputc
	movq	8(%rsp), %rax
	movb	$0, 11(%rax)
.LBB15_2:                               # %if.end
	movq	8(%rsp), %rax
	addb	$1, 11(%rax)
	movq	8(%rsp), %rax
	shlb	10(%rax)
	movl	20(%rsp), %eax
	andl	$1, %eax
	movq	8(%rsp), %rcx
	movzbl	10(%rcx), %edx
	orl	%eax, %edx
	movb	%dl, 10(%rcx)
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
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
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	movq	(%rdi), %rdi
	callq	fclose
	movq	(%rsp), %rdi
	callq	free
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
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
                                        # kill: def $edx killed $edx def $rdx
	movq	%rdi, -32(%rsp)
	movq	%rsi, -16(%rsp)
	movl	%edx, -36(%rsp)
	movl	%ecx, -4(%rsp)
	movl	%edx, %eax
	sarl	$2, %eax
	addl	%edx, %eax
	leal	3(%rdx), %esi
	testl	%edx, %edx
	cmovnsl	%edx, %esi
	andl	$-4, %esi
	xorl	%edi, %edi
	cmpl	%esi, %edx
	sete	%dil
	subl	%eax, %edi
	addl	%ecx, %edi
	movl	%edi, -20(%rsp)
	movl	$0, -24(%rsp)
	movl	-24(%rsp), %eax
	cmpl	-20(%rsp), %eax
	jge	.LBB17_3
	.p2align	4, 0x90
.LBB17_2:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	-32(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -32(%rsp)
	movb	$32, (%rax)
	addl	$1, -24(%rsp)
	movl	-24(%rsp), %eax
	cmpl	-20(%rsp), %eax
	jl	.LBB17_2
	jmp	.LBB17_3
	.p2align	4, 0x90
.LBB17_4:                               # %while.body
                                        #   in Loop: Header=BB17_3 Depth=1
	movq	-16(%rsp), %rax
	movzbl	-36(%rsp), %ecx
	shrq	%cl, %rax
	andb	$1, %al
	orb	$48, %al
	movq	-32(%rsp), %rcx
	leaq	1(%rcx), %rdx
	movq	%rdx, -32(%rsp)
	movb	%al, (%rcx)
	movl	-36(%rsp), %eax
	leal	3(%rax), %ecx
	testl	%eax, %eax
	cmovnsl	%eax, %ecx
	andl	$-4, %ecx
	cmpl	%ecx, %eax
	jne	.LBB17_3
# %bb.5:                                # %land.lhs.true
                                        #   in Loop: Header=BB17_3 Depth=1
	cmpl	$0, -36(%rsp)
	je	.LBB17_3
# %bb.6:                                # %if.then
                                        #   in Loop: Header=BB17_3 Depth=1
	movq	-32(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -32(%rsp)
	movb	$32, (%rax)
.LBB17_3:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	addl	$-1, -36(%rsp)
	jns	.LBB17_4
# %bb.7:                                # %while.end
	movq	-32(%rsp), %rax
	movb	$0, (%rax)
	retq
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movl	$0, 4(%rsp)
	cmpq	$0, 8(%rsp)
	je	.LBB18_4
	.p2align	4, 0x90
.LBB18_1:                               # %land.lhs.true
	movq	8(%rsp), %rax
	cmpb	$0, (%rax)
	je	.LBB18_4
# %bb.2:                                # %land.rhs
	movq	8(%rsp), %rax
	movsbl	(%rax), %esi
	movl	$.L.str.10, %edi
	callq	strchr
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	jne	.LBB18_5
	jmp	.LBB18_6
	.p2align	4, 0x90
.LBB18_4:
	xorl	%eax, %eax
	testb	%al, %al
	je	.LBB18_6
.LBB18_5:                               # %while.body
	movq	8(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 8(%rsp)
	movsbl	(%rax), %eax
	addl	$-48, %eax
	movl	%eax, 20(%rsp)
	movl	4(%rsp), %ecx
	andl	$1, %eax
	leal	(%rax,%rcx,2), %eax
	movl	%eax, 4(%rsp)
	cmpq	$0, 8(%rsp)
	jne	.LBB18_1
	jmp	.LBB18_4
.LBB18_6:                               # %while.end
	movl	4(%rsp), %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movl	$0, 12(%rsp)
	movl	%edi, 36(%rsp)
	movq	%rsi, 48(%rsp)
	movq	$0, 24(%rsp)
	movl	$.L.str.11, %edi
	movl	$.L.str.1.12, %esi
	callq	fopen
	movq	%rax, 24(%rsp)
	testq	%rax, %rax
	je	.LBB19_1
# %bb.2:                                # %if.end
	movq	24(%rsp), %rdi
	leaq	40(%rsp), %rdx
	movl	$.L.str.3.14, %esi
	xorl	%eax, %eax
	callq	__isoc99_fscanf
	movq	24(%rsp), %rdi
	callq	fclose
	movq	$0, 16(%rsp)
	movq	16(%rsp), %rax
	cmpq	40(%rsp), %rax
	jge	.LBB19_5
	.p2align	4, 0x90
.LBB19_4:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	36(%rsp), %edi
	movq	48(%rsp), %rsi
	movq	16(%rsp), %rax
	addq	$1, %rax
	xorl	%edx, %edx
	cmpq	40(%rsp), %rax
	sete	%dl
	callq	main1
	addq	$1, 16(%rsp)
	movq	16(%rsp), %rax
	cmpq	40(%rsp), %rax
	jl	.LBB19_4
.LBB19_5:                               # %for.end
	movl	$0, 12(%rsp)
	movl	$1, 32(%rsp)
	movl	12(%rsp), %eax
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB19_1:                               # %if.then
	.cfi_def_cfa_offset 64
	movq	stderr(%rip), %rdi
	movl	$.L.str.2.13, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	$1, 12(%rsp)
	movl	$1, 32(%rsp)
	movl	12(%rsp), %eax
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end19:
	.size	main, .Lfunc_end19-main
	.cfi_endproc
                                        # -- End function
	.type	bits,@object                    # @bits
	.data
	.p2align	4
bits:
	.ascii	"\000\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\004\005\005\006\005\006\006\007\005\006\006\007\006\007\007\b"
	.size	bits, 256

	.type	bits.1,@object                  # @bits.1
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

	.type	main1.pBitCntFunc,@object       # @main1.pBitCntFunc
	.data
	.p2align	4
main1.pBitCntFunc:
	.quad	bit_count
	.quad	bitcount
	.quad	ntbl_bitcnt
	.quad	ntbl_bitcount
	.quad	BW_btbl_bitcount
	.quad	AR_btbl_bitcount
	.quad	bit_shifter
	.size	main1.pBitCntFunc, 56

	.type	main1.text,@object              # @main1.text
	.p2align	4
main1.text:
	.quad	.L.str
	.quad	.L.str.1
	.quad	.L.str.2
	.quad	.L.str.3
	.quad	.L.str.4
	.quad	.L.str.5
	.quad	.L.str.6
	.size	main1.text, 56

	.type	.L.str.9,@object                # @.str.9
	.section	.rodata.str1.1,"aMS",@progbits,1
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

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"01"
	.size	.L.str.10, 3

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
