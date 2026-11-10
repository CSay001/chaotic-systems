% Rossler attractor
% Integrates the Rossler system with the explicit Euler method,
% starting from several initial conditions, and plots the x-y projection.
%
%   dx/dt = -y - z
%   dy/dt =  x + a*y
%   dz/dt =  b + z*(x - c)

close all
clearvars
clc

dt = 0.02;
t_final = 60;
T = 0:dt:t_final;
a = 0.2;
b = 0.2;
c = 7;

figure
hold on

% We consider several initial conditions (y0 = -8, -7, ..., -3).
for y0 = -8:1:-3
    x = 0.0;
    y = y0;
    z = 1.0;

    xs = zeros(size(T));    % store the trajectory, then plot it once
    ys = zeros(size(T));
    for k = 1:numel(T)
        xs(k) = x;
        ys(k) = y;
        new_x = x + (-y - z) * dt;
        new_y = y + (x + a*y) * dt;
        new_z = z + (b + z*(x - c)) * dt;
        x = new_x;
        y = new_y;
        z = new_z;
    end

    plot(xs, ys, 'b', 'LineWidth', 0.5);
end

scatter(0, 0, 'red', 'filled');   % origin
xlim([-15, 15]);
ylim([-15, 12]);
xlabel('X');
ylabel('Y');
title('Rossler attractor (x-y projection)');
hold off
exportgraphics(gcf, fullfile('figures', 'rossler.png'), 'Resolution', 150)
