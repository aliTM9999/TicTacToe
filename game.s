//number 3

.global _start


.colors:
        			.word   2911
        			.word   65535
        			.word   45248
		
.equ pixieDust, 0xc8000000
.equ charBuff, 0xc9000000
.equ stroke, 0xff200100

gameStarted : .word 0x0
charPressed : .word 5
currentTurn : .word 1


end:
        b       end
_start:
		
		
		bl VGA_clear_charbuff_ASM
		bl VGA_clear_pixelbuff_ASM

		bl VGA_fill_ASM
		bl draw_grid_ASM
		
		
		
		
waitToBegin:	add r0, sp, #7
				bl read_PS2_data_ASM
				cmp r0, #0
				beq waitToBegin
				ldrb r1, [sp, #7]
				
				
				cmp r1, #0x45
				
				bne waitToBegin
				
				mov r3, #0
				mov r4, #1
				mov r5, #0
				mov r6, #0
				mov r8, #0
				
				
				
gameloop:	mov r0, r3
			
			bl Player_turn_ASM
			
			
			
loop1:		mov r0, #0
			add r0, sp, #7
			bl read_PS2_data_ASM
			cmp r0, #0
			beq loop1
			ldrb r1, [sp, #7]
			
			
			cmp r1, #0x16
			moveq r4, #0
			bleq placeOne
			
			cmp r1, #0x1E
			moveq r4, #0
			bleq placeTwo
			
			cmp r1, #0x26
			moveq r4, #0
			bleq placeThree
			
			cmp r1, #0x25
			moveq r4, #0
			bleq placeFour
			
			cmp r1, #0x2E
			moveq r4, #0
			bleq placeFive
			
			cmp r1, #0x36
			moveq r4, #0
			bleq placeSix
			
			cmp r1, #0x3D
			moveq r4, #0
			bleq placeSeven
			
			cmp r1, #0x3E
			moveq r4, #0
			bleq placeEight
			
			cmp r1, #0x46
			moveq r4, #0
			bleq placeNine
			
			
			cmp r4, #1
			beq branchBack			
			cmp r1, #0x45
			
			bleq _start
			
			
			
			
			
			
			
			
branchBack:	push {lr}
			bl checkForW
			pop {lr}
			b gameloop
			
gameOver:	
			mov r0, #0
			add r0, sp, #7
			bl read_PS2_data_ASM
			cmp r0, #0
			beq gameOver
			ldrb r1, [sp, #7]
			
			cmp r1, #0x45
			
			bleq _start
			b gameOver
		
			
		
checkForW:	push {r0,r4, r7,r9}

			
			
			and r4, r5, #0x0007
			cmp r4, #0x0007
			moveq r0, #0
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			and r4, r6, #0x0007
			cmp r4, #0x0007
			moveq r0, #1
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			and r4, r5, #0x0038
			cmp r4, #0x0038
			moveq r0, #0
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			and r4, r6, #0x0038
			cmp r4, #0x0038
			moveq r0, #1
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			and r4, r5, #0x01c0
			cmp r4, #0x01c0
			moveq r0, #0
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			and r4, r6, #0x01c0
			cmp r4, #0x01c0
			moveq r0, #1
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			and r4, r5, #0x0049
			cmp r4, #0x0049
			moveq r0, #0
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			and r4, r6, #0x0049
			cmp r4, #0x0049
			moveq r0, #1
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			and r4, r5, #0x0092
			cmp r4, #0x0092
			moveq r0, #0
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			and r4, r6, #0x0092
			cmp r4, #0x0092
			moveq r0, #1
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			
			and r4, r5, #0x0124
			cmp r4, #0x0124
			moveq r0, #0
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			and r4, r6, #0x0124
			cmp r4, #0x0124
			moveq r0, #1
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			ldr r9, =#0x0111
			and r4, r5, r9
			cmp r4, r9
			moveq r0, #0
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			and r4, r6, r9
			cmp r4, r9
			moveq r0, #1
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			
			and r4, r5, #0x0054
			cmp r4, #0x0054
			moveq r0, #0
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			and r4, r6, #0x0054
			cmp r4, #0x0054
			moveq r0, #1
			pusheq {lr}
			bleq VGA_clear_charbuff_ASM
			popeq {lr}
			pusheq {lr}
			bleq result_ASM
			popeq {lr}
			beq gameOver
			
			
			mov r7, #0
			add r7, r5, r6
			ldr r9, =#0x01ff
			cmp r7, r9
			bne fini
			
			push {lr}
			bl VGA_clear_charbuff_ASM
			pop {lr}
			
			
			
			
draw:			mov r0, #41
				mov r1, #2
				mov r2, #68
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				mov r0, #42
				mov r1, #2
				mov r2, #114
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				mov r0, #43
				mov r1, #2
				mov r2, #97
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				mov r0, #44
				mov r1, #2
				mov r2, #119
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				b gameOver
				
				
			
			
fini:		pop {r0,r4, r7, r9}
			bx lr
         

		
placeOne:	push {r0, r1}
			mov r0, #94
			mov r1, #55
			
			tst r8, #0x0001
			popne {r0, r1}
			bxne lr
			
			orr r8, #0x0001
			
			cmp r3, #0
			pusheq {lr}
			bleq draw_plus_ASM
			popeq {lr}
			orreq r5, #0x0001
			
			cmp r3, #1
			pusheq {lr}
			bleq draw_square_ASM
			popeq {lr}
			orreq r6, #0x0001
			
			cmp r3, #0
			moveq r3, #1
			movne r3, #0
			pop {r0, r1}
			bx lr
			
placeTwo:	push {r0, r1}
			mov r0, #163
			mov r1, #55
			
			tst r8, #0x0002
			popne {r0, r1}
			bxne lr
			
			orr r8, #0x0002
			cmp r3, #0
			pusheq {lr}
			bleq draw_plus_ASM
			popeq {lr}
			orreq r5, #0x0002
			
			cmp r3, #1
			pusheq {lr}
			bleq draw_square_ASM
			popeq {lr}
			orreq r6, #0x0002
			
			cmp r3, #0
			moveq r3, #1
			movne r3, #0
			pop {r0, r1}
			bx lr 
			
placeThree:	push {r0, r1}
			mov r0, #231
			mov r1, #55
			
			
			tst r8, #0x0004
			popne {r0, r1}
			bxne lr
			
			orr r8, #0x0004
			cmp r3, #0
			pusheq {lr}
			bleq draw_plus_ASM
			popeq {lr}
			orreq r5, #0x0004
			
			cmp r3, #1
			pusheq {lr}
			bleq draw_square_ASM
			popeq {lr}
			orreq r6, #0x0004
			
			cmp r3, #0
			moveq r3, #1
			movne r3, #0
			pop {r0, r1}
			bx lr 
			
			
placeFour:	push {r0, r1}
			mov r0, #94
			mov r1, #123
			
			
			tst r8, #0x0008
			popne {r0, r1}
			bxne lr
			
			orr r8, #0x0008
			cmp r3, #0
			pusheq {lr}
			bleq draw_plus_ASM
			popeq {lr}
			orreq r5, #0x0008
			
			cmp r3, #1
			pusheq {lr}
			bleq draw_square_ASM
			popeq {lr}
			orreq r6, #0x0008
			
			cmp r3, #0
			moveq r3, #1
			movne r3, #0
			pop {r0, r1}
			bx lr 
			

placeFive:	push {r0, r1}
			mov r0, #163
			mov r1, #123
			
			tst r8, #0x0010
			popne {r0, r1}
			bxne lr
			
			orr r8, #0x0010
			cmp r3, #0
			pusheq {lr}
			bleq draw_plus_ASM
			popeq {lr}
			orreq r5, #0x0010
			
			cmp r3, #1
			pusheq {lr}
			bleq draw_square_ASM
			popeq {lr}
			orreq r6, #0x0010
			
			cmp r3, #0
			moveq r3, #1
			movne r3, #0
			pop {r0, r1}
			bx lr 
			
			
placeSix:	push {r0, r1}
			mov r0, #231
			mov r1, #123
			
			tst r8, #0x0020
			popne {r0, r1}
			bxne lr
			
			orr r8, #0x0020
			cmp r3, #0
			pusheq {lr}
			bleq draw_plus_ASM
			popeq {lr}
			orreq r5, #0x0020
			
			cmp r3, #1
			pusheq {lr}
			bleq draw_square_ASM
			popeq {lr}
			orreq r6, #0x0020
			
			cmp r3, #0
			moveq r3, #1
			movne r3, #0
			pop {r0, r1}
			bx lr 	
			
			
placeSeven:	push {r0, r1}
			mov r0, #94
			mov r1, #191
			
			tst r8, #0x0040
			popne {r0, r1}
			bxne lr
			
			orr r8, #0x0040
			cmp r3, #0
			pusheq {lr}
			bleq draw_plus_ASM
			popeq {lr}
			orreq r5, #0x0040
			
			cmp r3, #1
			pusheq {lr}
			bleq draw_square_ASM
			popeq {lr}
			orreq r6, #0x0040
			
			
			cmp r3, #0
			moveq r3, #1
			movne r3, #0
			pop {r0, r1}
			bx lr
			
placeEight:	push {r0, r1}
			mov r0, #163
			mov r1, #191
			
			tst r8, #0x0080
			popne {r0, r1}
			bxne lr
			
			orr r8, #0x0080
			cmp r3, #0
			pusheq {lr}
			bleq draw_plus_ASM
			popeq {lr}
			orreq r5, #0x0080
			
			cmp r3, #1
			pusheq {lr}
			bleq draw_square_ASM
			popeq {lr}
			orreq r6, #0x0080
			
			cmp r3, #0
			moveq r3, #1
			movne r3, #0
			pop {r0, r1}
			bx lr
			
placeNine:	push {r0, r1}
			mov r0, #231
			mov r1, #191
			
			tst r8, #0x0100
			popne {r0, r1}
			bxne lr
			
			orr r8, #0x0100
			cmp r3, #0
			pusheq {lr}
			bleq draw_plus_ASM
			popeq {lr}
			orreq r5, #0x0100
			
			cmp r3, #1
			pusheq {lr}
			bleq draw_square_ASM
			popeq {lr}
			orreq r6, #0x0100
			
			cmp r3, #0
			moveq r3, #1
			movne r3, #0
			pop {r0, r1}
			bx lr
			
draw_grid_ASM:	push {r0, r1, r2, r3}

				mov     r3, #207
        		mov     r2, #5
        		mov     r1, #17
        		mov     r0, #57
				push {lr}
        		bl      draw_rectangle_for_grid
				pop {lr}
				
				mov     r3, #207
        		mov     r2, #5
        		mov     r1, #17
        		mov     r0, #264
				push {lr}
        		bl      draw_rectangle_for_grid
				pop {lr}
				
				
				mov     r3, #5
        		mov     r2, #207
        		mov     r1, #219
        		mov     r0, #57
				push {lr}
        		bl      draw_rectangle_for_grid
				pop {lr}
				
				
				mov     r3, #5
        		mov     r2, #207
        		mov     r1, #155
        		mov     r0, #57
				push {lr}
        		bl      draw_rectangle_for_grid
				pop {lr}

				
        		mov     r3, #207
        		mov     r2, #5
        		mov     r1, #17
        		mov     r0, #126
				push {lr}
        		bl      draw_rectangle_for_grid
				pop {lr}
			
				
				mov     r3, #207
        		mov     r2, #5
        		mov     r1, #17
        		mov     r0, #195
				push {lr}
        		bl      draw_rectangle_for_grid
				pop {lr}
				
				mov     r3, #5
        		mov     r2, #207
        		mov     r1, #86
        		mov     r0, #57
				push {lr}
        		bl      draw_rectangle_for_grid
				pop {lr}
				
				
				mov     r3, #5
        		mov     r2, #207
        		mov     r1, #17
        		mov     r0, #57
				push {lr}
        		bl      draw_rectangle_for_grid
				pop {lr}
				pop {r0, r1, r2, r3}
				bx lr
				
				
draw_plus_ASM: 	push {r2, r3}
				
        		mov     r3, #14
        		mov     r2, #4
				add		r0, r0, #-2
				add		r1, r1, #-7
        		
				push {lr}
        		bl      draw_rectangle_for_X
				pop {lr}
				
				mov     r3, #4
        		mov     r2, #14
				add		r0, r0, #-8
				add		r1, r1, #-8
				
        		
				push {lr}
        		bl      draw_rectangle_for_X
				pop {lr}
				pop {r2, r3}
				bx lr
				

draw_square_ASM:push {r2, r3}
				
        		mov     r3, #14
        		mov     r2, #4
				add		r0, r0, #-6
				add		r1, r1, #-6
				
        		
				push {lr}
        		bl      draw_rectangle_for_X
				pop {lr}
				
				mov     r3, #4
        		mov     r2, #14
				add		r0, r0, #-3
				add		r1, r1, #-14
				
        		
				push {lr}
        		bl      draw_rectangle_for_X
				pop {lr}
				
				mov     r3, #4
        		mov     r2, #14
				add		r0, r0, #-13
				add		r1, r1, #9
				
        		
				push {lr}
        		bl      draw_rectangle_for_X
				pop {lr}
				
				
				
				mov     r3, #14
        		mov     r2, #4
				
				
				add		r0, r0, #-3
				add		r1, r1, #-14
				
        		
				push {lr}
        		bl      draw_rectangle_for_X
				pop {lr}
				pop {r2, r3}
				bx lr
				
				

result_ASM:		push {r1,r2}
				
				cmp r0, #1
				beq player_2_win
				
				
				cmp r0, #0
				beq player_1_win
				
			
				
				
				

				
				
				
player_1_win:	mov r0, #31
				mov r1, #2
				mov r2, #80
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				
					mov r0, #32
					mov r1, #2
					mov r2, #108
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #33
					mov r1, #2
					mov r2, #97
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #34
					mov r1, #2
					mov r2, #121
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					
					mov r0, #35
					mov r1, #2
					mov r2, #101
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #36
					mov r1, #2
					mov r2, #114
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
				mov r0, #38
				mov r1, #2
				mov r2, #49
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				mov r0, #40
				mov r1, #2
				mov r2, #119
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				mov r0, #41
				mov r1, #2
				mov r2, #105
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				mov r0, #42
				mov r1, #2
				mov r2, #110
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				mov r0, #43
				mov r1, #2
				mov r2, #115
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				pop {r1,r2}
				bx lr
				
player_2_win:	mov r0, #31
				mov r1, #2
				mov r2, #80
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				
					mov r0, #32
					mov r1, #2
					mov r2, #108
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #33
					mov r1, #2
					mov r2, #97
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #34
					mov r1, #2
					mov r2, #121
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					
					mov r0, #35
					mov r1, #2
					mov r2, #101
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #36
					mov r1, #2
					mov r2, #114
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
				mov r0, #38
				mov r1, #2
				mov r2, #50
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				mov r0, #40
				mov r1, #2
				mov r2, #119
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				mov r0, #41
				mov r1, #2
				mov r2, #105
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				mov r0, #42
				mov r1, #2
				mov r2, #110
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				
				mov r0, #43
				mov r1, #2
				mov r2, #115
				push {lr}
				bl VGA_write_char_ASM
				pop {lr}
				


finishedResult: pop {r1,r2}
				bx lr
				
				
				
				

Player_turn_ASM:	push {r0,r1,r2}

					cmp r0, #1
					beq player_2_turn
					
					mov r0, #30
					mov r1, #1
					mov r2, #73
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #31
					mov r1, #1
					mov r2, #116
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #32
					mov r1, #1
					mov r2, #39
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #33
					mov r1, #1
					mov r2, #115
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #35
					mov r1, #1
					mov r2, #112
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #36
					mov r1, #1
					mov r2, #108
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #37
					mov r1, #1
					mov r2, #97
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #38
					mov r1, #1
					mov r2, #121
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					
					mov r0, #39
					mov r1, #1
					mov r2, #101
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #40
					mov r1, #1
					mov r2, #114
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #42
					mov r1, #1
					mov r2, #49
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #43
					mov r1, #1
					mov r2, #39
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #44
					mov r1, #1
					mov r2, #115
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #46
					mov r1, #1
					mov r2, #116
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #47
					mov r1, #1
					mov r2, #117
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #48
					mov r1, #1
					mov r2, #114
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #49
					mov r1, #1
					mov r2, #110
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					
					b finished
					
			
					
player_2_turn:		mov r0, #30
					mov r1, #1
					mov r2, #73
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #31
					mov r1, #1
					mov r2, #116
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #32
					mov r1, #1
					mov r2, #39
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #33
					mov r1, #1
					mov r2, #115
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #35
					mov r1, #1
					mov r2, #112
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #36
					mov r1, #1
					mov r2, #108
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #37
					mov r1, #1
					mov r2, #97
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #38
					mov r1, #1
					mov r2, #121
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					
					mov r0, #39
					mov r1, #1
					mov r2, #101
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #40
					mov r1, #1
					mov r2, #114
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #42
					mov r1, #1
					mov r2, #50
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #43
					mov r1, #1
					mov r2, #39
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #44
					mov r1, #1
					mov r2, #115
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #46
					mov r1, #1
					mov r2, #116
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #47
					mov r1, #1
					mov r2, #117
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #48
					mov r1, #1
					mov r2, #114
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
					mov r0, #49
					mov r1, #1
					mov r2, #110
					push {lr}
					bl VGA_write_char_ASM
					pop {lr}
					
finished:			pop {r0,r1,r2}
					bx lr
					
					



VGA_fill_ASM: 				push {r0, r1, r2}
							
							mov r1, #0//y
							mov r2, #0x008F//navy color (approximately)
							
							
							
y_loop_start3:				cmp r1, #240
							bge y_loop_over3
							
							mov r0, #0//x
							

x_loop_start3:				
							cmp r0, #320
							bge x_loop_over3
							
							
							
							
							push {lr}
							bl VGA_draw_point_ASM
							pop {lr}
							
							
							add r0, r0, #1
							b x_loop_start3

							
							
x_loop_over3:				add r1, r1, #1
							b y_loop_start3

y_loop_over3: 
							pop {r0, r1, r2}
							bx lr





draw_rectangle_for_grid:
        push    {r4, r5, r6, r7, r8, r9, r10, lr}
        mov     r7, #0x00ff
        add     r9, r1, r3
        cmp     r1, r9
        popge   {r4, r5, r6, r7, r8, r9, r10, pc}
        mov     r8, r0
        mov     r5, r1
        add     r6, r0, r2
        b       .line_L2
.line_L5:
        add     r5, r5, #1
        cmp     r5, r9
        popeq   {r4, r5, r6, r7, r8, r9, r10, pc}
.line_L2:
        cmp     r8, r6
        movlt   r4, r8
        bge     .line_L5
.line_L4:
        mov     r2, r7
        mov     r1, r5
        mov     r0, r4
        bl      VGA_draw_point_ASM
        add     r4, r4, #1
        cmp     r4, r6
        bne     .line_L4
        b       .line_L5
		

draw_rectangle_for_X:
        push    {r4, r5, r6, r7, r8, r9, r10, lr}
        mov     r7, #0xffffff
        add     r9, r1, r3
        cmp     r1, r9
        popge   {r4, r5, r6, r7, r8, r9, r10, pc}
        mov     r8, r0
        mov     r5, r1
        add     r6, r0, r2
        b       .line_L2x
.line_L5x:
        add     r5, r5, #1
        cmp     r5, r9
        popeq   {r4, r5, r6, r7, r8, r9, r10, pc}
.line_L2x:
        cmp     r8, r6
        movlt   r4, r8
        bge     .line_L5x
.line_L4x:
        mov     r2, r7
        mov     r1, r5
        mov     r0, r4
        bl      VGA_draw_point_ASM
        add     r4, r4, #1
        cmp     r4, r6
        bne     .line_L4x
        b       .line_L5x



VGA_draw_point_ASM: push {r3, r4, r7, r8}
					ldr r3, =pixieDust
					
					lsl r7, r0, #1
					lsl r8, r1, #10
					
					orr r4, r7, r8
					
					strh r2, [r3, r4]
					pop {r3, r4, r7, r8}
					bx lr
		
	
VGA_clear_pixelbuff_ASM:	push {r0, r1, r2}
							
							mov r1, #0//y
							mov r2, #0x0000
							
							
							
y_loop_start:				cmp r1, #240
							bge y_loop_over
							
							mov r0, #0//x
							

x_loop_start:				
							cmp r0, #320
							bge x_loop_over
							
							
							
							
							push {lr}
							bl VGA_draw_point_ASM
							pop {lr}
							
							
							add r0, r0, #1
							b x_loop_start

							
							
x_loop_over:				add r1, r1, #1
							b y_loop_start

y_loop_over: 
							pop {r0, r1, r2}
							bx lr
							
							
							
							
VGA_write_char_ASM:	push {r3, r4, r7}
					ldr r3, =charBuff
					
					
					lsl r7, r1, #7
					
					orr r4, r0, r7
					
					strb r2, [r3, r4]
					pop {r3, r4, r7}
					bx lr
							
							
							
VGA_clear_charbuff_ASM:		push {r0, r1, r2, r3}
							
							mov r1, #0//y
							mov r2, #0x0000
							
							
							
y_loop_start1:				cmp r1, #59
							bge y_loop_over1
							
							mov r0, #0//x
							

x_loop_start1:				ldr r3, =#79
							cmp r0, r3
							bge x_loop_over1
							
							
							
							
							push {lr}
							bl VGA_write_char_ASM
							pop {lr}
							
							
							add r0, r0, #1
							b x_loop_start1

							
							
x_loop_over1:				add r1, r1, #1
							b y_loop_start1

y_loop_over1: 
							pop {r0, r1, r2, r3}
							bx lr							
							






read_PS2_data_ASM:	push {r1,r2,r3}
					ldr r1, =stroke
					ldr r3, [r1]
					
					lsr r2,r3,#15
					and r2, r2, #0x1
					
					tst r2, #0x1
					moveq r0, #0x0
					popeq {r1, r2,r3}
					bxeq lr
					
					
					strb r3, [r0]
					mov r0, #0x1
					
					pop {r1,r2,r3}
					
					bx lr
	
	
	