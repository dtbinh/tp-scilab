function resw = RBFL(X, T)
    K = 25;
    w = 1.0;
    h = 2.0;
    X_c = frequency_learning(X, K);
    rows_x = size(X, 'r');
    rows_x_c = size(X_c, 'r');
    distance = ones(rows_x_c, 1);
    zones = ones(rows_x, 1);
    for i = 1:rows_x
        for j = 1:rows_x_c
            distance(j) = sqrt((X(i,1) - X_c(j,1))*(X(i,1)-X_c(j,1)) + (X(i,2) - X_c(j,2))*(X(i,2)-X_c(j,2)));
        end
        [d_min, index] = min(distance);
        zone(i) = index;
    end
    nb_element_in_zone = 0;
    distance_to_element = 0.0;
    w = ones(rows_x_c, 1); //size of centre
    for j = 1:rows_x_c
        nb_element_in_zone = 0;
        distance_to_elements = 0.0;
        for i = 1:rows_x
            if zone(i) == j then
                _d = sqrt((X(i,1) - X_c(j,1))*(X(i,1)-X_c(j,1)) + (X(i,2) - X_c(j,2))*(X(i,2)-X_c(j,2)));
                nb_element_in_zone = nb_element_in_zone + 1;
                distance_to_elements = distance_to_elements + _d;
            end
        end
        w(j) = h*distance_to_elements/nb_element_in_zone;
        disp(w(j));
    end
    resphi = ones(rows_x, rows_x_c);
    resphi = phi(X, X_c, w);
    PHI = [ones(rows_x_c, 1) resphi];
    disp(size(resphi));
    disp(size(ones(rows_x_c, 1)));
    resw = pinv(PHI)*T;
endfunction
