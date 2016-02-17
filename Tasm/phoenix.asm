.model  tiny         
.data                
   stackrandom       dw 0
   random_number	 dw 8
   X                 db  0
   Y                 db  80 DUP (?)
   char_Random       db  133 
        .code      
		org     0100h
   main: 
        mov si,0  ;set  register pointer array at 0     
        mov     ah, 00h         ; Set to 80x25
        mov     al, 03h 
        int     10h    
		
        call readtime 
        call random_fist		
		;------------------------------------infinity loop------------------------------------ 
    loopInfinity:
		loopInner:	
			                      
			
			;---------ปริ้นตัวอักษรตัวใหม่------------
            call Move_cursor_XY   
			call print_line				
			call jmpdelay
			
			;--------- ลบตัวอักษรตัวที่ค้างอยู่บนหน้าจอ----------	                               
            sub y[si],11       
            call Move_cursor_XY  				   
            call Ereas_char				   
            add y[si],11 
			
            	
        ;-------ตรวจสอบแถวว่าลงไปหมดหน้าจอรึยังถ้าไปหมดแล้วให้สุ่มค่าแถวใหม่ลงไป-----
		cmp y[si],36
        JLE clearY 
            call random_minus_position
            add random_number,1 
           clearY: 			
		
		;-------ตรวจสอบหลักว่าหมดปริ้นหมดหน้าจอรึยังถ้าหมดแล้วให้เซตค่ากลับไปที่หลัก0 แล้วเริ่มปริ้นใหม่--------  	
            inc si	
			add x,1
			cmp x,80  
		 Jne loopInner
			mov x,0 
			mov si,0  
			
		 call readtime	
    jmp loopInfinity
	;--------------------------------------infinityloop---------------------------------------  
		

	jmpdelay:
			cmp x,35	
		JnE jumpdelay 
            call delay  
        jumpdelay:

		cmp x,50	
		JnE jumpdelay2 
            call delay  
        jumpdelay2:		
		
	ret		
	
	delay:	   
		mov     CX, 00h    ;---------delay-------
		mov     DX, 4240h
		mov     AH, 86H
		INT     15H 	   
	ret  
		  
		   
    Move_cursor_XY:		; 
		mov     ah, 02h         ; Move cursor XY
		mov     bh, 00h             
		mov     dh, y[si]
	    mov     dl, x
        int     10h 
	ret
	
	Write_soft_green:
	  call random_ascii
        mov     ah, 09h         ; Write a soft green colored char
        mov     al, char_Random
        mov     bh, 00h
        mov     bl, 0ah
        mov     cx, 0001h
        int     10h 
	ret
	
	Write_green:
	   call random_ascii
        mov     ah, 09h         ; Write a soft green colored char
        mov     al, char_Random
        mov     bh, 00h
        mov     bl, 02h
        mov     cx, 0001h
        int     10h 
	ret
	
	Write_white:
	   call random_ascii
		mov     ah, 09h         ; Write a white colored char
        mov     al, char_Random
        mov     bh, 00h
        mov     bl, 0Fh
        mov     cx, 0001h
        int     10h 
	ret
	Ereas_char:
		mov     ah, 09h         ; Ereas char
        mov     al, '8'
        mov     bh, 00h
        mov     bl, 00h
        mov     cx, 0001h
        int     10h
	ret	
	
	
	print_line:		
			call Write_white
			sub y[si],1
			call Move_cursor_XY  		
            call Write_white
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
			call Write_green
			sub y[si],1			
			call Move_cursor_XY		
			call Write_green
			sub y[si],1			
			call Move_cursor_XY		
			call Write_green
			add y[si],11			
			jne set_random_number3
              mov random_number,0  
          set_random_number3:
	ret
	
	readtime:
		  mov ah, 2ch
		  int 21h            
		  mov byte ptr stackrandom, dl 
	ret
	 
    random_minus_position:  		  
          mov ax, [stackrandom]
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
    ret
	  
	random_ascii:
		  mov ax, [stackrandom]
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
    ret
	 
ret
end     main