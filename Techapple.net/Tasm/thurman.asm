.model  tiny
.data
row      		db      23
column    		db      40
rowsub			db		24
chartemp		db		85d
key db 0
 msg2 	db "  1:easy / 2:normal / 3:hard "
.code
    org     0100h
main:   

	mov     ah, 00h         ; Set to 80x25
    mov     al, 03h
    int     10h
	
			
	call	screenmenu
		
       ;======================SCREEN MENU=================
	
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
		push 	cs
		push 	es
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
		call		outprog			;IF EQUAL END PROGRAM		
		no1:
		
		cmp		al,49			;COMPARE WITH 1
		jne		no2				;if not choose go to no2 for change color \continune
		call		rosesfall		;if chose 1 go to xwing
		no2:
		
		cmp		al,50			;COMPARE WITH 2
		jne		no3				;if not choose go to no2 for change color \continune
		call		rosesfall		;if chose 1 go to xwing	
		no3:
		
		cmp		al,51			;COMPARE WITH 3
		jne	delay2			;if not choose go to no2 for change color \continune
		call		rosesfall		;if chose 1 go to xwing		
		
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
	
	
			
	
    rosesfall:
			mov     ah, 00h         ; Set to 80x25
			mov     al, 03h
			int     10h
			
			
			
			
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
			
			call	move;
			
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
	
	;============== Control============
	move:
	mov		ah,00	
	int		16h			;wait for keyboard

	cmp 	ah,1fh		; press s to move left
	je		right
	
	cmp 	ah,22h		; press g to move left
	je		left
	
	cmp		ah,01h		; exit
	call	outprog
	
	mov		ah, 0Ch
	mov		al,0
	int		21h
	
	ret
	
	left:
	call	writeblack
	inc		column
	ret
	
	right:
	call	writeblack
	dec		column
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
	

end	main