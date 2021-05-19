% -----------------------------------------------------------------------
% File implementing simulated annealing
%
% For each step:
% 1. 
% 2. 
% 3. 
% 4. 
% 5. 
% -----------------------------------------------------------------------

function [x, y, value, iters, values, xs, ys] = sim_annealing(x0, y0, func, max_iterations, min_value)
    
    value = func(x0, y0);
    x = x0;
    y = y0;
    iters = 0;
    T = 100;
    
    values = [value];
    xs = [x];
    ys = [y];
    max_epoch_iters = 20;
    
    while iters < max_iterations && value > min_value
        delta = abs(normrnd(0, T));
        
        for i = 1:max_epoch_iters
            delta_x = normrnd(0, delta);
            delta_y = normrnd(0, delta);
            new_value = func(x+delta_x, y+delta_y);

            if (new_value < value) || (rand() <= 1/(1+exp((new_value-value)/(0.5*T))))
                x = x + delta_x;
                y = y + delta_y;
                value = new_value;
                break;
            end
        end
        
        T = T * 0.9;
        iters = iters + 1;
        xs(iters+1) = x;
        ys(iters+1) = y;
        values(iters+1) = value;
    end
end