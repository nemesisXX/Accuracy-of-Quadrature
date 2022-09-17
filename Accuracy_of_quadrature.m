%%
f=@(x)(exp(x).^2).*(sin(x).^2); 
f4=@(x)-8*exp(2*x).*(3*(sin(x)).^2-5*(cos(x)).^2);
a=input('Enter lower limit a: '); 
b=input('Enter upper limit b: ');
n=input('Enter the  number of sub-intervals n: '); 
h=(b-a)/n;
if rem(n,2)==1
   fprintf('\n Enter valid n!!!'); 
   n=input('\n Enter n as even number ');
end
i = linspace(1,n,n);
x(i)=a+i*h;
y(i)=f(x(i));
y4(i)=f4(x(i));
so=0;se=0;
for i=1:1:n-1
    if rem(i,2)==1
       so=so+y(i);%sum of odd terms
     else
       se=se+y(i); %sum of even terms
    end
end
% Formula:  (h/3)*[(y0+yn)+2*(y3+y5+..odd term)+4*(y2+y4+y6+...even terms)]
answer=h/3*(f(a)+f(b)+4*so+2*se);
f4_max = max(y4(i));
error = ((h^4)/180)*(b-a)*f4_max;
fprintf('\n The value of integration is %f',answer);
fprintf('\n The error of Composite Simspon rule is %f',error);
%%
err_sim = zeros(5,1);
for n = [2,4,6,8,10]
    a = 0;
    b = 1;
    h = (b-a)/n;
    f4=@(x)-8*exp(2*x).*(3*(sin(x)).^2-5*(cos(x)).^2);
    i = linspace(1,n,n);
    x(i)=a+i*h;
    y4(i)=f4(x(i));
    f4_max = max(y4(i));
    err_sim(n/2) = ((h^4)/180)*(b-a)*f4_max;
end
err_sim