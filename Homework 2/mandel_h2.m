% x and y range
x_range = linspace(-2, 0.5, 1000);
y_range = linspace(-1.5, 1.5, 1000);
% iterations
max_iter = 100;


mandelbrot_set = zeros(length(y_range), length(x_range));

for j = 1:length(y_range)
    for i = 1:length(x_range)
        
        c = x_range(i) + 1i * y_range(j);
        
        z = 0;
        
        % f_c(z) = z^2 + c
        for k = 1:max_iter
            z = z^2 + c;
            
            % break the loop
            if abs(z) > 2
                break;
            end
        end
        
        if k == max_iter
            mandelbrot_set(j, i) = 1;
        end
    end
end

imagesc(x_range, y_range, mandelbrot_set);
colormap([0 0 0; 1 1 1]); 
axis xy; %flip
xlabel('Real Part (x)');
ylabel('Imaginary Part (y)');
title('Mandelbrot Set');