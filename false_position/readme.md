## False Position (Root Finding)
`falseposition.m`

### Algorithm Overview:
False position is an algorithm for root finding. 
It requires 2 initial guesses that straddle the root (bounds) and a single variable function to evaluate.
The algorithm has error checking to make sure the input bounds do infact straddle a root.

The formula for falseposition is `xr = xu - f(xu)*(xl - xu)/(f(xl) - f(xu));` where `xr` is the root estimation, `xu` `xl` are bounds and `f(xu)` `f(xl)` 
are the function evaluated at the bounds

After each iteration the algorithm evaluates which bound to replace with the last root estimation, thereby gradually converging on the real root.
The relative approximate error* is calculated at each iteration to determine if the change in values is small enough to justify convergence.


__Inputs__: 

`func` an single variable anonymous function

`xl` the lower bound value

`xu` the upper bound value

`es` _[optional]_ stopping criterion for relative approximate error* in percentage (default: .0001%)

`maxit` _[optional]_ maximum iteration value (default: 200)

   

__Outputs__: 

`root` estimated root value

`fx` function evaluated at estimated root

`ea` the approximate relative error* of estimation

`iter` iteration count

### Sample Usage:
```
>> f = @(x) x^2 - 4.5
>> xl = 1
>> xu = 4
>> es = 5  % this will compute root estimate to ea = 5%
>> falseposition(f,xl,xu,es)

Setting default maxit to 200

Estimated root = 2.07771e+00 
Function at root = -1.83110e-01 
Relative approimate error = 4.58468e+00 
Iteration count = 3
```


### Limitations:
- No known

### Future Improvements:
- Condense code
- adapt to work with `sym` defined function

\*Relative approximate error and `es` and `ea` are computed as (new - old)/(new)
