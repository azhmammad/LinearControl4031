
%Q4
% Define the transfer function of the system
num = [5 10]; % Numerator
den = [1 4 5]; % Denominator
sys = tf(num, den);

% Calculate system parameters
wn = sqrt(5); % Natural frequency
zeta = 4 / (2 * wn); % Damping ratio
wd = wn * sqrt(1 - zeta^2); % Damped natural frequency

%% 1. Settling Time
% Settling time for 2% criterion
Ts = 4 / (zeta * wn); % Settling time (2%)
disp(['Settling time (2%): ', num2str(Ts), ' seconds']);

% Settling time for 5% criterion
Ts_5 = 5 / (zeta * wn); % Settling time (5%)
disp(['Settling time (5%): ', num2str(Ts_5), ' seconds']);

%% 2. Delay Time
Td = 1.4 / (zeta * wn); % Delay time
disp(['Delay time: ', num2str(Td), ' seconds']);

%% 3. Rise Time
Tr = (pi - acos(zeta)) / (wd); % Rise time
disp(['Rise time: ', num2str(Tr), ' seconds']);

%% 4. Maximum Overshoot
Mp = exp((-pi * zeta) / sqrt(1 - zeta^2)) * 100; % Maximum overshoot
disp(['Maximum overshoot: ', num2str(Mp), ' percent']);

%% 5. Steady-State Error
% DC gain of the system
dc_gain = dcgain(sys);
ess = 1 / (1 + dc_gain); % Steady-state error
disp(['Steady-state error: ', num2str(ess)]);


