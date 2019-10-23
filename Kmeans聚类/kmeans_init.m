function init = kmeans_init(X,k)
%ѡ���ʼ��
%���ߣ�Pygmalion
%ʱ�䣺2019-5-7
%X����������Ϊ��������Ϊ���ԣ���200��������96�����ԣ�����Ϊ200*96��
%k������������
%init,���س�ʼ����

[m,n] = size(X);
init = zeros(k,n);
D = zeros(m,1);
init(1,:) = X(1,:);
for i=2:k
    for j=1:m
        temp=0;
        for c=1:n
            temp = temp+(X(j,c)-init(i-1,c))^2;
        end
        D(j) = D(j) + temp;
        
    end
    
    idx = find(D(:) == max(D));
    init(i,:) = X(idx,:);
end
end