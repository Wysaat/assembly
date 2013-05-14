; call C function

; use GCC, not GAS!!!
section .data
  fmt db "%s", 10, 0
  msg db "hello, World!"

section .text
  extern printf
  global main

main:
  push ebp
  mov ebp, esp

  push msg
  push fmt
  call printf 
  add esp, 8 

  mov esp, ebp
  pop ebp

  mov eax, 0
  ret
