function resphi = phi(X, c, w)
    rows_x = size(X, 'r');
    rows_c = size(c, 'r');
    resphi = ones(rows_x, rows_c);
    distance = 0.0;
    for i = 1:rows_x
        for j = 1:rows_c
            distance = sqrt((X(i,1) - c(j))*(X(i,1)-c(j)) + (X(i,2) - c(j))*(X(i,2)-c(j)));
            resphi(i, j) = distance;
        end
    end
    resphi = exp(-distance/(2*w(i)*w(i)));
endfunction

