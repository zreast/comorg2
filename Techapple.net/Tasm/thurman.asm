.model  tiny
.data

cur				db		?
delcol			db		-1
row      		db      23
column    		db      40
rowsub			db		24
chartemp		db		85d
key 			db 		0
numbers		db		48
numbers2		db		48
 stackrandom       dw 0
   random_number	 dw 8
   X                 db  0
   Y                 db  80 DUP (?)
   char_Random       db  133 
 msg2 	db "  1:easy / 2:normal / 3:hard "
.code
    org     0100h
main:   

	mov     ah, 00h         ; Set to 80x25
    mov     al, 03h
    int     10h
	
			
	call	screenmenu
	barchelor:
	mov     ah, 00h         ; Set to 80x25
	mov     al, 03h
	int     10h
	
	
	mov si,0  ;set  register pointer array at 0     
	call readtime 
    call random_fist	
	
    rosesfall:
	call Move_cursor_XY   
	call print_line	
	
	sub y[si],11       
    call Move_cursor_XY  				   
    call Ereas_char				   
    add y[si],11 
	
	cmp y[si],36
    JLE clearY 
       call random_minus_position
       add random_number,1 
    clearY: 	

	inc si	
	add x,1
	cmp x,80  
	Jne rosesfall
	mov x,0 
	mov si,0  
	
	call readtime	
	
	call	writeunit
	call	move
	call	dellaser
	call	drawlaser
			
    ;Delay
    mov 	di, 1
    mov 	ah, 0
    int 	1Ah
    mov 	bx, dx
    delay:
        mov 	ah, 0
        int 	1Ah
        sub 	dx, bx
        cmp 	di, dx
        ja 		delay

	;Infinite Loop
    jmp 	rosesfall

	ret
	
	printscore:
		;mov		si,1
		mov 	al,1
		mov 	bh,0
		mov 	bl, 3
		mov 	cx, 8		;legnth of char
		mov 	dl,	69		;column
		mov 	dh, 0 		;row
		;push 	cs			; don't ask me what's this
		;push 	es			; don't ask me what's this
		mov 	bp,  offset scorew
		mov 	ah, 13h
		int 	10h
		ret
	scorew db "SCORE : "
	
	addscore:
		mov		ah,2		;set cursor position	
		mov		dl,77		;column
		mov		dh,0		;row
		mov		bh,0
		int		10h
		
		
		mov		ah,09h		;write character
		;mov		al,48
		mov		bh,0
		mov		al,numbers
		;push	al
		add		al,1		;add score point
		mov		numbers,al
		mov		bl,3
		mov		cx,1
		int		10h
		cmp		al,58
		jne		next
		mov		numbers,48
		add		numbers2,1
	next:
		
		
	ret	
	paddscore:				;show score
		mov		ah,2		;set cursor position	
		mov		dl,78		;column
		mov		dh,0		;row
		mov		bh,0
		int		10h
		
		mov		ah,09h
		mov		bh,0
		mov		al,numbers
		mov		bl,3
		mov		cx,1
		int		10h
		
		
	ret	
	paddscore2 :			;show score
		mov		ah,2		;set cursor position	
		mov		dl,77		;column
		mov		dh,0		;row
		mov		bh,0
		int		10h
		
		mov		ah,09h
		mov		bh,0
		mov		al,numbers2
		mov		bl,3
		mov		cx,1
		int		10h
	ret	
	Your_Soul_is_Mine:		;show hp
		;mov		si,1
		mov 	al,1
		mov 	bh,0
		mov 	bl, 3
		mov 	cx, 5		;legnth of char
		mov 	dl,	67		;column
		mov 	dh, 1 		;row		
		mov 	bp,  offset mylife
		mov 	ah, 13h
		int 	10h
		ret
	mylife db "HP : "
	ret	
	
	;score db	'1'
	;============== Control============
	move:
	; call add score// addscore = 1 point
	call	printscore
	call	paddscore
	call	paddscore2 
	call	Your_Soul_is_Mine
	
	;Skip if no input
	mov		ah, 0Bh
	int		21h
	cmp		al,00
	je		skip
	
	mov		ah,00	
	int		16h			;wait for keyboard

	cmp 	ah,1fh		; press s to move left	
	je		right
	
	cmp 	ah,22h		; press g to move left
	je		left
	
	cmp		ah,01h		; exit
	je		outprog2

	mov		ah, 0Ch
	mov		al,0
	int		21h
	skip:
	ret
	
	outprog2:
		mov     ah, 00h         ; Set to 80x25
        mov     al, 03h 
        int     10h  
		int		20h
		ret
	
	left:
	call	writeblack
	mov		al,column
	mov		delcol,al
	inc		column
	call	addscore
	
	ret
	
	right:
	call	writeblack	
	mov		al,column
	mov		delcol,al
	dec		column
	call	addscore
	
	ret
	
	writeblack:
	mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, row      ;y
            mov     dl, column    ;x

            int     10h
		
			;Player State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
			int     10h
			
			mov		al, row
			sub		al,1
			
			mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, al     ;y
            mov     dl, column    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 143d
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
			int     10h
			
			mov		al, column
			sub		al,1
			
			mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, row     ;y
            mov     dl, al    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 92d
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
			int     10h
			
			mov		al, column
			add		al,1
			
			mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, row     ;y
            mov     dl, al    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 47d
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
			int     10h
			
			mov		al, column
			sub		al,1
			
			mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, rowsub     ;y
            mov     dl, al    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 47d
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
			int     10h
			
			mov		al, column
			add		al,1
			
			mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, rowsub     ;y
            mov     dl, al    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 92d
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
			int     10h
			
			mov     ah, 01h
			mov     cx, 2607h
            int     10h
			
			
	ret
	
	screenmenu:   

		mov     ah, 00h         ; Set to 80x25
		mov     al, 03h
		int     10h
		
		mov     ah, 01h
		mov     cx, 2607h  	; hide cursr
         int     10h
		
		mov		si,1
		mov 	al,1
		mov 	bh,0
		mov 	bl, 3
		mov 	cx, 44		;legnth of char
		mov 	dl,	19		;column
		mov 	dh, 10 		;row
		;push 	cs
		;push 	es
		mov 	bp,  offset msg1
		mov 	ah, 13h
		int 	10h
		jmp 	msg1end
		 msg1 	db " Please choose your difficulty (ESC to exit)"
		
		msg1end:
			
		add 	bl,2
		mov 	al,0
		mov 	bh,0
		;mov 	bl, 1
		mov 	cx, 29		;legnth of char
		mov 	dl,	26		;column
		mov 	dh, 12 		;row
		push 	cs
		push 	es
		mov 	bp,  offset msg2
		mov 	ah, 13h
		int 	10h
			
		mov		ah,6			;get char from keyboard
		mov		dl,255			;INPUTMODE
		int		21h	
		cmp		al,27			;COMPARE WITH ESC
		jne		no1			;IF NOT EQUAL GO CHANGE COLOR
		call	outprog			;IF EQUAL END PROGRAM		
		no1:
		
		cmp		al,49			;COMPARE WITH 1
		jne		no2				;if not choose go to no2 for change color \continune
		call	barchelor		;if chose 1 go to xwing
		no2:
		
		cmp		al,50			;COMPARE WITH 2
		jne		no3				;if not choose go to no2 for change color \continune
		call	barchelor		;if chose 1 go to xwing	
		no3:
		
		cmp		al,51			;COMPARE WITH 3
		jne	delay2			;if not choose go to no2 for change color \continune
		call	barchelor		;if chose 1 go to xwing		
		
		delay2:	   				;DELAY WHO CARE
		mov 	di, 25
		mov 	ah, 0
		int 	1Ah
		mov 	bx, dx
		call	delayy2
		
		delayy2:
        mov 	ah, 0
        int 	1Ah
        sub 	dx, bx
        cmp 	di, dx
        ja 		delayy2
		
		
	jmp		msg1end			;CONTINUE TO CHANGE COLOR
				
		outprog:
		mov     ah, 00h         ; Set to 80x25
        mov     al, 03h 
        int     10h  
		int		20h
		ret
	ret			;return to call

	;================MENU End here=======================
	
	writeunit:
	mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, row      ;y
            mov     dl, column    ;x

            int     10h	
		
			;Player State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 0Ch
            mov     cx, 0001h
			int     10h
			
			mov		al, row
			sub		al,1
			
			mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, al     ;y
            mov     dl, column    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 143d
            mov     bh, 00h
            mov     bl, 0Ch
            mov     cx, 0001h
			int     10h
			
			mov		al, column
			sub		al,1
			
			mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, row     ;y
            mov     dl, al    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 92d
            mov     bh, 00h
            mov     bl, 0Ch
            mov     cx, 0001h
			int     10h
			
			mov		al, column
			add		al,1
			
			mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, row     ;y
            mov     dl, al    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 47d
            mov     bh, 00h
            mov     bl, 0Ch
            mov     cx, 0001h
			int     10h
			
			mov		al, column
			sub		al,1
			
			mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, rowsub     ;y
            mov     dl, al    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 47d
            mov     bh, 00h
            mov     bl, 0Ch
            mov     cx, 0001h
			int     10h
			
			mov		al, column
			add		al,1
			
			mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, rowsub     ;y
            mov     dl, al    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 92d
            mov     bh, 00h
            mov     bl, 0Ch
            mov     cx, 0001h
			int     10h
			
			mov     ah, 01h
			mov     cx, 2607h
            int     10h
	ret
	
	drawlaser:
	
	mov	al,21
	mov	cur,al
	xor	cx,cx
	drawing:
	
			mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, cur     ;y
            mov     dl, column    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 179d
            mov     bh, 00h
            mov     bl, 0Ch
            mov     cx, 0001h
			int     10h
			
	mov	al,cur
	dec	al
	mov	cur,al
	or	al,al
	jnz	drawing
	mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, 0     ;y
            mov     dl, column    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 179d
            mov     bh, 00h
            mov     bl, 0Ch
            mov     cx, 0001h
			int     10h
	ret
	
	dellaser:
	
	mov	al,21
	mov	cur,al
	xor	cx,cx
	deleting:
	
			mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, cur     ;y
            mov     dl, delcol    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 179d
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
			int     10h
			
	mov	al,cur
	dec	al
	mov	cur,al
	or	al,al
	jnz	deleting
	mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, 0     ;y
            mov     dl, delcol    ;x

            int     10h
		
            mov     ah, 09h    
            mov     al, 179d
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
			int     10h
	ret
	
	random_fist:   ;random at first time	 
	     set_number:
			call delay
			add random_number,3
			call readtime
			call random_minus_position		 
			inc si	
			add x,1
			cmp x,80  
	   Jl set_number			 
		mov si,0 
		mov x,0	 
    RET
	
	readtime:
		  mov ah, 2ch
		  int 21h            
		  mov byte ptr StackRandom, dl 
	 RET 
	 
	 random_minus_position:  		  
          mov ax, [StackRandom]
          mov bx, random_number
          mul bx                  
          add ax, word ptr x               
          mov bx, 35
          div bx           	  
          mov y[si]	,dl	                 
		  sub y[si],35
          cmp random_number,99 
          jne set_random_number
               mov random_number,0  
             set_random_number:
     RET
	
	Move_cursor_XY:		; 
		mov     ah, 02h         ; Move cursor XY
		mov     bh, 00h             
		mov     dh, y[si]
	    mov     dl, x
        int     10h 
	RET  
	
	print_line:		
			call Write_soft_green		
			sub y[si],1
			call Move_cursor_XY  		
            call Write_soft_green		
			sub y[si],1
			call Move_cursor_XY 		
			call Write_soft_green			
			sub y[si],1			
			call Move_cursor_XY		
			call Write_soft_green			
			sub y[si],1			
			call Move_cursor_XY		
			call Write_soft_green			
			sub y[si],1			
			call Move_cursor_XY		
			call Write_soft_green			
			sub y[si],1			
			call Move_cursor_XY			
			call Write_soft_green			
			sub y[si],1			
			call Move_cursor_XY			
			call Write_soft_green			
			sub y[si],1			
			call Move_cursor_XY			
			call Write_soft_green		
			sub y[si],1			
			call Move_cursor_XY		
			call Write_soft_green		
			sub y[si],1			
			call Move_cursor_XY		
			call Write_soft_green		
			add y[si],11			
			jne set_random_number3
              mov random_number,0  
          set_random_number3:
	RET  
	
	Write_soft_green:
	  call random_ascii
        mov     ah, 09h         ; Write a soft green colored char
        mov     al, char_Random
        mov     bh, 00h
        mov     bl, 0ah
        mov     cx, 0001h
        int     10h 
	RET
	
	random_ascii:
		  mov ax, [StackRandom]
          mov bx, random_number
          mul bx                  ; RND = RAND*P1
          add ax, word ptr x            ; RAND += P2      
          mov bx, 93      
          div bx            ; divition		  
          mov char_Random	,dl	                 
		  add char_Random,33		  
		  add random_number,1		  
          cmp random_number,99 
          jne set_random_number2
              mov random_number,0  
          set_random_number2:
	 RET
	 
	 Ereas_char:
		mov     ah, 09h         ; Ereas char
        mov     al, '8'
        mov     bh, 00h
        mov     bl, 00h
        mov     cx, 0001h
        int     10h
	RET		

end	main