## LU Decomposition (linear systems)
`lufactor.m`

### Algorithm Overview:
This algorithm finds the <a href="https://en.wikipedia.org/wiki/LU_decomposition">LU decomposition</a>  of the coefficient matrix `A` in a system where `A\B = C`.

It can operate on an NxN square matrix, and will pivot by magnitude to reduce the possibility of division by zero error.

The script contains a very verbose output of each interations' matrices and related information (comment out `fprintf` lines if desired)

There exists a built in MATLAB command `lu()` which should produce the same results is this script

__Inputs__: 

`A` a NxN square coefficient matrix

__Outputs__: 

`L` lower triangle matrix (contains Gaussian reduction factors)

`U` upper triangle matrix (contains the reduced system's coefficients)

`P` pivot matrix (contains the pivoted rearrangement of initial diagonal matrix)



### Sample Usage:
```
>> C = [ 2.3, 5.6; .45 .3]
>> [L,U,P] = lufactor(C)
L =

    1.0000         0
    0.1957    1.0000

U =

    2.3000    5.6000
         0   -0.7957

P =

     1     0
     0     1
```


### Limitations:
- No known

### Future Improvements:
- Condense code, reduce verbosity

