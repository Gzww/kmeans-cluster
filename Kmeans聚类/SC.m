function sc = SC(X,idx,k)
%����ϵ��������-1��+1֮�䣬ֵԽ��˵��������Խ��
%���ߣ�Pygmalion
%ʱ�䣺2019-5-7
%X����������Ϊ��������Ϊ���ԣ���200��������96�����ԣ�����Ϊ200*96��
%idx������ÿ�����������1��2��...,k
%k,��������
%sc,���������������ϵ��


A = [X,idx];%A����Ϊ���ʱ�
B = A;%B����Ϊִ�б�
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

%Ѱ��a(i)��b(i) ����sc
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