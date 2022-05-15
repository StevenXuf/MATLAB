function [A,cols] = sample_A(m,n)
%sample_A
% Output matrix: A of dimensions (m x n)
A=randn(m,n);
nn=n/10; % Number of changed columns
cols=randperm(n,nn);
for i=1:nn
    A(:,cols(i))=A(:,cols(i)).*10;
end