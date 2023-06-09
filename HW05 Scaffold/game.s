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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveLeft.part.0, %function
canMoveLeft.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L6
	str	lr, [sp, #-4]!
	ldr	r3, .L6+4
	ldr	r2, [r1, #4]
	ldr	ip, [r3]
	ldr	lr, [r1, #8]
	ldr	r3, [r1]
	add	r0, r2, #2
	add	r0, ip, r0, lsl #9
	sub	r3, r3, lr
	ldrb	r0, [r0, r3]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1
	ldr	r1, [r1, #20]
	add	r2, r2, r1
	sub	r2, r2, #3
	add	r2, ip, r2, lsl #9
	ldrb	r0, [r2, r3]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
.L1:
	ldr	lr, [sp], #4
	bx	lr
.L7:
	.align	2
.L6:
	.word	player
	.word	collisionMap
	.size	canMoveLeft.part.0, .-canMoveLeft.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveRight.part.0, %function
canMoveRight.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L12
	str	lr, [sp, #-4]!
	ldr	r0, .L12+4
	ldr	ip, [r2, #16]
	ldr	r3, [r2]
	ldr	r1, [r2, #4]
	add	r3, r3, ip
	ldr	lr, [r2, #8]
	ldr	ip, [r0]
	sub	r3, r3, #1
	add	r0, r1, #2
	add	r3, r3, lr
	add	r0, ip, r0, lsl #9
	ldrb	r0, [r0, r3]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L8
	ldr	r2, [r2, #20]
	add	r1, r1, r2
	sub	r1, r1, #3
	add	r1, ip, r1, lsl #9
	ldrb	r0, [r1, r3]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
.L8:
	ldr	lr, [sp], #4
	bx	lr
.L13:
	.align	2
.L12:
	.word	player
	.word	collisionMap
	.size	canMoveRight.part.0, .-canMoveRight.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveUp.part.0, %function
canMoveUp.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L17
	ldr	r3, .L17+4
	ldr	r0, [r2, #12]
	ldr	ip, [r2]
	ldr	r3, [r3]
	ldr	r1, [r2, #4]
	add	r3, r3, ip
	sub	r1, r1, r0
	add	r3, r3, r1, lsl #9
	ldrb	r0, [r3, #2]	@ zero_extendqisi2
	cmp	r0, #0
	bxeq	lr
	ldr	r2, [r2, #16]
	add	r3, r3, r2
	ldrb	r0, [r3, #-3]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L18:
	.align	2
.L17:
	.word	player
	.word	collisionMap
	.size	canMoveUp.part.0, .-canMoveUp.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveDown.part.0, %function
canMoveDown.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L22
	ldr	r2, .L22+4
	ldr	r0, [r1, #20]
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #12]
	add	r3, r3, r0
	ldr	r2, [r2]
	ldr	r0, [r1]
	sub	r3, r3, #1
	add	r2, r2, r0
	add	r3, r3, ip
	add	r3, r2, r3, lsl #9
	ldrb	r0, [r3, #2]	@ zero_extendqisi2
	cmp	r0, #0
	bxeq	lr
	ldr	r2, [r1, #16]
	add	r3, r3, r2
	ldrb	r0, [r3, #-3]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L23:
	.align	2
.L22:
	.word	player
	.word	collisionMap
	.size	canMoveDown.part.0, .-canMoveDown.part.0
	.align	2
	.global	hideLogo
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideLogo, %function
hideLogo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L25
	ldrh	r3, [r2, #8]
	orr	r3, r3, #512
	strh	r3, [r2, #8]	@ movhi
	bx	lr
.L26:
	.align	2
.L25:
	.word	shadowOAM
	.size	hideLogo, .-hideLogo
	.align	2
	.global	initFuel
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFuel, %function
initFuel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #6
	mov	lr, #208
	mov	ip, #32
	mov	r0, #0
	mov	r1, #240
	ldr	r3, .L29
	str	lr, [r3]
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #4]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L30:
	.align	2
.L29:
	.word	fuel
	.size	initFuel, .-initFuel
	.align	2
	.global	initSmoke
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSmoke, %function
initSmoke:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L32
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r1, [r3, #36]
	str	r1, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L33:
	.align	2
.L32:
	.word	smoke
	.size	initSmoke, .-initSmoke
	.align	2
	.global	initRocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRocks, %function
initRocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	ldr	r7, .L48
	ldr	r4, .L48+4
	ldr	r9, .L48+8
	ldr	r8, .L48+12
	add	r6, r7, #36
.L42:
	mov	lr, pc
	bx	r4
	rsbs	r3, r0, #0
	and	r3, r3, r8
	and	r0, r0, r8
	rsbpl	r0, r3, #0
	str	r0, [r7]
	mov	lr, pc
	bx	r4
	rsbs	r3, r0, #0
	and	r3, r3, r8
	and	r0, r0, r8
	rsbpl	r0, r3, #0
	ldr	r2, [r7]
	ldr	r3, [r9]
	stmib	r7, {r0, r5}
	add	r1, r2, #15
	add	r2, r3, r2
	add	r3, r3, r1
	ldrb	r1, [r2, r0, lsl #9]	@ zero_extendqisi2
	cmp	r1, #0
	lsl	r1, r0, #9
	beq	.L42
	ldrb	r0, [r3, r0, lsl #9]	@ zero_extendqisi2
	cmp	r0, #0
	add	r1, r1, #7680
	beq	.L42
	ldrb	r2, [r2, r1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L42
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L42
	add	r7, r7, #12
	cmp	r7, r6
	bne	.L42
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	rocks
	.word	rand
	.word	collisionMap
	.word	511
	.size	initRocks, .-initRocks
	.align	2
	.global	initlives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initlives, %function
initlives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #140
	mov	r2, #0
	mov	r4, #5
	mov	lr, #25
	mov	ip, #45
	mov	r0, #3
	ldr	r3, .L52
	str	r4, [r3, #4]
	str	lr, [r3, #12]
	str	ip, [r3, #20]
	str	r0, [r3]
	str	r1, [r3, #8]
	str	r1, [r3, #16]
	str	r1, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	pop	{r4, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	life
	.size	initlives, .-initlives
	.align	2
	.global	initFlags
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFlags, %function
initFlags:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #12
	mov	r8, r3
	str	r3, [sp, #4]
	ldr	r3, .L68
	ldr	r6, .L68+4
	ldr	r10, .L68+8
	ldr	r4, .L68+12
	add	r9, r3, #8
.L55:
	ldr	r3, [sp, #4]
	ldr	r2, .L68
	add	r5, r2, r3, lsl #4
	add	r2, r2, #4
	lsl	fp, r3, #4
	add	r7, r2, r3, lsl #4
.L62:
	mov	lr, pc
	bx	r6
	rsbs	r3, r0, #0
	and	r3, r3, r4
	and	r0, r0, r4
	rsbpl	r0, r3, #0
	str	r0, [r5]
	mov	lr, pc
	bx	r6
	rsbs	r3, r0, #0
	and	r3, r3, r4
	and	r0, r0, r4
	rsbpl	r0, r3, #0
	ldr	r3, .L68+16
	str	r0, [r7]
	str	r8, [r9, fp]
	str	r8, [r3, fp]
	ldr	r3, [r10]
	ldr	r2, [r5]
	add	r1, r2, #15
	add	r2, r3, r2
	add	r3, r3, r1
	ldrb	r1, [r2, r0, lsl #9]	@ zero_extendqisi2
	cmp	r1, #0
	lsl	r1, r0, #9
	beq	.L62
	ldrb	r0, [r3, r0, lsl #9]	@ zero_extendqisi2
	cmp	r0, #0
	add	r1, r1, #7680
	beq	.L62
	ldrb	r2, [r2, r1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L62
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L62
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	cmp	r3, #10
	str	r3, [sp, #4]
	bne	.L55
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	flags
	.word	rand
	.word	collisionMap
	.word	511
	.word	flags+12
	.size	initFlags, .-initFlags
	.align	2
	.global	initScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	initScore, %function
initScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L71
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	bx	lr
.L72:
	.align	2
.L71:
	.word	scoreDisplay
	.size	initScore, .-initScore
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L77
	push	{r4, r5, lr}
	mov	r0, #1
	mov	r3, r2
	mov	ip, #16
	mov	r5, #2
	mov	r1, #0
	mov	r4, #4
	add	lr, r2, #168
.L74:
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r5, [r3, #28]
	str	r0, [r3, #32]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r4, [r3, #40]
	str	r1, [r3, #44]
	str	r1, [r3, #48]
	add	r3, r3, #56
	cmp	r3, lr
	bne	.L74
	mov	lr, #48
	add	r0, r2, #72
	ldm	r0, {r0, r1}
	ldr	ip, [r2, #20]
	ldr	r3, [r2, #128]
	rsb	ip, ip, #456
	rsb	r0, r0, #456
	rsb	r1, r1, #456
	rsb	r3, r3, #456
	str	lr, [r2]
	str	lr, [r2, #116]
	str	ip, [r2, #4]
	str	r0, [r2, #56]
	str	r1, [r2, #60]
	str	r3, [r2, #112]
	pop	{r4, r5, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	enemies
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r4, r5, r6, r7, r8, lr}
	mov	r2, #48
	mov	r4, #0
	mov	lr, #2
	mov	ip, #16
	mov	r8, #4
	mov	r0, #6
	mov	r7, #208
	mov	r6, #32
	mov	r5, #240
	ldr	r3, .L81
	str	r1, [r3]
	ldr	r3, .L81+4
	str	r2, [r3]
	str	r1, [r3, #32]
	str	r8, [r3, #40]
	str	r2, [r3, #4]
	str	lr, [r3, #8]
	str	lr, [r3, #12]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r4, [r3, #28]
	str	r4, [r3, #24]
	str	r4, [r3, #36]
	str	r4, [r3, #44]
	ldr	r3, .L81+8
	str	r4, [r3]
	ldr	r3, .L81+12
	str	r4, [r3]
	ldr	r3, .L81+16
	str	r4, [r3]
	ldr	r3, .L81+20
	str	r4, [r3]
	ldr	r3, .L81+24
	str	r4, [r3]
	ldr	r3, .L81+28
	str	r4, [r3]
	ldr	r3, .L81+32
	ldr	r8, .L81+36
	str	r4, [r3]
	ldr	r3, .L81+40
	str	r2, [r8]
	str	r4, [r3]
	ldr	r8, .L81+44
	ldr	r3, .L81+48
	str	r2, [r8]
	str	r4, [r3]
	ldr	r2, .L81+52
	ldr	r3, .L81+56
	str	r4, [r2]
	str	r4, [r3]
	ldr	r2, .L81+60
	ldr	r3, .L81+64
	ldr	ip, .L81+68
	ldr	lr, .L81+72
	str	r4, [r2, #12]
	str	r7, [r2]
	str	r6, [r2, #8]
	str	r5, [r2, #16]
	str	r0, [r2, #4]
	str	lr, [ip]
	str	r0, [r2, #20]
	str	r4, [r3]
	str	r4, [r3, #4]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	str	r1, [r3, #36]
	str	r1, [r3, #40]
	str	r1, [r3, #44]
	bl	initRocks
	mov	r2, #140
	mov	lr, #5
	mov	ip, #25
	mov	r0, #45
	mov	r1, #3
	ldr	r3, .L81+76
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	str	r4, [r3, #36]
	str	lr, [r3, #4]
	str	ip, [r3, #12]
	str	r0, [r3, #20]
	str	r1, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #16]
	str	r2, [r3, #24]
	bl	initFlags
	ldr	r3, .L81+80
	str	r4, [r3]
	str	r4, [r3, #4]
	str	r4, [r3, #8]
	pop	{r4, r5, r6, r7, r8, lr}
	b	initEnemies
.L82:
	.align	2
.L81:
	.word	collisionsEnabled
	.word	player
	.word	vOff
	.word	time
	.word	score
	.word	score1
	.word	score2
	.word	score3
	.word	gameOver
	.word	oldX
	.word	bonusScore1
	.word	oldY
	.word	bonusScore2
	.word	hOff
	.word	flagsCollected
	.word	fuel
	.word	smoke
	.word	collisionMap
	.word	collisionmapBitmap
	.word	life
	.word	scoreDisplay
	.size	initGame, .-initGame
	.align	2
	.global	initGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame2, %function
initGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r4, r5, r6, r7, r8, lr}
	mov	r2, #48
	mov	r4, #0
	mov	lr, #2
	mov	ip, #16
	mov	r8, #4
	mov	r0, #6
	mov	r7, #208
	mov	r6, #32
	mov	r5, #240
	ldr	r3, .L85
	str	r1, [r3]
	ldr	r3, .L85+4
	str	r2, [r3]
	str	r1, [r3, #32]
	str	r2, [r3, #4]
	str	lr, [r3, #8]
	str	lr, [r3, #12]
	str	ip, [r3, #16]
	str	r8, [r3, #40]
	str	ip, [r3, #20]
	str	r4, [r3, #28]
	str	r4, [r3, #24]
	str	r4, [r3, #36]
	str	r4, [r3, #44]
	ldr	r3, .L85+8
	str	r4, [r3]
	ldr	r3, .L85+12
	str	r4, [r3]
	ldr	r3, .L85+16
	ldr	r8, .L85+20
	str	r4, [r3]
	ldr	r3, .L85+24
	str	r2, [r8]
	str	r4, [r3]
	ldr	r8, .L85+28
	ldr	r3, .L85+32
	str	r2, [r8]
	str	r4, [r3]
	ldr	r2, .L85+36
	ldr	r3, .L85+40
	ldr	ip, .L85+44
	ldr	lr, .L85+48
	str	r4, [r2, #12]
	str	r7, [r2]
	str	r6, [r2, #8]
	str	r5, [r2, #16]
	str	r0, [r2, #4]
	str	r0, [r2, #20]
	str	r4, [r3]
	str	r4, [r3, #4]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r4, [r3, #16]
	str	lr, [ip]
	str	r4, [r3, #20]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	str	r1, [r3, #36]
	str	r1, [r3, #40]
	str	r1, [r3, #44]
	bl	initRocks
	mov	r2, #140
	mov	lr, #5
	mov	ip, #25
	mov	r0, #45
	mov	r1, #3
	ldr	r3, .L85+52
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	str	r4, [r3, #36]
	str	lr, [r3, #4]
	str	ip, [r3, #12]
	str	r0, [r3, #20]
	str	r1, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #16]
	str	r2, [r3, #24]
	bl	initFlags
	pop	{r4, r5, r6, r7, r8, lr}
	b	initEnemies
.L86:
	.align	2
.L85:
	.word	collisionsEnabled
	.word	player
	.word	hOff
	.word	vOff
	.word	time
	.word	oldX
	.word	gameOver
	.word	oldY
	.word	flagsCollected
	.word	fuel
	.word	smoke
	.word	collisionMap
	.word	collisionmap2Bitmap
	.word	life
	.size	initGame2, .-initGame2
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Score: %d\000"
	.text
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L131
	ldr	r3, [r3]
	ldr	r5, .L131+4
	tst	r3, #7
	ldm	r5, {r1, r2}
	sub	sp, sp, #20
	beq	.L88
.L91:
	ldr	r0, .L131+8
	ldr	ip, .L131+12
	mla	r3, ip, r3, r0
	ldr	r0, .L131+16
	cmp	r0, r3, ror #2
	bcs	.L89
.L92:
	ldr	r3, .L131+20
	ldr	r0, [r3, #28]
	cmp	r0, #0
	beq	.L93
	ldr	ip, [r3, #32]
	sub	r0, r0, #1
	cmp	ip, #0
	str	r0, [r3, #28]
	beq	.L94
	ldr	r0, [r3, #24]
	cmp	r0, #0
	add	ip, r0, #1
	beq	.L95
	cmp	r0, #8
	beq	.L127
	cmp	r0, #16
	beq	.L128
	cmp	r0, #180
	bne	.L97
	mov	lr, #1
	mov	r0, #0
	mov	ip, #181
	str	lr, [r3, #36]
	str	lr, [r3, #40]
	str	lr, [r3, #44]
	str	r0, [r3]
	str	r0, [r3, #8]
	str	r0, [r3, #16]
	b	.L97
.L93:
	ldr	ip, .L131+24
	ldrh	ip, [ip]
	tst	ip, #1
	str	r0, [r3, #32]
	beq	.L94
	ldr	r0, .L131+28
	ldrh	r0, [r0]
	tst	r0, #1
	bne	.L94
	mov	r4, #1
	mov	lr, #240
	ldr	ip, .L131+32
	ldr	r0, [ip, #16]
	sub	r0, r0, #3
	str	r0, [ip, #16]
	str	r4, [r3, #32]
	str	lr, [r3, #28]
.L95:
	ldr	ip, .L131+36
	mov	r0, #0
	ldr	ip, [ip]
	str	ip, [r3, #4]
	mov	ip, #1
	ldr	lr, .L131+40
	ldr	lr, [lr]
	str	r0, [r3, #36]
	str	lr, [r3]
.L97:
	str	ip, [r3, #24]
.L94:
	mov	r9, #48
	ldr	r4, .L131+44
	ldr	r7, .L131+48
	ldr	r8, .L131+52
	add	r6, r4, #36
.L102:
	mov	r3, #16
	add	r0, r5, #16
	ldm	r0, {r0, ip}
	stm	sp, {r1, r2}
	str	ip, [sp, #12]
	str	r0, [sp, #8]
	mov	r2, r3
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r8]
	add	r4, r4, #12
	subne	r3, r3, #1
	strne	r9, [r5]
	strne	r9, [r5, #4]
	strne	r3, [r8]
	cmp	r4, r6
	ldmne	r5, {r1, r2}
	bne	.L102
.L101:
	ldr	r4, .L131+56
	ldr	r9, .L131+60
	ldr	r8, .L131+64
	ldr	fp, .L131+68
	ldr	r10, .L131+32
	add	r6, r4, #160
	b	.L108
.L104:
	add	r4, r4, #16
	cmp	r6, r4
	beq	.L129
.L108:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L104
	mov	r3, #16
	add	ip, r5, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	mov	r2, r3
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L104
	mov	r2, #1
	ldr	r1, [r8]
	ldr	r3, [r9]
	add	r1, r1, r2
	add	r3, r3, r2
	cmp	r1, #10
	str	r1, [r8]
	str	r3, [r9]
	str	r2, [r4, #12]
	str	r2, [r4, #8]
	beq	.L130
	cmp	r1, #20
	ldreq	r2, [r10]
	ldreq	r3, [r10, #16]
	subeq	r3, r3, r2
	ldreq	r2, .L131+72
	streq	r3, [r2]
.L107:
	mov	r0, fp
	ldr	r3, .L131+76
	add	r4, r4, #16
	mov	lr, pc
	bx	r3
	cmp	r6, r4
	bne	.L108
.L129:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L130:
	ldr	r3, [r10, #16]
	ldr	r0, [r10]
	ldr	r2, .L131+80
	sub	r3, r3, r0
	str	r3, [r2]
	b	.L107
.L88:
	ldr	ip, .L131+40
	ldr	r0, .L131+36
	cmp	r3, #0
	str	r1, [ip]
	str	r2, [r0]
	beq	.L92
	b	.L91
.L89:
	ldr	r0, .L131+32
	ldr	r3, [r0, #16]
	sub	r3, r3, #1
	str	r3, [r0, #16]
	b	.L92
.L127:
	mov	r0, #0
	ldr	lr, .L131+40
	ldr	ip, .L131+36
	ldr	lr, [lr]
	ldr	ip, [ip]
	str	lr, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #40]
	mov	ip, #9
	b	.L97
.L128:
	mov	r0, #0
	ldr	lr, .L131+40
	ldr	ip, .L131+36
	ldr	lr, [lr]
	ldr	ip, [ip]
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #44]
	mov	ip, #17
	b	.L97
.L132:
	.align	2
.L131:
	.word	time
	.word	player
	.word	28633112
	.word	-1775253149
	.word	14316556
	.word	smoke
	.word	oldButtons
	.word	buttons
	.word	fuel
	.word	oldY
	.word	oldX
	.word	rocks
	.word	collision
	.word	life
	.word	flags
	.word	flagsCollected
	.word	score
	.word	.LC0
	.word	bonusScore2
	.word	mgba_printf
	.word	bonusScore1
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L174
	ldr	ip, [r5, #16]
	sub	sp, sp, #16
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldr	r6, [r5, #20]
	ldr	lr, [r5, #4]
	mov	r4, r0
	ldm	r0, {r0, r1}
	str	ip, [sp, #8]
	ldr	ip, [r5]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r8, .L174+4
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L134
	mov	r2, #48
	ldr	r1, .L174+8
	ldr	r3, [r1]
	sub	r3, r3, #1
	str	r3, [r1]
	str	r2, [r5]
	str	r2, [r5, #4]
.L134:
	mov	r6, #16
	ldr	r7, .L174+12
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	r6, [sp, #12]
	str	r6, [sp, #8]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L135
.L137:
	mov	r2, #1
	ldr	r3, .L174+16
	str	r2, [r4, #48]
	str	r3, [r4, #52]
.L133:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L135:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	stmib	sp, {r2, r6}
	str	r6, [sp, #12]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L137
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #16]
	stmib	sp, {r2, r6}
	str	r6, [sp, #12]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L137
	ldr	lr, [r4, #48]
	cmp	lr, #0
	bne	.L172
	ldr	r2, [r4, #4]
	ldr	ip, [r5, #4]
	ldr	r3, [r4]
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	sub	ip, ip, r2
	cmp	ip, #0
	add	r0, r2, r0
	add	r1, r3, r1
	sub	r0, r0, #2
	sub	r1, r1, #2
	add	r6, r3, #1
	add	ip, r2, #1
	ble	.L141
	ldr	lr, .L174+20
	ldr	r8, [r4, #12]
	ldr	r7, [lr]
	add	lr, r8, r0
	add	lr, r7, lr, lsl #9
	ldrb	lr, [lr, r6]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L142
	ldr	lr, [r5, #12]
	add	lr, r0, lr
	add	r7, r7, lr, lsl #9
	ldrb	lr, [r7, r1]	@ zero_extendqisi2
	cmp	lr, #0
	movne	lr, #2
	addne	r2, r2, r8
	strne	r2, [r4, #4]
	strne	lr, [r4, #28]
.L142:
	ldr	r2, [r5]
	sub	r2, r2, r3
	cmp	r2, #0
	bgt	.L173
	beq	.L133
	ldr	r2, .L174+20
	ldr	r1, [r4, #8]
	ldr	r2, [r2]
	sub	r6, r6, r1
	add	ip, r2, ip, lsl #9
	ldrb	ip, [ip, r6]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L133
	add	r0, r2, r0, lsl #9
	ldrb	r2, [r0, r6]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #3
	subne	r3, r3, r1
	strne	r3, [r4]
	strne	r2, [r4, #28]
	b	.L133
.L173:
	ldr	r2, .L174+20
	ldr	lr, [r4, #8]
	ldr	r2, [r2]
	add	r1, lr, r1
	add	ip, r2, ip, lsl #9
	ldrb	ip, [ip, r1]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L133
	add	r0, r2, r0, lsl #9
	ldrb	r2, [r0, r1]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #1
	addne	r3, r3, lr
	strne	r3, [r4]
	strne	r2, [r4, #28]
	b	.L133
.L141:
	beq	.L142
	ldr	r7, .L174+20
	ldr	r9, [r4, #12]
	ldr	r7, [r7]
	sub	r8, ip, r9
	add	r10, r7, r6
	ldrb	r10, [r10, r8, lsl #9]	@ zero_extendqisi2
	cmp	r10, #0
	beq	.L142
	add	r7, r7, r1
	ldrb	r7, [r7, r8, lsl #9]	@ zero_extendqisi2
	cmp	r7, #0
	subne	r2, r2, r9
	strne	r2, [r4, #4]
	strne	lr, [r4, #28]
	b	.L142
.L172:
	ldr	r3, [r4, #52]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #52]
	streq	r3, [r4, #48]
	b	.L133
.L175:
	.align	2
.L174:
	.word	player
	.word	collision
	.word	life
	.word	smoke
	.word	359
	.word	collisionMap
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L213
	ldr	r7, .L213+4
	ldr	r3, [r2, #44]
	ldr	r4, [r7]
	ldr	r6, .L213+8
	lsl	lr, r4, #16
	cmp	r3, #0
	ldrh	r8, [r6]
	lsr	lr, lr, #16
	beq	.L177
	ldr	r0, .L213+12
	ldrh	r3, [r0]
	orr	r3, r3, #512
	strh	r3, [r0]	@ movhi
.L178:
	ldr	r3, .L213+16
	ldr	r3, [r3]
	cmp	r3, #9
	mov	r3, #67108864
	strhgt	r8, [r3, #24]	@ movhi
	strhle	r8, [r3, #16]	@ movhi
	strhgt	lr, [r3, #26]	@ movhi
	strhle	lr, [r3, #18]	@ movhi
	ldr	r3, .L213+20
	ldr	r2, [r3, #36]
	cmp	r2, #0
	bne	.L181
	ldr	r1, [r3, #4]
	sub	r2, r1, r4
	add	r2, r2, #16
	cmp	r2, #176
	bls	.L182
.L181:
	ldrh	r2, [r0, #48]
	orr	r2, r2, #512
	strh	r2, [r0, #48]	@ movhi
.L183:
	ldr	r2, [r3, #40]
	cmp	r2, #0
	bne	.L184
	ldr	r1, [r3, #12]
	sub	r2, r1, r4
	add	r2, r2, #16
	cmp	r2, #176
	bls	.L185
.L184:
	ldrh	r2, [r0, #40]
	orr	r2, r2, #512
	strh	r2, [r0, #40]	@ movhi
.L186:
	ldr	r2, [r3, #44]
	cmp	r2, #0
	bne	.L187
	ldr	r1, [r3, #20]
	sub	r2, r1, r4
	add	r2, r2, #16
	cmp	r2, #176
	bls	.L188
.L187:
	ldrh	r3, [r0, #32]
	orr	r3, r3, #512
	strh	r3, [r0, #32]	@ movhi
.L189:
	ldr	ip, .L213+12
	mov	r10, #202
	mov	r0, ip
	mov	r3, ip
	ldr	r2, .L213+24
	ldr	r9, .L213+28
	add	r5, ip, #24
.L193:
	ldr	r1, [r2, #8]
	cmp	r1, #0
	bne	.L190
	ldr	fp, [r2, #4]
	sub	r1, fp, r4
	add	r1, r1, #16
	cmp	r1, #176
	bls	.L191
.L190:
	ldrh	r1, [r3, #56]
	orr	r1, r1, #512
	strh	r1, [r3, #56]	@ movhi
.L192:
	add	r3, r3, #8
	cmp	r5, r3
	add	r2, r2, #12
	bne	.L193
	ldr	r3, .L213+32
	ldr	r1, [r3, #28]
	cmp	r1, #0
	beq	.L194
	ldrh	r2, [r0, #80]
	orr	r2, r2, #512
	strh	r2, [r0, #80]	@ movhi
.L195:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L196
	ldrh	r2, [r0, #88]
	orr	r2, r2, #512
	strh	r2, [r0, #88]	@ movhi
.L197:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	ldreq	r2, [r3, #20]
	ldrhne	r3, [r0, #96]
	lsleq	r2, r2, #23
	ldr	r4, [r7]
	lsreq	r2, r2, #23
	ldrbeq	r3, [r3, #24]	@ zero_extendqisi2
	ldr	lr, .L213+36
	orrne	r3, r3, #512
	orreq	r2, r2, #16384
	lsl	r5, r4, #16
	strheq	r2, [r0, #98]	@ movhi
	strh	r3, [r0, #96]	@ movhi
	mov	r10, #204
	strheq	r1, [r0, #100]	@ movhi
	ldrh	r9, [r6]
	ldr	r2, .L213+40
	ldr	r8, .L213+28
	lsr	r5, r5, #16
	sub	r3, lr, #80
	b	.L203
.L200:
	ldrh	r1, [r3, #104]
	orr	r1, r1, #512
	strh	r1, [r3, #104]	@ movhi
	add	r3, r3, #8
	cmp	lr, r3
	add	r2, r2, #16
	beq	.L212
.L203:
	ldr	r1, [r2, #8]
	cmp	r1, #0
	bne	.L200
	ldr	fp, [r2, #4]
	sub	r1, fp, r4
	add	r1, r1, #16
	cmp	r1, #176
	bhi	.L200
	ldr	r1, [r2]
	sub	r1, r1, r9
	sub	fp, fp, r5
	and	r1, r1, r8
	and	fp, fp, #255
	orr	r1, r1, #16384
	strh	fp, [r3, #104]	@ movhi
	strh	r10, [r3, #108]	@ movhi
	strh	r1, [r3, #106]	@ movhi
	add	r3, r3, #8
	cmp	lr, r3
	add	r2, r2, #16
	bne	.L203
.L212:
	mov	r9, #168
	mov	r10, #136
	mov	r8, #2
	mov	r5, #12
	mov	r4, #22
	ldr	r2, .L213+44
	ldr	lr, .L213+28
	ldr	r3, [r2]
	and	r3, r3, lr
	orr	r3, r3, #16384
	strh	r3, [r0, #26]	@ movhi
	ldr	r3, [r2, #16]
	ldr	r1, .L213+48
	mov	fp, lr
	and	lr, lr, r3
	orr	lr, lr, #16384
	ldr	r3, [r1]
	strh	lr, [r0, #18]	@ movhi
	ldr	lr, .L213+52
	add	r3, r3, #16
	and	r3, r3, lr
	strh	r3, [r0, #188]	@ movhi
	ldr	r3, [r1, #4]
	ldr	r1, [r1, #8]
	add	r1, r1, #16
	and	r1, r1, lr
	add	r3, r3, #16
	and	r3, r3, lr
	strh	r1, [r0, #204]	@ movhi
	ldrb	r1, [r2, #4]	@ zero_extendqisi2
	strh	r3, [r0, #196]	@ movhi
	ldrb	r3, [r2, #20]	@ zero_extendqisi2
	orr	r2, r1, #16384
	orr	r3, r3, #16384
	ldr	r7, [r7]
	strh	r2, [r0, #24]	@ movhi
	ldr	r2, .L213+56
	strh	r3, [r0, #16]	@ movhi
	ldr	r3, .L213+60
	lsl	r1, r7, #16
	ldrh	r6, [r6]
	strh	r10, [r0, #28]	@ movhi
	strh	r9, [r0, #20]	@ movhi
	strh	r8, [r0, #186]	@ movhi
	strh	r5, [r0, #194]	@ movhi
	strh	r2, [r0, #184]	@ movhi
	strh	r2, [r0, #192]	@ movhi
	strh	r2, [r0, #200]	@ movhi
	strh	r4, [r0, #202]	@ movhi
	lsr	r1, r1, #16
	add	r4, r4, #1000
	add	lr, r3, r9
.L207:
	ldr	r2, [r3, #44]
	cmp	r2, #0
	bne	.L204
	ldr	r0, [r3, #4]
	sub	r2, r0, r7
	add	r2, r2, #16
	cmp	r2, #176
	bls	.L205
.L204:
	ldrh	r2, [ip, #216]
	orr	r2, r2, #512
	strh	r2, [ip, #216]	@ movhi
.L206:
	add	r3, r3, #56
	cmp	lr, r3
	add	ip, ip, #8
	bne	.L207
	mov	r3, #512
	ldr	r4, .L213+64
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L213+12
	mov	lr, pc
	bx	r4
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L177:
	ldr	r3, [r2]
	ldr	r1, [r2, #4]
	ldr	r5, [r2, #36]
	ldr	ip, [r2, #28]
	sub	r3, r3, r8
	sub	r2, r1, lr
	lsl	r3, r3, #23
	ldr	r1, .L213+68
	ldr	r0, .L213+12
	lsr	r3, r3, #23
	add	ip, ip, r5, lsl #5
	orr	r3, r3, #16384
	and	r2, r2, #255
	and	r1, r1, ip, lsl #1
	strh	r3, [r0, #2]	@ movhi
	strh	r2, [r0]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	b	.L178
.L196:
	ldr	r2, [r3, #12]
	lsl	r2, r2, #23
	strh	r1, [r0, #92]	@ movhi
	lsr	r2, r2, #23
	ldrb	r1, [r3, #16]	@ zero_extendqisi2
	orr	r2, r2, #16384
	strh	r2, [r0, #90]	@ movhi
	strh	r1, [r0, #88]	@ movhi
	b	.L197
.L194:
	ldr	r2, [r3, #4]
	lsl	r2, r2, #23
	strh	r1, [r0, #84]	@ movhi
	lsr	r2, r2, #23
	ldrb	r1, [r3, #8]	@ zero_extendqisi2
	orr	r2, r2, #16384
	strh	r2, [r0, #82]	@ movhi
	strh	r1, [r0, #80]	@ movhi
	b	.L195
.L205:
	ldr	r5, [r3, #36]
	ldr	r2, [r3]
	add	r8, r5, #4
	ldr	r5, [r3, #28]
	sub	r2, r2, r6
	sub	r0, r0, r1
	and	r2, r2, fp
	add	r5, r5, r8, lsl #5
	and	r0, r0, #255
	orr	r2, r2, #16384
	and	r5, r4, r5, lsl #1
	strh	r0, [ip, #216]	@ movhi
	strh	r2, [ip, #218]	@ movhi
	strh	r5, [ip, #220]	@ movhi
	b	.L206
.L191:
	ldr	r1, [r2]
	sub	r1, r1, r8
	sub	fp, fp, lr
	and	r1, r1, r9
	and	fp, fp, #255
	orr	r1, r1, #16384
	strh	fp, [r3, #56]	@ movhi
	strh	r10, [r3, #60]	@ movhi
	strh	r1, [r3, #58]	@ movhi
	b	.L192
.L188:
	mov	ip, #200
	ldr	r2, [r3, #16]
	sub	r2, r2, r8
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	sub	r3, r1, lr
	orr	r2, r2, #16384
	and	r3, r3, #255
	strh	r2, [r0, #34]	@ movhi
	strh	r3, [r0, #32]	@ movhi
	strh	ip, [r0, #36]	@ movhi
	b	.L189
.L182:
	mov	r5, #200
	ldr	ip, [r3]
	sub	ip, ip, r8
	lsl	ip, ip, #23
	sub	r2, r1, lr
	lsr	ip, ip, #23
	and	r2, r2, #255
	orr	ip, ip, #16384
	strh	r2, [r0, #48]	@ movhi
	strh	ip, [r0, #50]	@ movhi
	strh	r5, [r0, #52]	@ movhi
	b	.L183
.L185:
	mov	r5, #200
	ldr	ip, [r3, #8]
	sub	ip, ip, r8
	lsl	ip, ip, #23
	sub	r2, r1, lr
	lsr	ip, ip, #23
	and	r2, r2, #255
	orr	ip, ip, #16384
	strh	r2, [r0, #40]	@ movhi
	strh	ip, [r0, #42]	@ movhi
	strh	r5, [r0, #44]	@ movhi
	b	.L186
.L214:
	.align	2
.L213:
	.word	player
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.word	score
	.word	smoke
	.word	rocks
	.word	511
	.word	life
	.word	shadowOAM+80
	.word	flags
	.word	fuel
	.word	scoreDisplay
	.word	1023
	.word	-32766
	.word	enemies
	.word	DMANow
	.word	1022
	.size	drawGame, .-drawGame
	.align	2
	.global	canMoveLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveLeft, %function
canMoveLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L217
	ldr	r3, [r3]
	cmp	r3, #0
	bne	canMoveLeft.part.0
.L216:
	mov	r0, #1
	bx	lr
.L218:
	.align	2
.L217:
	.word	collisionsEnabled
	.size	canMoveLeft, .-canMoveLeft
	.align	2
	.global	canMoveRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveRight, %function
canMoveRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L221
	ldr	r3, [r3]
	cmp	r3, #0
	bne	canMoveRight.part.0
.L220:
	mov	r0, #1
	bx	lr
.L222:
	.align	2
.L221:
	.word	collisionsEnabled
	.size	canMoveRight, .-canMoveRight
	.align	2
	.global	canMoveUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveUp, %function
canMoveUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L225
	ldr	r3, [r3]
	cmp	r3, #0
	bne	canMoveUp.part.0
.L224:
	mov	r0, #1
	bx	lr
.L226:
	.align	2
.L225:
	.word	collisionsEnabled
	.size	canMoveUp, .-canMoveUp
	.align	2
	.global	canMoveDown
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveDown, %function
canMoveDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L229
	ldr	r3, [r3]
	cmp	r3, #0
	bne	canMoveDown.part.0
.L228:
	mov	r0, #1
	bx	lr
.L230:
	.align	2
.L229:
	.word	collisionsEnabled
	.size	canMoveDown, .-canMoveDown
	.align	2
	.global	movePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	movePlayer, %function
movePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L412
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldrh	r5, [r3]
	ldr	r4, .L412+4
	and	r3, r5, #240
	cmp	r3, #240
	ldr	r6, [r4, #4]
	ldr	r7, [r4]
	beq	.L232
	ands	r10, r5, #128
	bne	.L233
	ldr	r8, .L412+8
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L233
	bl	canMoveDown.part.0
	cmp	r0, #0
	beq	.L234
	ands	r9, r5, #64
	beq	.L290
	tst	r5, #32
	beq	.L288
.L240:
	tst	r5, #16
	bne	.L263
	ldr	r8, .L412+8
.L286:
	ldr	r5, [r8]
	cmp	r5, #0
	beq	.L261
	bl	canMoveRight.part.0
	cmp	r0, #0
	beq	.L234
.L284:
	cmp	r5, #0
	beq	.L261
.L294:
	bl	canMoveRight.part.0
	cmp	r0, #0
	bne	.L261
	cmp	r9, #0
	bne	.L263
	b	.L283
.L233:
	ands	r9, r5, #64
	bne	.L236
	ldr	r8, .L412+8
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L237
.L290:
	bl	canMoveUp.part.0
	cmp	r0, #0
	bne	.L407
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L256
.L247:
	cmp	r3, #2
	bne	.L408
.L404:
	ldr	r3, .L412+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L266
.L282:
	bl	canMoveDown.part.0
	cmp	r0, #0
	bne	.L266
.L256:
	cmp	r7, #47
	movle	r5, #48
	ldr	r2, [r4, #16]
	rsb	r1, r2, #240
	add	r1, r1, r1, lsr #31
	strle	r5, [r4]
	sub	r1, r7, r1, asr #1
	movle	r7, r5
	cmp	r6, #47
	movle	r5, #48
	ldr	r0, [r4, #20]
	rsb	r3, r0, #160
	add	r3, r3, r3, lsr #31
	strle	r5, [r4, #4]
	sub	r3, r6, r3, asr #1
	movle	r6, r5
	ldr	r5, .L412+12
	ldr	r5, [r5]
	ldr	lr, .L412+16
	ldr	ip, .L412+20
	cmp	r5, #9
	str	r1, [lr]
	str	r3, [ip]
	rsb	r2, r2, #456
	ble	.L269
	cmp	r7, r2
	rsb	r0, r0, #480
	strgt	r2, [r4]
	cmp	r0, r6
	bge	.L272
.L402:
	str	r0, [r4, #4]
.L272:
	cmp	r1, #0
	blt	.L409
.L275:
	cmp	r3, #0
	blt	.L410
	cmp	r1, #272
	movgt	r2, #272
	strgt	r2, [lr]
.L276:
	cmp	r3, #352
	movgt	r3, #352
	strgt	r3, [ip]
.L231:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L234:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L247
.L281:
	bl	canMoveUp.part.0
	cmp	r0, #0
	bne	.L248
	b	.L256
.L266:
	ldr	r3, [r4, #12]
	add	r6, r6, r3
	str	r6, [r4, #4]
	b	.L256
.L269:
	cmp	r7, r2
	rsb	r0, r0, #456
	strgt	r2, [r4]
	cmp	r0, r6
	blt	.L402
	cmp	r1, #0
	bge	.L275
.L409:
	mov	r2, #0
	cmp	r3, r2
	str	r2, [lr]
	strlt	r2, [ip]
	bge	.L276
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L232:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L247
	ldr	r3, .L412+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L281
.L248:
	ldr	r3, [r4, #12]
	sub	r6, r6, r3
	str	r6, [r4, #4]
	b	.L256
.L410:
	mov	r3, #0
	cmp	r1, #272
	str	r3, [ip]
	ble	.L231
	mov	r3, #272
	str	r3, [lr]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L408:
	cmp	r3, #3
	bne	.L411
	ldr	r3, .L412+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L257
	bl	canMoveLeft.part.0
	cmp	r0, #0
	beq	.L256
.L257:
	ldr	r3, [r4, #8]
	sub	r7, r7, r3
	str	r7, [r4]
	b	.L256
.L411:
	cmp	r3, #1
	bne	.L256
	ldr	r3, .L412+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L258
	bl	canMoveRight.part.0
	cmp	r0, #0
	beq	.L256
.L258:
	ldr	r3, [r4, #8]
	add	r7, r7, r3
	str	r7, [r4]
	b	.L256
.L236:
	tst	r5, #32
	bne	.L240
	ldr	r8, .L412+8
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L241
.L288:
	bl	canMoveLeft.part.0
	cmp	r0, #0
	beq	.L234
	tst	r5, #16
	bne	.L244
	bl	canMoveRight.part.0
	cmp	r0, #0
	beq	.L234
	bl	canMoveLeft.part.0
	cmp	r0, #0
	beq	.L294
.L243:
	ldr	r3, [r4, #8]
	sub	r7, r7, r3
	str	r7, [r4]
	ldr	r5, [r8]
	b	.L284
.L237:
	ands	r9, r5, #32
	bne	.L396
.L241:
	tst	r5, #16
	beq	.L243
.L244:
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L259
	bl	canMoveLeft.part.0
	cmp	r0, #0
	bne	.L259
.L260:
	cmp	r9, #0
	beq	.L287
.L263:
	cmp	r10, #0
	bne	.L256
	b	.L404
.L407:
	ands	r9, r5, #32
	beq	.L288
.L396:
	ands	r9, r5, #16
	beq	.L286
.L287:
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L264
.L283:
	bl	canMoveUp.part.0
	cmp	r0, #0
	bne	.L264
	cmp	r10, #0
	bne	.L256
	b	.L282
.L261:
	ldr	r3, [r4, #8]
	add	r7, r7, r3
	str	r7, [r4]
	b	.L260
.L264:
	ldr	r3, [r4, #12]
	sub	r6, r6, r3
	str	r6, [r4, #4]
	b	.L263
.L259:
	ldr	r3, [r4, #8]
	sub	r7, r7, r3
	str	r7, [r4]
	b	.L260
.L413:
	.align	2
.L412:
	.word	buttons
	.word	player
	.word	collisionsEnabled
	.word	score
	.word	hOff
	.word	vOff
	.size	movePlayer, .-movePlayer
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L471
	ldrh	r3, [r3]
	tst	r3, #64
	push	{r4, r5, r6, r7, r8, lr}
	and	r8, r3, #128
	and	r7, r3, #32
	and	r4, r3, #16
	beq	.L461
	ldr	r5, .L471+4
.L415:
	cmp	r8, #0
	bne	.L419
	ldr	r6, .L471+8
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L421
.L420:
	bl	canMoveDown.part.0
	cmp	r0, #0
	beq	.L468
.L421:
	mov	r2, #1
	mov	r3, #2
	str	r2, [r5, #32]
	str	r3, [r5, #28]
.L419:
	cmp	r7, #0
	bne	.L423
	ldr	r6, .L471+8
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L427
.L424:
	bl	canMoveLeft.part.0
	cmp	r0, #0
	beq	.L469
.L427:
	mov	r2, #1
	mov	r3, #3
	cmp	r4, #0
	str	r2, [r5, #32]
	str	r3, [r5, #28]
	beq	.L425
.L429:
	ldr	r3, [r5, #24]
	cmp	r3, #9
	add	r3, r3, #1
	bne	.L467
.L434:
	mov	r3, #0
	ldr	r0, [r5, #36]
	str	r3, [r5, #24]
	ldr	r1, [r5, #40]
	ldr	r3, .L471+12
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r5, #36]
	b	.L435
.L468:
	cmp	r7, #0
	beq	.L424
.L423:
	cmp	r4, #0
	beq	.L470
.L432:
	ldr	r3, [r5, #32]
	cmp	r3, #0
	streq	r3, [r5, #36]
	bne	.L429
.L467:
	str	r3, [r5, #24]
.L435:
	mov	r7, #0
	ldr	r4, .L471+16
	ldr	r6, .L471+12
	add	r5, r4, #168
.L438:
	ldr	r3, [r4, #24]
	cmp	r3, #9
	add	r3, r3, #1
	strne	r3, [r4, #24]
	bne	.L437
	ldr	r0, [r4, #36]
	str	r7, [r4, #24]
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	str	r1, [r4, #36]
.L437:
	add	r4, r4, #56
	cmp	r5, r4
	bne	.L438
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L461:
	ldr	r6, .L471+8
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L416
	bl	canMoveUp.part.0
	cmp	r0, #0
	beq	.L417
.L416:
	mov	r2, #1
	mov	r3, #0
	ldr	r5, .L471+4
	str	r2, [r5, #32]
	str	r3, [r5, #28]
	b	.L415
.L470:
	ldr	r6, .L471+8
.L425:
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L430
.L431:
	bl	canMoveRight.part.0
	cmp	r0, #0
	beq	.L432
.L430:
	mov	r3, #1
	str	r3, [r5, #32]
	str	r3, [r5, #28]
	ldr	r3, [r5, #24]
	cmp	r3, #9
	add	r3, r3, #1
	bne	.L467
	b	.L434
.L417:
	cmp	r8, #0
	ldr	r5, .L471+4
	beq	.L420
	b	.L419
.L469:
	cmp	r4, #0
	bne	.L432
	b	.L431
.L472:
	.align	2
.L471:
	.word	buttons
	.word	player
	.word	collisionsEnabled
	.word	__aeabi_idivmod
	.word	enemies
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L484
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, r5, r6, lr}
	beq	.L474
	ldr	r3, .L484+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L483
.L474:
	ldr	r0, .L484+8
	bl	movePlayer
	bl	updatePlayer
	ldr	r0, .L484+12
	bl	updateEnemies
	ldr	r0, .L484+16
	bl	updateEnemies
	ldr	r0, .L484+20
	bl	updateEnemies
	ldr	r0, .L484+8
	bl	animatePlayer
	ldr	r2, .L484+24
	ldr	r3, [r2]
	cmp	r3, #2
	moveq	r3, #1
	streq	r3, [r2, #36]
	beq	.L476
	cmp	r3, #1
	streq	r3, [r2, #32]
	beq	.L476
	cmp	r3, #0
	moveq	r3, #1
	ldreq	r1, .L484+28
	streq	r3, [r2, #28]
	streq	r3, [r1]
.L476:
	ldr	r3, .L484+32
	ldr	r2, [r3, #16]
	ldr	r3, [r3]
	cmp	r2, r3
	moveq	r2, #1
	ldreq	r3, .L484+28
	streq	r2, [r3]
	ldr	r3, .L484+36
	ldr	r2, .L484+40
	ldr	r0, [r3]
	ldr	r3, .L484+44
	smull	r1, r2, r0, r2
	smull	r1, lr, r3, r0
	asr	r1, r0, #31
	rsb	ip, r1, r2, asr #5
	rsb	r1, r1, lr, asr #2
	smull	r2, lr, r3, ip
	smull	r2, r3, r1, r3
	asr	r2, ip, #31
	ldr	r4, .L484+48
	rsb	r2, r2, lr, asr #2
	asr	lr, r1, #31
	rsb	r3, lr, r3, asr #2
	add	r2, r2, r2, lsl #2
	add	lr, r1, r1, lsl #2
	sub	r0, r0, lr, lsl #1
	sub	r2, ip, r2, lsl #1
	ldr	lr, .L484+52
	ldr	ip, [r4]
	ldr	r5, .L484+56
	add	r3, r3, r3, lsl #2
	sub	r3, r1, r3, lsl #1
	str	r0, [r5]
	str	r0, [lr, #8]
	add	r1, ip, #1
	ldr	r0, .L484+60
	ldr	ip, .L484+64
	str	r2, [lr]
	str	r3, [lr, #4]
	str	r1, [r4]
	str	r2, [ip]
	str	r3, [r0]
	pop	{r4, r5, r6, lr}
	bx	lr
.L483:
	ldr	r2, .L484+68
	ldr	r3, [r2]
	rsbs	r3, r3, #1
	movcc	r3, #0
	str	r3, [r2]
	b	.L474
.L485:
	.align	2
.L484:
	.word	oldButtons
	.word	buttons
	.word	player
	.word	enemies
	.word	enemies+56
	.word	enemies+112
	.word	life
	.word	gameOver
	.word	fuel
	.word	score
	.word	1374389535
	.word	1717986919
	.word	time
	.word	scoreDisplay
	.word	score3
	.word	score2
	.word	score1
	.word	collisionsEnabled
	.size	updateGame, .-updateGame
	.comm	enemies,168,4
	.comm	scoreDisplay,12,4
	.comm	flags,160,4
	.comm	life,40,4
	.comm	rocks,36,4
	.comm	smoke,48,4
	.comm	fuel,24,4
	.comm	player,48,4
	.comm	collisionsEnabled,4,4
	.comm	collisionMap,4,4
	.comm	flagsCollected,4,4
	.comm	gameOver,4,4
	.comm	oldY,4,4
	.comm	oldX,4,4
	.comm	bonusScore2,4,4
	.comm	bonusScore1,4,4
	.comm	score3,4,4
	.comm	score2,4,4
	.comm	score1,4,4
	.comm	score,4,4
	.comm	time,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
