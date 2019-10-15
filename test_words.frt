( .S 2 3 parity .S )
( .S 3 3 parity .S )
( .S 1 1 parity .S )
( -1 prime )
( 0 prime )
( 1 prime )
( 2 prime )
( 3 prime )
( 4 prime )
( 5 prime )
( 6 prime )
( 7 prime) 
( m" test" 1 + c@ 2 heap-alloc dup swap .S
140300132548677
140300132548677
101
rot
.S
101
140300132548677
140300132548677
swap
.S
140300132548677
101
140300132548677
c!
.S
140300132548677
1 printc
e
16 push_mem )
m" hello" m"  world" concat prints cr
m" test" m" hello" concat prints cr 
( : concat
.S ." start" cr swap dup count >r swap dup count >r dup count rot dup 
count rot + rot swap 1 + heap-alloc dup >r over dup count 
copy_string count r@ + swap dup count copy_string r> r> r>
; )
6 collatz
8 collatz


