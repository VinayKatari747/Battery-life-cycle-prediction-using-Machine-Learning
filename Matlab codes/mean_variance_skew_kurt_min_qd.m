% Initialize arrays to store statistics for all cycles
m = zeros(1000, 1);
n = zeros(1000, 1);
o = zeros(1000, 1);
q = zeros(1000, 1);
r = zeros(1000, 1);

for cy = 100:861
    % Determine the size of Qd array for the current cycle and cycle 2
    Qd_size_cycle = numel(batch(17).cycles(cy).Qd);
    Qd_size_cycle100 = numel(batch(17).cycles(100).Qd);
    
    % Determine the minimum size between the two cycles
    min_size = min(Qd_size_cycle, Qd_size_cycle100);
    
    % Initialize q_v for the current cycle
    q_v = zeros(min_size, 1);
    
    % Compute differences for the current cycle
    for i = 1:min_size
        q_v(i) = batch(17).cycles(100).Qd(i) - batch(17).cycles(cy).Qd(i);
    end
    
    % Calculate statistics for the current cycle
    m(cy-99) = mean(q_v); % Mean
    n(cy-99) = min(q_v); % Minimum
    o(cy-99) = var(q_v); % Variance
    q(cy-99) = skewness(q_v); % Skewness
    r(cy-99) = kurtosis(q_v); % Kurtosis
end

% Calculate overall statistics
overall_mean = mean(m); % Overall mean
overall_min = min(n); % Overall minimum
overall_variance = mean(o); % Overall variance (averaged across cycles)
overall_skewness = mean(q); % Overall skewness (averaged across cycles)
overall_kurtosis = mean(r); % Overall kurtosis (averaged across cycles)
