% dQ/dV vs Volatge graphs g,h,i
dQ1 = batch(30).cycles(10).discharge_dQdV;
dQ2 = batch(30).cycles(100).discharge_dQdV;
V = batch(30).cycles(500).V(1:1000);
hold on
plot(V,dQ1);
plot(V,dQ2);
hold off
legend