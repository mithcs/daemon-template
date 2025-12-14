# Double Fork Daemon Template

This repository contains double fork daemon template written in x86-64 assembly.

## Features

- Written in 100% Assembly
- No runtime dependencies
- Small size (<1KB)
- Bare minimum resource usage
- Zero dynamic allocations

## How to use

- Copy `daemon.asm`, `syscalls.asm` and `macros.asm` to your project
- Modify `daemon.asm` to suit your needs
- Build with `mise run build` or assemble and link manually

> [!NOTE]
> Make sure to change filename for your daemon
