donnees = [
5  92  7.8; 4  64  9.5; 6 124  6.4; 5  97  7.5; 5  79  8.1; 5  76  9.0;
6  93  6.1; 6  63  8.7; 2  13 15.4; 7 111  6.4; 7 143  4.4];
// definition des variables
r1=donnees(:,1); r2=donnees(:,2); X=donnees(:,3);
// allure des nuages
subplot(121), plot2d(r1,X,-2,"111","Age",[1,0,8,16]);
subplot(122), plot2d(r2,X,-3,"111","Kms",[0,0,150,16]);
