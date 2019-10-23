%产生样本
%作者：Pygmalion
%时间：2019-5-7
clear
n = 50;
z = 0.02;
shift = shift(n);
for i=1:n
    %0~7  0.14/28
    x1 = 0.14*(ones(1,28));
    r1 = z*(rand(1,28)*2-1);
    x1 = x1+r1;
    %7~9 (0.14-0.98)/8
    deta = 0.84/8;
    x2 = (0.14+deta):deta:0.98;
    r2 = z*(rand(1,8)*2-1);
    x2 = x2+r2;
    %9~20  1/44
    x3 = 0.98*(ones(1,44));
    r3 = z*(rand(1,44)*2-1);
    x3 = x3+r3;
    %20~23  (0.96-0.24)/12
    deta = 0.72/12;
    x4 = (0.24+deta):deta:0.96;
    r4 = z*(rand(1,12)*2-1);
    x4 = x4+r4;
    x4 = flip(x4);
    %23~24  (0.24-0.14)
    x5 = 0.14*(ones(1,4));
    r5 = z*(rand(1,4)*2-1);
    x5 = x5+r5;
    x5 = flip(x5);
    x = [x1,x2,x3,x4,x5];
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
