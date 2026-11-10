% Lorenz attractor
% Solves the Lorenz system with ode45 and plots
%   (1) the 3D attractor
%   (2) x(t), y(t), z(t) against time
%
%   dx/dt = sigma * (y - x)
%   dy/dt = x * (rho - z) - y
%   dz/dt = x * y - beta * z

close all
clearvars
clc

sigma = 10;
beta  = 8/3;
rho   = 28;                 % classic chaotic parameters

ICs   = [5, 5, 5];          % initial conditions
tspan = [0, 40];
OPTs  = odeset('RelTol', 1e-6, 'AbsTol', 1e-8);

lorenz_rhs = @(t, s) [ sigma * (s(2) - s(1));
                       s(1) * (rho - s(3)) - s(2);
                       s(1) * s(2) - beta * s(3) ];

[time, S] = ode45(lorenz_rhs, tspan, ICs, OPTs);

% (1) 3D attractor
figure
plot3(S(:,1), S(:,2), S(:,3)), grid on
xlabel('x(t)'), ylabel('y(t)'), zlabel('z(t)')
title('Lorenz attractor (\sigma = 10, \beta = 8/3, \rho = 28)')
axis tight
view(-30, 20)
exportgraphics(gcf, fullfile('figures', 'lorenz.png'), 'Resolution', 150)

% (2) Time series
figure
subplot(311)
plot(time, S(:,1), 'b', 'LineWidth', 1), grid minor
title('Lorenz system: x(t), y(t), z(t)'), ylabel('x(t)')
subplot(312)
plot(time, S(:,2), 'r', 'LineWidth', 1), grid minor
ylabel('y(t)')
subplot(313)
plot(time, S(:,3), 'k', 'LineWidth', 1), grid minor
xlabel('time'), ylabel('z(t)')
exportgraphics(gcf, fullfile('figures', 'lorenz_time.png'), 'Resolution', 150)