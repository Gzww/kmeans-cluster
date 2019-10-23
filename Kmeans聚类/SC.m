function sc = SC(X,idx,k)
%轮廓系数，处于-1到+1之间，值越大说明聚类结果越好
%作者：Pygmalion
%时间：2019-5-7
%X，样本（行为样本，列为属性，即200个样本，96个属性，样本为200*96）
%idx，返回每个样本的类别，1，2，...,k
%k,聚类数量
%sc,返回样本点的轮廓系数


A = [X,idx];%A表作为访问表
B = A;%B表作为执行表
[m,n] = size(X);
D = zeros(m,k);
a = zeros(m,1);
b = zeros(m,1);
for i=1:m
    for j=1:m
        if i==j
            continue
        end
        if A(i,n+1) == B(j,n+1)
            for q=1:n
                D(i,A(i,n+1)) =  D(i,A(i,n+1))+(A(i,q)-B(j,q))^2;
                E(i,A(i,n+1)) = D(i,A(i,n+1));;
                a(i) =  E(i,A(i,n+1));
                E(i,A(i,n+1)) = 0;
            end
        else
            for q=1:n
                D(i,B(j,n+1)) =  D(i,B(j,n+1))+(A(i,q)-B(j,q))^2;
                E(i,B(j,n+1)) = D(i,B(j,n+1));
            end
        end        
    end    
end

%寻找a(i)、b(i) 计算sc
for i=1:m
    for j=1:k-2
        E(i,find(E(i,:) == max(E(i,:)))) = 0;
    end
    b(i) = E(i,find(E(i,:) == max(E(i,:))));
end

for i=1:m
    numa = size(find(A(:,n+1) == A(i,n+1)));
    a(i) = a(i)/(numa(1)-1);
    numb = size(find(A(:,n+1) == find(find(E(i,:) == max(E(i,:))))));
    b(i) = b(i)/numb(1);
    sc(i) = (b(i)-a(i))/max([a(i) b(i)]);
end

end