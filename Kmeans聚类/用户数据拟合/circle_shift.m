function new = circle_class(old,num)
%Բ��������λ����Ϊ��λ�仯�����������ݲ�����ǰ�棬����ʱԲ����Ϊ
%���ߣ�Pygmalion
%ʱ�䣺2019-5-7
%old,ԭʼ����
%num���ƶ���λ��
%new�������ƶ��õ�����
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