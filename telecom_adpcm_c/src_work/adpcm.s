	.text
	.file	"adpcm.c"
	.file	1 "/home/jiayu/cBench_V1.1/telecom_adpcm_c/src_work/adpcm.c"
	.globl	adpcm_coder                     // -- Begin function adpcm_coder
	.p2align	2
	.type	adpcm_coder,@function
adpcm_coder:                            // @adpcm_coder
.Lfunc_begin0:
	.loc	1 78 0                          // adpcm.c:78:0
	.cfi_startproc
// %bb.0:                               // %entry
	sub	sp, sp, #96                     // =96
	.cfi_def_cfa_offset 96
	stp	x1, x0, [sp, #80]
	str	w2, [sp, #76]
	stp	x0, x3, [sp, #56]
.Ltmp2:
	.loc	1 92 10 prologue_end            // adpcm.c:92:10
	str	x1, [sp, #48]
	.loc	1 96 20                         // adpcm.c:96:20
	ldrb	w13, [x3, #2]
	.loc	1 97 12                         // adpcm.c:97:12
	adrp	x8, stepsizeTable
	add	x8, x8, :lo12:stepsizeTable
	.loc	1 95 22                         // adpcm.c:95:22
	ldrsh	w15, [x3]
	.loc	1 97 12                         // adpcm.c:97:12
	ldr	w14, [x8, x13, lsl #2]
	mov	w12, #1
	adrp	x11, indexTable
	mov	w9, #4
	mov	w10, #32767
	add	x11, x11, :lo12:indexTable
	.loc	1 89 9                          // adpcm.c:89:9
	stp	w12, wzr, [sp, #8]
	mov	w12, #88
	.loc	1 96 11                         // adpcm.c:96:11
	str	w13, [sp, #16]
	mov	w13, #-32769
	.loc	1 95 13                         // adpcm.c:95:13
	stp	w15, w14, [sp, #24]
	mov	w14, #-32768
	b	.LBB0_3
.LBB0_1:                                // %if.else57
                                        //   in Loop: Header=BB0_3 Depth=1
.Ltmp3:
	.loc	1 162 33                        // adpcm.c:162:33
	ldr	w16, [sp, #12]
	.loc	1 162 11 is_stmt 0              // adpcm.c:162:11
	ldr	x17, [sp, #48]
	.loc	1 162 23                        // adpcm.c:162:23
	and	w15, w15, #0xf
	.loc	1 162 31                        // adpcm.c:162:31
	orr	w15, w15, w16
	.loc	1 162 11                        // adpcm.c:162:11
	add	x16, x17, #1                    // =1
	str	x16, [sp, #48]
	.loc	1 162 14                        // adpcm.c:162:14
	strb	w15, [x17]
.Ltmp4:
.LBB0_2:                                // %if.end62
                                        //   in Loop: Header=BB0_3 Depth=1
	.loc	1 164 16 is_stmt 1              // adpcm.c:164:16
	ldr	w15, [sp, #8]
.Ltmp5:
	.loc	1 101 26                        // adpcm.c:101:26
	ldr	w16, [sp, #76]
.Ltmp6:
	.loc	1 164 15                        // adpcm.c:164:15
	cmp	w15, #0                         // =0
.Ltmp7:
	.loc	1 101 26                        // adpcm.c:101:26
	sub	w15, w16, #1                    // =1
.Ltmp8:
	.loc	1 164 15                        // adpcm.c:164:15
	cset	w16, eq
	.loc	1 164 13 is_stmt 0              // adpcm.c:164:13
	str	w16, [sp, #8]
.Ltmp9:
	.loc	1 101 26 is_stmt 1              // adpcm.c:101:26
	str	w15, [sp, #76]
.LBB0_3:                                // %for.cond
                                        // =>This Inner Loop Header: Depth=1
	.loc	1 101 13 is_stmt 0              // adpcm.c:101:13
	ldr	w15, [sp, #76]
.Ltmp10:
	.loc	1 101 5                         // adpcm.c:101:5
	cmp	w15, #1                         // =1
	b.lt	.LBB0_21
// %bb.4:                               // %for.body
                                        //   in Loop: Header=BB0_3 Depth=1
.Ltmp11:
	.loc	1 102 12 is_stmt 1              // adpcm.c:102:12
	ldr	x15, [sp, #56]
	add	x16, x15, #2                    // =2
	str	x16, [sp, #56]
	.loc	1 102 8 is_stmt 0               // adpcm.c:102:8
	ldrsh	w15, [x15]
	.loc	1 105 15 is_stmt 1              // adpcm.c:105:15
	ldr	w16, [sp, #24]
	.loc	1 102 6                         // adpcm.c:102:6
	str	w15, [sp, #44]
	.loc	1 105 13                        // adpcm.c:105:13
	sub	w15, w15, w16
	.loc	1 105 7 is_stmt 0               // adpcm.c:105:7
	str	w15, [sp, #32]
	.loc	1 106 9 is_stmt 1               // adpcm.c:106:9
	lsr	w15, w15, #28
	and	w16, w15, #0x8
	.loc	1 106 7 is_stmt 0               // adpcm.c:106:7
	str	w16, [sp, #40]
	.loc	1 107 7 is_stmt 1               // adpcm.c:107:7
	tbz	w15, #3, .LBB0_6
// %bb.5:                               // %if.then
                                        //   in Loop: Header=BB0_3 Depth=1
.Ltmp12:
	.loc	1 107 23 is_stmt 0              // adpcm.c:107:23
	ldr	w15, [sp, #32]
	.loc	1 107 22                        // adpcm.c:107:22
	neg	w15, w15
	.loc	1 107 19                        // adpcm.c:107:19
	str	w15, [sp, #32]
.Ltmp13:
.LBB0_6:                                // %if.end
                                        //   in Loop: Header=BB0_3 Depth=1
	.loc	1 119 12 is_stmt 1              // adpcm.c:119:12
	ldp	w15, w16, [sp, #28]
	.loc	1 118 8                         // adpcm.c:118:8
	str	wzr, [sp, #36]
	.loc	1 119 17                        // adpcm.c:119:17
	asr	w17, w15, #3
	.loc	1 121 7                         // adpcm.c:121:7
	cmp	w16, w15
	.loc	1 119 9                         // adpcm.c:119:9
	str	w17, [sp, #20]
	.loc	1 121 7                         // adpcm.c:121:7
	b.lt	.LBB0_8
// %bb.7:                               // %if.then10
                                        //   in Loop: Header=BB0_3 Depth=1
.Ltmp14:
	.loc	1 123 11                        // adpcm.c:123:11
	ldp	w16, w15, [sp, #28]
	.loc	1 124 13                        // adpcm.c:124:13
	ldr	w17, [sp, #20]
	.loc	1 123 11                        // adpcm.c:123:11
	sub	w15, w15, w16
	.loc	1 124 13                        // adpcm.c:124:13
	add	w16, w17, w16
	.loc	1 122 12                        // adpcm.c:122:12
	stp	w15, w9, [sp, #32]
	.loc	1 124 13                        // adpcm.c:124:13
	str	w16, [sp, #20]
.Ltmp15:
.LBB0_8:                                // %if.end12
                                        //   in Loop: Header=BB0_3 Depth=1
	.loc	1 126 7                         // adpcm.c:126:7
	ldp	w15, w16, [sp, #28]
	asr	w15, w15, #1
	.loc	1 127 7                         // adpcm.c:127:7
	cmp	w16, w15
	.loc	1 126 7                         // adpcm.c:126:7
	str	w15, [sp, #28]
	.loc	1 127 7                         // adpcm.c:127:7
	b.lt	.LBB0_10
// %bb.9:                               // %if.then16
                                        //   in Loop: Header=BB0_3 Depth=1
.Ltmp16:
	.loc	1 128 12                        // adpcm.c:128:12
	ldp	w16, w15, [sp, #32]
	.loc	1 129 14                        // adpcm.c:129:14
	ldr	w17, [sp, #28]
	.loc	1 130 13                        // adpcm.c:130:13
	ldr	w18, [sp, #20]
	.loc	1 128 12                        // adpcm.c:128:12
	orr	w15, w15, #0x2
	.loc	1 129 11                        // adpcm.c:129:11
	sub	w16, w16, w17
	.loc	1 130 13                        // adpcm.c:130:13
	add	w17, w18, w17
	.loc	1 128 12                        // adpcm.c:128:12
	stp	w16, w15, [sp, #32]
	.loc	1 130 13                        // adpcm.c:130:13
	str	w17, [sp, #20]
.Ltmp17:
.LBB0_10:                               // %if.end19
                                        //   in Loop: Header=BB0_3 Depth=1
	.loc	1 132 7                         // adpcm.c:132:7
	ldp	w15, w16, [sp, #28]
	asr	w15, w15, #1
	.loc	1 133 7                         // adpcm.c:133:7
	cmp	w16, w15
	.loc	1 132 7                         // adpcm.c:132:7
	str	w15, [sp, #28]
	.loc	1 133 7                         // adpcm.c:133:7
	b.lt	.LBB0_12
// %bb.11:                              // %if.then23
                                        //   in Loop: Header=BB0_3 Depth=1
.Ltmp18:
	.loc	1 134 12                        // adpcm.c:134:12
	ldr	w15, [sp, #36]
	.loc	1 135 16                        // adpcm.c:135:16
	ldr	w16, [sp, #28]
	.loc	1 135 13 is_stmt 0              // adpcm.c:135:13
	ldr	w17, [sp, #20]
	.loc	1 134 12 is_stmt 1              // adpcm.c:134:12
	orr	w15, w15, #0x1
	str	w15, [sp, #36]
	.loc	1 135 13                        // adpcm.c:135:13
	add	w16, w17, w16
	str	w16, [sp, #20]
.Ltmp19:
.LBB0_12:                               // %if.end26
                                        //   in Loop: Header=BB0_3 Depth=1
	.loc	1 139 7                         // adpcm.c:139:7
	ldr	w17, [sp, #40]
	.loc	1 0 0 is_stmt 0                 // adpcm.c:0:0
	ldp	w15, w16, [sp, #20]
.Ltmp20:
	.loc	1 139 7                         // adpcm.c:139:7
	cbz	w17, .LBB0_14
// %bb.13:                              // %if.then28
                                        //   in Loop: Header=BB0_3 Depth=1
.Ltmp21:
	.loc	1 140 12 is_stmt 1              // adpcm.c:140:12
	sub	w15, w16, w15
	b	.LBB0_15
.LBB0_14:                               // %if.else
                                        //   in Loop: Header=BB0_3 Depth=1
	.loc	1 142 12                        // adpcm.c:142:12
	add	w15, w16, w15
.LBB0_15:                               // %if.end31
                                        //   in Loop: Header=BB0_3 Depth=1
	.loc	1 0 0 is_stmt 0                 // adpcm.c:0:0
	str	w15, [sp, #24]
.Ltmp22:
	.loc	1 145 7 is_stmt 1               // adpcm.c:145:7
	mov	w15, w15
.Ltmp23:
	.loc	1 145 7 is_stmt 0               // adpcm.c:145:7
	cmp	w15, #8, lsl #12                // =32768
	b.lt	.LBB0_17
// %bb.16:                              // %if.then34
                                        //   in Loop: Header=BB0_3 Depth=1
.Ltmp24:
	.loc	1 146 12 is_stmt 1              // adpcm.c:146:12
	str	w10, [sp, #24]
	b	.LBB0_19
.LBB0_17:                               // %if.else35
                                        //   in Loop: Header=BB0_3 Depth=1
.Ltmp25:
	.loc	1 147 12                        // adpcm.c:147:12
	ldr	w15, [sp, #24]
.Ltmp26:
	.loc	1 147 12 is_stmt 0              // adpcm.c:147:12
	cmp	w15, w13
	b.gt	.LBB0_19
// %bb.18:                              // %if.then38
                                        //   in Loop: Header=BB0_3 Depth=1
.Ltmp27:
	.loc	1 148 12 is_stmt 1              // adpcm.c:148:12
	str	w14, [sp, #24]
.Ltmp28:
.LBB0_19:                               // %if.end40
                                        //   in Loop: Header=BB0_3 Depth=1
	.loc	1 151 11                        // adpcm.c:151:11
	ldp	w16, w15, [sp, #36]
	.loc	1 153 8                         // adpcm.c:153:8
	ldr	w17, [sp, #16]
.Ltmp29:
	.loc	1 159 7                         // adpcm.c:159:7
	ldr	w18, [sp, #8]
.Ltmp30:
	.loc	1 151 8                         // adpcm.c:151:8
	orr	w15, w16, w15
	.loc	1 153 11                        // adpcm.c:153:11
	ldr	w16, [x11, w15, sxtw #2]
	.loc	1 151 8                         // adpcm.c:151:8
	str	w15, [sp, #36]
	.loc	1 153 8                         // adpcm.c:153:8
	add	w16, w17, w16
	.loc	1 154 7                         // adpcm.c:154:7
	cmp	w16, #0                         // =0
	csel	w16, wzr, w16, lt
	.loc	1 155 7                         // adpcm.c:155:7
	cmp	w16, #88                        // =88
	csel	w16, w12, w16, gt
	.loc	1 156 9                         // adpcm.c:156:9
	ldr	w17, [x8, w16, sxtw #2]
	.loc	1 0 0 is_stmt 0                 // adpcm.c:0:0
	str	w16, [sp, #16]
	.loc	1 156 7                         // adpcm.c:156:7
	str	w17, [sp, #28]
	.loc	1 159 7 is_stmt 1               // adpcm.c:159:7
	cbz	w18, .LBB0_1
// %bb.20:                              // %if.then56
                                        //   in Loop: Header=BB0_3 Depth=1
.Ltmp31:
	.loc	1 160 34                        // adpcm.c:160:34
	ubfiz	w15, w15, #4, #4
	.loc	1 160 19 is_stmt 0              // adpcm.c:160:19
	str	w15, [sp, #12]
	b	.LBB0_2
.Ltmp32:
.LBB0_21:                               // %for.end
	.loc	1 168 11 is_stmt 1              // adpcm.c:168:11
	ldr	w8, [sp, #8]
.Ltmp33:
	.loc	1 168 10 is_stmt 0              // adpcm.c:168:10
	cbnz	w8, .LBB0_23
// %bb.22:                              // %if.then65
.Ltmp34:
	.loc	1 169 12 is_stmt 1              // adpcm.c:169:12
	ldr	x8, [sp, #48]
	.loc	1 169 17 is_stmt 0              // adpcm.c:169:17
	ldr	w9, [sp, #12]
	.loc	1 169 12                        // adpcm.c:169:12
	add	x10, x8, #1                     // =1
	str	x10, [sp, #48]
	.loc	1 169 15                        // adpcm.c:169:15
	strb	w9, [x8]
.Ltmp35:
.LBB0_23:                               // %if.end68
	.loc	1 171 22 is_stmt 1              // adpcm.c:171:22
	ldr	w8, [sp, #24]
	.loc	1 171 5 is_stmt 0               // adpcm.c:171:5
	ldr	x9, [sp, #64]
	.loc	1 171 20                        // adpcm.c:171:20
	strh	w8, [x9]
	.loc	1 172 20 is_stmt 1              // adpcm.c:172:20
	ldr	w8, [sp, #16]
	.loc	1 172 5 is_stmt 0               // adpcm.c:172:5
	ldr	x9, [sp, #64]
	.loc	1 172 18                        // adpcm.c:172:18
	strb	w8, [x9, #2]
	.loc	1 173 1 is_stmt 1               // adpcm.c:173:1
	add	sp, sp, #96                     // =96
	ret
.Ltmp36:
.Lfunc_end0:
	.size	adpcm_coder, .Lfunc_end0-adpcm_coder
	.cfi_endproc
                                        // -- End function
	.globl	adpcm_decoder                   // -- Begin function adpcm_decoder
	.p2align	2
	.type	adpcm_decoder,@function
adpcm_decoder:                          // @adpcm_decoder
.Lfunc_begin1:
	.loc	1 181 0                         // adpcm.c:181:0
	.cfi_startproc
// %bb.0:                               // %entry
	sub	sp, sp, #80                     // =80
	.cfi_def_cfa_offset 80
	stp	x1, x0, [sp, #64]
	str	w2, [sp, #60]
	stp	x0, x3, [sp, #40]
.Ltmp37:
	.loc	1 190 9 prologue_end            // adpcm.c:190:9
	str	xzr, [sp]
	.loc	1 193 10                        // adpcm.c:193:10
	str	x1, [sp, #32]
	.loc	1 197 20                        // adpcm.c:197:20
	ldrb	w12, [x3, #2]
	.loc	1 198 12                        // adpcm.c:198:12
	adrp	x8, stepsizeTable
	add	x8, x8, :lo12:stepsizeTable
	.loc	1 196 22                        // adpcm.c:196:22
	ldrsh	w14, [x3]
	.loc	1 198 12                        // adpcm.c:198:12
	ldr	w13, [x8, x12, lsl #2]
	adrp	x9, indexTable
	add	x9, x9, :lo12:indexTable
	mov	w10, #88
	mov	w11, #32767
	.loc	1 197 11                        // adpcm.c:197:11
	str	w12, [sp, #8]
	mov	w12, #-32769
	.loc	1 196 13                        // adpcm.c:196:13
	stp	w14, w13, [sp, #16]
	mov	w13, #-32768
	b	.LBB1_3
.LBB1_1:                                // %if.then44
                                        //   in Loop: Header=BB1_3 Depth=1
.Ltmp38:
	.loc	1 239 12                        // adpcm.c:239:12
	str	w11, [sp, #16]
.Ltmp39:
.LBB1_2:                                // %if.end50
                                        //   in Loop: Header=BB1_3 Depth=1
	.loc	1 244 23                        // adpcm.c:244:23
	ldrsw	x14, [sp, #8]
	.loc	1 247 7                         // adpcm.c:247:7
	ldr	x15, [sp, #32]
	.loc	1 247 12 is_stmt 0              // adpcm.c:247:12
	ldr	w16, [sp, #16]
	.loc	1 244 9 is_stmt 1               // adpcm.c:244:9
	ldr	w14, [x8, x14, lsl #2]
	.loc	1 247 7                         // adpcm.c:247:7
	add	x17, x15, #2                    // =2
	str	x17, [sp, #32]
	.loc	1 244 7                         // adpcm.c:244:7
	str	w14, [sp, #20]
	.loc	1 247 10                        // adpcm.c:247:10
	strh	w16, [x15]
.Ltmp40:
	.loc	1 202 26                        // adpcm.c:202:26
	ldr	w14, [sp, #60]
	sub	w14, w14, #1                    // =1
	str	w14, [sp, #60]
.LBB1_3:                                // %for.cond
                                        // =>This Inner Loop Header: Depth=1
	.loc	1 202 13 is_stmt 0              // adpcm.c:202:13
	ldr	w14, [sp, #60]
.Ltmp41:
	.loc	1 202 5                         // adpcm.c:202:5
	cmp	w14, #1                         // =1
	b.lt	.LBB1_19
// %bb.4:                               // %for.body
                                        //   in Loop: Header=BB1_3 Depth=1
.Ltmp42:
	.loc	1 205 7 is_stmt 1               // adpcm.c:205:7
	ldr	w14, [sp]
.Ltmp43:
	.loc	1 205 7 is_stmt 0               // adpcm.c:205:7
	cbz	w14, .LBB1_6
// %bb.5:                               // %if.then
                                        //   in Loop: Header=BB1_3 Depth=1
.Ltmp44:
	.loc	1 206 14 is_stmt 1              // adpcm.c:206:14
	ldr	w14, [sp, #4]
	.loc	1 206 26 is_stmt 0              // adpcm.c:206:26
	and	w14, w14, #0xf
	b	.LBB1_7
.Ltmp45:
.LBB1_6:                                // %if.else
                                        //   in Loop: Header=BB1_3 Depth=1
	.loc	1 208 24 is_stmt 1              // adpcm.c:208:24
	ldr	x14, [sp, #40]
	add	x15, x14, #1                    // =1
	str	x15, [sp, #40]
	.loc	1 208 20 is_stmt 0              // adpcm.c:208:20
	ldrsb	w14, [x14]
	.loc	1 208 18                        // adpcm.c:208:18
	str	w14, [sp, #4]
	.loc	1 209 33 is_stmt 1              // adpcm.c:209:33
	ubfx	w14, w14, #4, #4
.Ltmp46:
.LBB1_7:                                // %if.end
                                        //   in Loop: Header=BB1_3 Depth=1
	.loc	1 0 0 is_stmt 0                 // adpcm.c:0:0
	str	w14, [sp, #24]
.Ltmp47:
	.loc	1 211 16 is_stmt 1              // adpcm.c:211:16
	ldr	w14, [sp]
	.loc	1 214 22                        // adpcm.c:214:22
	ldrsw	x15, [sp, #24]
	.loc	1 219 9                         // adpcm.c:219:9
	ldr	w16, [sp, #24]
	.loc	1 214 8                         // adpcm.c:214:8
	ldr	w17, [sp, #8]
	.loc	1 211 15                        // adpcm.c:211:15
	cmp	w14, #0                         // =0
	.loc	1 214 11                        // adpcm.c:214:11
	ldr	w14, [x9, x15, lsl #2]
	.loc	1 219 15                        // adpcm.c:219:15
	and	w18, w16, #0x8
	.loc	1 220 16                        // adpcm.c:220:16
	and	w15, w16, #0x7
	.loc	1 219 7                         // adpcm.c:219:7
	stp	w15, w18, [sp, #24]
	.loc	1 211 15                        // adpcm.c:211:15
	cset	w15, eq
	.loc	1 211 13 is_stmt 0              // adpcm.c:211:13
	str	w15, [sp]
	.loc	1 214 8 is_stmt 1               // adpcm.c:214:8
	add	w14, w17, w14
	.loc	1 227 11                        // adpcm.c:227:11
	ldr	w15, [sp, #20]
	.loc	1 215 7                         // adpcm.c:215:7
	cmp	w14, #0                         // =0
	csel	w14, wzr, w14, lt
	.loc	1 216 7                         // adpcm.c:216:7
	cmp	w14, #88                        // =88
	csel	w17, w10, w14, gt
	.loc	1 227 16                        // adpcm.c:227:16
	asr	w14, w15, #3
	.loc	1 0 0 is_stmt 0                 // adpcm.c:0:0
	stp	w17, w14, [sp, #8]
	.loc	1 228 7 is_stmt 1               // adpcm.c:228:7
	tbnz	w16, #2, .LBB1_13
// %bb.8:                               // %if.end24
                                        //   in Loop: Header=BB1_3 Depth=1
	.loc	1 229 7                         // adpcm.c:229:7
	ldrb	w14, [sp, #24]
	tbnz	w14, #1, .LBB1_14
.LBB1_9:                                // %if.end30
                                        //   in Loop: Header=BB1_3 Depth=1
	.loc	1 230 7                         // adpcm.c:230:7
	ldrb	w14, [sp, #24]
	tbz	w14, #0, .LBB1_11
.LBB1_10:                               // %if.then33
                                        //   in Loop: Header=BB1_3 Depth=1
.Ltmp48:
	.loc	1 230 29 is_stmt 0              // adpcm.c:230:29
	ldr	w14, [sp, #20]
	.loc	1 230 26                        // adpcm.c:230:26
	ldr	w15, [sp, #12]
	add	w14, w15, w14, asr #2
	str	w14, [sp, #12]
.Ltmp49:
.LBB1_11:                               // %if.end36
                                        //   in Loop: Header=BB1_3 Depth=1
	.loc	1 232 7 is_stmt 1               // adpcm.c:232:7
	ldr	w16, [sp, #28]
	.loc	1 0 0 is_stmt 0                 // adpcm.c:0:0
	ldp	w14, w15, [sp, #12]
.Ltmp50:
	.loc	1 232 7                         // adpcm.c:232:7
	cbz	w16, .LBB1_15
// %bb.12:                              // %if.then38
                                        //   in Loop: Header=BB1_3 Depth=1
.Ltmp51:
	.loc	1 233 12 is_stmt 1              // adpcm.c:233:12
	sub	w14, w15, w14
	b	.LBB1_16
.Ltmp52:
.LBB1_13:                               // %if.then22
                                        //   in Loop: Header=BB1_3 Depth=1
	.loc	1 228 29                        // adpcm.c:228:29
	ldr	w14, [sp, #20]
	.loc	1 228 26 is_stmt 0              // adpcm.c:228:26
	ldr	w15, [sp, #12]
	add	w14, w15, w14
	str	w14, [sp, #12]
.Ltmp53:
	.loc	1 229 7 is_stmt 1               // adpcm.c:229:7
	ldrb	w14, [sp, #24]
	tbz	w14, #1, .LBB1_9
.LBB1_14:                               // %if.then27
                                        //   in Loop: Header=BB1_3 Depth=1
.Ltmp54:
	.loc	1 229 29 is_stmt 0              // adpcm.c:229:29
	ldr	w14, [sp, #20]
	.loc	1 229 26                        // adpcm.c:229:26
	ldr	w15, [sp, #12]
	add	w14, w15, w14, asr #1
	str	w14, [sp, #12]
.Ltmp55:
	.loc	1 230 7 is_stmt 1               // adpcm.c:230:7
	ldrb	w14, [sp, #24]
	tbnz	w14, #0, .LBB1_10
	b	.LBB1_11
.LBB1_15:                               // %if.else39
                                        //   in Loop: Header=BB1_3 Depth=1
.Ltmp56:
	.loc	1 235 12                        // adpcm.c:235:12
	add	w14, w15, w14
.LBB1_16:                               // %if.end41
                                        //   in Loop: Header=BB1_3 Depth=1
	.loc	1 0 0 is_stmt 0                 // adpcm.c:0:0
	str	w14, [sp, #16]
.Ltmp57:
	.loc	1 238 7 is_stmt 1               // adpcm.c:238:7
	mov	w14, w14
.Ltmp58:
	.loc	1 238 7 is_stmt 0               // adpcm.c:238:7
	cmp	w14, #8, lsl #12                // =32768
	b.ge	.LBB1_1
// %bb.17:                              // %if.else45
                                        //   in Loop: Header=BB1_3 Depth=1
.Ltmp59:
	.loc	1 240 12 is_stmt 1              // adpcm.c:240:12
	ldr	w14, [sp, #16]
.Ltmp60:
	.loc	1 240 12 is_stmt 0              // adpcm.c:240:12
	cmp	w14, w12
	b.gt	.LBB1_2
// %bb.18:                              // %if.then48
                                        //   in Loop: Header=BB1_3 Depth=1
.Ltmp61:
	.loc	1 241 12 is_stmt 1              // adpcm.c:241:12
	str	w13, [sp, #16]
	b	.LBB1_2
.Ltmp62:
.LBB1_19:                               // %for.end
	.loc	1 250 22                        // adpcm.c:250:22
	ldr	w8, [sp, #16]
	.loc	1 250 5 is_stmt 0               // adpcm.c:250:5
	ldr	x9, [sp, #48]
	.loc	1 250 20                        // adpcm.c:250:20
	strh	w8, [x9]
	.loc	1 251 20 is_stmt 1              // adpcm.c:251:20
	ldr	w8, [sp, #8]
	.loc	1 251 5 is_stmt 0               // adpcm.c:251:5
	ldr	x9, [sp, #48]
	.loc	1 251 18                        // adpcm.c:251:18
	strb	w8, [x9, #2]
	.loc	1 252 1 is_stmt 1               // adpcm.c:252:1
	add	sp, sp, #80                     // =80
	ret
.Ltmp63:
.Lfunc_end1:
	.size	adpcm_decoder, .Lfunc_end1-adpcm_decoder
	.cfi_endproc
                                        // -- End function
	.type	stepsizeTable,@object           // @stepsizeTable
	.data
	.p2align	2
stepsizeTable:
	.word	7                               // 0x7
	.word	8                               // 0x8
	.word	9                               // 0x9
	.word	10                              // 0xa
	.word	11                              // 0xb
	.word	12                              // 0xc
	.word	13                              // 0xd
	.word	14                              // 0xe
	.word	16                              // 0x10
	.word	17                              // 0x11
	.word	19                              // 0x13
	.word	21                              // 0x15
	.word	23                              // 0x17
	.word	25                              // 0x19
	.word	28                              // 0x1c
	.word	31                              // 0x1f
	.word	34                              // 0x22
	.word	37                              // 0x25
	.word	41                              // 0x29
	.word	45                              // 0x2d
	.word	50                              // 0x32
	.word	55                              // 0x37
	.word	60                              // 0x3c
	.word	66                              // 0x42
	.word	73                              // 0x49
	.word	80                              // 0x50
	.word	88                              // 0x58
	.word	97                              // 0x61
	.word	107                             // 0x6b
	.word	118                             // 0x76
	.word	130                             // 0x82
	.word	143                             // 0x8f
	.word	157                             // 0x9d
	.word	173                             // 0xad
	.word	190                             // 0xbe
	.word	209                             // 0xd1
	.word	230                             // 0xe6
	.word	253                             // 0xfd
	.word	279                             // 0x117
	.word	307                             // 0x133
	.word	337                             // 0x151
	.word	371                             // 0x173
	.word	408                             // 0x198
	.word	449                             // 0x1c1
	.word	494                             // 0x1ee
	.word	544                             // 0x220
	.word	598                             // 0x256
	.word	658                             // 0x292
	.word	724                             // 0x2d4
	.word	796                             // 0x31c
	.word	876                             // 0x36c
	.word	963                             // 0x3c3
	.word	1060                            // 0x424
	.word	1166                            // 0x48e
	.word	1282                            // 0x502
	.word	1411                            // 0x583
	.word	1552                            // 0x610
	.word	1707                            // 0x6ab
	.word	1878                            // 0x756
	.word	2066                            // 0x812
	.word	2272                            // 0x8e0
	.word	2499                            // 0x9c3
	.word	2749                            // 0xabd
	.word	3024                            // 0xbd0
	.word	3327                            // 0xcff
	.word	3660                            // 0xe4c
	.word	4026                            // 0xfba
	.word	4428                            // 0x114c
	.word	4871                            // 0x1307
	.word	5358                            // 0x14ee
	.word	5894                            // 0x1706
	.word	6484                            // 0x1954
	.word	7132                            // 0x1bdc
	.word	7845                            // 0x1ea5
	.word	8630                            // 0x21b6
	.word	9493                            // 0x2515
	.word	10442                           // 0x28ca
	.word	11487                           // 0x2cdf
	.word	12635                           // 0x315b
	.word	13899                           // 0x364b
	.word	15289                           // 0x3bb9
	.word	16818                           // 0x41b2
	.word	18500                           // 0x4844
	.word	20350                           // 0x4f7e
	.word	22385                           // 0x5771
	.word	24623                           // 0x602f
	.word	27086                           // 0x69ce
	.word	29794                           // 0x7462
	.word	32767                           // 0x7fff
	.size	stepsizeTable, 356

	.type	indexTable,@object              // @indexTable
	.p2align	2
indexTable:
	.word	4294967295                      // 0xffffffff
	.word	4294967295                      // 0xffffffff
	.word	4294967295                      // 0xffffffff
	.word	4294967295                      // 0xffffffff
	.word	2                               // 0x2
	.word	4                               // 0x4
	.word	6                               // 0x6
	.word	8                               // 0x8
	.word	4294967295                      // 0xffffffff
	.word	4294967295                      // 0xffffffff
	.word	4294967295                      // 0xffffffff
	.word	4294967295                      // 0xffffffff
	.word	2                               // 0x2
	.word	4                               // 0x4
	.word	6                               // 0x6
	.word	8                               // 0x8
	.size	indexTable, 64

	.file	2 "/home/jiayu/cBench_V1.1/telecom_adpcm_c/src_work/./adpcm.h"
	.section	.debug_abbrev,"",@progbits
	.byte	1                               // Abbreviation Code
	.byte	17                              // DW_TAG_compile_unit
	.byte	1                               // DW_CHILDREN_yes
	.byte	37                              // DW_AT_producer
	.byte	14                              // DW_FORM_strp
	.byte	19                              // DW_AT_language
	.byte	5                               // DW_FORM_data2
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	16                              // DW_AT_stmt_list
	.byte	23                              // DW_FORM_sec_offset
	.byte	27                              // DW_AT_comp_dir
	.byte	14                              // DW_FORM_strp
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	2                               // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	3                               // Abbreviation Code
	.byte	1                               // DW_TAG_array_type
	.byte	1                               // DW_CHILDREN_yes
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	4                               // Abbreviation Code
	.byte	33                              // DW_TAG_subrange_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	55                              // DW_AT_count
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	5                               // Abbreviation Code
	.byte	36                              // DW_TAG_base_type
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	62                              // DW_AT_encoding
	.byte	11                              // DW_FORM_data1
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	6                               // Abbreviation Code
	.byte	36                              // DW_TAG_base_type
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	62                              // DW_AT_encoding
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	7                               // Abbreviation Code
	.byte	15                              // DW_TAG_pointer_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	8                               // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	1                               // DW_CHILDREN_yes
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	64                              // DW_AT_frame_base
	.byte	24                              // DW_FORM_exprloc
	.ascii	"\227B"                         // DW_AT_GNU_all_call_sites
	.byte	25                              // DW_FORM_flag_present
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	9                               // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	10                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	11                              // Abbreviation Code
	.byte	19                              // DW_TAG_structure_type
	.byte	1                               // DW_CHILDREN_yes
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	12                              // Abbreviation Code
	.byte	13                              // DW_TAG_member
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	56                              // DW_AT_data_member_location
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	0                               // EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 // Length of Unit
.Ldebug_info_start0:
	.hword	4                               // DWARF version number
	.word	.debug_abbrev                   // Offset Into Abbrev. Section
	.byte	8                               // Address Size (in bytes)
	.byte	1                               // Abbrev [1] 0xb:0x290 DW_TAG_compile_unit
	.word	.Linfo_string0                  // DW_AT_producer
	.hword	12                              // DW_AT_language
	.word	.Linfo_string1                  // DW_AT_name
	.word	.Lline_table_start0             // DW_AT_stmt_list
	.word	.Linfo_string2                  // DW_AT_comp_dir
	.xword	.Lfunc_begin0                   // DW_AT_low_pc
	.word	.Lfunc_end1-.Lfunc_begin0       // DW_AT_high_pc
	.byte	2                               // Abbrev [2] 0x2a:0x15 DW_TAG_variable
	.word	.Linfo_string3                  // DW_AT_name
	.word	63                              // DW_AT_type
	.byte	1                               // DW_AT_decl_file
	.byte	60                              // DW_AT_decl_line
	.byte	9                               // DW_AT_location
	.byte	3
	.xword	stepsizeTable
	.byte	3                               // Abbrev [3] 0x3f:0xc DW_TAG_array_type
	.word	75                              // DW_AT_type
	.byte	4                               // Abbrev [4] 0x44:0x6 DW_TAG_subrange_type
	.word	82                              // DW_AT_type
	.byte	89                              // DW_AT_count
	.byte	0                               // End Of Children Mark
	.byte	5                               // Abbrev [5] 0x4b:0x7 DW_TAG_base_type
	.word	.Linfo_string4                  // DW_AT_name
	.byte	5                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	6                               // Abbrev [6] 0x52:0x7 DW_TAG_base_type
	.word	.Linfo_string5                  // DW_AT_name
	.byte	8                               // DW_AT_byte_size
	.byte	7                               // DW_AT_encoding
	.byte	2                               // Abbrev [2] 0x59:0x15 DW_TAG_variable
	.word	.Linfo_string6                  // DW_AT_name
	.word	110                             // DW_AT_type
	.byte	1                               // DW_AT_decl_file
	.byte	55                              // DW_AT_decl_line
	.byte	9                               // DW_AT_location
	.byte	3
	.xword	indexTable
	.byte	3                               // Abbrev [3] 0x6e:0xc DW_TAG_array_type
	.word	75                              // DW_AT_type
	.byte	4                               // Abbrev [4] 0x73:0x6 DW_TAG_subrange_type
	.word	82                              // DW_AT_type
	.byte	16                              // DW_AT_count
	.byte	0                               // End Of Children Mark
	.byte	7                               // Abbrev [7] 0x7a:0x5 DW_TAG_pointer_type
	.word	127                             // DW_AT_type
	.byte	5                               // Abbrev [5] 0x7f:0x7 DW_TAG_base_type
	.word	.Linfo_string7                  // DW_AT_name
	.byte	6                               // DW_AT_encoding
	.byte	1                               // DW_AT_byte_size
	.byte	8                               // Abbrev [8] 0x86:0xfa DW_TAG_subprogram
	.xword	.Lfunc_begin0                   // DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	111
                                        // DW_AT_GNU_all_call_sites
	.word	.Linfo_string8                  // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	73                              // DW_AT_decl_line
                                        // DW_AT_external
	.byte	9                               // Abbrev [9] 0x9b:0xf DW_TAG_formal_parameter
	.byte	3                               // DW_AT_location
	.byte	145
	.asciz	"\330"
	.word	.Linfo_string10                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	74                              // DW_AT_decl_line
	.word	604                             // DW_AT_type
	.byte	9                               // Abbrev [9] 0xaa:0xf DW_TAG_formal_parameter
	.byte	3                               // DW_AT_location
	.byte	145
	.asciz	"\320"
	.word	.Linfo_string12                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	75                              // DW_AT_decl_line
	.word	616                             // DW_AT_type
	.byte	9                               // Abbrev [9] 0xb9:0xf DW_TAG_formal_parameter
	.byte	3                               // DW_AT_location
	.byte	145
	.asciz	"\314"
	.word	.Linfo_string14                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	76                              // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	9                               // Abbrev [9] 0xc8:0xf DW_TAG_formal_parameter
	.byte	3                               // DW_AT_location
	.byte	145
	.asciz	"\300"
	.word	.Linfo_string15                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	77                              // DW_AT_decl_line
	.word	628                             // DW_AT_type
	.byte	10                              // Abbrev [10] 0xd7:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	56
	.word	.Linfo_string19                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	79                              // DW_AT_decl_line
	.word	604                             // DW_AT_type
	.byte	10                              // Abbrev [10] 0xe5:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	48
	.word	.Linfo_string20                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	80                              // DW_AT_decl_line
	.word	122                             // DW_AT_type
	.byte	10                              // Abbrev [10] 0xf3:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	44
	.word	.Linfo_string21                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	81                              // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x101:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	40
	.word	.Linfo_string22                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	82                              // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x10f:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	36
	.word	.Linfo_string23                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	83                              // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x11d:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	32
	.word	.Linfo_string24                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	84                              // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x12b:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	28
	.word	.Linfo_string25                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	85                              // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x139:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	24
	.word	.Linfo_string26                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	86                              // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x147:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	20
	.word	.Linfo_string27                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	87                              // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x155:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	16
	.word	.Linfo_string17                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	88                              // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x163:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	12
	.word	.Linfo_string28                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	89                              // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x171:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	8
	.word	.Linfo_string29                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	90                              // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	8                               // Abbrev [8] 0x180:0xdc DW_TAG_subprogram
	.xword	.Lfunc_begin1                   // DW_AT_low_pc
	.word	.Lfunc_end1-.Lfunc_begin1       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	111
                                        // DW_AT_GNU_all_call_sites
	.word	.Linfo_string9                  // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	176                             // DW_AT_decl_line
                                        // DW_AT_external
	.byte	9                               // Abbrev [9] 0x195:0xf DW_TAG_formal_parameter
	.byte	3                               // DW_AT_location
	.byte	145
	.asciz	"\310"
	.word	.Linfo_string10                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	177                             // DW_AT_decl_line
	.word	616                             // DW_AT_type
	.byte	9                               // Abbrev [9] 0x1a4:0xf DW_TAG_formal_parameter
	.byte	3                               // DW_AT_location
	.byte	145
	.asciz	"\300"
	.word	.Linfo_string12                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	178                             // DW_AT_decl_line
	.word	604                             // DW_AT_type
	.byte	9                               // Abbrev [9] 0x1b3:0xe DW_TAG_formal_parameter
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	60
	.word	.Linfo_string14                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	179                             // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	9                               // Abbrev [9] 0x1c1:0xe DW_TAG_formal_parameter
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	48
	.word	.Linfo_string15                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	180                             // DW_AT_decl_line
	.word	628                             // DW_AT_type
	.byte	10                              // Abbrev [10] 0x1cf:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	40
	.word	.Linfo_string19                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	182                             // DW_AT_decl_line
	.word	122                             // DW_AT_type
	.byte	10                              // Abbrev [10] 0x1dd:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	32
	.word	.Linfo_string20                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	183                             // DW_AT_decl_line
	.word	604                             // DW_AT_type
	.byte	10                              // Abbrev [10] 0x1eb:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	28
	.word	.Linfo_string22                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	184                             // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x1f9:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	24
	.word	.Linfo_string23                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	185                             // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x207:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	20
	.word	.Linfo_string25                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	186                             // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x215:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	16
	.word	.Linfo_string26                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	187                             // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x223:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	12
	.word	.Linfo_string27                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	188                             // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x231:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	8
	.word	.Linfo_string17                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	189                             // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x23f:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	4
	.word	.Linfo_string30                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	190                             // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	10                              // Abbrev [10] 0x24d:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	0
	.word	.Linfo_string29                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	191                             // DW_AT_decl_line
	.word	75                              // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	7                               // Abbrev [7] 0x25c:0x5 DW_TAG_pointer_type
	.word	609                             // DW_AT_type
	.byte	5                               // Abbrev [5] 0x261:0x7 DW_TAG_base_type
	.word	.Linfo_string11                 // DW_AT_name
	.byte	5                               // DW_AT_encoding
	.byte	2                               // DW_AT_byte_size
	.byte	7                               // Abbrev [7] 0x268:0x5 DW_TAG_pointer_type
	.word	621                             // DW_AT_type
	.byte	5                               // Abbrev [5] 0x26d:0x7 DW_TAG_base_type
	.word	.Linfo_string13                 // DW_AT_name
	.byte	8                               // DW_AT_encoding
	.byte	1                               // DW_AT_byte_size
	.byte	7                               // Abbrev [7] 0x274:0x5 DW_TAG_pointer_type
	.word	633                             // DW_AT_type
	.byte	11                              // Abbrev [11] 0x279:0x21 DW_TAG_structure_type
	.word	.Linfo_string18                 // DW_AT_name
	.byte	4                               // DW_AT_byte_size
	.byte	2                               // DW_AT_decl_file
	.byte	7                               // DW_AT_decl_line
	.byte	12                              // Abbrev [12] 0x281:0xc DW_TAG_member
	.word	.Linfo_string16                 // DW_AT_name
	.word	609                             // DW_AT_type
	.byte	2                               // DW_AT_decl_file
	.byte	8                               // DW_AT_decl_line
	.byte	0                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x28d:0xc DW_TAG_member
	.word	.Linfo_string17                 // DW_AT_name
	.word	621                             // DW_AT_type
	.byte	2                               // DW_AT_decl_file
	.byte	9                               // DW_AT_decl_line
	.byte	2                               // DW_AT_data_member_location
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)" // string offset=0
.Linfo_string1:
	.asciz	"adpcm.c"                       // string offset=105
.Linfo_string2:
	.asciz	"/home/jiayu/cBench_V1.1/telecom_adpcm_c/src_work" // string offset=113
.Linfo_string3:
	.asciz	"stepsizeTable"                 // string offset=162
.Linfo_string4:
	.asciz	"int"                           // string offset=176
.Linfo_string5:
	.asciz	"__ARRAY_SIZE_TYPE__"           // string offset=180
.Linfo_string6:
	.asciz	"indexTable"                    // string offset=200
.Linfo_string7:
	.asciz	"signed char"                   // string offset=211
.Linfo_string8:
	.asciz	"adpcm_coder"                   // string offset=223
.Linfo_string9:
	.asciz	"adpcm_decoder"                 // string offset=235
.Linfo_string10:
	.asciz	"indata"                        // string offset=249
.Linfo_string11:
	.asciz	"short"                         // string offset=256
.Linfo_string12:
	.asciz	"outdata"                       // string offset=262
.Linfo_string13:
	.asciz	"char"                          // string offset=270
.Linfo_string14:
	.asciz	"len"                           // string offset=275
.Linfo_string15:
	.asciz	"state"                         // string offset=279
.Linfo_string16:
	.asciz	"valprev"                       // string offset=285
.Linfo_string17:
	.asciz	"index"                         // string offset=293
.Linfo_string18:
	.asciz	"adpcm_state"                   // string offset=299
.Linfo_string19:
	.asciz	"inp"                           // string offset=311
.Linfo_string20:
	.asciz	"outp"                          // string offset=315
.Linfo_string21:
	.asciz	"val"                           // string offset=320
.Linfo_string22:
	.asciz	"sign"                          // string offset=324
.Linfo_string23:
	.asciz	"delta"                         // string offset=329
.Linfo_string24:
	.asciz	"diff"                          // string offset=335
.Linfo_string25:
	.asciz	"step"                          // string offset=340
.Linfo_string26:
	.asciz	"valpred"                       // string offset=345
.Linfo_string27:
	.asciz	"vpdiff"                        // string offset=353
.Linfo_string28:
	.asciz	"outputbuffer"                  // string offset=360
.Linfo_string29:
	.asciz	"bufferstep"                    // string offset=373
.Linfo_string30:
	.asciz	"inputbuffer"                   // string offset=384
	.ident	"clang version 12.0.0 (https://github.com/llvm/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
