	.syntax unified
	.cpu cortex-m4
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu fpv4-sp-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	playNote
	.thumb
	.thumb_func
	.type	playNote, %function
playNote:
.LFB112:
	.file 1 "main.c"
	.loc 1 138 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 139 0
	subs	r0, r0, #1
.LVL1:
	fmsr	s15, r0	@ int
	.loc 1 138 0
	fstmfdd	sp!, {d8}
	.cfi_def_cfa_offset 16
	.cfi_offset 80, -16
	.cfi_offset 81, -12
	.loc 1 138 0
	fcpys	s16, s0
	fcpys	s17, s1
	.loc 1 139 0
	fconsts	s0, #0
.LVL2:
	fsitos	s1, s15
.LVL3:
	bl	powf
.LVL4:
	.loc 1 140 0
	flds	s15, .L3
	.loc 1 139 0
	fmuls	s0, s0, s16
.LVL5:
	.loc 1 140 0
	fmuls	s0, s0, s15
.LVL6:
	.loc 1 141 0
	fmuls	s0, s0, s17
.LVL7:
	bl	sinf
.LVL8:
	.loc 1 142 0
	fldmfdd	sp!, {d8}
	.cfi_restore 80
	.cfi_restore 81
	.cfi_def_cfa_offset 8
.LVL9:
	.loc 1 141 0
	ldr	r3, .L3+4
	fsts	s0, [r3]
	.loc 1 142 0
	pop	{r3, pc}
.L4:
	.align	2
.L3:
	.word	1086918608
	.word	y
	.cfi_endproc
.LFE112:
	.size	playNote, .-playNote
	.align	2
	.global	getData4DacUSART2
	.thumb
	.thumb_func
	.type	getData4DacUSART2, %function
getData4DacUSART2:
.LFB111:
	.loc 1 68 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL10:
	push	{r4, r5, r6, r7, r8, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 14, -4
	fstmfdd	sp!, {d8}
	.cfi_def_cfa_offset 32
	.cfi_offset 80, -32
	.cfi_offset 81, -28
	.loc 1 69 0
	flds	s16, .L30
	ldr	r7, .L30+4
	.loc 1 119 0
	fcpys	s17, s16
	.loc 1 68 0
	mov	r8, r0
	mov	r6, r1
	mov	r4, r2
	movs	r5, #0
.LVL11:
.L25:
	.loc 1 74 0
	cmp	r6, #13
	bhi	.L6
	tbb	[pc, r6]
.L8:
	.byte	(.L6-.L8)/2
	.byte	(.L9-.L8)/2
	.byte	(.L10-.L8)/2
	.byte	(.L11-.L8)/2
	.byte	(.L12-.L8)/2
	.byte	(.L13-.L8)/2
	.byte	(.L14-.L8)/2
	.byte	(.L15-.L8)/2
	.byte	(.L16-.L8)/2
	.byte	(.L17-.L8)/2
	.byte	(.L18-.L8)/2
	.byte	(.L19-.L8)/2
	.byte	(.L20-.L8)/2
	.byte	(.L21-.L8)/2
	.p2align 1
.L6:
	.loc 1 119 0
	fsts	s17, [r7]
.L22:
	.loc 1 124 0
	flds	s15, [r7]
	flds	s13, .L30+8
	.loc 1 126 0
	flds	s14, .L30+12
	.loc 1 124 0
	fmuls	s15, s15, s13
	uxtb	r1, r5
	ftouizs	s15, s15
	.loc 1 128 0
	cmp	r4, #7
	.loc 1 124 0
	fmrs	r3, s15	@ int
	.loc 1 126 0
	fadds	s16, s16, s14
.LVL12:
	.loc 1 124 0
	strh	r3, [r8, r1, lsl #1]	@ movhi
	.loc 1 128 0
	bhi	.L26
	.loc 1 132 0
	cmp	r4, #1
	it	cc
	movcc	r4, #1
.LVL13:
.L24:
	adds	r5, r5, #1
.LVL14:
	.loc 1 134 0
	b	.L25
.LVL15:
.L20:
	.loc 1 113 0
	flds	s0, .L30+16
	fcpys	s1, s16
	mov	r0, r4
	bl	playNote
.LVL16:
	.loc 1 114 0
	b	.L22
.L19:
	.loc 1 110 0
	flds	s0, .L30+20
	fcpys	s1, s16
	mov	r0, r4
	bl	playNote
.LVL17:
	.loc 1 111 0
	b	.L22
.L18:
	.loc 1 107 0
	flds	s0, .L30+24
	fcpys	s1, s16
	mov	r0, r4
	bl	playNote
.LVL18:
	.loc 1 108 0
	b	.L22
.L17:
	.loc 1 104 0
	flds	s0, .L30+28
	fcpys	s1, s16
	mov	r0, r4
	bl	playNote
.LVL19:
	.loc 1 105 0
	b	.L22
.L16:
	.loc 1 101 0
	flds	s0, .L30+32
	fcpys	s1, s16
	mov	r0, r4
	bl	playNote
.LVL20:
	.loc 1 102 0
	b	.L22
.L15:
	.loc 1 98 0
	flds	s0, .L30+36
	fcpys	s1, s16
	mov	r0, r4
	bl	playNote
.LVL21:
	.loc 1 99 0
	b	.L22
.L14:
	.loc 1 95 0
	flds	s0, .L30+40
	fcpys	s1, s16
	mov	r0, r4
	bl	playNote
.LVL22:
	.loc 1 96 0
	b	.L22
.L13:
	.loc 1 92 0
	flds	s0, .L30+44
	fcpys	s1, s16
	mov	r0, r4
	bl	playNote
.LVL23:
	.loc 1 93 0
	b	.L22
.L12:
	.loc 1 89 0
	flds	s0, .L30+48
	fcpys	s1, s16
	mov	r0, r4
	bl	playNote
.LVL24:
	.loc 1 90 0
	b	.L22
.L11:
	.loc 1 86 0
	flds	s0, .L30+52
	fcpys	s1, s16
	mov	r0, r4
	bl	playNote
.LVL25:
	.loc 1 87 0
	b	.L22
.L10:
	.loc 1 83 0
	flds	s0, .L30+56
	fcpys	s1, s16
	mov	r0, r4
	bl	playNote
.LVL26:
	.loc 1 84 0
	b	.L22
.L9:
	.loc 1 80 0
	flds	s0, .L30+60
	fcpys	s1, s16
	mov	r0, r4
	bl	playNote
.LVL27:
	.loc 1 81 0
	b	.L22
.L21:
	.loc 1 116 0
	flds	s0, .L30+64
	fcpys	s1, s16
	mov	r0, r4
	bl	playNote
.LVL28:
	.loc 1 117 0
	b	.L22
.L26:
	.loc 1 129 0
	movs	r4, #8
.LVL29:
	b	.L24
.L31:
	.align	2
.L30:
	.word	0
	.word	y
	.word	1165991936
	.word	944879383
	.word	1106698568
	.word	1105796792
	.word	1104936960
	.word	1104124314
	.word	1103358853
	.word	1102640579
	.word	1101959004
	.word	1101319373
	.word	1100711199
	.word	1100139725
	.word	1099599708
	.word	1099091149
	.word	1107479757
	.cfi_endproc
.LFE111:
	.size	getData4DacUSART2, .-getData4DacUSART2
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
.LFB110:
	.loc 1 35 0
	.cfi_startproc
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 36 0
	movs	r0, #45
	.loc 1 35 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 36 0
	bl	initUSART2
.LVL30:
	.loc 1 37 0
	bl	enIrqUSART2
.LVL31:
	.loc 1 38 0
	bl	initSYSTIM
.LVL32:
	.loc 1 40 0
	ldr	r0, .L34
	movs	r1, #0
	movs	r2, #1
	bl	getData4DacUSART2
.LVL33:
.L35:
	.align	2
.L34:
	.word	dac_buff
	.cfi_endproc
.LFE110:
	.size	main, .-main
	.comm	dac_buff,1000,4
	.global	utmp32
	.comm	y,4,4
	.comm	dev_addr,1,1
	.bss
	.align	2
	.type	utmp32, %object
	.size	utmp32, 4
utmp32:
	.space	4
	.text
.Letext0:
	.file 2 "/home/ozman/msut/STM32F407/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/home/ozman/msut/STM32F407/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h"
	.file 4 "../../../../STM32F407/Libraries/CMSIS/ST/STM32F4xx/Include/stm32f4xx.h"
	.file 5 "../../../../STM32F407/Libraries/CMSIS/Include/core_cm4.h"
	.file 6 "usart.h"
	.file 7 "i2c.h"
	.file 8 "/home/ozman/msut/STM32F407/gcc-arm-none-eabi/arm-none-eabi/include/math.h"
	.file 9 "delay.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x607
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF51
	.byte	0x1
	.4byte	.LASF52
	.4byte	.LASF53
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x1d
	.4byte	0x3e
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2b
	.4byte	0x57
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x3f
	.4byte	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0x41
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x15
	.4byte	0x33
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0x21
	.4byte	0x4c
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0x2c
	.4byte	0x5e
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x3
	.byte	0x2d
	.4byte	0x70
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF18
	.uleb128 0x5
	.4byte	0x9e
	.uleb128 0x5
	.4byte	0xa9
	.uleb128 0x5
	.4byte	0xb4
	.uleb128 0x6
	.byte	0x24
	.byte	0x4
	.2byte	0x34f
	.4byte	0x1d2
	.uleb128 0x7
	.ascii	"CR1\000"
	.byte	0x4
	.2byte	0x351
	.4byte	0xd6
	.byte	0
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x352
	.4byte	0xa9
	.byte	0x2
	.uleb128 0x7
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x353
	.4byte	0xd6
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x354
	.4byte	0xa9
	.byte	0x6
	.uleb128 0x7
	.ascii	"SR\000"
	.byte	0x4
	.2byte	0x355
	.4byte	0xd6
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x356
	.4byte	0xa9
	.byte	0xa
	.uleb128 0x7
	.ascii	"DR\000"
	.byte	0x4
	.2byte	0x357
	.4byte	0xd6
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x358
	.4byte	0xa9
	.byte	0xe
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x359
	.4byte	0xd6
	.byte	0x10
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x35a
	.4byte	0xa9
	.byte	0x12
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x35b
	.4byte	0xd6
	.byte	0x14
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x35c
	.4byte	0xa9
	.byte	0x16
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x35d
	.4byte	0xd6
	.byte	0x18
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x35e
	.4byte	0xa9
	.byte	0x1a
	.uleb128 0x8
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x35f
	.4byte	0xd6
	.byte	0x1c
	.uleb128 0x8
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x360
	.4byte	0xa9
	.byte	0x1e
	.uleb128 0x8
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x361
	.4byte	0xd6
	.byte	0x20
	.uleb128 0x8
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x362
	.4byte	0xa9
	.byte	0x22
	.byte	0
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x363
	.4byte	0xe0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF34
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF35
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF36
	.uleb128 0xa
	.4byte	.LASF40
	.byte	0x1
	.byte	0x89
	.4byte	.LFB112
	.4byte	.LFE112-.LFB112
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x273
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x1
	.byte	0x89
	.4byte	0x25
	.4byte	.LLST0
	.uleb128 0xc
	.ascii	"t\000"
	.byte	0x1
	.byte	0x89
	.4byte	0x25
	.4byte	.LLST1
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x1
	.byte	0x89
	.4byte	0x9e
	.4byte	.LLST2
	.uleb128 0xd
	.4byte	.LASF39
	.byte	0x1
	.byte	0x8b
	.4byte	0x25
	.4byte	.LLST3
	.uleb128 0xe
	.ascii	"w\000"
	.byte	0x1
	.byte	0x8c
	.4byte	0x25
	.4byte	.LLST4
	.uleb128 0xf
	.4byte	.LVL4
	.4byte	0x5ba
	.4byte	0x269
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x40000000
	.byte	0
	.uleb128 0x11
	.4byte	.LVL8
	.4byte	0x5d5
	.byte	0
	.uleb128 0xa
	.4byte	.LASF41
	.byte	0x1
	.byte	0x43
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4d4
	.uleb128 0xb
	.4byte	.LASF42
	.byte	0x1
	.byte	0x43
	.4byte	0x4d4
	.4byte	.LLST5
	.uleb128 0xb
	.4byte	.LASF43
	.byte	0x1
	.byte	0x43
	.4byte	0x9e
	.4byte	.LLST6
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x1
	.byte	0x43
	.4byte	0x9e
	.4byte	.LLST7
	.uleb128 0xe
	.ascii	"t\000"
	.byte	0x1
	.byte	0x45
	.4byte	0x25
	.4byte	.LLST8
	.uleb128 0xe
	.ascii	"n\000"
	.byte	0x1
	.byte	0x46
	.4byte	0x9e
	.4byte	.LLST9
	.uleb128 0xf
	.4byte	.LVL16
	.4byte	0x1f3
	.4byte	0x2f7
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x41
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x41f6e148
	.byte	0
	.uleb128 0xf
	.4byte	.LVL17
	.4byte	0x1f3
	.4byte	0x31f
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x41
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x41e91eb8
	.byte	0
	.uleb128 0xf
	.4byte	.LVL18
	.4byte	0x1f3
	.4byte	0x347
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x41
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x41dc0000
	.byte	0
	.uleb128 0xf
	.4byte	.LVL19
	.4byte	0x1f3
	.4byte	0x36f
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x41
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x41cf999a
	.byte	0
	.uleb128 0xf
	.4byte	.LVL20
	.4byte	0x1f3
	.4byte	0x397
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x41
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x41c3eb85
	.byte	0
	.uleb128 0xf
	.4byte	.LVL21
	.4byte	0x1f3
	.4byte	0x3bf
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x41
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x41b8f5c3
	.byte	0
	.uleb128 0xf
	.4byte	.LVL22
	.4byte	0x1f3
	.4byte	0x3e7
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x41
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x41ae8f5c
	.byte	0
	.uleb128 0xf
	.4byte	.LVL23
	.4byte	0x1f3
	.4byte	0x40f
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x41
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x41a4cccd
	.byte	0
	.uleb128 0xf
	.4byte	.LVL24
	.4byte	0x1f3
	.4byte	0x437
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x41
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x419b851f
	.byte	0
	.uleb128 0xf
	.4byte	.LVL25
	.4byte	0x1f3
	.4byte	0x45f
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x41
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x4192cccd
	.byte	0
	.uleb128 0xf
	.4byte	.LVL26
	.4byte	0x1f3
	.4byte	0x487
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x41
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x418a8f5c
	.byte	0
	.uleb128 0xf
	.4byte	.LVL27
	.4byte	0x1f3
	.4byte	0x4af
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x41
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x4182cccd
	.byte	0
	.uleb128 0x12
	.4byte	.LVL28
	.4byte	0x1f3
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x41
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x40
	.uleb128 0x7
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x4202cccd
	.byte	0
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0xa9
	.uleb128 0x14
	.4byte	.LASF54
	.byte	0x1
	.byte	0x22
	.4byte	0x90
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x540
	.uleb128 0x15
	.ascii	"k\000"
	.byte	0x1
	.byte	0x36
	.4byte	0xbf
	.uleb128 0xf
	.4byte	.LVL30
	.4byte	0x5eb
	.4byte	0x510
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x2d
	.byte	0
	.uleb128 0x11
	.4byte	.LVL31
	.4byte	0x5fc
	.uleb128 0x11
	.4byte	.LVL32
	.4byte	0x603
	.uleb128 0x12
	.4byte	.LVL33
	.4byte	0x273
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	dac_buff
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF44
	.byte	0x5
	.2byte	0x51b
	.4byte	0xdb
	.uleb128 0x17
	.4byte	.LASF43
	.byte	0x6
	.byte	0x1c
	.4byte	0xd1
	.uleb128 0x17
	.4byte	.LASF38
	.byte	0x6
	.byte	0x1d
	.4byte	0xd1
	.uleb128 0x18
	.4byte	.LASF45
	.byte	0x7
	.byte	0x14
	.4byte	0xd1
	.uleb128 0x5
	.byte	0x3
	.4byte	dev_addr
	.uleb128 0x19
	.ascii	"y\000"
	.byte	0x1
	.byte	0x1b
	.4byte	0x582
	.uleb128 0x5
	.byte	0x3
	.4byte	y
	.uleb128 0x5
	.4byte	0x25
	.uleb128 0x18
	.4byte	.LASF46
	.byte	0x1
	.byte	0x1c
	.4byte	0xbf
	.uleb128 0x5
	.byte	0x3
	.4byte	utmp32
	.uleb128 0x1a
	.4byte	0xa9
	.4byte	0x5a9
	.uleb128 0x1b
	.4byte	0xca
	.2byte	0x1f3
	.byte	0
	.uleb128 0x18
	.4byte	.LASF42
	.byte	0x1
	.byte	0x1d
	.4byte	0x598
	.uleb128 0x5
	.byte	0x3
	.4byte	dac_buff
	.uleb128 0x1c
	.4byte	.LASF47
	.byte	0x8
	.2byte	0x14f
	.4byte	0x25
	.4byte	0x5d5
	.uleb128 0x1d
	.4byte	0x25
	.uleb128 0x1d
	.4byte	0x25
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF48
	.byte	0x8
	.2byte	0x13c
	.4byte	0x25
	.4byte	0x5eb
	.uleb128 0x1d
	.4byte	0x25
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF55
	.byte	0x6
	.byte	0x22
	.4byte	0x5fc
	.uleb128 0x1d
	.4byte	0xbf
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF49
	.byte	0x6
	.byte	0x2c
	.uleb128 0x1f
	.4byte	.LASF50
	.byte	0x9
	.byte	0x17
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x2
	.byte	0x90
	.uleb128 0x40
	.4byte	.LVL2
	.4byte	.LVL9
	.2byte	0x2
	.byte	0x90
	.uleb128 0x50
	.4byte	.LVL9
	.4byte	.LFE112
	.2byte	0x6
	.byte	0xf3
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x40
	.uleb128 0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0x2
	.byte	0x90
	.uleb128 0x41
	.4byte	.LVL3
	.4byte	.LFE112
	.2byte	0x2
	.byte	0x90
	.uleb128 0x51
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1
	.4byte	.LFE112
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x8
	.byte	0xf5
	.uleb128 0x40
	.uleb128 0x25
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.byte	0x1e
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x2
	.byte	0x90
	.uleb128 0x40
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x10
	.byte	0xf5
	.uleb128 0x40
	.uleb128 0x25
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.byte	0x1e
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x40c90fd0
	.byte	0x1e
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x2
	.byte	0x90
	.uleb128 0x40
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11
	.4byte	.LFE111
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL11
	.4byte	.LFE111
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL11
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL29
	.4byte	.LFE111
	.2byte	0x2
	.byte	0x38
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x6
	.byte	0x9e
	.uleb128 0x4
	.4byte	0
	.4byte	.LVL11
	.4byte	.LFE111
	.2byte	0x2
	.byte	0x90
	.uleb128 0x50
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LFE111
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.LFB110
	.4byte	.LFE110
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF47:
	.ascii	"powf\000"
.LASF3:
	.ascii	"short int\000"
.LASF50:
	.ascii	"initSYSTIM\000"
.LASF18:
	.ascii	"sizetype\000"
.LASF54:
	.ascii	"main\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF5:
	.ascii	"__uint16_t\000"
.LASF49:
	.ascii	"enIrqUSART2\000"
.LASF27:
	.ascii	"TXCRCR\000"
.LASF25:
	.ascii	"RXCRCR\000"
.LASF14:
	.ascii	"uint8_t\000"
.LASF37:
	.ascii	"noteFrequency\000"
.LASF42:
	.ascii	"dac_buff\000"
.LASF0:
	.ascii	"float\000"
.LASF11:
	.ascii	"long long int\000"
.LASF8:
	.ascii	"long int\000"
.LASF55:
	.ascii	"initUSART2\000"
.LASF4:
	.ascii	"__uint8_t\000"
.LASF36:
	.ascii	"long double\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF38:
	.ascii	"octave\000"
.LASF1:
	.ascii	"signed char\000"
.LASF12:
	.ascii	"long long unsigned int\000"
.LASF17:
	.ascii	"uint32_t\000"
.LASF13:
	.ascii	"unsigned int\000"
.LASF15:
	.ascii	"uint16_t\000"
.LASF45:
	.ascii	"dev_addr\000"
.LASF10:
	.ascii	"long unsigned int\000"
.LASF53:
	.ascii	"/home/ozman/msut/STM32F407/examples/tk402_projekat_"
	.ascii	"annamari_milic_osman_azabagic_osman_nezic/piano\000"
.LASF48:
	.ascii	"sinf\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF34:
	.ascii	"char\000"
.LASF16:
	.ascii	"int32_t\000"
.LASF33:
	.ascii	"SPI_TypeDef\000"
.LASF31:
	.ascii	"I2SPR\000"
.LASF43:
	.ascii	"note\000"
.LASF23:
	.ascii	"CRCPR\000"
.LASF39:
	.ascii	"Frequency\000"
.LASF19:
	.ascii	"RESERVED0\000"
.LASF20:
	.ascii	"RESERVED1\000"
.LASF21:
	.ascii	"RESERVED2\000"
.LASF22:
	.ascii	"RESERVED3\000"
.LASF24:
	.ascii	"RESERVED4\000"
.LASF26:
	.ascii	"RESERVED5\000"
.LASF28:
	.ascii	"RESERVED6\000"
.LASF30:
	.ascii	"RESERVED7\000"
.LASF32:
	.ascii	"RESERVED8\000"
.LASF35:
	.ascii	"double\000"
.LASF40:
	.ascii	"playNote\000"
.LASF44:
	.ascii	"ITM_RxBuffer\000"
.LASF41:
	.ascii	"getData4DacUSART2\000"
.LASF46:
	.ascii	"utmp32\000"
.LASF7:
	.ascii	"__int32_t\000"
.LASF52:
	.ascii	"main.c\000"
.LASF29:
	.ascii	"I2SCFGR\000"
.LASF51:
	.ascii	"GNU C 4.9.3 20141119 (release) [ARM/embedded-4_9-br"
	.ascii	"anch revision 218278] -mlittle-endian -mthumb -mcpu"
	.ascii	"=cortex-m4 -mthumb-interwork -mfloat-abi=hard -mfpu"
	.ascii	"=fpv4-sp-d16 -g -O2 -fsingle-precision-constant\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20141119 (release) [ARM/embedded-4_9-branch revision 218278]"
