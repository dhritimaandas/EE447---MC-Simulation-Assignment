function [ans_]=main_func(vfs,k,f,parameter,num_simulations)
    %Define Constants
    d=50;
    d_=f*d;
    coating=k*d;
    coating_=k*d_;
    Ds=[d,d_];
    Cs=[coating,coating_];
    D=2000;
    coating=k*d;
    coating_=k*d_;
    %array to store the coating volume fraction for the input vfs
    ans_=[];
    for z=1:length(vfs)
      %getiing the value of concnetrations of each filler
      Vf=vfs(z);
      Vf_=parameter*Vf;
      %calculating number of fillers of both type
      N=ceil((Vf*(D^3))/(d^3));
      N_=ceil((Vf_*(D^3))/(d_^3));
      fprintf('For Vf= %i and and Vfb =%i\n', Vf,Vf_);%print("FOR VFa = {} and VFb = {}".format(Vf,Vf_));

      avg=0;
      %looping through simulations
      for sim=1:num_simulations
        cntr=0;
        %Defining random coordinates for a simlation
        x_coord=randi([d/2,D-d/2+1],N+N_);
        y_coord=randi([d/2,D-d/2+1],N+N_);
        z_coord=randi([d/2,D-d/2+1],N+N_);
        %Calcualting Total Coating Volume
        Nr=N*((d+2*coating)^3-d^3)+N_*((d_+2*coating_)^3-d_^3);
        Dr=D^3;
        %Array to keep track of the type of filler, here 0 means filler
        %type A and 1 represents filler type B
        flag=zeros(1,N+N_);
        for var=N:N_
          flag(var)=1;
        end
        %variable to store total overlapped volume
        total_overlapped=0;
        %looping to cubes pairwise
        for i=1:N+N_
           for j=i+1:N+N_
            %calculating distance between their centers in the respective
            %axis
            dst_in_x=abs(x_coord(i)-x_coord(j));%###distance between x coordinates
            dst_in_y=abs(y_coord(i)-y_coord(j));%###distance between y coordinates
            dst_in_z=abs(z_coord(i)-z_coord(j));%###distance between z coordinates
            %finding the corresponding particle type using the flag array
            %and keeping a track of their side lengths and coating thickness
            d1=Ds(flag(i)+1);
            d2=Ds(flag(j)+1);
            c1=Cs(flag(i)+1);
            c2=Cs(flag(j)+1);
            %Calculating the overlapped volumes between the cubes
            volume_overlapping=calc_overlap(d1,d2,c1,c2,dst_in_x,dst_in_y,dst_in_z,1.6);

            total_overlapped=total_overlapped+volume_overlapping;
           end
        end
        temp=Nr;
        %Calculating final coating volume
        Nr=Nr-total_overlapped;
        %Calculating Coating Volume Fraction
        ratio_for_sim=Nr/Dr;
        
        fprintf('Sim Number: %i  Actual Volume: %i Final Volume: %i  Overlapped Volume: %i Coating Volume Fraction: %i cntr: %i\n', sim,temp,Nr,total_overlapped,ratio_for_sim,cntr)%print("FOR VF = {}".format(Vf))
        
        %Calculating Average of Coating Volume Fraction
        avg=avg+ratio_for_sim;
      end
      fprintf('Final Coating Volume Fraction: %i for Filler concentration: %i\n', avg/num_simulations,Vf);%print(avg/num_simulations)
      ans_=[ans_ (avg/num_simulations)];
    end
end
% plot(vfs,ans_);