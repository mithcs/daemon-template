; exits program with specified status code
%macro exit_program 1
        mov rax, syscall_exit
        mov rdi, %1
        syscall
%endmacro

; closes specified file descriptor
%macro close_file_descriptor 1
        mov rax, syscall_close
        mov rdi, %1
        syscall
        
        test rax, rax
        js die
%endmacro
