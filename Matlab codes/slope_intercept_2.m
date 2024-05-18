% Assuming you have loaded your data into a table named 'batch'

% Extract relevant columns from the table
cycles = batch.cycles;
Qd = batch.Qd;

% Reshape the data
cycles_reshaped = reshape(cycles, [], 1);
Qd_reshaped = reshape(Qd, [], 1);

% Perform linear regression
X = [ones(size(cycles_reshaped)), cycles_reshaped]; % Add a column of ones for intercept
coefficients = X\Qd_reshaped; % Compute coefficients

% Extract slope and intercept
intercept = coefficients(1);
slope = coefficients(2);

% Display results
disp(['Slope of the linear fit: ', num2str(slope)]);
disp(['Intercept of the linear fit: ', num2str(intercept)]);
