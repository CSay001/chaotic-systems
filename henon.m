% Henon map
% Iterates the Henon map with the classic chaotic parameters and plots
%   (1) the attractor in the x-y plane
%   (2) the first iterations of x and y against the iteration number
%
%   x_{n+1} = 1 + y_n - alpha * x_n^2
%   y_{n+1} = beta * x_n

close all
clearvars
clc

N = 10000;          % number of iterations
N_transient = 100;  % first iterations discarded before plotting the attractor

x = nan(N, 1);      % preallocate
y = nan(N, 1);

% initial conditions
x(1) = 1;
y(1) = 0;

% alpha controls the stretching, beta the thickness of the folding
alpha = 1.4;
beta  = 0.3;

for n = 2:N
    x(n) = 1 + y(n-1) - alpha * x(n-1)^2;
    y(n) = beta * x(n-1);
end

% (1) Attractor: each iterate is one point
figure
plot(x(N_transient+1:end), y(N_transient+1:end), '.', 'MarkerSize', 2)
xlabel('x'), ylabel('y')
title('Henon attractor (\alpha = 1.4, \beta = 0.3)')
exportgraphics(gcf, fullfile('figures', 'henon.png'), 'Resolution', 150)

% (2) Time evolution of the first 200 iterations
figure
plot3(1:200, x(1:200), y(1:200))
xlabel('iteration n'), ylabel('x'), zlabel('y'), grid on
title('Henon map: x and y over the first 200 iterations')
exportgraphics(gcf, fullfile('figures', 'henon_time.png'), 'Resolution', 150)