X2 = X(:, 9);
w2=inv(X2'*X2)*X2'*t;
Y2=X2*w2;

figure();
subplot(2, 1, 1);
plot(X2, t, 'b.');
plot(X2, Y2, 'r.');

subplot(2, 1, 2);
plot(Y2,t,'b.');
xtitle("Bivarie - Valeur prevu et reel");
