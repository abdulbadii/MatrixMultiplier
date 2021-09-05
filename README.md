Bash function to perform matrix mulpiplier with argument the two matrix in array data format and option to set the number of precision on command line

## Requirement  
  - `bash` (tested or developed using version 5)
  - `bc` (Linux basic calculator utility, 1.07)


## Uses

$ a=(4 2.5, 1 1); b=(1 2 2, 4 6 2); mul a b

4 23 13 
5 8 4


multiplying matrixes:
( 4 2.5 )     ( 1 2 2 )
( 1 1    ) x  ( 4 6 2 )

with result in no digit behind decimal point:

( 4 23 13 )
( 5 8 4    )

$ a=(4.1 2.5,1.7 1); b=(1 2 2, 4 6 2); mul a b 1

14.1 23.2 13.2 
5.7 9.4 5.4

the result being 1 digit behind decimal point
