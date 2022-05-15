n = 50;
m = 2000;

% i)
% A = randn(n,m);

% ii)
A = sample_A(n,m);

% p = optimal_p(A,A.',2);


err = zeros(m,2);
for c = 1:m
    % c)
    C = SubsampledMatrixMultiplication(A,A.',optimal_p(A,A.',2),c);
    % d)
    C2 = SubsampledMatrixMultiplication(A,A.',ones(m,1)/m,c);
    err(c,1) = norm(A*A.' - C,'fro');
    err(c,2) = norm(A*A.' - C2,'fro');
end

figure
plot(1:m,log10(err))
figure 
plot(1:m,err/norm(A*A.','fro'))


function p = optimal_p(A,B,lp)
m = size(A,2);
p = zeros(m,1);
for i =1:m
    p(i) = norm(A(:,i),lp) * norm(B(i,:),lp);
end

p = p / sum(p);
end