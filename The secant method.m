f = @(x) x^2 - sin(x) - .5;
a = 1; fa = f(a); b = 2; fb = f(b); N = 9;
for i = 1:N
c = b - fb*(b-a)/(fb-fa); fc = f(c);
if fa*fc<0, b=c;fb=fc; else, a=c;fa=fc; end
disp([i c fc ] )
end