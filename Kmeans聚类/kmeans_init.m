function init = kmeans_init(X,k)
%选择初始点
%作者：Pygmalion
%时间：2019-5-7
%X，样本（行为样本，列为属性，即200个样本，96个属性，样本为200*96）
%k，聚类样本数
%init,返回初始中心

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