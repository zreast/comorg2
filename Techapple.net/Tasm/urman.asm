.model  tiny
.data
head      		db      0 	;First letter 
follow      	db      0 	;Other letter
start   		db      0	;Start row 
endr       		db      25	;End row
apick			db		0
column    		db      0 
stop    		db      100	;Stop falling
chartemp		db		0d

.code
    org     0100h
main:   

	mov     ah, 00h         ; Set to 80x25
    mov     al, 03h
    int     10h

	mov 	si, offset staticdrop

    rosesfall:
            mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, head      ;y
            mov     dl, column    ;x
            int     10h
		
		
			;Color State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 0fh
            mov     cx, 0001h
            int     10h
        end1:
		
		mov 	ah,	staticascii + [2]
		mov 	chartemp,ah
		
        
		;Switch Column
        mov 	ah,prsnt
        cmp 	ah,maxcol
        ja 		endcolumnloop
        jmp 	columnloop
        endcolumnloop:

    ;Delay
    mov 	di, 5
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

end	main