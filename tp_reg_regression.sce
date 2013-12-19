function [theta,MSE,pval, XE]=regression(M,X,alpha)
  // regression lineaire avec table d'anova
  // M = matrice (n,r) des regresseurs, X = observations (n,1)
  // theta = estimateur des parametres
  // MSE   = Mean Square Error estimateur de la variance
  // pval    = p-valeur du test de Ho : "pas de regresseurs"
  [n,r]=size(M); // r = nbre de régresseurs + 1
  theta = inv(M'*M)*M'*X; // estimateur des parametres
  // calcul des sommes de carres
  XE = M*theta;                 // projete sur E
  SSE = sum((X - XE).^2);       // ||X-XE||^2
  MSE = SSE/(n-r);
  printf("\n");
  printf("Estimateur de beta:\n");
  printf('beta_%d=%f\n', [0:r-1]',theta);
  printf("Estimateur de sigma^2: %f\n", MSE);
  SSM = sum((XE - mean(X)).^2); // ||XE-XH||^2
  MSM = SSM/(r-1);
  F = MSM/MSE;                      // Fisher
  q = cdff("F",r-1,n-r,1-alpha,alpha); // quantile d'ordre 1-alpha
  [pp,pval] = cdff("PQ",F,r-1,n-r);  // p-valeur
  // Affichage de la table d'anova
  printf("\n");
  printf("TABLE D''ANALYSE DE LA VARIANCE\n");
  printf("Source   SS      DF    MS      Fisher  p-valeur\n");
  printf("-----------------------------------------------\n");
  printf("Model  %6.1f   %3d  %6.1f    %4.1f    %f\n",SSM,r-1,MSM,F,pval);
  printf("Error  %6.1f   %3d  %6.1f\n",SSE,n-r,MSE);
  printf("-----------------------------------------------\n");
  printf("Quantile de F(%d,%d) d''ordre %f : %f\n",r-1,n-r,1-alpha,q);
endfunction;
