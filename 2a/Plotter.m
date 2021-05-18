path='C:\Users\dhrit\Desktop\HVE_Codes\2a\main_func.m'
% run(path)
% fprintf('For k= %i and factor= %i\n', k,factor)
k=2;
num_simulations=20;
vfs=[0.02];%%ENTER THE VALUE OF Vf here inside the list
ploting_vals=main_func(vfs,k,num_simulations);
%TO PLOT FOR DIFFERENT CONCENTRATIONS OF FILLER UNCOMMENT THE FOLLOWING
%LINES
% plot(vfs*100,ploting_vals,'Color',[0,0.7,0.9])
% title('Coating Volume Fraction Vs Filler Concentration')
% xlabel('Filler Concentration(in %)')
% ylabel('Coating Volume Fraction')