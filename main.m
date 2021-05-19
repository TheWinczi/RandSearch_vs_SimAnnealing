% ========================================
% Program compare two algorithms:
% 1. Random Searching
% 2. Simulated Annealing
%
% each program uses Gauss method to random
% next position/next position vector
% ========================================

close all
clear
clc

[x, y] = meshgrid(-3:0.25:3, -3:0.25:3);
z = func(x, y);
% surf(x, y, z);

min_value = 10^(-4);
x0 = 1.5;
y0 = 0.5;
max_iters = 1000;


% ----------------
% Random Searching
% ----------------

tic
[x, y, minimum, iters, values, xs, ys] = random_search(x0, y0, @func, max_iters, min_value);
toc

disp("x: " + num2str(x) + ", y:" + num2str(y));
disp("minimum value: " + num2str(minimum));
disp("iterations: " + num2str(iters));

c = linspace(1,10,length(xs));
fig = figure();
scatter(xs, ys, 50, c, 'filled');

% fig = figure();
% semilogy(1:iters+1, abs(values));

disp(" ");
disp(" ");

% -------------------
% Simulated Annealing
% -------------------

tic
[x, y, minimum, iters, values, xs, ys] = sim_annealing(x0, y0, @func, max_iters, min_value);
toc

disp("x: " + num2str(x) + ", y:" + num2str(y));
disp("minimum value: " + num2str(minimum));
disp("iterations: " + num2str(iters));

c = linspace(1,10,length(xs));
fig = figure();
scatter(xs, ys, 50, c, 'filled');

% fig = figure();
% semilogy(1:iters+1, abs(values));

