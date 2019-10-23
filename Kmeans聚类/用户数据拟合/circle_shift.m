function new = circle_class(old,num)
%圆周序列移位，因为移位变化后最后面的数据补到最前面，所以时圆周以为
%作者：Pygmalion
%时间：2019-5-7
%old,原始数据
%num，移动的位数
%new，返回移动好的数据
[m,n] = size(old);
k=1;
if num > 0
    for i=num+1:n
        new(k) = old(i);
        k = k+1;
    end
    for i=1:num
        new(k) = old(i);
        k = k+1;
    end
end
if num < 0
    for i=(num+n+1):n
        new(k) = old(i);
        k = k+1;
    end
    for i=1:(n+num)
        new(k) = old(i);
        k = k+1;
    end
end

if num == 0
    new = old;
end

end