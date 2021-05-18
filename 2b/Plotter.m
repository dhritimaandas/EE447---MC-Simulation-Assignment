path='C:\Users\dhrit\Desktop\HVE_Codes\2b\main_func.m'%write path to main_func.m file here
%DEFINE CONSTANTS--------------------
k=2;
f=2;
num_simulations=10;
vfs=[0.002,0.007,0.015,0.02,0.025,0.03,0.035,0.04,0.045,0.05];%Write Concetrations of filler type 'A' here which are to be plotted
scalling_factor_of_concentration=[0.2,0.4,0.6,0.8,1,1.2,1.4,1.6,1.8,2];%Scaling Factors
final=[];
%%Looping through all the scaling factors
for i=1:length(scalling_factor_of_concentration)
    fprintf('For SCALLING FACTOR = %i\n',scalling_factor_of_concentration(i) );
    %Get the values of all coating volume fractions corresponding to
    %defines Concetrations of filler type 'A' above
    ploting_vals=main_func(vfs,k,f,scalling_factor_of_concentration(i),num_simulations);
    %plot the values and use HOLD ON to plot values of next loop in the
    %same graph
    plot(vfs*100,ploting_vals,'Color',[rand(1),rand(1),rand(1)]);
    final=[final; ploting_vals];
    hold on;
end
legend(num2str(0.2),num2str(0.4),num2str(0.6),num2str(0.8),num2str(1.0),num2str(1.2),num2str(1.4),num2str(1.6),num2str(1.8),num2str(2.0));
title('Coating Volume Fraction Vs Filler Concentration')
xlabel('Filler Concentration(in %)')
ylabel('Coating Volume Fraction')