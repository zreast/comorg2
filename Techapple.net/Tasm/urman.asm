.model  tiny
.data
row      		db      23
column    		db      40
rowsub			db		24
chartemp		db		85d

.code
    org     0100h
main:   

	mov     ah, 00h         ; Set to 80x25
    mov     al, 03h
    int     10h

    rosesfall:
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
	
	move:
	mov		ah,00	
	int		16h			;wait for keyboard

	cmp 	ah,1fh
	je		right
	
	cmp 	ah,22h
	je		left
	
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