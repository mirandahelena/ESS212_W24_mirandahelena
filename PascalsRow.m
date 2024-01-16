function PascalsRow(n)
    % Initialize the n-th row of Pascal's triangle using nchoosek
    row = zeros(1, n + 1);
    
    for k = 0:n
        row(k + 1) = nchoosek(n, k);
    end
    
    % Print the n-th row
    disp(row);
end