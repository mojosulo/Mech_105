function [I] = simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated


%% Error handling
if nargin < 2
    error('not enough inputs')
end

if length(x) ~= length(y)
    error('Input vectors are not equal length')
end

gap = x(2:end)-x(1:end-1); %creates vector with spacing amounts of x
if all(gap(1)==gap(:)) ~= 1 %checks if the spacings are all equal or not
    error('Input X vector spacing not equal')
end
    
%% count how many segments are in x and what do do about it
seg = (length(x)-1)/2;  %resulting #segments / 2 
clean = abs(seg - floor(seg)); %pulls off fractional part of the division

%indicating if trap rule should be used or not   
if clean ~= 0
    warning('Using single trapazoidal rule on last 2 points')
    trap = true;
else
    trap = false;
end


%% Core Computations
I = 0; %initial running sum state
j = 1; %point index counter
for i = 1:floor(seg) %number of iterations of 1/3 rule
    
%     I = I + (b-a)((fx0 + 4fx1 + fx2)/6)
    I = I + (x(j+2) - x(j))*((y(j) + 4*y(j+1) + y(j+2)) / 6);

    j = j+2; %resets j to the last point for start of next segment

end



% End Trapizoidal rule
% I = (b-a)(fa + fb)/2
if trap == true
    I = I + (x(end)-x(end-1))*(y(end) + y(end-1))/2;   
end


fprintf('\n Integral value: %.9f \n \n',I)
end
