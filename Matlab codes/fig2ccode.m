Q_V = zeros(46, 1000);
variance = zeros(46, 1);
cycle_life = zeros(46, 1);

for j = 1:46
    for i = 1:1000
        Q_V(j, i) = batch(j).cycles(100).Qd(i) - batch(j).cycles(10).Qd(i);
    end
    variance(j) = var(Q_V(j, :));
    cycle_life(j) = batch(j).cycle_life;
end
loglog(variance, cycle_life, '.', 'MarkerSize', 20);

xlabel('Variance');
ylabel('Cycle Life');
title('Cycle Life vs Var(\DeltaQ(V)) on log-log axis');