% b)

m = 0;
n = 0;
step = 100;
time = 0;
time_tr = 1.0;
while time < time_tr
    m = m + step;
    n = n + step;
    A = randn(n,m);
    tic 
    B = A * A.';
    time = toc;
end

m

m = 0;
n = 0;
step = 100;
time = 0;
time_tr = 1.0;
while time < time_tr
    m = m + step;
    n = n + step;
    A = sample_A(n,m);
    tic 
    B = A * A.';
    time = toc;
end

m
