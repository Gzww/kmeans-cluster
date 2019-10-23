function [idx,cents,SSE] = kmeans_process(X,cents,k)
%kmeans�㷨��������
%���ߣ�Pygmalion
%ʱ�䣺2019-5-7
%X����������Ϊ��������Ϊ���ԣ���200��������96�����ԣ�����Ϊ200*96��
%cents����������
%k,��������
%idx������ÿ�����������1��2��...,k
%cents,�����µ���������
%SSE�����ؾ������

%�������е㵽ÿ�����ĵĵľ���
[m,n] = size(X);
SSE = 0;
D = zeros(m,k);
idx = zeros(m,1);
for c=1:k
    for i=1:m
        temp =0;
        for j=1:n
            temp = temp+(cents(c,j)-X(i,j))^2;
        end
        D(i,c) = temp;
    end    
end

%����idx��SSE
for i=1:m
    idx(i) = find(D(i,:) == min(D(i,:)));
    SSE = SSE+D(i,idx(i));
end
%���¾�������
for i=1:k
    new_cents = zeros(1,n);
    temp = find(idx == k);
    [m_temp,n_temp] = size(temp);
    for j=1:m_temp
        new_cents = new_cents(1,:)+X(temp(j),:);
    end
    cents(k,:) = new_cents/m_temp;
end
end