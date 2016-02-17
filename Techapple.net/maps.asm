        .model  tiny


        .data


n       db      15;end y
stop    db      100; stop down
                ;start,stop,xposition 
all     db      6,15,6, 8,20,9 ,5,25,15 ,4,16,21 ,1,9,75 ,2,10,65 ,5,20,72 ,7,23,63 ,14,25,49 ,4,23,55 
                ;0      1       2        3        4       5        6        7        8         9
xl      db      0 ; frist letter 
px      db      0 ; other letter
start   db      0; start y 
line    db      0 

i       db      0;prasent line
j       db      9;max line


        .code
        org     0100h
main:   mov     ah, 00h         ; Set to 80x25
        mov     al, 03h
        int     10h

 ;-------------------------------------------------
    ;start
    mov si, offset all 
    down:

        loopy:
;-----------------------------------
    ;set xl set px 
            mov ah,[si]
            mov px,ah
            inc byte ptr [si]
;------------------------------------ 
    ;set n set line
            inc si
            mov ah,[si]
            mov n,ah
            inc si
            mov ah,[si]
            mov line,ah
            inc si
;------------------------------------
            mov     ah, 02h         ; Move cursor XY
            mov     bh, 00h
            mov     dh, xl      ;y
            mov     dl, line    ;x
            int     10h


            mov     ah, xl
            cmp     n,ah
            jge c01

        c00:;drow back
            mov     ah, 09h         ; Write a colored char
            mov     al, '0'
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp go0
        c01:;drow color
            mov     ah, 09h         ; Write a colored char
            mov     al, xl
            mov     bh, 00h
            mov     bl, 0fh
            mov     cx, 0001h
            int     10h
        go0:

;-------------------------------------------------
            
            ;first letter
            sub px,1

            ;mov ah,px
            ;mov start,ah
            ;jge 
        

            mov     ah, 02h         ; Move cursor XY
            mov     bh, 00h
            mov     dh, px
            mov     dl, line
            int     10h

            mov     ah, px
            cmp     n,ah
            jge c12
        c11:    ;drow back
            mov     ah, 09h         ; Write a colored char
            mov     al, '1'
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp go1
        c12:    ;drow color
            mov     ah, 09h         ; Write a colored char
            mov     al, px
            mov     bh, 00h
            mov     bl, 0fh
            mov     cx, 0001h
            int     10h
        go1:
    ;----------------------------------------------------
            ;second letter
            sub px,1
      
            mov     ah, 02h         ; Move cursor XY
            mov     bh, 00h
            mov     dh, px
            mov     dl, line
            int     10h

            mov     ah, px
            cmp     n,ah
            jge c22
        c21:    ;drow back
            mov     ah, 09h         ; Write a colored char
            mov     al, '2'
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp go2
        c22:    ;drow color
            mov     ah, 09h         ; Write a colored char
            mov     al, px
            mov     bh, 00h
            mov     bl, 0Ah
            mov     cx, 0001h
            int     10h
        go2:
    ;----------------------------------------------------
            ;thired letter
            sub     px, 1
            mov     ah, 02h         ; Move cursor XY
            mov     bh, 00h
            mov     dh, px
            mov     dl, line
            int     10h

            mov     ah, px
            cmp     n,ah
            jge c32
        c31:    ;drow back
            mov     ah, 09h         ; Write a colored char
            mov     al, '3'
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp go3
        c32:    ;drow color
            mov     ah, 09h         ; Write a colored char
            mov     al, px
            mov     bh, 00h
            mov     bl, 0Ah
            mov     cx, 0001h
            int     10h
        go3:
    ;----------------------------------------------------
            ;fourth letter
            sub px,1      
            mov     ah, 02h         ; Move cursor XY
            mov     bh, 00h
            mov     dh, px
            mov     dl, line
            int     10h

            mov     ah, px
            cmp     n,ah
            jge c42
        c41:    ;drow back
            mov     ah, 09h         ; Write a colored char
            mov     al, '4'
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp go4
        c42:    ;drow color
            mov     ah, 09h         ; Write a colored char
            mov     al, px
            mov     bh, 00h
            mov     bl, 02h
            mov     cx, 0001h
            int     10h
        go4:
    ;----------------------------------------------------
            ;fifth letter
            sub     px,1
            mov     ah, 02h         ; Move cursor XY
            mov     bh, 00h
            mov     dh, px
            mov     dl, line
            int     10h

            mov     ah, px
            cmp     n,ah
            jge c52
        c51:    ;drow back
            mov     ah, 09h         ; Write a colored char
            mov     al, '5'
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp go5
        c52:    ;drow color
            mov     ah, 09h         ; Write a colored char
            mov     al, px
            mov     bh, 00h
            mov     bl, 02h
            mov     cx, 0001h
            int     10h
        go5:
    ;----------------------------------------------------
            ;sixth letter
            sub     px, 1
            mov     ah, 02h         ; Move cursor XY
            mov     bh, 00h
            mov     dh, px
            mov     dl, line
            int     10h

            mov     ah, px
            cmp     n,ah
            jge c62
        c61:    ;drow back
            mov     ah, 09h         ; Write a colored char
            mov     al, '6'
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h
            jmp go6
        c62:    ;drow color
            mov     ah, 09h         ; Write a colored char
            mov     al, px
            mov     bh, 00h
            mov     bl, 08h
            mov     cx, 0001h
            int     10h
        go6:
    
    ;-------------------------------------------------------
            ;turn to back
            sub     px,1
            mov     ah, 02h         ; Move cursor XY
            mov     bh, 00h
            mov     dh, px
            mov     dl, line
            int     10h

            mov     ah, 09h         ; Write a colored char
            mov     al, '0'
            mov     bh, 00h
            mov     bl, 00h
            mov     cx, 0001h
            int     10h

    ;------------------------------------------------------         
         add i,1
        ; mov dh,xl
        ; mov px,dh
;--------------------------------------------------
;       end loopy
        mov ah,i
        cmp ah,j
        ja endloopy; false? exit loop
        jmp loopy
        endloopy:


    mov i,0
    mov si, offset all
;------------------------------
    ;delay
    mov AH ,86H
    mov cx,001eh
    mov dx,4840h
    int 15h
;---------------------------------------
;       end down
    mov ah,stop
    cmp xl,ah
    ja enddown ; false? exit loop
    jmp down
    enddown:

ret
end     main