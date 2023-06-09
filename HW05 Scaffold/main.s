	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	r0, .L4
	ldr	r1, .L4+4
	push	{r4, lr}
	ldr	r2, .L4+8
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	mov	ip, #4352
	mov	r0, #8
	mov	r3, #67108864
	ldr	r4, .L4+12
	ldr	r1, .L4+16
	ldr	r2, .L4+20
	strh	ip, [r3]	@ movhi
	strh	r0, [r4, #12]	@ movhi
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r3, #512
	ldr	r4, .L4+28
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	rSeed
	.word	hideSprites
	.word	shadowOAM
	.word	16452
	.word	-16296
	.word	waitForVBlank
	.word	DMANow
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #67108864
	mov	lr, #4352
	mov	r3, #56320
	mov	r1, #55040
	ldr	ip, .L8
	ldr	r2, .L8+4
	strh	lr, [r0]	@ movhi
	ldr	r4, .L8+8
	strh	r3, [r0, #8]	@ movhi
	strh	r2, [r0, #10]	@ movhi
	mov	r3, #2960
	strh	r1, [r0, #12]	@ movhi
	ldr	r2, .L8+12
	strh	ip, [r0, #14]	@ movhi
	ldr	r1, .L8+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L8+24
	ldr	r1, .L8+28
	mov	lr, pc
	bx	r4
	mov	r3, #1472
	mov	r0, #3
	ldr	r2, .L8+32
	ldr	r1, .L8+36
	mov	lr, pc
	bx	r4
	mov	r3, #32
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+40
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L8+44
	ldr	r1, .L8+48
	mov	lr, pc
	bx	r4
	mov	r3, #384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L8+52
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+56
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L8+60
	ldr	r1, .L8+64
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L8+68
	ldr	r1, .L8+72
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+76
	ldr	r1, .L8+80
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L8+84
	ldr	r1, .L8+88
	mov	lr, pc
	bx	r4
	mov	r1, #0
	ldr	r3, .L8+92
	ldr	r0, .L8+96
	ldrh	ip, [r3, #48]
	ldr	r2, .L8+100
	ldr	r3, .L8+104
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+108
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+112
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	5128
	.word	6916
	.word	DMANow
	.word	100696064
	.word	winscreenTiles
	.word	winscreenPal
	.word	100704256
	.word	winscreenMap
	.word	100679680
	.word	losescreenTiles
	.word	losescreenPal
	.word	100718592
	.word	losescreenMap
	.word	tilesetTiles
	.word	tilesetPal
	.word	100720640
	.word	tilemapMap
	.word	100710400
	.word	tilemap2Map
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose.part.0, %function
lose.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L13:
	.align	2
.L12:
	.word	buttons
	.size	lose.part.0, .-lose.part.0
	.set	win.part.0,lose.part.0
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L21
	ldr	r3, [r4]
	ldr	r2, .L21+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+12
	ldrh	r3, [r3]
	ands	r5, r3, #8
	beq	.L20
.L14:
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	ldr	r3, .L21+16
	mov	lr, pc
	bx	r3
	ldr	r2, .L21+20
	ldr	r0, [r4]
	ldr	r3, .L21+24
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+28
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L21+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L22:
	.align	2
.L21:
	.word	rSeed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	hideLogo
	.word	time
	.word	srand
	.word	initGame
	.word	state
	.size	start, .-start
	.align	2
	.global	goToGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame1, %function
goToGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L24
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	state
	.size	goToGame1, .-goToGame1
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #80
	push	{r4, lr}
	ldr	r4, .L28
	ldrh	r3, [r4]
	ldr	ip, .L28+4
	ldr	r0, .L28+8
	orr	r3, r3, #512
	strh	ip, [r4, #208]	@ movhi
	strh	r0, [r4, #210]	@ movhi
	strh	r1, [r4, #212]	@ movhi
	strh	r3, [r4]	@ movhi
	ldr	r2, .L28+12
	mov	lr, pc
	bx	r2
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r4, .L28+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L28+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L29:
	.align	2
.L28:
	.word	shadowOAM
	.word	16460
	.word	16488
	.word	waitForVBlank
	.word	DMANow
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L40
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L40+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r4, .L40+8
	ldrh	r3, [r4, #208]
	orr	r3, r3, #512
	strh	r3, [r4, #208]	@ movhi
	ldr	r2, .L40+12
	mov	lr, pc
	bx	r2
	mov	r2, #117440512
	mov	r1, r4
	mov	r3, #512
	ldr	r4, .L40+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L40+20
	ldr	r3, [r3]
	cmp	r3, #9
	movgt	r2, #4
	movle	r2, #2
	ldr	r3, .L40+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L41:
	.align	2
.L40:
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	score
	.word	state
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4608
	push	{r4, r5, r6, lr}
	ldr	r3, .L44
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r5, #120
	mov	lr, #130
	mov	ip, #140
	ldr	r2, .L44+4
	ldr	r3, .L44+8
	ldr	r1, [r2]
	ldr	r2, [r3]
	ldr	r3, .L44+12
	ldr	r0, .L44+16
	ldr	r4, .L44+20
	ldr	r3, [r3]
	add	r1, r1, #16
	and	r1, r1, r0
	strh	r1, [r4, #188]	@ movhi
	add	r2, r2, #16
	ldr	r1, .L44+24
	add	r3, r3, #16
	and	r2, r2, r0
	and	r3, r3, r0
	strh	lr, [r4, #194]	@ movhi
	strh	r5, [r4, #186]	@ movhi
	strh	r2, [r4, #196]	@ movhi
	strh	r3, [r4, #204]	@ movhi
	strh	ip, [r4, #202]	@ movhi
	strh	r1, [r4, #184]	@ movhi
	strh	r1, [r4, #192]	@ movhi
	strh	r1, [r4, #200]	@ movhi
	ldr	r0, .L44+28
	mov	lr, pc
	bx	r0
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r4, .L44+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r3, .L44+36
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L45:
	.align	2
.L44:
	.word	hideSprites
	.word	score1
	.word	score2
	.word	score3
	.word	1023
	.word	shadowOAM
	.word	-32681
	.word	waitForVBlank
	.word	DMANow
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L49
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+4
	ldrh	r3, [r3]
	tst	r3, #8
	popne	{r4, lr}
	bne	lose.part.0
.L46:
	pop	{r4, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	oldButtons
	.size	lose, .-lose
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #5120
	push	{r4, lr}
	ldr	r3, .L53
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r0, #112
	ldr	r4, .L53+4
	ldr	r1, .L53+8
	ldr	r2, .L53+12
	strh	r0, [r4, #244]	@ movhi
	strh	r1, [r4, #240]	@ movhi
	strh	r2, [r4, #242]	@ movhi
	ldr	r3, .L53+16
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r4, .L53+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L53+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
	.word	hideSprites
	.word	shadowOAM
	.word	16452
	.word	-16296
	.word	waitForVBlank
	.word	DMANow
	.word	state
	.size	goToGame2, .-goToGame2
	.align	2
	.global	game1
	.syntax unified
	.arm
	.fpu softvfp
	.type	game1, %function
game1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L69
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
	ldr	r3, .L69+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L66
.L56:
	ldr	r3, .L69+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L67
	ldr	r3, .L69+24
	ldr	r3, [r3]
	cmp	r3, #10
	beq	.L68
.L55:
	pop	{r4, lr}
	bx	lr
.L67:
	bl	goToLose
	ldr	r3, .L69+24
	ldr	r3, [r3]
	cmp	r3, #10
	bne	.L55
.L68:
	pop	{r4, lr}
	b	goToGame2
.L66:
	bl	goToPause
	b	.L56
.L70:
	.align	2
.L69:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	gameOver
	.word	score
	.size	game1, .-game1
	.align	2
	.global	gameTransition
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameTransition, %function
gameTransition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L80
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L80+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	ldr	r2, .L80+8
	ldrh	r3, [r2, #240]
	orr	r3, r3, #512
	push	{r4, lr}
	ldr	r1, .L80+12
	strh	r3, [r2, #240]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r2, #4
	ldr	r3, .L80+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L81:
	.align	2
.L80:
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
	.word	initGame2
	.word	state
	.size	gameTransition, .-gameTransition
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #6144
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L84
	sub	sp, sp, #28
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r1, .L84+4
	ldr	r2, .L84+8
	ldr	r3, .L84+12
	ldr	r0, [r1]
	ldr	lr, [r2]
	ldr	r4, [r3]
	ldr	r2, .L84+16
	add	lr, r0, lr
	ldr	ip, .L84+20
	add	lr, lr, r4
	smull	r3, fp, r2, lr
	smull	r3, r10, ip, lr
	smull	r3, r9, ip, r0
	smull	r3, r1, r2, r0
	smull	r3, r8, ip, r4
	smull	r3, r2, r4, r2
	asr	r7, lr, #31
	asr	r3, r0, #31
	rsb	fp, r7, fp, asr #5
	str	fp, [sp]
	rsb	r1, r3, r1, asr #5
	rsb	fp, r7, r10, asr #2
	rsb	r3, r3, r9, asr #2
	asr	r7, r4, #31
	rsb	r10, r7, r8, asr #2
	rsb	r2, r7, r2, asr #5
	smull	r7, r9, ip, r1
	smull	r8, r7, ip, r3
	str	r7, [sp, #4]
	smull	r7, r8, ip, r2
	str	r8, [sp, #8]
	smull	r7, r8, ip, r10
	str	r8, [sp, #12]
	ldr	r8, [sp]
	smull	r7, r8, ip, r8
	str	r8, [sp, #16]
	smull	r7, r8, ip, fp
	str	r8, [sp, #20]
	add	r8, fp, fp, lsl #2
	add	ip, r3, r3, lsl #2
	sub	lr, lr, r8, lsl #1
	ldr	r8, .L84+24
	sub	r0, r0, ip, lsl #1
	add	r0, r0, #16
	add	ip, r8, #268
	strh	r0, [ip]	@ movhi
	mov	ip, #130	@ movhi
	ldr	r0, .L84+28
	ldr	r0, [r0]
	strh	ip, [r8, #186]	@ movhi
	ldr	ip, .L84+32
	add	r0, r0, #16
	and	r0, r0, ip
	strh	r0, [r8, #188]	@ movhi
	ldr	r0, .L84+36
	ldr	r0, [r0]
	add	r0, r0, #16
	and	r0, r0, ip
	strh	r0, [r8, #196]	@ movhi
	ldr	r0, .L84+40
	ldr	r0, [r0]
	add	r0, r0, #16
	and	ip, ip, r0
	asr	r0, r1, #31
	rsb	r9, r0, r9, asr #2
	add	r9, r9, r9, lsl #2
	sub	r1, r1, r9, lsl #1
	add	r1, r1, #16
	strh	r1, [r8, #252]	@ movhi
	ldr	r1, [sp, #4]
	asr	r9, r3, #31
	rsb	r7, r9, r1, asr #2
	add	r7, r7, r7, lsl #2
	sub	r3, r3, r7, lsl #1
	add	r1, r8, #260
	add	r3, r3, #16
	strh	r3, [r1]	@ movhi
	strh	ip, [r8, #204]	@ movhi
	add	r3, r10, r10, lsl #2
	ldr	ip, [sp, #8]
	sub	r4, r4, r3, lsl #1
	asr	r3, r2, #31
	rsb	r3, r3, ip, asr #2
	add	r3, r3, r3, lsl #2
	ldr	r1, [sp]
	sub	r2, r2, r3, lsl #1
	ldr	r3, [sp, #12]
	ldr	r0, [sp, #16]
	asr	r7, r10, #31
	rsb	r7, r7, r3, asr #2
	asr	r3, r1, #31
	rsb	r3, r3, r0, asr #2
	mov	r5, #150
	add	r3, r3, r3, lsl #2
	sub	r3, r1, r3, lsl #1
	ldr	r1, [sp, #20]
	mov	r6, #140
	asr	ip, fp, #31
	rsb	ip, ip, r1, asr #2
	add	ip, ip, ip, lsl #2
	sub	ip, fp, ip, lsl #1
	mov	fp, #160	@ movhi
	add	r7, r7, r7, lsl #2
	add	r1, r8, #276
	sub	r7, r10, r7, lsl #1
	add	r2, r2, #16
	ldr	r0, .L84+44
	strh	r2, [r1]	@ movhi
	add	r7, r7, #16
	add	r2, r8, #284
	strh	r7, [r2]	@ movhi
	add	r7, r8, #256
	ldr	r9, .L84+48
	strh	r0, [r7]	@ movhi
	strh	r5, [r7, #2]	@ movhi
	add	r7, r8, #264
	strh	r0, [r8, #248]	@ movhi
	strh	r5, [r8, #202]	@ movhi
	strh	r0, [r7]	@ movhi
	add	r0, r8, #272
	strh	r9, [r0]	@ movhi
	strh	r6, [r0, #2]	@ movhi
	add	r0, r8, #280
	strh	r9, [r0]	@ movhi
	strh	r5, [r0, #2]	@ movhi
	ldr	r1, .L84+52
	add	r0, r8, #288
	ldr	r2, .L84+56
	strh	r9, [r0]	@ movhi
	add	lr, lr, #16
	add	r9, r8, #316
	strh	fp, [r7, #2]	@ movhi
	strh	fp, [r0, #2]	@ movhi
	strh	lr, [r9]	@ movhi
	add	r0, r8, #304
	add	ip, ip, #16
	add	lr, r8, #308
	strh	r1, [r8, #184]	@ movhi
	strh	r1, [r8, #192]	@ movhi
	strh	r1, [r8, #200]	@ movhi
	add	r3, r3, #16
	add	r1, r8, #312
	add	r7, r8, #296
	add	r4, r4, #16
	add	r10, r8, #292
	add	r9, r8, #300
	strh	r4, [r10]	@ movhi
	strh	r2, [r7]	@ movhi
	strh	r5, [r0, #2]	@ movhi
	strh	r2, [r0]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	fp, [r1, #2]	@ movhi
	strh	r3, [r9]	@ movhi
	strh	ip, [lr]	@ movhi
	strh	r6, [r8, #194]	@ movhi
	strh	r6, [r8, #250]	@ movhi
	strh	r6, [r7, #2]	@ movhi
	ldr	r4, .L84+60
	mov	lr, pc
	bx	r4
	mov	r1, r8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L84+64
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L84+68
	str	r2, [r3]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	hideSprites
	.word	bonusScore1
	.word	score
	.word	bonusScore2
	.word	1374389535
	.word	1717986919
	.word	shadowOAM
	.word	score1
	.word	1023
	.word	score2
	.word	score3
	.word	-32678
	.word	-32661
	.word	-32695
	.word	-32644
	.word	waitForVBlank
	.word	DMANow
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	game2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game2, %function
game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L100
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L87
	ldr	r3, .L100+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L97
.L87:
	ldr	r3, .L100+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L98
	ldr	r3, .L100+24
	ldr	r3, [r3]
	cmp	r3, #20
	beq	.L99
.L86:
	pop	{r4, lr}
	bx	lr
.L98:
	bl	goToLose
	ldr	r3, .L100+24
	ldr	r3, [r3]
	cmp	r3, #20
	bne	.L86
.L99:
	pop	{r4, lr}
	b	goToWin
.L97:
	bl	goToPause
	b	.L87
.L101:
	.align	2
.L100:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	gameOver
	.word	score
	.size	game2, .-game2
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Debug Log Initialized!\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L117
	mov	lr, pc
	bx	r3
	ldr	r7, .L117+4
	ldr	r0, .L117+8
	ldr	r3, .L117+12
	ldr	r6, .L117+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L117+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L117+24
	ldrh	r0, [r7]
	ldr	r1, [r6]
	ldr	fp, .L117+28
	ldr	r10, .L117+32
	ldr	r9, .L117+36
	ldr	r8, .L117+40
	ldr	r4, .L117+44
.L103:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r1, #6
	ldrls	pc, [pc, r1, asl #2]
	b	.L114
.L107:
	.word	.L112
	.word	.L111
	.word	.L110
	.word	.L109
	.word	.L108
	.word	.L104
	.word	.L106
.L106:
	ldr	r3, .L117+48
	mov	lr, pc
	bx	r3
	ldrh	r0, [r7]
	ldr	r1, [r6]
	b	.L103
.L108:
	ldr	r3, .L117+52
	mov	lr, pc
	bx	r3
	ldrh	r0, [r7]
	ldr	r1, [r6]
	b	.L103
.L109:
	mov	lr, pc
	bx	r8
	ldrh	r0, [r7]
	ldr	r1, [r6]
	b	.L103
.L110:
	mov	lr, pc
	bx	r9
	ldrh	r0, [r7]
	ldr	r1, [r6]
	b	.L103
.L111:
	mov	lr, pc
	bx	r10
	ldrh	r0, [r7]
	ldr	r1, [r6]
	b	.L103
.L112:
	mov	lr, pc
	bx	fp
	ldrh	r0, [r7]
	ldr	r1, [r6]
	b	.L103
.L113:
	strh	r3, [r5]	@ movhi
	ldrh	r1, [r4, #48]
	mov	r0, r3
	mov	r3, r1
	strh	r1, [r7]	@ movhi
.L104:
	tst	r0, #8
	beq	.L113
	ldr	r3, .L117+56
	mov	lr, pc
	bx	r3
	ldrh	r0, [r7]
	ldr	r1, [r6]
	b	.L103
.L114:
	mov	r0, r3
	b	.L103
.L118:
	.align	2
.L117:
	.word	mgba_open
	.word	buttons
	.word	.LC0
	.word	mgba_printf
	.word	state
	.word	initialize
	.word	oldButtons
	.word	start
	.word	pause
	.word	game1
	.word	gameTransition
	.word	67109120
	.word	lose
	.word	game2
	.word	win.part.0
	.size	main, .-main
	.text
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L121
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L122:
	.align	2
.L121:
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	testTilemap
	.syntax unified
	.arm
	.fpu softvfp
	.type	testTilemap, %function
testTilemap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	testTilemap, .-testTilemap
	.comm	rSeed,4,4
	.comm	state,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
