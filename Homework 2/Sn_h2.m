%difference eq S[n+2]=2S[n+1]+2S[n]
%ic S[0] = 0 S[1]=1
S=nan(20,1);
S(1,1)=0;
S(2,1)=1;

max=40; 

for i=3:max
    S(i,1)=2*S(i-1,1)+2*S(i-2,1);
end 

save("S","S")
%%
%Test closed form function
    a = 1+sqrt(3);
    b = 1-sqrt(3);
    A = sqrt(3)/6;
    B = -sqrt(3)/6;
    n=10;
    %Sn= A*a^n + B*b^n; 

    for i=1:n
        Sn3(i)=A * a^i + B * b^i;
    end 

Sn3=Sn3';

load("S.mat")%compare



  


