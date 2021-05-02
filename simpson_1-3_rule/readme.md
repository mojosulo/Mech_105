## Simpson's 1/3 Role (numerical integration)
`simpson.m`

### Algorithm Overview:
<a href="https://en.wikipedia.org/wiki/Simpson%27s_rule">Simpson's 1/3 Rule</a> is a numerical integration technique. 
This algorithm will take the input segment count, subdevide that into multiple 1/3 rule (2 segment) chunks, computer each chuck, then sum all chucks to obtain an overal estimate of the integral.
If the segment count doesn't divide evenly into 2 segment chunks, then the leftover segment will be computed with a simple <a href="https://en.wikipedia.org/wiki/Trapezoidal_rule">Trapezoidal Rule</a> (it will notify the user if this is used).

__Inputs__: 

`X` a 1-D array containing independant variable's values (x)

`Y` a 1-D array containing dependant values (f(x))

__Outputs__: 

`I` estimated integral value 


### Sample Usage:
```
>> x = 1:6
>> y = x.^2
>> simpson(x,y)

Warning: Using single trapazoidal rule on last 2 points 
> In simpson (line 30) 

 Integral value: 71.833333333 

```


### Limitations:
- Tabular datasets
- Equally spaced independant variable values

### Future Improvements:
- Ability to use with anonymous functions
- Romberg integration option for calculating error
- Simpsons 3/8 option
