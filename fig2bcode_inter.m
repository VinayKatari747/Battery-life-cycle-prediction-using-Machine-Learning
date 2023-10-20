%{
Q_V = zeros(1000, 0);
V = batch(15).cycles(100).V(1:1000);

hold on
for cy = 101:111
    for i = 1:1000
        Q_V(i) = batch(15).cycles(cy).Qd(i) - batch(15).cycles(10).Qd(i);
    end
    
    % Remove duplicate points from V
    [uniqueV, uniqueIndices] = unique(V);
    uniqueQ_V = Q_V(uniqueIndices);
    
    interpQ_V = interp1(uniqueV, uniqueQ_V, linspace(min(uniqueV), max(uniqueV), 1000));
    
    plot(interpQ_V, linspace(min(uniqueV), max(uniqueV), 1000));
    F = getframe(gca);
end

xlabel('Q[100] - Q[10]')
ylabel('Voltage')
title('V vs \DeltaQ(V)')
%}

Q_V = zeros(1000, 0);
V = batch(15).cycles(100).V(1:1000);

hold on
for cy = 101:111
    for i = 1:1000
        Q_V(i) = batch(15).cycles(cy).Qd(i) - batch(15).cycles(10).Qd(i);
    end
    
    % Remove duplicate points from V
    [uniqueV, uniqueIndices] = unique(V);
    uniqueQ_V = Q_V(uniqueIndices);
    
    interpQ_V = interp1(uniqueV, uniqueQ_V, linspace(min(uniqueV), max(uniqueV), 1000), 'nearest');
    
    plot(interpQ_V, linspace(min(uniqueV), max(uniqueV), 1000));
    F = getframe(gca);
end

xlabel('Q[100] - Q[10]')
ylabel('Voltage')
title('V vs \DeltaQ(V)')


