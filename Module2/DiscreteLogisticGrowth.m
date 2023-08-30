% How many rabbits are in the population?

nMax = 1000; % max y value
r = 2.5; % per capita growth rate, this changes based on example
K= 0.6; % carrying capacity of rabbit population
x = zeros(1,nMax); % matrix defining the time points
x(1)= 0.2; % initial condition of the population

xdot = @(x,r,K) x + r*(1-x./K).*x;

for n=2:nMax
    x(n) = xdot(x(n-1),r,K);
end

figure(1); 
plot(x,'-ok');
ylabel('population in thousands')
xlabel('number of months')
%%

% Parameter sweep for 0 < r < 3 w / K = 0.6

figure(2); 
plot(x,'-ok');
ylabel('population steady state')
xlabel('value of r')
for r=0:0.01:3
    for n=2:nMax
    x(n,:) = xdot(x(n-1,:),r,K);
    end
    plot(r,x(nMax-10:nMax),'o')
    hold on
end