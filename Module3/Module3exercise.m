% ------------------------------------------------------
A     = 1.1; % fluorescence intensity units
omega = 2.6; % rad/s
A_0   = 0.01; % constant
noise = (1e-6); % defining noise as a parameter

u=@(t) A*sin(omega*t)+A_0;

tArray = linspace(0,1.6,200);
uArray = u(tArray); % an array of samples of u
% ------------------------------------------------------

% analytical solutions (in real life, we might not know these)
dudtExact      =  A*omega*cos(omega*tArray);
du2dt2Exact    = -A*omega^2*sin(omega*tArray);
du3dt3Exact    = -A*omega^3*cos(omega*tArray);

% Take the sample and add a bit of noise
 uObserved = u(tArray) + (noise)*randn(size(tArray));
 
%display(uObserved);

dudt = diff(uObserved)./diff(tArray); % first derivative
du2dt2 = diff(dudt)./diff(tArray(1:end-1)); % second derivative
du3dt3 = diff(du2dt2)./diff(tArray(1:end-2)); % third derivative

figure;
subplot(3,1,1); hold on;
plot(tArray(1:end-1), dudt);
plot(tArray, dudtExact, '--r');
xlabel('t');
ylabel('dudt');

subplot(3,1,2); hold on;
plot(tArray(1:end-2), du2dt2);
plot(tArray, du2dt2Exact, '--r');
xlabel('t');
ylabel('du2dt2');

subplot(3,1,3); hold on;
plot(tArray(1:end-3), du3dt3);
plot(tArray, du3dt3Exact, '--r');
xlabel('t');
ylabel('du3dt3');

if sum(abs(dudtExact(1:end-1)-dudt)./length(dudt))<0.1 
    display('true')
end

if sum(abs(du2dt2Exact(1:end-2)-du2dt2)./length(du2dt2))<0.1
    display('t')
end

if sum(abs(du3dt3Exact(1:end-3)-du3dt3)./length(du3dt3))<0.1
    display('tru')
end

