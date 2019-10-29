( 0 if even, 1 if odd )
: parity 2 % ;

( puts 1 on stack if given is prime, otherwise 0 )
: prime
    dup 2 < not if
    1 swap
        repeat 
            swap 1 + dup rot dup rot % not 
        until 
        = 
    else drop 0 then
;

( writes null-terminated string by at addres )
: write-word
  repeat
       over over 
       c@ swap c! 
       1 + swap 1 + swap 
       dup c@ not
  until ; 

( concatenates two null-terminated strings and returns addres of a result string )
: cat
  over count over count 
  1 + + allot
  rot over >r 
  write-word
  drop swap 
  write-word 
  drop 0 swap 
  c! r> ;

( prints Collatz sequence to stdout )
: collatz 
repeat 
    dup 1 = not 
    if 
        dup 2 % 
        if 
            3 * 1 + dup . cr 0 
        else 
            2 / dup . cr 0 
        then 
    then 
until ;

." Test parity of number 3: " cr
3 parity . cr

." Test parity of number 2: " cr
2 parity . cr cr

." Test primeness of number 3: " cr
3 prime . cr

." Test primeness of number 6: " cr
6 prime . cr cr

." Test string concat: " cr
m" hello, "
m" world!"
cat
prints cr cr

." Print collatz: " cr
10 collatz

