clear all; 

x=[-4;0;4];
y=[30;2;6];
y1 = @(e)-e;
A = [x(1)^2 x(1) 1; x(2)^2 x(2) 1; x(3)^2 x(3) 1];
%x_i = inv(A) * y1([0;0;0]);
coeff = A\y;
%finding e
e=A*coeff-y; 


%%
A = 1;
B = 2;
C = 3;

new = @(x) [y(1) - x(1)*(x(2) - B)*(x(3) - C); 
            y(2) - x(1)*(x(2) - B)*(x(3) - C);
            y(3) - x(1)*(x(2) - B)*(x(3) - C)];

Jacobian = @(x) [- (x(2) - B)*(x(3) - C), -x(1)*(x(3) - C), -x(1)*(x(2) - B);
                 - (x(2) - B)*(x(3) - C), -x(1)*(x(3) - C), -x(1)*(x(2) - B); 
                 - (x(2) - B)*(x(3) - C), -x(1)*(x(3) - C), -x(1)*(x(2) - B)];

x0 = [A; B; C];

% Newton's method
max_iterations = 10;
tolerance = 1e-8;
x_current = x0;

for iter = 1:max_iterations
    f_val = new(x_current);
    J_val = Jacobian(x_current);
    
   
    delta_x = - J_val \ f_val;
    x_next = x_current + delta_x;
    
    %convergence
    if norm(delta_x) < tolerance
        fprintf('Converged at iteration %d\n', iter);
        break;
    end
    
    x_current = x_next;
end

% Extracting A, B, and C
A_sol = x_current(1);
B_sol = x_current(2);
C_sol = x_current(3);
