INCLUDE Irvine32.inc

.data
   space BYTE " ",0
   line BYTE "   ------------------------------------",0
   a BYTE "   |  1.Input Matrix 1                |",0
   d BYTE "   |  2.Input Matrix 2                |",0
   g BYTE "   |  3.Display Matrix 1              |",0
   j BYTE "   |  4.Display Matrix 2              |",0
   m BYTE "   |  5.Addition of Matrices          |",0
   n BYTE "   |  6.Subtraction of Matrices       |",0
   o BYTE "   |  7.Multiplication of Matrices    |",0
   p BYTE "   |  8.Inverse of Matrix 1           |",0
   q BYTE "   |  9.Inverse of Matrix 2           |",0
   r BYTE "   |  0.Exit                          |",0
   invalid_msg BYTE "Invalid Choice !..",0
   input_order DWORD ?
   k BYTE " Matrix Calculator:",0
   input_msg BYTE "Enter your Choice: ",0
   input_value DWORD ?
   msg_for_input BYTE "Enter Order of Matrix  (2 or 3): ",0
   matrix2x2_A DWORD 4 DUP(0)
   matrix2x2_B DWORD 4 DUP(0)
   matrix3x3_A DWORD 9 DUP(0)
   matrix3x3_B DWORD 9 DUP(0)
   element_msg BYTE "Enter Elements of Matrix: ",0
   error_msg BYTE "Invalid Order choose only (2x2) or (3x3)",0
   display_msg1 BYTE "Displaying Matrix 1:",0
   display_msg2 BYTE "Displaying Matrix 2:",0
   go BYTE "Exiting....",0
   final2x2 DWORD 4 DUP(0)
   final3x3 DWORD 9 DUP(0)
   result1 DWORD 4 DUP(0)
   result2 DWORD 4 DUP(0)
   count DWORD 2
   result1_3x3 DWORD 9 DUP(0)
   result2_3x3 DWORD 9 DUP(0)
   result3_3x3 DWORD 9 DUP(0)
   count3x3 DWORD 4
   var DWORD ?
   product DWORD 9 DUP(0)
.code
main PROC
    call Menu
main ENDP

Menu PROC
    mov edx, OFFSET k
    call writestring
    call crlf

    mov edx, OFFSET line
    call writestring
    call crlf

    mov edx, OFFSET a
    call writestring
    call crlf

    mov edx, OFFSET d
    call writestring
    call crlf

    mov edx, OFFSET g
    call writestring
    call crlf

    mov edx, OFFSET j
    call writestring
    call crlf

    mov edx, OFFSET m
    call writestring
    call crlf

    mov edx, OFFSET n
    call writestring
    call crlf

    mov edx, OFFSET o
    call writestring
    call crlf

    mov edx, OFFSET p
    call writestring
    call crlf

    mov edx, OFFSET q
    call writestring
    call crlf

    mov edx, OFFSET r
    call writestring
    call crlf

    mov edx, OFFSET line
    call writestring
    call crlf

take:
    mov edx, OFFSET input_msg
    call writestring

    call ReadInt
    mov input_value, eax

    cmp input_value, 9
    ja Invalid
    cmp input_value, 0
    jb Invalid

    cmp input_value, 0
    je Exit_Menu

    cmp input_value, 1
    je Input_matrix_1

    cmp input_value, 2
    je Input_matrix_2
    

    cmp input_value, 3
    je Display_Matrix_1
    

    cmp input_value, 4
    je Display_Matrix_2
    
    
    cmp input_value, 5
    je Add_Matrix
    
    
    cmp input_value, 6
    je Subtract_Matrix
    
    
    cmp input_value, 7
    je Mul_Matrix

Invalid:
    mov edx, OFFSET invalid_msg
    call writestring
    call crlf
    jmp take
Menu ENDP

Input_Matrix_1 PROC
    mov edx, OFFSET a
	call writestring
    call crlf
    mov edx, OFFSET msg_for_input
	call writestring
	call readInt
	mov input_order, eax

	cmp input_order, 2
	jb fail
	cmp input_order, 3
	ja fail

    cmp input_order, 2
	je label2x2
	jmp label3x3


label2x2:	
	mov ecx, 4
	mov esi, OFFSET matrix2x2_A
	mov edx, OFFSET element_msg
	call Writestring
	call crlf

input_loop2x2:
	call readInt
	mov [esi],eax
	add esi, 4
	loop input_loop2x2
    call Menu
    ret

label3x3:
	mov ecx, 9
	mov esi, OFFSET matrix3x3_A
	mov edx, OFFSET element_msg
	call Writestring
	call crlf

input_loop3x3:
	call readInt
	mov [esi],eax
	add esi, 4
	loop input_loop3x3
    call Menu
    ret

fail:
	mov edx, OFFSET error_msg
	call Writestring
    call crlf
    ret
Input_Matrix_1 ENDP

Input_Matrix_2 PROC
    mov edx, OFFSET d
	call writestring
    call crlf
    mov edx, OFFSET msg_for_input
	call writestring
	call readInt
	mov input_order, eax

    cmp input_order, 2
	jb fail
	cmp input_order, 3
	ja fail

    cmp input_order, 2
	je label2x2
	jmp label3x3

label2x2:	
	mov ecx, 4
	mov esi, OFFSET matrix2x2_B
	mov edx, OFFSET element_msg
	call Writestring
	call crlf

input_loop2x2:
	call readInt
	mov [esi],eax
	add esi, 4
	loop input_loop2x2
    Call Menu
    ret

label3x3:
	mov ecx, 9
	mov esi, OFFSET matrix3x3_B
	mov edx, OFFSET element_msg
	call Writestring
	call crlf

input_loop3x3:
	call readInt
	mov [esi],eax
	add esi, 4
	loop input_loop3x3
    Call Menu
    ret

fail:
	mov edx, OFFSET error_msg
	call Writestring
    call Crlf
    ret
Input_Matrix_2 ENDP

Display_Matrix_1 PROC
    mov edx, OFFSET msg_for_input
	call writestring
	call readInt
	mov input_order, eax

    cmp input_order, 2
	jb fail
	cmp input_order, 3
	ja fail

    cmp input_order, 2
	je starting_offset2x2
	jmp starting_offset3x3

starting_offset2x2:
    mov edx, OFFSET display_msg1
    call WriteString
    call crlf
    mov esi, OFFSET matrix2x2_A
	mov ecx, 2
	mov edx, OFFSET space

display2x2:
    mov ebx, 2
inner:
    mov eax, [esi]
    call WriteInt
    call WriteString
    add esi, 4
    dec ebx
    jnz inner

    call Crlf
    loop display2x2
    Call Menu
    ret

starting_offset3x3:
    mov edx, OFFSET display_msg1
    call WriteString
    call crlf
    mov esi, OFFSET matrix3x3_A
	mov ecx, 3
	mov edx, OFFSET space

display3x3:
    mov ebx, 3
inner3x3:
    mov eax, [esi]
    call WriteInt
    call WriteString
    add esi, 4
    dec ebx
    jnz inner3x3

    call Crlf
    loop display3x3
    Call Menu
    ret
   
fail:
    mov edx, OFFSET error_msg
	call Writestring
    call Crlf
    ret
Display_Matrix_1 ENDP

Display_Matrix_2 PROC
    mov edx, OFFSET msg_for_input
	call writestring
	call readInt
	mov input_order, eax

    cmp input_order, 2
	jb fail
	cmp input_order, 3
	ja fail

    cmp input_order, 2
	je starting_offset2x2
	jmp starting_offset3x3

starting_offset2x2:
    mov edx, OFFSET display_msg2
    call WriteString
    call crlf
    mov esi, OFFSET matrix2x2_B
	mov ecx, 2
	mov edx, OFFSET space

display2x2:
    mov ebx, 2
inner:
    mov eax, [esi]
    call WriteInt
    call WriteString
    add esi, 4
    dec ebx
    jnz inner

    call Crlf
    loop display2x2
    Call Menu
    ret

starting_offset3x3:
    mov edx, OFFSET display_msg2
    call WriteString
    call crlf
    mov esi, OFFSET matrix3x3_B
	mov ecx, 3
	mov edx, OFFSET space

display3x3:
    mov ebx, 3
inner3x3:
    mov eax, [esi]
    call WriteInt
    call WriteString
    add esi, 4
    dec ebx
    jnz inner3x3

    call Crlf
    loop display3x3 
    Call Menu
    ret
   
fail:
    mov edx, OFFSET error_msg
	call Writestring
    call Crlf
    ret
Display_Matrix_2 ENDP
    
Add_Matrix PROC
    cmp input_order, 2
    je go2x2
    jmp go3x3

go2x2:
    mov esi, OFFSET matrix2x2_A
    mov edi, OFFSET matrix2x2_B
    mov edx, OFFSET final2x2
    mov ecx, lengthof final2x2

my2x2:
    mov eax, [esi]
    add eax, [edi]
    mov [edx], eax
    add esi,4
    add edi,4
    add edx,4
    loop my2x2

    mov edx, OFFSET m
    call writestring
    call crlf
    mov esi, OFFSET final2x2
    mov ecx, 2
    mov edx, OFFSET space

display_final2x2:
    mov ebx, 2
inner2:
    mov eax, [esi]
    call WriteInt
    call WriteString
    add esi, 4
    dec ebx
    jnz inner2

    call Crlf
    loop display_final2x2
    Call Menu
    ret

go3x3:
    mov esi, OFFSET matrix3x3_A
    mov edi, OFFSET matrix3x3_B
    mov edx, OFFSET final3x3
    mov ecx, lengthof final3x3

my3x3:
    mov eax, [esi]
    add eax, [edi]
    mov [edx], eax
    add esi,4
    add edi,4
    add edx,4
    loop my3x3

    mov edx, OFFSET m
    call writestring
    call crlf
    mov esi, OFFSET final3x3
    mov ecx, 3
    mov edx, OFFSET space

display_final3x3:
    mov ebx, 3
inner3:
    mov eax, [esi]
    call WriteInt
    call WriteString
    add esi, 4
    dec ebx
    jnz inner3

    call Crlf
    loop display_final3x3
 
    Call Menu
    ret
Add_Matrix ENDP

Subtract_Matrix PROC
    cmp input_order, 2
    je go2x2
    jmp go3x3

go2x2:
    mov esi, OFFSET matrix2x2_A
    mov edi, OFFSET matrix2x2_B
    mov edx, OFFSET final2x2
    mov ecx, lengthof final2x2

my2x2:
    mov eax, [esi]
    sub eax, [edi]
    mov [edx], eax
    add esi,4
    add edi,4
    add edx,4
    loop my2x2

    mov edx, OFFSET n
    call writestring
    call crlf
    mov esi, OFFSET final2x2
    mov ecx, 2
    mov edx, OFFSET space

display_final2x2:
    mov ebx, 2
inner2:
    mov eax, [esi]
    call WriteInt
    call WriteString
    add esi, 4
    dec ebx
    jnz inner2

    call Crlf
    loop display_final2x2
    call Menu
    ret

go3x3:
    mov esi, OFFSET matrix3x3_A
    mov edi, OFFSET matrix3x3_B
    mov edx, OFFSET final3x3
    mov ecx, lengthof final3x3

my3x3:
    mov eax, [esi]
    sub eax, [edi]
    mov [edx], eax
    add esi,4
    add edi,4
    add edx,4
    loop my3x3

    mov edx, OFFSET n
    call writestring
    call crlf
    mov esi, OFFSET final3x3
    mov ecx, 3
    mov edx, OFFSET space

display_final3x3:
    mov ebx, 3
inner3:
    mov eax, [esi]
    call WriteInt
    call WriteString
    add esi, 4
    dec ebx
    jnz inner3

    call Crlf
    loop display_final3x3
    Call Menu
    ret
Subtract_Matrix ENDP

Mul_Matrix PROC
    cmp input_order, 2
    je go2x2
    jmp go3x3

go2x2:
    mov ecx, 3             
    mov esi, OFFSET matrix2x2_A   
    mov edi, OFFSET matrix2x2_B   
    mov ebx, OFFSET result1   

new_matrix1:
    mov eax, [esi]            
    mov edx, [edi]   
    imul edx                   
    mov [ebx], eax            
    add edi, 4                
    add ebx, 4
    cmp count, 0
    je value 
    sub count, 2              
    loop new_matrix1
    
    cmp ecx,0
    je try

value:    
    mov edi, OFFSET matrix2x2_B
    add esi, 8
    mov count, 2
    jmp new_matrix1

try:
    mov count, 2
    mov ecx, 3             
    mov esi, OFFSET matrix2x2_A   
    mov edi, OFFSET matrix2x2_B  
    mov ebx, OFFSET result2 

    add edi,8
    add esi,4

new_matrix2:
    mov eax, [esi]            
    mov edx, [edi]   
    imul edx                   
    mov [ebx], eax            
    add edi, 4                
    add ebx, 4
    cmp count, 0
    je new_value 
    sub count, 2              
    loop new_matrix2
    
    cmp ecx,0
    je try_new

new_value:    
    mov edi, OFFSET matrix2x2_B
    add esi, 8
    add edi, 8
    mov count, 2
    jmp new_matrix2

try_new:
    mov esi, OFFSET result1
    mov edi, OFFSET result2
    mov edx, OFFSET final2x2
    mov ecx, 4

my:
    mov eax, [esi]
    add eax, [edi]
    mov [edx], eax
    add esi,4
    add edi,4
    add edx,4
    loop my

    mov edx, OFFSET o
    call writestring
    call crlf
    mov esi, OFFSET final2x2
    mov ecx, 2
    mov edx, OFFSET space

display_final:
    mov ebx, 2
inner2:
    mov eax, [esi]
    call WriteInt
    call WriteString
    add esi, 4
    dec ebx
    jnz inner2

    call Crlf
    loop display_final
    call Menu

go3x3:
    mov ecx, 8
    mov esi, OFFSET matrix3x3_A
    mov edi, OFFSET matrix3x3_B
    mov ebx, OFFSET result1_3x3

new_matrix1_3x3:
    mov eax, [esi]
    mov edx, [edi]
    imul edx
    mov [ebx], eax
    add edi, 4
    add ebx, 4
    cmp count3x3, 0
    je value3x3
    sub count3x3, 2
    loop new_matrix1_3x3

    cmp ecx,0
    je try3x3

value3x3:
    mov edi, OFFSET matrix3x3_B
    add esi, 12
    mov count3x3, 4
    jmp new_matrix1_3x3

try3x3:
    mov count3x3, 4
    mov ecx, 8             
    mov esi, OFFSET matrix3x3_A   
    mov edi, OFFSET matrix3x3_B   
    mov ebx, OFFSET result2_3x3 

    add edi,12
    add esi,4

new_matrix2_3x3:
    mov eax, [esi]            
    mov edx, [edi]   
    imul edx                   
    mov [ebx], eax            
    add edi, 4                
    add ebx, 4
    cmp count3x3, 0
    je new_value_11 
    sub count3x3, 2              
    loop new_matrix2_3x3
    
    cmp ecx,0
    je try_new_3x3

new_value_11:    
    mov edi, OFFSET matrix3x3_B
    add esi, 12
    add edi, 12
    mov count3x3, 4
    jmp new_matrix2_3x3

try_new_3x3:
    mov count3x3, 4
    mov ecx, 8             
    mov esi, OFFSET matrix3x3_A   
    mov edi, OFFSET matrix3x3_B  
    mov ebx, OFFSET result3_3x3 

    add edi,24
    add esi,8

new_matrix3_3x3:
    mov eax, [esi]            
    mov edx, [edi]   
    imul edx                   
    mov [ebx], eax            
    add edi, 4                
    add ebx, 4
    cmp count3x3, 0
    je new_value1 
    sub count3x3, 2              
    loop new_matrix3_3x3
    
    cmp ecx,0
    je try_new1

new_value1:    
    mov edi, OFFSET matrix3x3_B
    add esi, 12
    add edi, 24
    mov count3x3, 4
    jmp new_matrix3_3x3

try_new1:
    mov esi, OFFSET result1_3x3
    mov edi, OFFSET result2_3x3
    mov edx, OFFSET final3x3
    mov var, edx

    call Add_matrix_pro

    mov esi, OFFSET result3_3x3
    mov edi, OFFSET final3x3
    mov edx, OFFSET product
    mov var, edx
    call Add_matrix_pro
    call Final_show_product
    ret
MUl_Matrix ENDP

Add_matrix_pro PROC
    mov ecx, 9
my:
    mov eax, [esi]
    add eax, [edi]
    mov [edx], eax
    add esi,4
    add edi,4
    add edx,4
    loop my
    ret
Add_matrix_pro ENDP

Final_show_product PROC
    mov edx, OFFSET o
    call writestring
    call crlf
    mov esi, OFFSET product
    mov ecx, 3
    mov edx, OFFSET space

display_final:
    mov ebx, 3
inner2:
    mov eax, [esi]
    call WriteInt
    call WriteString
    add esi, 4
    dec ebx
    jnz inner2

    call Crlf
    loop display_final
    call Menu
    ret
Final_show_product ENDP

Exit_Menu PROC
    mov edx, OFFSET go
    call WriteString
    exit
Exit_Menu ENDP

END main
