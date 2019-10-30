% Titlu: Laborator 1
% Autor: Calin George-Adrian
% Grupa: 334
% Data: 3 Octombrie 2019

ox = @(x) x-x;
plot(interval, ox(interval));
hold on

% Exercitiul 1
f1 = @(x) x.^3 - 7*x.^2 + 14*x - 6;
interval = linspace(0,4,100);
eps = 10^(-5);
xaprox1 = MetBisectie(f1,0,1,eps);
xaprox2 = MetBisectie(f1,1,3.2,eps);
xaprox3 = MetBisectie(f1,3.2,4,eps);

%plot(interval, f1(interval));
%plot(xaprox1,f1(xaprox1),'*');
%plot(xaprox2,f1(xaprox2),'*');
%plot(xaprox3,f1(xaprox3),'*');

% Exercitiul 2
y1 = @(x) exp(x) - 2
y2 = @(x) cos(exp(x) - 2)
interval2 = linspace(0.5,1.5,100);
xaprox = MetBisectie2(y1, y2, 0.5, 1.5, eps);

%plot(interval2,y1(interval2));
%plot(interval2,y2(interval2));
%plot(xaprox, y1(xaprox), '*');

% Exercitiul 3
fd = @(x) 3*x.^2 - 14*x + 14
eps2 = 10^(-3);
plot(interval, f(interval));
xaprox4 = MetNR(f1,fd,1,eps2);

plot(xaprox4,f1(xaprox4),'*');

function [xaprox] = MetBisectie(f, a, b, eps)
    a0 = a;
    b0 = b;
    x0 = (a0+b0)/2;
    N = log2(abs(b-a)/eps);
    
    for(k = 1:N)
        if(f(x0) == 0)
            x1 = x0;
            break;
        elseif(f(a0)*f(x0)<0)
            a1 = a0;
            b1 = x0;
            x1 = (a1+b1)/2;
        elseif(f(a0)*f(x0)>0)
            a1 = x0;
            b1 = b0;
            x1 = (a1+b1)/2;
        end;
        a0 = a1;
        b0 = b1;
        x0 = x1;
    end;
    xaprox = x0;
end

function [xaprox] = MetBisectie2(f1, f2, a, b, eps)
    a0 = a;
    b0 = b;
    x0 = (a0+b0)/2;
    N = log2(abs(b-a)/eps);
    
    for(k = 1:N)
        if(f1(x0) - f2(x0) == 0)
            x1 = x0;
            break;
        elseif(f1(a0)*f1(x0) - f2(a0)*f2(x0) < 0)
            a1 = a0;
            b1 = x0;
            x1 = (a1+b1)/2;
        elseif(f1(a0)*f1(x0) - f2(a0)*f2(x0) > 0)
            a1 = x0;
            b1 = b0;
            x1 = (a1+b1)/2;
        end;
        a0 = a1;
        b0 = b1;
        x0 = x1;
    end;
    xaprox = x0;
end

function [xaprox] = MetNR(f, f1, x0, eps)
    k = 1;
    x1 = x0 - f(x0)/f1(x0);
    while(abs(x1 - x0)/abs(x0) >= eps)
        k = k+1;
        x1 = x0 - f(x0)/f1(x0);
    end
    xaprox = x1;
end