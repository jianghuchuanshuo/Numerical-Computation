% Uses Regula Falsi to find a root r, of a function f.
format long; % Set format to long to see more decimal places.
 
f = @(x) tan(x)-x; % Function to be evaluated.
 
% Interval [a,b] on which there exists a root, f(a)f(b)<0.
a = 4; b = 5;
 
step_size = Inf; % Set step_size to Inf to allow every e_step.
e_step = 1e-15; % User-specified error.
n = 0; % Variable used to count number of iterations.
 
% Main loop.
while (step_size >= e_step)
 c = b - (f(b)*(b-a)) / (f(b)-f(a));
 if f(a)*f(c) < 0
 % f(a) and f(c) have opposite signs, and so r is bracketed between a
 % and c. We set b=c and shorten our interval by b-c.
 step_size = b - c;
 b = c;
 else
 % f(a) and f(c) have the same sign, so r is bracketed between c and b.
 % We set a=c and shorten our interval by c-a.
 step_size = c - a;
 a = c;
 end
 n = n + 1; % Add one to number of iterations.
end
 
% Output.
fprintf('The approximate root after %d iterations is: %12.15f',n,c);
 
% Plot properties.
grid on; hold on;
title('Regula Falsi (Method of False Position)');
 
% Plot the function on interval x.
x = linspace(0,1,10);
plot(x,f(x));