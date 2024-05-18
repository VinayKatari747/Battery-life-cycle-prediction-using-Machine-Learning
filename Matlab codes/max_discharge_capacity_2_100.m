m = zeros(46,2);
for i = 1:46
    m(i, 1) = mean(batch(i).cycles(2).Qd);
    m(i, 2) = mean(batch(i).cycles(100).Qd);
end
