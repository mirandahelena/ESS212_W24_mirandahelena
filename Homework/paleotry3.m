clear all
% URL of the text file
url = 'https://www.ncei.noaa.gov/pub/data/paleo/icecore/trop/everest/rongbuk2007.txt';

% Retrieve data from the URL
data = webread(url);
data=convertCharsToStrings(data);
a=strsplit(data, '\n');
a=a';
a(1:52)=[];

count = 1;
for i=1:length(a)
val = a{1}(1);
try
BB(count,:) = str2num(a{i});
count = count + 1;
catch
disp('Not number');
end
end

time = BB(:,1); 
Ca = BB(:,3); %ug/L

projection = @(params, Ca) params(1) + (Ca - mean(Ca)) * params(2);

initial_guess = [0, 0]; % [u, m]

% use lsqcurvefit
param = lsqcurvefit(@(params, Ca) projection(params, Ca), initial_guess, time, Ca);

u = param(1);
m = param(2);

%trend line
projected_trend = projection(param, time);

figure(1)
plot(time, Ca, 'k', 'LineWidth', 2);
hold on
plot(time,projected_trend, 'r', 'LineWidth', 2);
xlabel('Time (Years AD)');
ylabel('Ca (ug/L)');
title('East Rongbuk Glacier Calcium Data Past1k');
legend('Ice Core Calcium Data-2007', 'Projected Trend Model');
grid on;
hold off;

% Calculate E
e = Ca - projected_trend; %data minus trend
std_est = std(e);

% Output
disp(['Estimated value of u: ' num2str(u)]);
disp(['Estimated value of m: ' num2str(m)]);
disp(['Standard deviation of the components of the e vector: ' num2str(std_est)]);






