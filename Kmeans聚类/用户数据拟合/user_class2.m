%产生样本
%作者：Pygmalion
%时间：2019-5-7
clear
n = 50;
z = 0.02;
shift = shift(n);
for i=1:n
    %0~4  0.96/16
    x1 = 0.96*(ones(1,16));
    r1 = z*(rand(1,16)*2-1);
    x1 = x1+r1;
    %4~8 (0.0.8-0.96)/16
    deta = 0.16/16;
    x2 = (0.8+deta):deta:0.96;
    r2 = z*(rand(1,16)*2-1);
    x2 = x2+r2;
    x2 = flip(x2);
    %8~18 
    delta = 10/40;
    t = -10+delta:delta:0;
    x3 = 0.3+(0.005*t.*t);
    r3 = z*(rand(1,40)*2-1);
    x3 = x3+r3;
    %18~24 
    delta = 6/24;
    t = 0+delta:delta:6;
    x4 = 0.3+(0.0183*t.*t);
    r4 = z*(rand(1,24)*2-1);
    x4 = x4+r4;
    x = [x1,x2,x3,x4];
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
