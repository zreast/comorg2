	
		.model  tiny
		.data
		key db 0
		 msg2 	db "  1:easy / 2:normal / 3:hard "
        .code
        org     0100h
main:   

		mov     ah, 00h         ; Set to 80x25
		mov     al, 03h
		int     10h
		
		mov     ah, 01h
		mov     cx, 2607h  	; hide cursr
         int     10h
		
		mov		si,0100b
		mov 	al,1
		mov 	bh,0
		mov 	bl, 4
		mov 	cx, 38		;legnth of char
		mov 	dl,	22		;column
		mov 	dh, 10 		;row
		push 	cs
		push 	es
		mov 	bp,  offset msg1
		mov 	ah, 13h
		int 	10h
		jmp 	msg1end
		 msg1 	db " Hello!! Please choose your difficulty"
		 
	
		 
		msg1end:
		
	
		add 	si,0001b
		mov 	al,0
		mov 	bh,0
		mov 	bl, [si]
		mov 	cx, 29		;legnth of char
		mov 	dl,	26		;column
		mov 	dh, 12 		;row
		push 	cs
		push 	es
		mov 	bp,  offset msg2
		mov 	ah, 13h
		int 	10h
		
			
		
		
		;===============esc==============
;			mov cl,0 
;skIn:
		;===============esc==============
		mov		ah,6			;get char from keyboard
		mov		dl,255			;INPUTMODE
		int		21h	
		cmp		al,27			;COMPARE WITH ESC
		jne		delay2			;IF NOT EQUAL GO CHANGE COLOR
		je		outprog			;IF EQUAL END PROGRAM
		
		delay2:	   				;DELAY WHO CARE
		mov 	di, 3
		mov 	ah, 0
		int 	1Ah
		mov 	bx, dx
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
        end     main

