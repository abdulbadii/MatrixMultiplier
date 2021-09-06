Copy the **MatrixMultiplier.sh** to ~/.bashrc by clicking it, select all and copy functions inside then paste it into ~/.bashrc   
**mul** is Bash function performing matrix multiplication with argument the two matrix in array data format and an option to set the number of precision on command line, and the other is to rotate 2D of a set of cartesian pairs.  

## Requirement  
  - `bash` (tested or developed on version 5)  
  - `bc` (Linux basic calculator utility version 1.07)   

## Uses
1. **mul**

```
  $ a=(4 2.5, 1 1); b=(1 2 2, 4 6 2)   
  $ mul a b   
  4 23 13   
  5 8 4
 ```   

Notice the comma delimiting each row, its matrix multiplying form:    

`( 4  2.5)    (1  2  2 )`    
`( 1  1  )    (4  6  2 )`   

the matrix result has no digit behind the decimal point:   

`( 4 23 13 )`   
`( 5  8  4  )`  

```
  $ a=(4.1 2.5,1.7 1); b=(1 2 2, 4 6 2)
  $ mul a b 1

  14.1 23.2 13.2   
  5.7 9.4 5.4
```

Notice **1** after ```mul a b```, so the result should have 1 digit behind decimal point   

2. **rot**   
rot, means rotate on plane, just uses the function code with specific second matrix that is a rotation one:  

**( cos -sin )   
( sin  cos )**

```
  $ a=(0 -32, 0 -12, 7 9);   
  $ rot a  
  Rotated by 45 degree based on cartesian system (counter clockwise)  
  -23 -23  
  -8 -8  
  11 1
```  

If no degree of rotation is specified, it'd default to 45   

```
  $ a=(0 -32, 0 -12, 7 9)   
  $ rot a 70 2   
  Rotated by 70 degree based on cartesian system (counter clockwise)   
  -30.07 -10.94  
  -11.28 -4.10  
  10.85 -3.50
```

the last argument, 2, is number of precision digit behind decimal point  
To specify it for the default 45 degree so always not typing the **45** :
```$ p=2 rot a```
or
```$ rot a p=2```

not ```$ rot a 2``` as the second argument is always assumed as the angle degree

