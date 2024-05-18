all_capacity_differences = cell(1, 46);

legend_labels = cell(1, 46);

% Initialize a figure for the plot
figure;

% Window size for the moving average filter
window_size = 5; % You can adjust this value as needed

% Iterate through each cell
for cell_idx = 1:46
    % Initialize variables to store cycle numbers and discharge capacity differences
    cycle_numbers = [];
    capacity_differences = [];

    % Get discharge capacity at cycle 2 (as reference)
    Qd_reference = mean(batch(cell_idx).cycles(2).Qdlin);

    % Iterate through each cycle for the current cell
    for j = 2:numel(batch(cell_idx).cycles)
        % Get discharge capacity values for the current cycle
        Qdlin = batch(cell_idx).cycles(j).Qdlin;

        % Calculate the average discharge capacity for the cycle
        avg_Qd = mean(Qdlin);

        % Calculate the difference in discharge capacity compared to cycle 2
        difference = avg_Qd - Qd_reference;

        % Store cycle number and discharge capacity difference
        cycle_numbers = [cycle_numbers, j];
        capacity_differences = [capacity_differences, difference];
    end

    % Apply polynomial fit
    poly_degree = 3; % You can adjust the polynomial degree as needed
    p = polyfit(2:numel(batch(cell_idx).cycles), capacity_differences, poly_degree);
    smoothed_differences = polyval(p, 2:numel(batch(cell_idx).cycles));

    % Store smoothed capacity differences for the current cell
    all_capacity_differences{cell_idx} = smoothed_differences;

    % Plot smoothed discharge capacity difference against cycle number for the current cell
    plot(2:numel(batch(cell_idx).cycles), smoothed_differences, 'LineWidth', 1); % Start from cycle 2
    hold on; % Hold the plot to add more data
    
    % Store legend label for the current cell
    legend_labels{cell_idx} = sprintf('Cell %d', cell_idx);
end

xlabel('Cycle Number');
ylabel('Discharge Capacity Difference (Ah)');
title('Discharge capacity fade curve for 40 cells');
ylim([-0.25,0])
grid on;

% Add legend
legend(legend_labels, 'Location', 'best');

hold off; % Release the hold on the plot


