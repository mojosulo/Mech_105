## Decimal -> Binary Converter
`decbincon.m`

### Algorithm Overview:
This algorithm converts positive base10 integer to base2. 

If the input integer is fractional, it will be rounded down to the nearest integer with `floor(input)`


__Inputs__: `base10` a (+) base10 integer

__Outputs__: `base2` a 1-D array with each bit value (correct direction as period on right)



### Sample Usage: 
```
>> decbincon(34)
ans =

     1     0     0     0     1     0

```

### Limitations:
- Max iteration count is 1023, therefore the 64bit float is the highest precision possible.
- Cannot convert fractional base10
- Cannot convert negative base10



### Future Improvements:
- Decimal conversion (with error approximation)  
- Negative integers to 2's compliment
- Notify user of when input is floored to integer
- Add `format short`
