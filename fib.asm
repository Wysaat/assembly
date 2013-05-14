; fibonacci number calculation
; call C function to read parameter and print out result

section .data
  fmt1 db "%d", 10, 0
  fmt2 db "the %dth fibonacci number is %d", 10, 0

section .bss

section .text
  extern scanf    ; scanf("%d", num)
  extern printf   ; printf("the %dth fibonacci number is %d\n", fib(num))
  global main

main:
  push ebp
  mov ebp, esp
  push eax
  push fmt1
  call scanf
  add esp, 8
  pop eax
  pop ebp
  mov esp, ebp

  mov ecx, eax
  mov eax, 1
  mov ebx, 1
  sub ecx, 1
  sub ecx, 1
  jz print

loop:
  mov edx, eax
  mov eax, ebx
  add edx, eax
  mov ebx, edx
  sub ecx, 1
  jnz loop

print:
  xor eax, eax
  push ebp
  mov ebp, esp
  push ebx
  push fmt2
  call printf
  add esp, 8
  mov esp, ebp
  pop ebp

  mov eax, 0
  ret
