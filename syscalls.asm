; Changes the current working directory of the calling process.
; 
; Arguments:
;   rdi = path to become the current working directory
; Returns:
;   On success: 0
;   On failure: -1
; Example:
;   chdir("/")
%define syscall_chdir 80

; Terminates the calling process immediately.
; 
; Arguments:
;   rdi = status code
; Returns:
;   Nothing
; Example:
;   exit(0)
%define syscall_exit 60


; Creates a new (child) process by duplicating the calling process.
; 
; Arguments:
;   None
; Returns:
;   On success:
;     To child: 0
;     To parent: pid of child process
;   On failure: -1
; Example:
;   fork()
%define syscall_fork 57

; Creates a new session if the calling process is not a process group leader.
; 
; Arguments:
;   None
; Returns:
;   On success: (new) session ID of the calling process
;   On failure: -1
%define syscall_setsid 112

; Sets the calling process's file mode creation mask to `mask(rdi) & 0777`.
; 
; Arguments:
;   rdi = mask value
; Returns:
;   Previous value of the mask is always returned
; Example:
;   umask(0)
%define syscall_umask 95

; Closes a file descriptor.
; 
; Arguments:
;   rdi = file descriptor to close
; Returns:
;   On success: 0
;   On failure: -1
; Example:
;   close(0)
%define syscall_close 3
