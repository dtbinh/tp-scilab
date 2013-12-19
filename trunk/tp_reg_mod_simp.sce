// MODELE SIMPLE  X = beta_0 + beta_1 r1 + eps
M = [ones(r1) r1]; // matrice des regresseurs
// Pour obtenir les estimations de beta, sigma^2, et la p-valeur du
// test de nullité de beta_1 au niveau alpha (à préciser)
alpha=0.05; // niveau du test
[gam,sigma2,pval]=regression(M,X,alpha);
