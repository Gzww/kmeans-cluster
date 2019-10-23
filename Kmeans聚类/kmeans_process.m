function [idx,cents,SSE] = kmeans_process(X,cents,k)
%kmeans算法迭代过程
%作者：Pygmalion
%时间：2019-5-7
%X，样本（行为样本，列为属性，即200个样本，96个属性，样本为200*96）
%cents，样本中心
%k,聚类数量
%idx，返回每个样本的类别，1，2，...,k
%cents,返回新的样本中心
%SSE，返回均方误差

%计算所有点到每个中心的的距离
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

%计算idx和SSE
for i=1:m
    idx(i) = find(D(i,:) == min(D(i,:)));
    SSE = SSE+D(i,idx(i));
end
%更新聚类中心
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