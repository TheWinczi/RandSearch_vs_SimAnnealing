% ----------------------------------------
% Program compare two algorithms:
% 1. Random search
% 2. ....
%
% each program uses Gauss method to random
% next position/next position vector
% ----------------------------------------

[x, y, minimum, iters, xs, ys, values] = random_search(4, -4, 10^(-4), 100);
disp("x: " + num2str(x) + ", y:" + num2str(y));
disp("minimum value: " + num2str(minimum));
disp("iterations: " + num2str(iters));

c = linspace(1,10,length(xs));
fig = figure();
scatter(xs, ys, 20, c, 'filled');

fig = figure();
plot(1:iters+1, values);