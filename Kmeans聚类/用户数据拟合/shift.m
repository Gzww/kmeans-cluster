function shift = shift(num)
%����λ������
%���ߣ�Pygmalion
%ʱ�䣺2019-5-7
%num������������
%shift������ÿ���������ƶ����
rands = rand(1,num);
for i=1:num
    if rands(i)>=0 && rands(i)<=0.4
        shift(i) = 0;
    end
    if rands(i)>0.4 && rands(i)<=0.7
        shift(i) = 1;
    end
    if rands(i)>0.7 && rands(i)<=1
        shift(i) = -1;
    end    
end
end