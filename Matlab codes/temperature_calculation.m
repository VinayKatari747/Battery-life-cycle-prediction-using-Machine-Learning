figure; % Create a new figure for the plot
hold on; % Hold the current plot

for i = 1:46
    mean_Qd = zeros(batch(i).cycle_life-1, 1); % Preallocate array to store mean Qd for each cycle
    for j = 1:batch(i).cycle_life-1
        mean_Qd(j) = max(batch(i).cycles(j).Qd); % Calculate mean Qd for each cycle
    end
    plot(1:(batch(i).cycle_life-1),mean_Qd, 'o-'); % Plot mean Qd over cycle life for each cell
end

ylabel('Mean Discharge Capacity (Qd)');
xlabel('Cycle Number');
title('Mean Discharge Capacity over Cycle Life for 46 Cells');
grid on; % Add grid to the plot
hold off; % Release the current plot

