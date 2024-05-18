% Initialize variables to store cycle numbers and internal resistances
cycle_numbers = [];
internal_resistances = [];

% Iterate through each cycle
for j = 2:702 % Assuming the first cycle is at index 1
    % Get voltage and current values for the current cycle
    V = batch(36).cycles(j).V;
    I = batch(36).cycles(j).I;
    
    % Calculate the internal resistance using Ohm's Law
    Ri = (max(V)-min(V)) / max(I);
    
    % Store cycle number and internal resistance
    cycle_numbers = [cycle_numbers, j];
    internal_resistances = [internal_resistances, Ri];
end

% Plot internal resistance against cycle number
plot(cycle_numbers, internal_resistances, 'LineWidth', 2);
xlabel('Cycle Number');
ylabel('Internal Resistance (Ohms)');
title('Internal Resistance vs. Cycle Number');
grid on;
