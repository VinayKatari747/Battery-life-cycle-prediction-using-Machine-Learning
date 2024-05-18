Qd = batch(1).cycles(2).Qd; % Replace [your_Qd_data] with your actual data

Qd_without_zeros = Qd(Qd ~= 0);
mean_without_zeros = mean(Qd_without_zeros); % Calculate mean excluding zero values
min_value_without_zeros = min(Qd_without_zeros); % Calculate minimum value excluding zero values
