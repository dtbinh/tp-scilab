function codebook = competitive_learning(X, q)
    a = 0.2;
    b = 10;
    r = size(X, "r");
    Y = ones(q, 2);
    for i = 1:q
        Y(i) = X(i);
    end
    D = ones(q, 1);
    while a > 0.01
        for i = 1:r
            for j = 1:q
                D(j) = sqrt((X(i,1) - Y(j,1))*(X(i,1)-Y(j,1)) + (X(i,2) - Y(j,2))*(X(i,2)-Y(j,2)));
            end
            [_min, k] = min(D);
            Y(k, :) = Y(k, :) + a*(X(i, :) - Y(k, :));
        end
        a = a*b/(a + b);
    end
    codebook = Y;
endfunction
