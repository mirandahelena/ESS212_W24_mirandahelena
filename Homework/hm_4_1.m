clear all
t = (1:10);
y = [-2.7 -2.71 -2.65 -0.87 -3.10 -1.03 0.63 1.46 5.90 8.38];
p1 = cat(1,t,y);
p1=p1';
A=[p1(:,1).^2 p1(:,1) ones(10,1)];
b=(p1(:,2));
x=inv(A'*A) * A'*b; 
sigma=(((A*x)-b)'*((A*x)-b)/(4*(10+1))); 

t=12; 
y_12=[1,t,t^2];
y_12=y_12*x; 
