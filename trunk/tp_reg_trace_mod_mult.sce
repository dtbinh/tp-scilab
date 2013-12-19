// Tracé du nuage de points
param3d1(r1,r2,list(X,-2));
a=get("current_axes');
a.cube_scaling="on";
// Définition du plan
s1=linspace(2,7,10);
s2=linspace(10,150,10);
z=gam(1)+gam(2)*s1'*ones(s2)+gam(3)*ones(s1')*s2;
// Tracé et rotation
for (i=200:-5:-50)
plot3d(s1,s2,z,alpha=77,theta=i,leg="r1@r2@X",flag=[0,0,3]);
end
