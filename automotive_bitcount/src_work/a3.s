	.text
	.file	"llvm-link"
	.globl	alloc_bit_array                 // -- Begin function alloc_bit_array
	.p2align	2
	.type	alloc_bit_array,@function
alloc_bit_array:                        // @alloc_bit_array
	.cfi_startproc
// %bb.0:                               // %entry
	add	x8, x0, #7                      // =7
	lsr	x0, x8, #3
	mov	w1, #1
	b	calloc
.Lfunc_end0:
	.size	alloc_bit_array, .Lfunc_end0-alloc_bit_array
	.cfi_endproc
                                        // -- End function
	.globl	getbit                          // -- Begin function getbit
	.p2align	2
	.type	getbit,@function
getbit:                                 // @getbit
	.cfi_startproc
// %bb.0:                               // %entry
	add	w8, w1, #7                      // =7
	cmp	w1, #0                          // =0
	csel	w8, w8, w1, lt
	asr	w8, w8, #3
	ldrb	w8, [x0, w8, sxtw]
	and	w9, w1, #0x7
	lsr	w8, w8, w9
	and	w0, w8, #0x1
	ret
.Lfunc_end1:
	.size	getbit, .Lfunc_end1-getbit
	.cfi_endproc
                                        // -- End function
	.globl	setbit                          // -- Begin function setbit
	.p2align	2
	.type	setbit,@function
setbit:                                 // @setbit
	.cfi_startproc
// %bb.0:                               // %entry
	add	w8, w1, #7                      // =7
	cmp	w1, #0                          // =0
	csel	w8, w8, w1, lt
	sbfx	x8, x8, #3, #29
	ldrb	w9, [x0, x8]
	and	w10, w1, #0x7
	mov	w11, #1
	lsl	w10, w11, w10
	bic	w11, w9, w10
	orr	w9, w9, w10
	cmp	w2, #0                          // =0
	csel	w9, w11, w9, eq
	strb	w9, [x0, x8]
	ret
.Lfunc_end2:
	.size	setbit, .Lfunc_end2-setbit
	.cfi_endproc
                                        // -- End function
	.globl	flipbit                         // -- Begin function flipbit
	.p2align	2
	.type	flipbit,@function
flipbit:                                // @flipbit
	.cfi_startproc
// %bb.0:                               // %entry
	add	w8, w1, #7                      // =7
	cmp	w1, #0                          // =0
	csel	w8, w8, w1, lt
	sbfx	x8, x8, #3, #29
	ldrb	w9, [x0, x8]
	and	w10, w1, #0x7
	mov	w11, #1
	lsl	w10, w11, w10
	eor	w9, w9, w10
	strb	w9, [x0, x8]
	ret
.Lfunc_end3:
	.size	flipbit, .Lfunc_end3-flipbit
	.cfi_endproc
                                        // -- End function
	.globl	bit_count                       // -- Begin function bit_count
	.p2align	2
	.type	bit_count,@function
bit_count:                              // @bit_count
	.cfi_startproc
// %bb.0:                               // %entry
	fmov	d0, x0
	cnt	v0.8b, v0.8b
	uaddlv	h0, v0.8b
	fmov	w0, s0
	ret
.Lfunc_end4:
	.size	bit_count, .Lfunc_end4-bit_count
	.cfi_endproc
                                        // -- End function
	.globl	bitcount                        // -- Begin function bitcount
	.p2align	2
	.type	bitcount,@function
bitcount:                               // @bitcount
	.cfi_startproc
// %bb.0:                               // %entry
	mov	w8, #1431655765
	and	x9, x8, x0, lsr #1
	and	x8, x0, x8
	add	x8, x9, x8
	lsr	x9, x8, #2
	and	x8, x8, #0x3333333333333333
	and	x9, x9, #0x3333333333333333
	add	x8, x9, x8
	lsr	x9, x8, #4
	and	x8, x8, #0xf0f0f0f0f0f0f0f
	and	x9, x9, #0xf0f0f0f0f0f0f0f
	add	x8, x9, x8
	lsr	x9, x8, #8
	and	x8, x8, #0xff00ff00ff00ff
	and	x9, x9, #0xffffffffffff00ff
	add	x8, x9, x8
	lsr	x9, x8, #16
	and	w8, w8, #0x1f
	add	w0, w9, w8
	ret
.Lfunc_end5:
	.size	bitcount, .Lfunc_end5-bitcount
	.cfi_endproc
                                        // -- End function
	.globl	ntbl_bitcount                   // -- Begin function ntbl_bitcount
	.p2align	2
	.type	ntbl_bitcount,@function
ntbl_bitcount:                          // @ntbl_bitcount
	.cfi_startproc
// %bb.0:                               // %entry
	adrp	x9, bits.1
	and	x8, x0, #0xf
	add	x9, x9, :lo12:bits.1
	ubfx	x10, x0, #4, #4
	ubfx	x11, x0, #8, #4
	ldrb	w8, [x9, x8]
	ldrb	w10, [x9, x10]
	ubfx	x12, x0, #12, #4
	ldrb	w11, [x9, x11]
	ldrb	w12, [x9, x12]
	add	w8, w10, w8
	ubfx	x10, x0, #16, #4
	add	w8, w8, w11
	ubfx	x11, x0, #20, #4
	ldrb	w10, [x9, x10]
	add	w8, w8, w12
	ubfx	x12, x0, #24, #4
	ldrb	w11, [x9, x11]
	ubfx	x13, x0, #28, #4
	ldrb	w12, [x9, x12]
	ldrb	w9, [x9, x13]
	add	w8, w8, w10
	add	w8, w8, w11
	add	w8, w8, w12
	add	w0, w8, w9
	ret
.Lfunc_end6:
	.size	ntbl_bitcount, .Lfunc_end6-ntbl_bitcount
	.cfi_endproc
                                        // -- End function
	.globl	BW_btbl_bitcount                // -- Begin function BW_btbl_bitcount
	.p2align	2
	.type	BW_btbl_bitcount,@function
BW_btbl_bitcount:                       // @BW_btbl_bitcount
	.cfi_startproc
// %bb.0:                               // %entry
	adrp	x9, bits.1
	and	x8, x0, #0xff
	add	x9, x9, :lo12:bits.1
	ubfx	x10, x0, #8, #8
	ubfx	x11, x0, #24, #8
	ldrb	w8, [x9, x8]
	ldrb	w10, [x9, x10]
	ldrb	w11, [x9, x11]
	ubfx	x12, x0, #16, #8
	ldrb	w9, [x9, x12]
	add	w8, w10, w8
	add	w8, w8, w11
	add	w0, w8, w9
	ret
.Lfunc_end7:
	.size	BW_btbl_bitcount, .Lfunc_end7-BW_btbl_bitcount
	.cfi_endproc
                                        // -- End function
	.globl	AR_btbl_bitcount                // -- Begin function AR_btbl_bitcount
	.p2align	2
	.type	AR_btbl_bitcount,@function
AR_btbl_bitcount:                       // @AR_btbl_bitcount
	.cfi_startproc
// %bb.0:                               // %entry
	adrp	x9, bits.1
	and	x8, x0, #0xff
	add	x9, x9, :lo12:bits.1
	ubfx	x10, x0, #8, #8
	ubfx	x11, x0, #16, #8
	ldrb	w8, [x9, x8]
	ldrb	w10, [x9, x10]
	ldrb	w11, [x9, x11]
	ubfx	x12, x0, #24, #8
	ldrb	w9, [x9, x12]
	add	w8, w10, w8
	add	w8, w8, w11
	add	w0, w8, w9
	ret
.Lfunc_end8:
	.size	AR_btbl_bitcount, .Lfunc_end8-AR_btbl_bitcount
	.cfi_endproc
                                        // -- End function
	.globl	ntbl_bitcnt                     // -- Begin function ntbl_bitcnt
	.p2align	2
	.type	ntbl_bitcnt,@function
ntbl_bitcnt:                            // @ntbl_bitcnt
	.cfi_startproc
// %bb.0:                               // %entry
	adrp	x9, bits.1
	mov	x8, x0
	mov	w0, wzr
	add	x9, x9, :lo12:bits.1
.LBB9_1:                                // %tailrecurse
                                        // =>This Inner Loop Header: Depth=1
	and	x10, x8, #0xf
	ldrb	w10, [x9, x10]
	asr	x8, x8, #4
	add	w0, w0, w10
	cbnz	x8, .LBB9_1
// %bb.2:                               // %if.end
	ret
.Lfunc_end9:
	.size	ntbl_bitcnt, .Lfunc_end9-ntbl_bitcnt
	.cfi_endproc
                                        // -- End function
	.globl	btbl_bitcnt                     // -- Begin function btbl_bitcnt
	.p2align	2
	.type	btbl_bitcnt,@function
btbl_bitcnt:                            // @btbl_bitcnt
	.cfi_startproc
// %bb.0:                               // %entry
	adrp	x9, bits.1
	mov	x8, x0
	mov	w0, wzr
	add	x9, x9, :lo12:bits.1
.LBB10_1:                               // %tailrecurse
                                        // =>This Inner Loop Header: Depth=1
	and	x10, x8, #0xff
	ldrb	w10, [x9, x10]
	asr	x8, x8, #8
	add	w0, w0, w10
	cbnz	x8, .LBB10_1
// %bb.2:                               // %if.end
	ret
.Lfunc_end10:
	.size	btbl_bitcnt, .Lfunc_end10-btbl_bitcnt
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               // -- Begin function main1
.LCPI11_0:
	.xword	1                               // 0x1
	.xword	14                              // 0xe
	.text
	.globl	main1
	.p2align	2
	.type	main1,@function
main1:                                  // @main1
	.cfi_startproc
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-48]!           // 16-byte Folded Spill
	str	x21, [sp, #16]                  // 8-byte Folded Spill
	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 48
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -32
	.cfi_offset w30, -40
	.cfi_offset w29, -48
	cmp	w0, #1                          // =1
	b.le	.LBB11_50
// %bb.1:                               // %if.end
	ldr	x0, [x1, #8]
	mov	w19, w2
	mov	w2, #10
	mov	x1, xzr
	bl	strtol
	mov	x20, x0
	cbz	w19, .LBB11_4
// %bb.2:                               // %if.end4.thread
	adrp	x0, .L.str.8
	add	x0, x0, :lo12:.L.str.8
	bl	puts
	cmp	w20, #1                         // =1
	b.ge	.LBB11_5
// %bb.3:                               // %for.cond6.preheader.preheader
	adrp	x19, .L.str.9
	add	x19, x19, :lo12:.L.str.9
	adrp	x1, .L.str
	add	x1, x1, :lo12:.L.str
	mov	x0, x19
	mov	x2, xzr
	bl	printf
	adrp	x1, .L.str.1
	add	x1, x1, :lo12:.L.str.1
	mov	x0, x19
	mov	x2, xzr
	bl	printf
	adrp	x1, .L.str.2
	add	x1, x1, :lo12:.L.str.2
	mov	x0, x19
	mov	x2, xzr
	bl	printf
	adrp	x1, .L.str.3
	add	x1, x1, :lo12:.L.str.3
	mov	x0, x19
	mov	x2, xzr
	bl	printf
	adrp	x1, .L.str.4
	add	x1, x1, :lo12:.L.str.4
	mov	x0, x19
	mov	x2, xzr
	bl	printf
	adrp	x1, .L.str.5
	add	x1, x1, :lo12:.L.str.5
	mov	x0, x19
	mov	x2, xzr
	bl	printf
	adrp	x1, .L.str.6
	add	x1, x1, :lo12:.L.str.6
	mov	x0, x19
	mov	x2, xzr
	b	.LBB11_48
.LBB11_4:                               // %if.end4
	cmp	w20, #0                         // =0
	b.le	.LBB11_49
.LBB11_5:                               // %for.cond6.preheader.us.preheader
	sxtw	x8, w20
	cmp	x8, #1                          // =1
	csinc	x20, x8, xzr, gt
	cmp	x20, #4                         // =4
	adrp	x21, .LCPI11_0
	b.hs	.LBB11_7
// %bb.6:
	mov	x2, xzr
	mov	x9, xzr
	mov	w8, #1
	b	.LBB11_10
.LBB11_7:                               // %vector.ph
	ldr	q1, [x21, :lo12:.LCPI11_0]
	and	x9, x20, #0x7ffffffffffffffc
	mov	w8, #13
	mov	w10, #26
	mov	w11, #52
	mul	x8, x9, x8
	movi	v0.2d, #0000000000000000
	dup	v2.2d, x10
	orr	x8, x8, #0x1
	dup	v3.2d, x11
	mov	x10, x9
	movi	v4.2d, #0000000000000000
.LBB11_8:                               // %vector.body
                                        // =>This Inner Loop Header: Depth=1
	add	v5.2d, v1.2d, v2.2d
	cnt	v6.16b, v1.16b
	cnt	v5.16b, v5.16b
	uaddlp	v6.8h, v6.16b
	uaddlp	v5.8h, v5.16b
	uaddlp	v6.4s, v6.8h
	uaddlp	v5.4s, v5.8h
	subs	x10, x10, #4                    // =4
	uadalp	v0.2d, v6.4s
	uadalp	v4.2d, v5.4s
	add	v1.2d, v1.2d, v3.2d
	b.ne	.LBB11_8
// %bb.9:                               // %middle.block
	add	v0.2d, v4.2d, v0.2d
	addp	d0, v0.2d
	cmp	x20, x9
	fmov	x2, d0
	b.eq	.LBB11_12
.LBB11_10:                              // %for.body9.us.preheader
	sub	x9, x20, x9
.LBB11_11:                              // %for.body9.us
                                        // =>This Inner Loop Header: Depth=1
	fmov	d0, x8
	cnt	v0.8b, v0.8b
	uaddlv	h0, v0.8b
	fmov	w10, s0
	subs	x9, x9, #1                      // =1
	add	x2, x2, x10
	add	x8, x8, #13                     // =13
	b.ne	.LBB11_11
.LBB11_12:                              // %for.cond6.for.end_crit_edge.us
	cbz	w19, .LBB11_14
// %bb.13:                              // %if.then15.us
	adrp	x0, .L.str.9
	adrp	x1, .L.str
	add	x0, x0, :lo12:.L.str.9
	add	x1, x1, :lo12:.L.str
	bl	printf
.LBB11_14:                              // %for.inc20.us
	cmp	x20, #4                         // =4
	b.hs	.LBB11_16
// %bb.15:
	mov	x2, xzr
	mov	x9, xzr
	mov	w8, #1
	b	.LBB11_19
.LBB11_16:                              // %vector.ph86
	mov	w10, #26
	dup	v2.2d, x10
	mov	w10, #1431655765
	dup	v3.2d, x10
	mov	w10, #858993459
	dup	v4.2d, x10
	mov	w10, #117901063
	ldr	q0, [x21, :lo12:.LCPI11_0]
	dup	v5.2d, x10
	mov	w10, #983055
	and	x9, x20, #0x7ffffffffffffffc
	mov	w8, #13
	dup	v6.2d, x10
	mov	w10, #31
	dup	v7.2d, x10
	mov	w10, #52
	mul	x8, x9, x8
	movi	v1.2d, #0000000000000000
	orr	x8, x8, #0x1
	dup	v16.2d, x10
	mov	x10, x9
	movi	v17.2d, #0000000000000000
.LBB11_17:                              // %vector.body84
                                        // =>This Inner Loop Header: Depth=1
	add	v18.2d, v0.2d, v2.2d
	ushr	v19.2d, v0.2d, #1
	ushr	v21.2d, v18.2d, #1
	and	v20.16b, v0.16b, v3.16b
	and	v19.16b, v19.16b, v3.16b
	and	v18.16b, v18.16b, v3.16b
	and	v21.16b, v21.16b, v3.16b
	add	v19.2d, v19.2d, v20.2d
	add	v18.2d, v21.2d, v18.2d
	ushr	v20.2d, v19.2d, #2
	ushr	v21.2d, v18.2d, #2
	and	v19.16b, v19.16b, v4.16b
	and	v20.16b, v20.16b, v4.16b
	and	v18.16b, v18.16b, v4.16b
	and	v21.16b, v21.16b, v4.16b
	add	v19.2d, v20.2d, v19.2d
	add	v18.2d, v21.2d, v18.2d
	ushr	v20.2d, v19.2d, #4
	ushr	v21.2d, v18.2d, #4
	and	v19.16b, v19.16b, v5.16b
	and	v20.16b, v20.16b, v5.16b
	and	v18.16b, v18.16b, v5.16b
	and	v21.16b, v21.16b, v5.16b
	add	v19.2d, v20.2d, v19.2d
	add	v18.2d, v21.2d, v18.2d
	ushr	v20.2d, v19.2d, #8
	ushr	v21.2d, v18.2d, #8
	and	v19.16b, v19.16b, v6.16b
	and	v20.16b, v20.16b, v6.16b
	and	v18.16b, v18.16b, v6.16b
	and	v21.16b, v21.16b, v6.16b
	add	v19.2d, v20.2d, v19.2d
	add	v18.2d, v21.2d, v18.2d
	and	v20.16b, v19.16b, v7.16b
	and	v21.16b, v18.16b, v7.16b
	add	v1.2d, v20.2d, v1.2d
	add	v17.2d, v21.2d, v17.2d
	subs	x10, x10, #4                    // =4
	usra	v1.2d, v19.2d, #16
	usra	v17.2d, v18.2d, #16
	add	v0.2d, v0.2d, v16.2d
	b.ne	.LBB11_17
// %bb.18:                              // %middle.block82
	add	v0.2d, v17.2d, v1.2d
	addp	d0, v0.2d
	cmp	x20, x9
	fmov	x2, d0
	b.eq	.LBB11_21
.LBB11_19:                              // %for.body9.us.1.preheader
	mov	w10, #1431655765
	mov	w11, #858993459
	mov	w12, #117901063
	mov	w13, #983055
	sub	x9, x20, x9
.LBB11_20:                              // %for.body9.us.1
                                        // =>This Inner Loop Header: Depth=1
	and	x14, x10, x8, lsr #1
	and	x15, x8, x10
	add	x14, x14, x15
	and	x15, x11, x14, lsr #2
	and	x14, x14, x11
	add	x14, x15, x14
	and	x15, x12, x14, lsr #4
	and	x14, x14, x12
	add	x14, x15, x14
	and	x15, x13, x14, lsr #8
	and	x14, x14, x13
	add	x14, x15, x14
	and	x15, x14, #0x1f
	add	x15, x15, x2
	subs	x9, x9, #1                      // =1
	add	x2, x15, x14, lsr #16
	add	x8, x8, #13                     // =13
	b.ne	.LBB11_20
.LBB11_21:                              // %for.cond6.for.end_crit_edge.us.1
	cbz	w19, .LBB11_23
// %bb.22:                              // %if.then15.us.1
	adrp	x0, .L.str.9
	adrp	x1, .L.str.1
	add	x0, x0, :lo12:.L.str.9
	add	x1, x1, :lo12:.L.str.1
	bl	printf
.LBB11_23:                              // %for.body9.us.2.preheader
	adrp	x21, bits.1
	mov	x2, xzr
	mov	x8, xzr
	mov	w9, #1
	add	x21, x21, :lo12:bits.1
.LBB11_24:                              // %for.body9.us.2
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB11_25 Depth 2
	mov	w10, wzr
	mov	x11, x9
.LBB11_25:                              // %tailrecurse.i
                                        //   Parent Loop BB11_24 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	and	x12, x11, #0xf
	ldrb	w12, [x21, x12]
	asr	x11, x11, #4
	add	x10, x12, w10, uxtw
	cbnz	x11, .LBB11_25
// %bb.26:                              // %ntbl_bitcnt.exit
                                        //   in Loop: Header=BB11_24 Depth=1
	add	x8, x8, #1                      // =1
	add	x2, x2, x10
	cmp	x8, x20
	add	x9, x9, #13                     // =13
	b.ne	.LBB11_24
// %bb.27:                              // %for.cond6.for.end_crit_edge.us.2
	cbz	w19, .LBB11_29
// %bb.28:                              // %if.then15.us.2
	adrp	x0, .L.str.9
	adrp	x1, .L.str.2
	add	x0, x0, :lo12:.L.str.9
	add	x1, x1, :lo12:.L.str.2
	bl	printf
.LBB11_29:                              // %for.body9.us.3.preheader
	mov	w9, #13
	mov	x8, xzr
	mov	x2, xzr
	mul	x9, x20, x9
.LBB11_30:                              // %for.body9.us.3
                                        // =>This Inner Loop Header: Depth=1
	add	x10, x8, #1                     // =1
	and	x11, x10, #0xf
	ubfx	x12, x10, #4, #4
	ldrb	w11, [x21, x11]
	ldrb	w12, [x21, x12]
	ubfx	x13, x10, #8, #4
	ubfx	x14, x10, #12, #4
	ldrb	w13, [x21, x13]
	ldrb	w14, [x21, x14]
	add	x11, x12, x11
	ubfx	x12, x10, #16, #4
	ldrb	w12, [x21, x12]
	add	x11, x11, x13
	add	x11, x11, x14
	ubfx	x13, x10, #20, #4
	add	x11, x11, x12
	ubfx	x12, x10, #24, #4
	ldrb	w13, [x21, x13]
	ubfx	x10, x10, #28, #4
	ldrb	w12, [x21, x12]
	ldrb	w10, [x21, x10]
	add	x11, x11, x13
	add	x8, x8, #13                     // =13
	add	x11, x11, x12
	add	x10, x11, x10
	cmp	x9, x8
	add	x2, x10, x2
	b.ne	.LBB11_30
// %bb.31:                              // %for.cond6.for.end_crit_edge.us.3
	cbz	w19, .LBB11_33
// %bb.32:                              // %if.then15.us.3
	adrp	x0, .L.str.9
	adrp	x1, .L.str.3
	add	x0, x0, :lo12:.L.str.9
	add	x1, x1, :lo12:.L.str.3
	bl	printf
.LBB11_33:                              // %for.body9.us.4.preheader
	mov	w9, #13
	mov	x8, xzr
	mov	x2, xzr
	mul	x9, x20, x9
.LBB11_34:                              // %for.body9.us.4
                                        // =>This Inner Loop Header: Depth=1
	add	x10, x8, #1                     // =1
	and	x11, x10, #0xff
	ubfx	x12, x10, #8, #8
	ldrb	w11, [x21, x11]
	ubfx	x13, x10, #24, #8
	ldrb	w12, [x21, x12]
	ubfx	x10, x10, #16, #8
	ldrb	w13, [x21, x13]
	ldrb	w10, [x21, x10]
	add	x11, x2, x11
	add	x11, x11, x12
	add	x8, x8, #13                     // =13
	add	x11, x11, x13
	cmp	x9, x8
	add	x2, x11, x10
	b.ne	.LBB11_34
// %bb.35:                              // %for.cond6.for.end_crit_edge.us.4
	cbz	w19, .LBB11_37
// %bb.36:                              // %if.then15.us.4
	adrp	x0, .L.str.9
	adrp	x1, .L.str.4
	add	x0, x0, :lo12:.L.str.9
	add	x1, x1, :lo12:.L.str.4
	bl	printf
.LBB11_37:                              // %for.body9.us.5.preheader
	mov	w9, #13
	mov	x8, xzr
	mov	x2, xzr
	mul	x9, x20, x9
.LBB11_38:                              // %for.body9.us.5
                                        // =>This Inner Loop Header: Depth=1
	add	x10, x8, #1                     // =1
	and	x11, x10, #0xff
	ubfx	x12, x10, #8, #8
	ldrb	w11, [x21, x11]
	ubfx	x13, x10, #16, #8
	ldrb	w12, [x21, x12]
	ubfx	x10, x10, #24, #8
	ldrb	w13, [x21, x13]
	ldrb	w10, [x21, x10]
	add	x11, x2, x11
	add	x11, x11, x12
	add	x8, x8, #13                     // =13
	add	x11, x11, x13
	cmp	x9, x8
	add	x2, x11, x10
	b.ne	.LBB11_38
// %bb.39:                              // %for.cond6.for.end_crit_edge.us.5
	cbz	w19, .LBB11_41
// %bb.40:                              // %if.then15.us.5
	adrp	x0, .L.str.9
	adrp	x1, .L.str.5
	add	x0, x0, :lo12:.L.str.9
	add	x1, x1, :lo12:.L.str.5
	bl	printf
.LBB11_41:                              // %for.body9.us.6.preheader
	mov	x2, xzr
	mov	x8, xzr
	mov	w9, #1
	b	.LBB11_43
.LBB11_42:                              // %bit_shifter.exit
                                        //   in Loop: Header=BB11_43 Depth=1
	add	x8, x8, #1                      // =1
	add	x2, x2, w10, uxtw
	cmp	x8, x20
	add	x9, x9, #13                     // =13
	b.eq	.LBB11_46
.LBB11_43:                              // %for.body9.us.6
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB11_44 Depth 2
	mov	w10, wzr
	mov	w12, wzr
	mov	x11, x9
.LBB11_44:                              // %for.body.i
                                        //   Parent Loop BB11_43 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	and	w13, w11, #0x1
	asr	x11, x11, #1
	add	w10, w10, w13
	cbz	x11, .LBB11_42
// %bb.45:                              // %for.body.i
                                        //   in Loop: Header=BB11_44 Depth=2
	cmp	w12, #63                        // =63
	add	w12, w12, #1                    // =1
	b.lo	.LBB11_44
	b	.LBB11_42
.LBB11_46:                              // %for.cond6.for.end_crit_edge.us.6
	cbz	w19, .LBB11_49
// %bb.47:                              // %if.then15.us.6
	adrp	x0, .L.str.9
	adrp	x1, .L.str.6
	add	x0, x0, :lo12:.L.str.9
	add	x1, x1, :lo12:.L.str.6
.LBB11_48:                              // %for.end22
	bl	printf
.LBB11_49:                              // %for.end22
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	ldr	x21, [sp, #16]                  // 8-byte Folded Reload
	mov	w0, wzr
	ldp	x29, x30, [sp], #48             // 16-byte Folded Reload
	ret
.LBB11_50:                              // %if.then
	adrp	x8, stderr
	ldr	x3, [x8, :lo12:stderr]
	adrp	x0, .L.str.7
	add	x0, x0, :lo12:.L.str.7
	mov	w1, #28
	mov	w2, #1
	bl	fwrite
	mov	w0, #1
	bl	exit
.Lfunc_end11:
	.size	main1, .Lfunc_end11-main1
	.cfi_endproc
                                        // -- End function
	.globl	bfopen                          // -- Begin function bfopen
	.p2align	2
	.type	bfopen,@function
bfopen:                                 // @bfopen
	.cfi_startproc
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-48]!           // 16-byte Folded Spill
	str	x21, [sp, #16]                  // 8-byte Folded Spill
	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 48
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -32
	.cfi_offset w30, -40
	.cfi_offset w29, -48
	mov	x21, x0
	mov	w0, #16
	mov	x20, x1
	bl	malloc
	mov	x19, x0
	cbz	x0, .LBB12_4
// %bb.1:                               // %if.end
	mov	x0, x21
	mov	x1, x20
	bl	fopen
	str	x0, [x19]
	cbz	x0, .LBB12_3
// %bb.2:                               // %if.end5
	strb	wzr, [x19, #9]
	strb	wzr, [x19, #11]
	b	.LBB12_4
.LBB12_3:                               // %if.then4
	mov	x0, x19
	bl	free
	mov	x19, xzr
.LBB12_4:                               // %cleanup
	mov	x0, x19
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	ldr	x21, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48             // 16-byte Folded Reload
	ret
.Lfunc_end12:
	.size	bfopen, .Lfunc_end12-bfopen
	.cfi_endproc
                                        // -- End function
	.globl	bfread                          // -- Begin function bfread
	.p2align	2
	.type	bfread,@function
bfread:                                 // @bfread
	.cfi_startproc
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	str	x19, [sp, #16]                  // 8-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	ldrb	w8, [x0, #9]
	mov	x19, x0
	cbz	w8, .LBB13_2
// %bb.1:                               // %entry.if.end_crit_edge
	ldrb	w0, [x19, #8]
	sub	w8, w8, #1                      // =1
	b	.LBB13_3
.LBB13_2:                               // %if.then
	ldr	x0, [x19]
	bl	fgetc
	mov	w8, #7
	strb	w0, [x19, #8]
.LBB13_3:                               // %if.end
	strb	w8, [x19, #9]
	ldr	x19, [sp, #16]                  // 8-byte Folded Reload
	and	w9, w0, #0xff
	lsr	w9, w9, w8
	and	w0, w9, #0x1
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	ret
.Lfunc_end13:
	.size	bfread, .Lfunc_end13-bfread
	.cfi_endproc
                                        // -- End function
	.globl	bfwrite                         // -- Begin function bfwrite
	.p2align	2
	.type	bfwrite,@function
bfwrite:                                // @bfwrite
	.cfi_startproc
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	ldrb	w8, [x1, #11]
	mov	x19, x1
	mov	w20, w0
	cmp	w8, #8                          // =8
	b.ne	.LBB14_2
// %bb.1:                               // %if.then
	ldrb	w0, [x19, #10]
	ldr	x1, [x19]
	bl	fputc
	mov	w8, wzr
.LBB14_2:                               // %if.end
	ldrb	w9, [x19, #10]
	add	w8, w8, #1                      // =1
	strb	w8, [x19, #11]
	bfi	w20, w9, #1, #31
	strb	w20, [x19, #10]
	ldp	x20, x19, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	ret
.Lfunc_end14:
	.size	bfwrite, .Lfunc_end14-bfwrite
	.cfi_endproc
                                        // -- End function
	.globl	bfclose                         // -- Begin function bfclose
	.p2align	2
	.type	bfclose,@function
bfclose:                                // @bfclose
	.cfi_startproc
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-32]!           // 16-byte Folded Spill
	str	x19, [sp, #16]                  // 8-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 32
	.cfi_offset w19, -16
	.cfi_offset w30, -24
	.cfi_offset w29, -32
	mov	x19, x0
	ldr	x0, [x0]
	bl	fclose
	mov	x0, x19
	ldr	x19, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32             // 16-byte Folded Reload
	b	free
.Lfunc_end15:
	.size	bfclose, .Lfunc_end15-bfclose
	.cfi_endproc
                                        // -- End function
	.globl	bitstring                       // -- Begin function bitstring
	.p2align	2
	.type	bitstring,@function
bitstring:                              // @bitstring
	.cfi_startproc
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-48]!           // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 48
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w30, -40
	.cfi_offset w29, -48
	add	w8, w2, w2, asr #2
	tst	w2, #0x3
	sub	w10, w3, w8
	cinc	w10, w10, eq
	mov	w21, w2
	mov	x19, x1
	cset	w9, eq
	cmp	w10, #1                         // =1
	mov	x20, x0
	b.lt	.LBB16_2
// %bb.1:                               // %for.body.preheader
	add	w9, w9, w3
	mvn	w8, w8
	add	w8, w9, w8
	add	x22, x8, #1                     // =1
	mov	w1, #32
	mov	x0, x20
	mov	x2, x22
	bl	memset
	add	x20, x20, x22
.LBB16_2:                               // %while.cond.preheader
	subs	w8, w21, #1                     // =1
	b.lt	.LBB16_8
// %bb.3:                               // %while.body.preheader
	mov	w9, w21
	add	x9, x9, #1                      // =1
	mov	w11, #32
	mov	x10, x20
	b	.LBB16_5
.LBB16_4:                               // %if.end
                                        //   in Loop: Header=BB16_5 Depth=1
	sub	x9, x9, #1                      // =1
	cmp	x9, #1                          // =1
	sub	w8, w8, #1                      // =1
	mov	x20, x10
	b.le	.LBB16_9
.LBB16_5:                               // %while.body
                                        // =>This Inner Loop Header: Depth=1
	lsr	x12, x19, x8
	mov	w13, #48
	bfxil	w13, w12, #0, #1
	strb	w13, [x10], #1
	cbz	w8, .LBB16_4
// %bb.6:                               // %while.body
                                        //   in Loop: Header=BB16_5 Depth=1
	and	w12, w8, #0x3
	cbnz	w12, .LBB16_4
// %bb.7:                               // %if.then
                                        //   in Loop: Header=BB16_5 Depth=1
	add	x10, x20, #2                    // =2
	strb	w11, [x20, #1]
	b	.LBB16_4
.LBB16_8:
	mov	x10, x20
.LBB16_9:                               // %while.end
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             // 16-byte Folded Reload
	strb	wzr, [x10]
	ldp	x29, x30, [sp], #48             // 16-byte Folded Reload
	ret
.Lfunc_end16:
	.size	bitstring, .Lfunc_end16-bitstring
	.cfi_endproc
                                        // -- End function
	.globl	bstr_i                          // -- Begin function bstr_i
	.p2align	2
	.type	bstr_i,@function
bstr_i:                                 // @bstr_i
	.cfi_startproc
// %bb.0:                               // %entry
	cbz	x0, .LBB17_6
// %bb.1:                               // %land.lhs.true.preheader
	ldrb	w9, [x0]
	mov	x8, x0
	cbz	w9, .LBB17_7
// %bb.2:                               // %land.rhs.preheader
	mov	x11, #1
	mov	w0, wzr
	add	x8, x8, #1                      // =1
	mov	w10, #1
	movk	x11, #3, lsl #48
.LBB17_3:                               // %land.rhs
                                        // =>This Inner Loop Header: Depth=1
	and	w12, w9, #0xff
	cmp	w12, #63                        // =63
	b.hi	.LBB17_6
// %bb.4:                               // %land.rhs
                                        //   in Loop: Header=BB17_3 Depth=1
	lsl	x12, x10, x9
	and	x12, x12, x11
	cbz	x12, .LBB17_6
// %bb.5:                               // %while.body
                                        //   in Loop: Header=BB17_3 Depth=1
	bfi	w9, w0, #1, #31
	mov	w0, w9
	ldrb	w9, [x8], #1
	cbnz	w9, .LBB17_3
.LBB17_6:                               // %while.end
	ret
.LBB17_7:
	mov	w0, wzr
	ret
.Lfunc_end17:
	.size	bstr_i, .Lfunc_end17-bstr_i
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-48]!           // 16-byte Folded Spill
	str	x21, [sp, #16]                  // 8-byte Folded Spill
	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 48
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -32
	.cfi_offset w30, -40
	.cfi_offset w29, -48
	mov	x19, x1
	mov	w20, w0
	adrp	x0, .L.str.11
	adrp	x1, .L.str.1.12
	add	x0, x0, :lo12:.L.str.11
	add	x1, x1, :lo12:.L.str.1.12
	bl	fopen
	cbz	x0, .LBB18_6
// %bb.1:                               // %if.end
	adrp	x1, .L.str.3.14
	add	x1, x1, :lo12:.L.str.3.14
	add	x2, x29, #24                    // =24
	mov	x21, x0
	bl	__isoc99_fscanf
	mov	x0, x21
	bl	fclose
	ldr	x8, [x29, #24]
	cmp	x8, #1                          // =1
	b.lt	.LBB18_4
// %bb.2:                               // %for.body.preheader
	mov	x21, xzr
.LBB18_3:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	add	x21, x21, #1                    // =1
	cmp	x21, x8
	cset	w2, eq
	mov	w0, w20
	mov	x1, x19
	bl	main1
	ldr	x8, [x29, #24]
	cmp	x21, x8
	b.lt	.LBB18_3
.LBB18_4:
	mov	w19, wzr
.LBB18_5:                               // %cleanup
	mov	w0, w19
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	ldr	x21, [sp, #16]                  // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48             // 16-byte Folded Reload
	ret
.LBB18_6:                               // %if.then
	adrp	x8, stderr
	ldr	x3, [x8, :lo12:stderr]
	adrp	x0, .L.str.2.13
	add	x0, x0, :lo12:.L.str.2.13
	mov	w1, #28
	mov	w2, #1
	mov	w19, #1
	bl	fwrite
	b	.LBB18_5
.Lfunc_end18:
	.size	main, .Lfunc_end18-main
	.cfi_endproc
                                        // -- End function
	.type	bits.1,@object                  // @bits.1
	.section	.rodata,"a",@progbits
bits.1:
	.ascii	"\000\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\004\005\005\006\005\006\006\007\005\006\006\007\006\007\007\b"
	.size	bits.1, 256

	.type	.L.str.7,@object                // @.str.7
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.7:
	.asciz	"Usage: bitcnts <iterations>\n"
	.size	.L.str.7, 29

	.type	.L.str.8,@object                // @.str.8
.L.str.8:
	.asciz	"Bit counter algorithm benchmark\n"
	.size	.L.str.8, 33

	.type	.L.str.9,@object                // @.str.9
.L.str.9:
	.asciz	"%-38s> Bits: %ld\n"
	.size	.L.str.9, 18

	.type	.L.str,@object                  // @.str
.L.str:
	.asciz	"Optimized 1 bit/loop counter"
	.size	.L.str, 29

	.type	.L.str.1,@object                // @.str.1
.L.str.1:
	.asciz	"Ratko's mystery algorithm"
	.size	.L.str.1, 26

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.asciz	"Recursive bit count by nybbles"
	.size	.L.str.2, 31

	.type	.L.str.3,@object                // @.str.3
.L.str.3:
	.asciz	"Non-recursive bit count by nybbles"
	.size	.L.str.3, 35

	.type	.L.str.4,@object                // @.str.4
.L.str.4:
	.asciz	"Non-recursive bit count by bytes (BW)"
	.size	.L.str.4, 38

	.type	.L.str.5,@object                // @.str.5
.L.str.5:
	.asciz	"Non-recursive bit count by bytes (AR)"
	.size	.L.str.5, 38

	.type	.L.str.6,@object                // @.str.6
.L.str.6:
	.asciz	"Shift and count bits"
	.size	.L.str.6, 21

	.type	.L.str.11,@object               // @.str.11
.L.str.11:
	.asciz	"_finfo_dataset"
	.size	.L.str.11, 15

	.type	.L.str.1.12,@object             // @.str.1.12
.L.str.1.12:
	.asciz	"rt"
	.size	.L.str.1.12, 3

	.type	.L.str.2.13,@object             // @.str.2.13
.L.str.2.13:
	.asciz	"\nError: Can't find dataset!\n"
	.size	.L.str.2.13, 29

	.type	.L.str.3.14,@object             // @.str.3.14
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
