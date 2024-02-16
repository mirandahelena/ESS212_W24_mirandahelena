N = 4;  
S_n = compute_sequence(N);
% Print 
for n = 1:N+1
    fprintf('S[%d] = %d\n', n-1, S_n(n));
end

%%%%

function sequence = compute_sequence(N)
    % initial conditions
    sequence = [0, 1];
    for n = 3:N+1
        S_n = 2 * sequence(n-1) + 2 * sequence(n-2);
        sequence(n) = S_n;
    end
end
