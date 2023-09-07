lambda = 1/60;
theta = 10; 
N_0 = 0.05; 
alpha = 2; 


T = linspace(0,5,100);
[h,N,Time] = CF_Sim_ModLog2022(lambda,theta,N_0,alpha,T);

figure
subplot (1,2,1)
plot(Time,N,'-g') ;
ylabel('Bacterial Growth')
xlabel('Time (hours)')
ylim([0 0.6])

timemins = BacterialgrowthModule5DataBootcamp(:,1);
population = BacterialgrowthModule5DataBootcamp(:,2);

figure
subplot(1,2,2)
plot(timemins,population,'-r');
ylabel('Bacterial Growth')
xlabel('Time (mins)')

err = CF_Error_ModLog2022([1/60,10,0.05,2],timemins,population);
display(err)

%min = fminsearch(@CF_Error_ModLog2022,[0.9176,1,0.00001,2.1258],[],timemins,population);
%display(min)

