function codebook = frequency_learning(X, q)
    a = 0.2;
    b = 10;
    u = ones(q, 1);
    distace_multi_u = ones(q, 1);
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
                distace_multi_u(j) = D(j)*u(j);
            end
            [_min, k] = min(distace_multi_u);
            Y(k, :) = Y(k, :) + a*(X(i, :) - Y(k, :));
            u(k) = u(k) + 1;
        end
        a = a*b/(a + b);
    end
    codebook = Y;
endfunction
