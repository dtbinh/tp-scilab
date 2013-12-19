function codebook = nearal_gas(X, q)
    a = 0.2;
    b = 10;
    r = size(X, "r");
    Y = ones(q, 2);
    h = ones(q, r);
    Y(1) = X(100);
    Y(2) = X(200);
    Y(3) = X(300);
    //Y(4) = X(400);
    D = ones(q, 1);
    while a > 0.01
        for i = 1:r
            for j = 1:q
                D(j) = sqrt((X(i,1) - Y(j,1))*(X(i,1)-Y(j,1)) + (X(i,2) - Y(j,2))*(X(i,2)-Y(j,2)));
            end
            [d_order, old_index] = gsort(t, 'g', 'i');
            for j = 1:q
                h(old_index(j), X(i)) = d_order(j);
            end
        end
        a = a*b/(a + b);
    end
    codebook = Y;
endfunction
