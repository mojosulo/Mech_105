function [root, fx, ea, iter] = falseposition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%
%INPUTS (5):
% func = single variable function
% xl = lower bound (left guess of root)
% ui = upper bound (right guess of root)
% es = stopping criteria (in percent) (default=.0001)
% maxit = maximum iterations (default=200)
% varargin = ...non existant additional arguments
%     
%OUTPUTS (4):
% root = estimated root
% fx = functions value at estimated root
% ea = the relative approximate error of root
% iter = iteration count







%error handling

% check arguments and error or set defaults
if nargin < 3
    error('Please input minimum number of arguments')
end
if nargin <= 4
    maxit = 200;
    disp('Setting default maxit to 200')
end
if nargin == 3
    es = .0001; %percent
    disp('Setting default es to .0001%')
end

%check domain of inputs
if nargin >= 5
    if es <= 0
        error('Please enter a non-zero positive es value')
    end
    if maxit <= 0
        error('Please enter non-zero maxit')
    end
end


%check if the bounds are useable (sign check)
if func(xu)*func(xl) >0 %if the f(x) have matching sign
    error('Chosen bounds dont have a root between them')
end




%setup intial parameters
format LONGENG %set format
f = func; %different variable used in calculations

xr = xl; %initial condition for ea to work with


for iter = 1:maxit
    
    
    lastx = xr;
        
    xr = xu - f(xu)*(xl - xu)/(f(xl) - f(xu));
       
    if f(xr) == 0  %check if first guess is a root bingo
        ea = 0;
        disp('---- Check the results, the root evaluated is suspiciously exactly 0(?) ----')
%         i = 0;
    else
        ea = abs((xr - lastx)/(xr))*100;
    end
    
    
    %check if close enough
    if ea <= es
        break %exit if true
    end
    
    %check sign to switch bound
    if f(xr)*f(xu) < 0
        xl = xr; %if xr and xu are different signs, lower switches
    else
        xu = xr; %if xr and xu are same sign, upper switches  
    end
 
end
root = xr; %correcting variables
fx = func(root);
% iter = i;

fprintf('\nEstimated root = %.5e \n', root)
fprintf('Function at root = %.5e \n', fx)
fprintf('Relative approimate error = %.5e \n', ea)
fprintf('Iteration count = %d \n \n', iter)










end




% call code
% Create a test function to test falsePosition function. 
% It is best to choose something where you already know the answer so it is
% easy to check if the solution your algorithms gives is correct.
% Polynomials are a nice starting place, since we have equations for the roots
% testFunc = @(x) x.^3; % the root for this is pretty clearly x=0
% 
% % now lets test the function, using default value for es
% x_left = -1;
% x_right = 1;
% [root, fx, ea, iter] = falsePosition(testFunc, x_left, x_right)