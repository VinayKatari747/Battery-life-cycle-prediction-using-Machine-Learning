% Voltage vs Discharge Capacity for 10th and 100 cycles
% fig-2a, page -3 
hold on
for i = 10:90:100
    plot(batch(1).cycles(10).Qd(1:1000), batch(1).cycles(i).V(1:1000))
end
xlabel('Discharge Capacity');
ylabel('Voltage');
title('V vs Qd at cycles-10,100');
legend('Cycle 100','Cycle 10');