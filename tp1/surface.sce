w0=-118.0:0.1:-116.0; 
w1=9.0:0.1:11.0;
//[W0,W1] = meshgrid(w0,w1);
[r1, c1] = size(w0');
[r2, c2] = size(w1');
for i=1:r1
  for j=1:r2
      e = M*[w0(i) w1(j)]' - t;
      E(i,j)=1/r1*e'*e;
  end;
end;
x = w0;
y = w1;
z = E;
figure();
plot3d(x, y, z);
