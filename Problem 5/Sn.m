%s(n) = a*(1-r^n)/1-r
% 
% function S = Sn(r,n)
% for i=r
% 
% if isnumeric(r) && isscalar(r) && n > 0 && mod(r, 1) == 0 && isnumeric(n) && isscalar(n) && isreal(n)
% else
%     error('r must be pos and r must be real')
% end
% a=1; 
% S = a*(1-i^n)/(1-i);
% end 
% 
% end  


function S = Sn(r, n)
if isnumeric(r) && isscalar(r) && isreal(r) && isnumeric(n) && isscalar(n) && isreal(n) && n > 0 && mod(n, 1) == 0        a = 1;
        S = a * (1 - r^n) / (1 - r);
    else
        error('r must be a positive integer and n must be real');
end

end


