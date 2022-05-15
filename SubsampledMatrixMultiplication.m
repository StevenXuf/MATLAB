function C = SubsampledMatrixMultiplication(A,B,p,c)
pd = makedist('Multinomial','probabilities',p);
sel = random(pd,c,1);
% A_sel = A(:,sel) ;
% B_sel = B(sel,:)./ p(sel);
% C = A_sel*B_sel ./ c;

% one line
C = A(:,sel) * (B(sel,:)./ p(sel)) ./c; 
end
