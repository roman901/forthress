( x -- x+1 |
increments given value )
: inc 
1 +
;


( x -- | 
check parity of value | 
in case of even prints "value is even", in other case prints "value is not even". )
( : parity 
2 % 
if 
    ." value is not even " cr 
else 
    ." value is even " cr 
then 
; )
( x -- parity | in case of even returns 1, in other case returns 0 )
: parity 2 % if 0 else 1 then ;


( x -- | 
check prime of value | 
to come over bug in forthress with iteration was created simple idea: added conditions. )
( : is_prime 
dup 2 < 
if 
    drop ." can not check value " cr exit 
else 
then 
dup 2 = 
if 
    drop ." value is prime " cr exit 
else 
then 
dup dup 2 
do 
    if 
        dup r@ % 
    else 
        0 
    then 
loop 
if 
    ." value is prime " cr 
else 
    ." value is complex " cr 
then 
drop
; )


( x -- prime | 
check prime of value | 
to come over bug in forthress with iteration was created simple idea: added conditions. )
: is_prime 
dup 2 < 
if 
    drop 0 exit 
else 
then 
dup 2 = 
if 
    drop 1 exit 
else 
then 
dup 2 
do 
    if 
        dup r@ % 
    else 
        0 
    then 
loop 
if 
    1
else 
    0 
then 
; 

( value -- addr |
allocating memory in according with value amd stores value in menory )
( : push_mem 
dup 0 = 
if
    1 allot dup rot swap ! exit
else 
then
dup dup 8 / swap 8 % 
if 
    inc  
else 
then 
allot dup rot swap ! 
; )


( -- addr |
allocating 8 bite as 1 cell in memory returns address )
: push_mem 
1 allot 
;

( x -- |
Second task made with changes )
: prime_alloc
dup 2 < 
if 
    drop 0 push_mem exit 
else 
then 
dup 2 = 
if 
    drop 1 push_mem exit 
else 
then 
dup 2 
do 
if 
    dup r@ % 
else 
    0 
then 
loop 
if 
    1 push_mem 
else 
    0 push_mem 
then 
;


( x y -- x+1 y+1 |
increments to given values )
: inc_twice 
inc swap inc swap
;


( x y -- x y x y |
copies given values )
: dup_twice
over swap dup rot swap 
;

( from_addr to_addr -- |
copies one byte from from_addr to to_addr )
: copy_char 
c@ swap c! 
;


( quantity from_addr to_addr -- |
copies given amount of bytes from from_addr to to_addr )
: copy_string 
0 
do 
dup_twice 
copy_char 
inc_twice 
loop
drop drop 
;


( first_str_addr second_str_addr -- result_addr |
concat given strings returns new addres ) 
: concat
swap dup count >r swap dup count >r dup count rot dup 
count rot + rot swap inc heap-alloc dup >r over dup count 
copy_string count r@ + swap dup count copy_string r> r> r> inc + 
swap dup rot + 0x 0 swap c!
; 


( value -- [colltz_vector] | 
makes collataz vector on stack )
( : collatz
repeat
dup dup 2 % 
if
    3 * inc 
else 
    2 /
then
dup
1 = 
until 
; )

( value --  |
makes collatz vector and prints it )
: collatz 
repeat
dup 2 %
if
    3 * inc dup . cr
else
    2 / dup . cr
then
dup
1 = 
until
; 