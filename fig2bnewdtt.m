k = [1100 1122 1120 1072 1063 1053 1041 1060 1084 1073 1093 1094 1068 1073 1075 1072 1053 1064 1081 1067 1050 1059 1121 1093 1101 1104 1094 1089 1084 1083 1096 1065 1059 1079 1073 1086 1096 1088 1056 1077 1102 1115 1095 1092 1060 1055];
runningAvgWindow = 25;

figure; % Create a new figure to have separate data tips
Q_V_tot = cell(1,46);
V_tot = cell(1,46);

for i = 1:46
    V = batch(i).cycles(100).V(1:k(i));
    Q_V = zeros(k(i), 1);
    for m = 1:k(i)
        Q_V(m) = batch(i).cycles(100).Qd(m) - batch(i).cycles(10).Qd(m);
    end
    Q_V_tot{i} = Q_V;
    V_tot{i} = V;

    runningAvg = movmean(Q_V, runningAvgWindow);
    plot(runningAvg, V)
    hold on
end

xlabel('Q[100] - Q[10]')
ylabel('Voltage')
ylim([2, 3.6])
xlim([-0.16,0.2])

legend('Location', 'Best')

% Enabling data tips with custom DataTipTemplate
dcm_obj = datacursormode(gcf);
set(dcm_obj, 'UpdateFcn', @customDataTip);
set(dcm_obj, 'SnapToDataVertex', 'off');

function txt = customDataTip(~, event_obj)
    pos = get(event_obj, 'Position');
    target = get(event_obj, 'Target');
    displayName = get(target, 'DisplayName');
    txt = {['Cell: ', displayName], ...
           ['Q[100] - Q[10]: ', num2str(pos(1))], ...
           ['Voltage: ', num2str(pos(2))]};
end
