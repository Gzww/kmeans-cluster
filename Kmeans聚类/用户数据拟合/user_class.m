%产生样本
%作者：Pygmalion
%时间：2019-5-7
clear
n = 50;%产生的样本数量
z = 0.02;%随机数的衰减值
shift = shift(n);
for i=1:n
    %0~5  0.1/20=0.005  ，0-5个小时，每个小时4个点，也就是15分钟一个点，所以步长计算为0.1/20
    x1 = (0.7+0.005):0.005:0.8;
    r1 = z*(rand(1,20)*2-1);
    x1 = x1+r1;
    x1 = flip(x1);  %序列首尾倒置
    %5~9 0.25/16
    deta = 0.25/16;
    x2 = (0.7+deta):deta:0.95;
    r2 = z*(rand(1,16)*2-1);
    x2 = x2+r2;
    %9~12  1/12
    deta = 0.12/12;
    x3 = (0.83+deta):deta:0.95;
    r3 = z*(rand(1,12)*2-1);
    x3 = x3+r3;
    x3 = flip(x3);
    %12~14
    deta = 0.08/8;
    x4 = (0.83+deta):deta:0.91;
    r4 = z*(rand(1,8)*2-1);
    x4 = x4+r4;
    %14~24
    deta = 0.1/40;
    x5 = (0.81+deta):deta:0.91;
    r5 = z*(rand(1,40)*2-1);
    x5 = x5+r5;
    x5 = flip(x5);
    x = [x1,x2,x3,x4,x5];
    x = circle_shift(x,shift(i));
    xn(i,:) = x;
    
end
%绘制出样本点
for i=1:n
    plot(xn(i,:))
    axis([0 96 0 1.2])
    hold on
end
% plot(x)
% axis([0 96 0 1.2])
