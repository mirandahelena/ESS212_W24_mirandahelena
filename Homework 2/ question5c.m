
% Define the value of N
N = 4;
S_n = compute_sequence(N);

closed_form_S_n = closed_form_sequence(N);

% Compare the sequences
if isequal(S_n, closed_form_S_n)
    disp('Equal');
else
    disp('Not equal');
end

%%%
% closed-form solution function
function sequence = closed_form_sequence(N)
    A = 1 - 1/sqrt(12);
    B = 1 - 1/sqrt(12);
    a = 1 + sqrt(12) * A;
    b = 1 - sqrt(12) * B;
    
    % closed-form 
    n = 0:N;
    sequence = A * a.^n + B * b.^n;
end
