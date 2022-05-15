n = 5;
m = 50;
step = 10;
t1= 0;
t2 = 0;
err = 0;

while (t1 >= t2 || err > 0.5) && m <= 20000
    m = m +step;
    A = sample_A(n,m);
    p = optimal_p(A,A.',2);
    c = 8*round(log(m));
    pd = makedist('Multinomial','probabilities',p);
    tic 
    C = SubsampledMatrixMultiplication(A,A.',p,pd,c);
    t1 = toc;
    tic 
    D = A * A.';
    t2 = toc;
    err = norm(C-D,'fro') / norm(D);
%     m
%     [ t1 t2 err]
end

[m c]
[t1 t2]
err

function p = optimal_p(A,B,lp)
m = size(A,2);
p = zeros(m,1);
for i =1:m
    p(i) = norm(A(:,i),lp) * norm(B(i,:),lp);
end

p = p / sum(p);
end

function C = SubsampledMatrixMultiplication(A,B,p,pd,c)
sel = random(pd,c,1);
% A_sel = A(:,sel) ;
% B_sel = B(sel,:)./ p(sel);
% C = A_sel*B_sel ./ c;

% one line
C = A(:,sel) * (B(sel,:)./ p(sel)) ./c; 
end