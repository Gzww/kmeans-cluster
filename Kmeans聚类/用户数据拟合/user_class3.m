%产生样本
%作者：Pygmalion
%时间：2019-5-7
clear
n = 50;
z = 0.02;
shift = shift(n);
for i=1:n
    %0~5  
    x1 = 0.1*(ones(1,20));
    r1 = z*(rand(1,20)*2-1);
    x1 = x1+r1;
    %5~8 
    delta = 3/12;
    t = 0+delta:delta:3;
    x2 = 0.1+(0.095*t.*t);
    r2 = z*(rand(1,12)*2-1);
    x2 = x2+r2;
    %8~12
    delta = 4/16;
    t = 0+delta:delta:4;
    x3 = 0.96+(-0.0475*t.*t);
    r3 = z*(rand(1,16)*2-1);
    x3 = x3+r3;
    %12~14  
    delta = (0.96-0.2)/8;
    x4 = 0.2+delta:delta:0.96;
    r4 = z*(rand(1,8)*2-1);
    x4 = x4+r4;
    %14~18
    delta = 4/16;
    t = 0+delta:delta:4;
    x5 = 0.96+(-0.02875*t.*t);
    r5 = z*(rand(1,16)*2-1);
    x5 = x5+r5;
    %18-24
    delta = (0.5-0.08)/24;
    x6 = 0.08+delta:delta:0.5;
    r6 = z*(rand(1,24)*2-1);
    x6 = x6+r6;
    x6 = flip(x6);
    x = [x1,x2,x3,x4,x5,x6];
    x = circle_shift(x,shift(i));
    xn(i,:) = x;
    
end

for i=1:n
    plot(xn(i,:))
    axis([0 96 0 1.2])
    hold on
end
% plot(x)
% axis([0 96 0 1.2])
