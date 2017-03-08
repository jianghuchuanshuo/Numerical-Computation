clc
clear all
close all
fprintf('Please Choose The Method:\n');
fprintf('1 - Langrange Interpolation\n');
fprintf('2 - Newton Dividend Difference\n');
fprintf('3 - Newton Forward Difference\n');
fprintf('4 - Newton Backward Difference\n');
fprintf('5 - Spline Interpolation\n');
choice = input('\nEnter Your Choice: ');
switch choice

%langrang interpolation method    
case 1
clc
clear all
close all

x = [1;2;3;4;5];
y = [7;12;29;64;123];

syms z;
sol = ((z-x(2))*(z-x(3))*(z-x(4))*(z-x(5)))* y(1)/((x(1)-x(2))*(x(1)-x(3))*(x(1)-x(4))*(x(1)-x(5)));
sol = sol + ((z-x(1))*(z-x(3))*(z-x(4))*(z-x(5)))* y(2)/((x(2)-x(1))*(x(2)-x(3))*(x(2)-x(4))*(x(2)-x(5)));
sol = sol + ((z-x(1))*(z-x(2))*(z-x(4))*(z-x(5)))* y(3)/((x(3)-x(1))*(x(3)-x(2))*(x(3)-x(4))*(x(3)-x(5)));
sol = sol + ((z-x(1))*(z-x(2))*(z-x(3))*(z-x(5)))* y(4)/((x(4)-x(1))*(x(4)-x(2))*(x(4)-x(3))*(x(4)-x(5)));
sol = sol + ((z-x(1))*(z-x(2))*(z-x(3))*(z-x(4)))* y(5)/((x(5)-x(1))*(x(5)-x(2))*(x(5)-x(3))*(x(5)-x(4)));

y=simplify(sol);
fprintf('\nEquation Is: \n');
display(y);
y(z) = y;
fprintf('\nBack Checking the equation\n');
fprintf('sol(1)');
simplify(y(1))
fprintf('sol(2)');
simplify(y(2))
fprintf('sol(3)');
simplify(y(3))
fprintf('We see that the answers are same as given in question\n Thus, equation is correct\n');

    
%newton's dividend difference method    
case 2
clc
clear all
close all
    
x = [1;2;3;4;5];
y = [7;12;29;64;123];
for a=1:1:4
    col(1,a) = (y(a+1) - y(a))/(x(2) - x(1));
end
col = [col';0];
    
for b=1:1:3
    col2(1,b) = (col(b+1) - col(b))/(x(3) - x(1));
end
col2 = [col2';0;0];

for c=1:1:2
    col3(1,c) = (col2(c+1) - col2(c))/(x(4) - x(1));
end
col3 = [col3';0;0;0];

for d=1:1:1
    col4(1,d) = (col3(d+1) - col3(d))/(x(5) - x(1));
end
col4 = [col4';0;0;0;0];



fprintf('\nDividend Difference Table is\n ');
table = [x y col col2 col3 col4]

syms z;
sol = table(1,2) + (table(1,3)*(z - x(1))) + (table(1,4)*(z - x(1))* (z - x(2))) + (table(1,5)*(z - x(1))*(z-x(2))*(z-x(3))) + ( table(1,6)* (z-x(1)) * (z-x(2)) * (z-x(3))* (z-x(4)) );
y=simplify(sol);
display(y);

syms z;
y(z) = y;
fprintf('\nBack Checking the equation\n');
fprintf('sol(1)');
simplify(y(1))
fprintf('sol(2)');
simplify(y(2))
fprintf('sol(3)');
simplify(y(3))
fprintf('We see that the answers are same as given in question\n So equation is correct\n');


case 3
%newton's forward difference method
clc
clear all
close all

x = [1;2;3;4;5];
y = [7;12;29;64;123];

for a=1:1:4
    col(1,a) = y(a+1) - y(a);
end
col = [col';0];

for b=1:1:3
    col2(1,b) = col(b+1) - col(b);
end
col2 = [col2';0;0];

for c=1:1:2
    col3(1,c) = col2(c+1) - col2(c);
end
col3 = [col3';0;0;0];

for d=1:1:1
    col4(1,d) = col3(d+1) - col3(d);
end
col4 = [col4';0;0;0;0];
fprintf('Difference Table is\n ');
table = [x y col col2 col3 col4]

h = x(2) - x(1);
temp = x(1);
syms x;
u = (x - temp)/h;

sol = table(1,2) + (u * table(1,3)) + (u*(u-1)*table(1,4))/2 + (u*(u-1)*(u-2)*table(1,5))/6 + (u*(u-1)*(u-2)*(u-3)*table(1,6))/24;
fprintf('\nThe required equation is: \n');
y=simplify(sol);
display(y);
syms x;
y(x) = y;
fprintf('\nBack Checking the equation\n');
fprintf('sol(1)');
simplify(y(1))
fprintf('sol(2)');
simplify(y(2))
fprintf('sol(3)');
simplify(y(3))
fprintf('We see that the answers are same as given in question\n So equation is correct\n');

case 4
%newton's backward difference method
clc
clear all
close all

x = [1;2;3;4;5];
y = [7;12;29;64;123];

for a=1:1:4
    col(1,a) = y(a+1) - y(a);
end
col = [col';0];

for b=1:1:3
    col2(1,b) = col(b+1) - col(b);
end
col2 = [col2';0;0];

for c=1:1:2
    col3(1,c) = col2(c+1) - col2(c);
end
col3 = [col3';0;0;0];

for d=1:1:1
    col4(1,d) = col3(d+1) - col3(d);
end
col4 = [col4';0;0;0;0];
fprintf('Difference Table is\n ');
table = [x y col col2 col3 col4]

h = x(2) - x(1);
temp = x(5);
syms x;
u = (x - temp)/h;
sol = table(5,2) + (u * table(4,3)) + (u*(u+1)*table(3,4))/2 + (u*(u+1)*(u+2)*table(2,5))/6 + (u*(u+1)*(u+2)*(u+3)*table(1,6))/24;
fprintf('\nThe required equation is: \n');
y=simplify(sol);
display(y);
syms x;
y(x) = y;
fprintf('\nBack Checking the equation\n');
fprintf('sol(1)');
simplify(y(1))
fprintf('sol(2)');
simplify(y(2))
fprintf('sol(3)');
simplify(y(3))
fprintf('sol(4)');
simplify(y(4))
fprintf('sol(5)');
simplify(y(5))
fprintf('We see that the answers are same as given in question\n So equation is correct\n');


%linear spline interpolation
case 5
clc
clear all
close all

x = [1;2;3;4;5];
y = [7;12;29;64;123];

syms z;
sol = y(1) + ((y(2)-y(1)) * (z-x(1)))/(x(2)-x(1));
fprintf('\nSpline Between 1 & 2\n');
display(sol)

sol = y(2) + ((y(3)-y(2)) * (z-x(2)))/(x(3)-x(2));
fprintf('\nSpline Between 2 & 3\n');
display(sol)

sol = y(3) + ((y(4)-y(3)) * (z-x(3)))/(x(4)-x(3));
fprintf('\nSpline Between 3 & 4\n');
display(sol)

sol = y(4) + ((y(5)-y(4)) * (z-x(4)))/(x(5)-x(4));
fprintf('\nSpline Between 4 & 5\n');
display(sol)


end