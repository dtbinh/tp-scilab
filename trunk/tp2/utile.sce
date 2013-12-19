x1 = -1:0.1:1;
x2 = -1:0.1:1;

[X1, X2] = meshgrid(x1, x2);

for i = 1:size(X1, 1)
    for j = 1:size(X1, 2)
        Y(i, j) = RBF([X1(i,j), X2(i, j)]);
    end
end
