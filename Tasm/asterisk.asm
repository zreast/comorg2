.model  tiny
.data
staticascii    	db      112, 81, 124, 62, 66, 85, 109, 56, 80, 104, 113, 110, 73, 72, 70, 111, 61, 126, 53
staticdrop     	db      7,25,4, 1,25,10, 2,22,38, 11,22,41, 1,25,46, 2,24,8, 15,25,36, 4,24,15, 9,23,25, 4,16,21, 1,9,75, 2,10,65, 5,20,72, 7,23,63, 14,25,49, 4,23,55, 1,18,1, 1,16,79, 1,22,33, 3,24,40
head      		db      0 	;First letter 
follow      	db      0 	;Other letter
start   		db      0	;Start row 
endr       		db      25	;End row
apick			db		0
column    		db      0 
prsnt       	db      0	;Present Column
maxcol       	db      17	;Max Column
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
        columnloop:
            mov 	ah,[si]
            mov 	head,ah
            mov 	ah,head
            mov 	follow,ah
            inc 	byte ptr [si]

            inc 	si
            mov 	ah,[si]
            mov 	endr,ah
            inc 	si
            mov 	ah,[si]
            mov 	column,ah
            inc 	si

            mov     ah, 02h     ;Move cursor XY
            mov     bh, 00h
            mov     dh, head      ;y
            mov     dl, column    ;x
            int     10h
		
		mov 	ah,	staticascii + [1]
		mov 	chartemp,ah
		
		;Letter 1
            mov     ah, head
            cmp     endr,ah
            jge cstate1

									;Black State
            mov     ah, 09h
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end1
        cstate1:					;Color State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 0fh
            mov     cx, 0001h
            int     10h
        end1:
		
		mov 	ah,	staticascii + [2]
		mov 	chartemp,ah
		
        ;Letter 2
			sub follow,1
			
            mov     ah, 02h      	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate2
									;Black State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end2
        cstate2:    				 ;Color State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 0fh
            mov     cx, 0001h
            int     10h
        end2:

		mov 	ah,	staticascii + [3]
		mov 	chartemp,ah
		
		;Letter 3
            sub follow,1
      
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate3
									;Black State
            mov     ah, 09h
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end3
        cstate3:   					;Color State
            mov     ah, 09h     
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 0Ah
            mov     cx, 0001h
            int     10h
        end3:
		
		mov 	ah,	staticascii + [4]
		mov 	chartemp,ah
		
		;Letter 4
            sub     follow, 1
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate4
									;Black State
            mov     ah, 09h     
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end4
        cstate4:    				;Color State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 0Ah
            mov     cx, 0001h
            int     10h
        end4:
		
		mov 	ah,	staticascii + [5]
		mov 	chartemp,ah
		
		;Letter 5
            sub follow,1      
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate5
									;Black State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end5
        cstate5:    				;Color State
            mov     ah, 09h     
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 0Ah
            mov     cx, 0001h
            int     10h
        end5:
		
		mov 	ah,	staticascii + [6]
		mov 	chartemp,ah
		
		;Letter 6
            sub     follow,1
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate6
									;Black State
            mov     ah, 09h      
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end6
        cstate6:    				;Color State
            mov     ah, 09h      
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 02h
            mov     cx, 0001h
            int     10h
		 end6:
		 
		mov 	ah,	staticascii + [7]
		mov 	chartemp,ah
		 
		 ;Letter 7
            sub     follow,1
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate7
									;Black State
            mov     ah, 09h     
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end7
        cstate7:    				;Color State
            mov     ah, 09h         
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 02h
            mov     cx, 0001h
            int     10h
		end7:
		
		jmp		minions
		falling:
		jmp		rosesfall
		minions:
		
		mov 	ah,	staticascii + [8]
		mov 	chartemp,ah
		
		;Letter 8
            sub     follow,1
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate8
									;Black State
            mov     ah, 09h      
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end8
        cstate8:    				;Color State
            mov     ah, 09h         
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 02h
            mov     cx, 0001h
            int     10h
        end8:
		
		mov 	ah,	staticascii + [9]
		mov 	chartemp,ah
		
		;Letter 9
            sub     follow, 1
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate9
									;Black State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end9
        cstate9:    				;Color State
            mov     ah, 09h         
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 02h
            mov     cx, 0001h
            int     10h
        end9:
		
		mov 	ah,	staticascii + [10]
		mov 	chartemp,ah
		
		;Letter 10
            sub     follow, 1
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate10
									;Black State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end10
        cstate10:    				;Color State
            mov     ah, 09h         
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 02h
            mov     cx, 0001h
            int     10h
        end10:
		
		mov 	ah,	staticascii + [11]
		mov 	chartemp,ah
		
		;Letter 11
            sub     follow, 1
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate11
									;Black State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end11
        cstate11:    				;Color State
            mov     ah, 09h         
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 02h
            mov     cx, 0001h
            int     10h
        end11:
		
		mov 	ah,	staticascii + [12]
		mov 	chartemp,ah
		
		;Letter 12
            sub     follow, 1
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate12
									;Black State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end12
        cstate12:    				;Color State
            mov     ah, 09h         
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 02h
            mov     cx, 0001h
            int     10h
        end12:
		
		mov 	ah,	staticascii + [13]
		mov 	chartemp,ah
		
		;Letter 13
            sub     follow, 1
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate13
									;Black State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end13
        cstate13:    				;Color State
            mov     ah, 09h         
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 0Ah
            mov     cx, 0001h
            int     10h
        end13:
		
		mov 	ah,	staticascii + [14]
		mov 	chartemp,ah
		
		;Letter 14
            sub     follow, 1
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate14
									;Black State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end14
        cstate14:    				;Color State
            mov     ah, 09h         
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 08h
            mov     cx, 0001h
            int     10h
        end14:
		
		mov 	ah,	staticascii + [15]
		mov 	chartemp,ah
		
		;Letter 15
            sub     follow, 1
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, follow
            cmp     endr,ah
            jge cstate15
									;Black State
            mov     ah, 09h    
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp end15
        cstate15:    				;Color State
            mov     ah, 09h         
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 08h
            mov     cx, 0001h
            int     10h
        end15:
    
		mov 	ah,	staticascii + [16]
		mov 	chartemp,ah
	
		;Letter 16
            sub     follow,1
            mov     ah, 02h     	;Move cursor XY
            mov     bh, 00h
            mov     dh, follow
            mov     dl, column
            int     10h

            mov     ah, 09h     	;Black State
            mov     al, chartemp
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
      
        add 	prsnt,1
		
		;Switch Column
        mov 	ah,prsnt
        cmp 	ah,maxcol
        ja 		endcolumnloop
        jmp 	columnloop
        endcolumnloop:

	
    mov 	prsnt,0
    mov 	si, offset staticdrop

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
    jmp 	falling

	ret

end	main