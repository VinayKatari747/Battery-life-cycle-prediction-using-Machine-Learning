m = zeros(48,9);
x = 91:100;
slope = zeros(48,1);
intercept = zeros(48,1);
for i = 1:48
    for j=91:100
        m(i,j) = max(batch(i).cycles(j).Qd);
    end
end

for i = 1:48
     y = m(i,91:100);
     p = polyfit(x,y,1);
     slope(i) = p(1);
     intercept(i) = p(2);
end