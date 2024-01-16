function S = S1_rec(n)
if n > 1
S = n + S1_rec(n-1);
else
S = 1;
end
end
