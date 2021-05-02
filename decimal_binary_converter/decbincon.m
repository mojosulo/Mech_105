function [base2] = decbincon(base10)
%binary A simple function to convert a base10 number to binary
%   Inputs:
%       base10 - A number in base10
%   Outputs:
%       base2 - The base10 number converted to binary


if base10 <0
    error('Can only take positive integers')
end

if base10 == 0 %skips converting 0's and returns 0
    base2 = [0];
    return
end


maxit = 1023; %max iteration count, for a 64 float


x = floor(base10); %rounds input down saves to working variable


for i = 1:maxit %this loop finds new x's and stores in array
    a=0;
    for j = 1:maxit %this loop finds the biggest 2^x guess
        if 2^a <= x
            %guess isn't the biggest possible
            a = a+1;
            list(a) = 0; %store 0 in 2^a cell
        else
            %guess is just right
            cv = 2^(a-1); %correct value for max, 2^x that fits
            list(a) = 1; %store 1 in 2^a cell
            break
        end
        
        
    end
    
    x = x - cv;
    
    if x <= 0
        break
    end
    
    
end %end of first loop
base2 = flip(list);




end
