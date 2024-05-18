all_capacity_differences = cell(1, 46);

legend_labels = cell(1, 46);


figure;

% Window size for the moving average filter
window_size = 5; 


for cell_idx = 1:46
    % variables to store cycle numbers and discharge capacity differences
    cycle_numbers = [];
    capacity_differences = [];

    Qd_reference = mean(batch(cell_idx).cycles(2).Qdlin);

    for j = 2:numel(batch(cell_idx).cycles)

        Qdlin = batch(cell_idx).cycles(j).Qdlin;

        avg_Qd = mean(Qdlin);


        difference = avg_Qd - Qd_reference;


        cycle_numbers = [cycle_numbers, j];
        capacity_differences = [capacity_differences, difference];
    end


    poly_degree = 3; 
    p = polyfit(2:numel(batch(cell_idx).cycles), capacity_differences, poly_degree);
    smoothed_differences = polyval(p, 2:numel(batch(cell_idx).cycles));

    
    all_capacity_differences{cell_idx} = smoothed_differences;

    plot(2:numel(batch(cell_idx).cycles), smoothed_differences, 'LineWidth', 1); % Start from cycle 2
    hold on; % Hold the plot to add more data
    
    legend_labels{cell_idx} = sprintf('Cell %d', cell_idx);
end

xlabel('Cycle Number');
ylabel('Discharge Capacity Difference (Ah)');
title('Discharge capacity fade curve for 40 cells');
ylim([-0.25,0])
grid on;


legend(legend_labels, 'Location', 'best');

hold off; 


