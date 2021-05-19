% -----------------------------------------------------------------------
% File implementing random search algorithm
%
% For each step:
% 1. Get random number using Gauss function
% 2. Get x and y coordinates for new position vector
% 3. Chcek is new position better than past
% 4. If yes change actual x and y else go to 2.
% 5. If the number of iterations exceeded or the expected accuracy return
%       else go to 1.
% -----------------------------------------------------------------------

function [x, y, value, iters, values, xs, ys] = random_search(x0, y0, acc, max_iterations)
    
    value = func(x0, y0);
    x = x0;
    y = y0;
    iters = 0;
    sigma = 10;
    max_finding_iters = 100;
    
    values = [value];
    xs = [x];
    ys = [y];
    
    while (iters < max_iterations) && (acc < value)
        
        delta = abs(normrnd(0, sigma));
        
        for i = 1:max_finding_iters
           delta_x = normrnd(0, delta);
           delta_y = normrnd(0, delta);
           new_value = func(x + delta_x, y + delta_y);
           if new_value < value
               x = x + delta_x;
               y = y + delta_y;
               value = new_value;
               break
           end
        end
        
        sigma = sigma * 0.9;
        iters = iters + 1;
        xs(iters+1) = x;
        ys(iters+1) = y;
        values(iters+1) = value;
    end
end