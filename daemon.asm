BITS 64
CPU X64

%include "syscalls.asm"
%include "macros.asm"

%define stdin 0
%define stdout 1
%define stderr 2

%define mask_value 0

section .rodata
root_dir db "/", 0

section .text

global _start
_start:
        call fork_process
        call create_session
        call fork_process
        call reset_umask
        call change_dir
        call close_fd

        .loop:
                ; TODO: jmp sleep

                ; 
                ; main daemon logic goes here
                ; 

                jmp .loop

; create child process (duplicating current process)
fork_process:
        mov rax, syscall_fork
        syscall

        ; if function returns:
        ;   < 0: parent process dies (failure)
        ;     0: continue - it is child process (success)
        ;   > 0: parent process exits (success)
        cmp rax, 0
        jl die
        jg exit

        ret

; create a new session, if the current process is not a process group leader,
; to make current process session leader
create_session:
        mov rax, syscall_setsid
        syscall

        test rax, rax
        js die

        ret
       
; reset umask to 0
reset_umask:
        mov rax, syscall_umask
        mov rdi, mask_value
        syscall

        ret

; set working directory to root ("/")
change_dir:
        mov rax, syscall_chdir
        lea rdi, root_dir
        syscall

        test rax, rax
        js die

        ret

; close all standard file descriptors (stdin, stdout, stderr)
close_fd:
        close_file_descriptor stdin
        close_file_descriptor stdout
        close_file_descriptor stderr

        ret

; terminate current process with status code 0
exit:
        exit_program 0

; terminate current process with status code 1
die:
        exit_program 1

; TODO: add sleep
