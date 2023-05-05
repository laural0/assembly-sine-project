.model small
.stack 200h
.data
	mesaj db 13, 10, 'Introduceti numarul:$'
	mesaj1 db 13, 10, 'Rezultatul este 0$'
	mesaj2 db 13, 10, 'Transformare: $'
	mesaj3 db 13,10, 'Rezultatul este: $'
	mesaj4 db 13,10, 'Thank you $'

	numar dw 0
	suma dw 0
	suma1 dw 0
	termen dw 0
	
.code
	
		
	start:
		mov ax, @data
		mov ds, ax
		
		lea dx, mesaj
		mov ah, 9
		int 21h
		
		sin_x:
			
			mov ah, 01h
			int 21h
			
			mov cx, 10
			mov bh, 0
			
			cmp al, 30h
			je sin_0
			
			sub al, 48
			mov bl, al
				
			mov ax, numar
			mul cx
			add ax, bx
			mov numar, ax 
			jmp citireTasta
			
			
			citireTasta:
				mov ah, 01h
				int 21h
				
				cmp al, 13
				je conversie
				sub al, 48
				mov bl, al
				
				mov ax, numar
				mul cx
				add ax, bx
				mov numar, ax 
				jmp citireTasta
				
				sin_0:
				    lea dx, mesaj1
					mov ah,9
					int 21h
					jmp amTerminat	
				
				conversie:
				    mov ax, numar
					mov bx, 57
					div bx
					mov numar,ax
					push ax
					
					lea dx, mesaj2
		            mov ah, 9
		            int 21h
			
			        pop dx 
					add dl, 48
					mov ah, 02h
					int 21h
					sub dl, 48
					jz sin_0
					jmp sin
					
					
				sin:
					mov suma, dx;aici salvam suma
					mov termen, dx
					
					mov cx,2
					
					inmultire:
					  
					  mov ax, termen
					  mov bx, numar
					  mul bx
					  mul bx                       
					
					 mov bx,cx
					 dec bx
					 add bx,bx
					 xor dx,dx
					 div bx
					 inc bx
					 xor dx,dx
					 div bx
					 mov termen, ax
					 
					 mov ax,cx
					 mov bx,2
					 mov dx, 0
					 div bx
					 cmp dx, 0
					 je el_grad_par
					 jne el_grad_impar
			

					 el_grad_impar:
					 mov ax, suma
					 mov bx, termen
					 add ax,bx
					 mov suma, ax
					 jmp next
			
    				 el_grad_par:
					 mov ax, suma1
					 mov bx, termen
					 add ax, bx
					 mov suma1, ax
					 jmp next
					 
					 next:
					 inc cx
					 cmp cx,3
					 jle inmultire
					 jmp afisare_finala
					
			    afisare_finala: 
			    	lea dx, mesaj3
		            mov ah, 9
		            int 21h
					
					mov ax, suma
					mov bx, suma1
					sub ax,bx
					mov bx, 10
			    	mov cx, 0
				
			    	descompune:
					mov dx, 0
					div bx
					push dx
					inc cx
					
					cmp ax, 0
					je afisare
					jmp descompune	
				
		          afisare:
					pop dx 
					add dl, 48
					mov ah, 02h
					int 21h
					loop afisare 
				
				
				amTerminat:
				    lea dx, mesaj4
		            mov ah, 9
		            int 21h
					
					mov ah,6
					mov dl, 1
					int 21h
				
				mov ah, 04ch
				int 21h
				
	
	end start
´´´´´´´´´´´´´´´´´´´´´´¶¶¶¶¶¶¶¶¶
´´´´´´´´´´´´´´´´´´´´¶¶´´´´´´´´´´¶¶
´´´´´´¶¶¶¶¶´´´´´´´¶¶´´´´´´´´´´´´´´¶¶
´´´´´¶´´´´´¶´´´´¶¶´´´´´¶¶´´´´¶¶´´´´´¶¶
´´´´´¶´´´´´¶´´´¶¶´´´´´´¶¶´´´´¶¶´´´´´´´¶¶
´´´´´¶´´´´¶´´¶¶´´´´´´´´¶¶´´´´¶¶´´´´´´´´¶¶
´´´´´´¶´´´¶´´´¶´´´´´´´´´´´´´´´´´´´´´´´´´¶¶
´´´´¶¶¶¶¶¶¶¶¶¶¶¶´´´´´´´´´´´´´´´´´´´´´´´´¶¶
´´´¶´´´´´´´´´´´´¶´¶¶´´´´´´´´´´´´´¶¶´´´´´¶¶
´´¶¶´´´´´´´´´´´´¶´´¶¶´´´´´´´´´´´´¶¶´´´´´¶¶
´¶¶´´´¶¶¶¶¶¶¶¶¶¶¶´´´´¶¶´´´´´´´´¶¶´´´´´´´¶¶
´¶´´´´´´´´´´´´´´´¶´´´´´¶¶¶¶¶¶¶´´´´´´´´´¶¶
´¶¶´´´´´´´´´´´´´´¶´´´´´´´´´´´´´´´´´´´´¶¶
´´¶´´´¶¶¶¶¶¶¶¶¶¶¶¶´´´´´´´´´´´´´´´´´´´¶¶
´´¶¶´´´´´´´´´´´¶´´¶¶´´´´´´´´´´´´´´´´¶¶
´´´¶¶¶¶¶¶¶¶¶¶¶¶´´´´´¶¶´´´´´´´´´´´´¶¶
´´´´´´´´´´´´´´´´´´´´´´´¶¶¶¶¶¶¶¶¶¶¶