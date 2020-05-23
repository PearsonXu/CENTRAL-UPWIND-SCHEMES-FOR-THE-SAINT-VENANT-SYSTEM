xx = -1:0.01:1; dx = 0.01;
y1 = xx + 2; y2 = 2*xx+3; y = [y1;y2];
U = GeneralMinmod(1,y,dx);
plot(xx,U);