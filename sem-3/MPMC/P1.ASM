.model small
.data

a dw 1000h
b dw 2000h
c dw ?
.code
start:mov ax, @data
mov ds,ax

mov ax,a
add ax,b
mov c,ax

mov ah,4ch
int 21h
end start

