% equation 7:  C(n, k) = C(n − 1, k − 1) + C(n − 1, k)
%  Write a procedure in your favorite computer language that uses Equation (7)
% evaluates C(n, k) using a recursive algorithm.

function F = binomialCoefficient(n, k)
    if any([k, n] == 0) || k == n
        F = 1;
    else
        F = binomialCoefficient(n-1, k-1) + binomialCoefficient(n-1, k);
    end
end