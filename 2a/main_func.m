function [ploting_vals]=main_func(vfs,k,num_simulations)
    %CONSTANTS-----------------------------------------------------------------
    d=50;
    D=2000;
    coating=k*d;

    %FOR STORING THE CORRESPONDING COATING VOLUME FRACTIONS FOR EACH Vf-------- 
    ploting_vals=[];
    factor=1;
    if k == 1.5
        factor=1.3;
    end
    if k == 2
        factor=1.7;
    end
    %SIMULATEING FOR EVERY VALUE OF Vf-----------------------------------------
    for z=1:length(vfs)
      Vf=vfs(z);
      %Calculating number of particles
      N=ceil(Vf*((D/d)^3));
      fprintf('For Vf= %i\n', Vf)%print("FOR VF = {}".format(Vf))

      avg=0;
      %SIMULATIONS-------------------------------------------------------------
      for sim=1:num_simulations
        cntr=0;

        %Generating random coordinates which will act as center of the fillers

        x_coord=randi([d/2,D-d/2+1],N);
        y_coord=randi([d/2,D-d/2+1],N);
        z_coord=randi([d/2,D-d/2+1],N);

        %Calculating total Volume of Coating-----------------------------------

        Nr=N*((d+2*coating)^3-d^3);%Represents the numerator of coating volume fraction
        Dr=D^3;%Represents the denominator of coating volume fraction

        total_overlapped=0;

        for i=1:N
          for j=i+1:N

            %Calculating distance between the centers corresponding to each axis

            dst_in_x=abs(x_coord(i)-x_coord(j));%###distance between x coordinates
            dst_in_y=abs(y_coord(i)-y_coord(j));%###distance between y coordinates
            dst_in_z=abs(z_coord(i)-z_coord(j));%###distance between z coordinates

            volume_overlapping=0;

            %###find overlaping in xy plane
            if dst_in_x < (d + 2*coating) && dst_in_x > d               %###overlap in x direction of cube - only coating surface

              if dst_in_y < (d + 2*coating) && dst_in_y > d                   %###overlap in y direction of cube - only coating surface

                if dst_in_z < (d + 2*coating) && dst_in_z > d                          %###overlap in z direction of cube - only coating surface
                  %##overlap of coating in x y z directions 
                  dim1=(d+2*coating-dst_in_x)/factor;
                  dim2=(d+2*coating-dst_in_y)/factor;
                  dim3=(d+2*coating-dst_in_z)/factor;
                  %# print("1:{} ,2:{} ,3:{}".format(dim1,dim2,dim3))
                  volume_overlapping=dim1*dim2*dim3;
                  %# ????    
                end
                if dst_in_z < d                                                        %###overlap in z direction of cube - cubes overlap 

                  %##overlap of coating in x y directions and cube overlap in z directions
                  dim1=(d+2*coating-dst_in_x)/factor;
                  dim2=(d+2*coating-dst_in_y)/factor;
                  dim3=(d+2*coating-dst_in_z)/factor;
                  %# print("1:{} ,2:{} ,3:{}".format(dim1,dim2,dim3))
                  volume_overlapping=dim1*dim2*dim3;
                  %# ???? 
                end
              end
              if dst_in_y < d                                                  %###overlap in y direction of cube - cubes overlap 

                if dst_in_z < (d + 2*coating) && dst_in_z > d                          %###overlap in z direction of cube - only coating surface
                  %##overlap of coating in x z directions and cube overlap in y direction
                  dim1=(d+2*coating-dst_in_x)/factor;
                  dim2=(d+2*coating-dst_in_y)/factor;
                  dim3=(d+2*coating-dst_in_z)/factor;
                  %# print("1:{} ,2:{} ,3:{}".format(dim1,dim2,dim3))
                  volume_overlapping=dim1*dim2*dim3;
                  %# ????  
                end
                if dst_in_z < d                                                          %###overlap in z direction of cube - cubes overlap 
                  %##overlap of coating in x direction and cube overlap in y z directions
                  dim1=(d+2*coating-dst_in_x)/factor;
                  dim2=(d+2*coating-dst_in_y)/factor;
                  dim3=(d+2*coating-dst_in_z)/factor;
                  %# print("1:{} ,2:{} ,3:{}".format(dim1,dim2,dim3))
                  volume_overlapping=dim1*dim2*dim3;
                  %# ????  
                end
              end
            end


            if dst_in_x < d                                              %###overlap in x direction of cube - cubes overlap 

              if dst_in_y < (d + 2*coating) && dst_in_y > d                    %###overlap in y direction of cube - only coating surface

                if dst_in_z < (d + 2*coating) && dst_in_z > d                           %###overlap in z direction of cube - only coating surface
                  %##overlap of coating in y z directions and cube overlap in x direction
                  dim1=(d+2*coating-dst_in_x)/factor;
                  dim2=(d+2*coating-dst_in_y)/factor;
                  dim3=(d+2*coating-dst_in_z)/factor;
                  %# print("1:{} ,2:{} ,3:{}".format(dim1,dim2,dim3))
                  volume_overlapping=dim1*dim2*dim3;
                  %# ????   
                end
                if dst_in_z < d                                                          %###overlap in z direction of cube - cubes overlap 
                  %##overlap of coating in y direction and cube overlap in x z direction
                  dim1=(d+2*coating-dst_in_x)/factor;
                  dim2=(d+2*coating-dst_in_y)/factor;
                  dim3=(d+2*coating-dst_in_z)/factor;
                  %# print("1:{} ,2:{} ,3:{}".format(dim1,dim2,dim3))
                  volume_overlapping=dim1*dim2*dim3;
                  %#????  
                end
              end
              if dst_in_y < d                                                  %###overlap in y direction of cube - cubes overlap 

                if dst_in_z < (d + 2*coating) && dst_in_z > d                           %###overlap in z direction of cube - only coating surface
                  %##overlap of coating in z direction and cube overlap in x y direction
                  dim1=(d+2*coating-dst_in_x)/factor;
                  dim2=(d+2*coating-dst_in_y)/factor;
                  dim3=(d+2*coating-dst_in_z)/factor;
                  %# print("1:{} ,2:{} ,3:{}".format(dim1,dim2,dim3))
                  volume_overlapping=dim1*dim2*dim3;
                  %#????  
                end
                if dst_in_z < d                                                          %###overlap in z direction of cube - cubes overlap 
                  %##overlap of coating in no direction and cube overlap in x y z direction
                  dim1=(d+2*coating-dst_in_x)/factor;
                  dim2=(d+2*coating-dst_in_y)/factor;
                  dim3=(d+2*coating-dst_in_z)/factor;
                  %#print("1:{} ,2:{} ,3:{}".format(dim1,dim2,dim3))
                  cntr=cntr+1;
                  volume_overlapping=coating*dim1*dim3*2+coating*dim2*dim3*2-min(max(0,dim1-coating),coating)*min(max(0,dim2-coating),coating)*dim3;
                  %# print("1:{} ,2:{} ,3:{} 4: {}".format(dim1,dim2,dim3,volume_overlapping ))
                  %#???? 
                end
              end
            end
            total_overlapped=total_overlapped+volume_overlapping;
            %#print("total: {} current: {}".format(total_overlapped,volume_overlapping))
          end
        end
        temp=Nr;
        Nr=Nr-total_overlapped;

        %Final Coating Volume Fraction for this simulation

        ratio_for_sim=Nr/Dr;
        fprintf('Sim Number: %i  Actual Volume: %i Final Volume: %i  Overlapped Volume: %i Coating Volume Fraction: %i cntr: %i\n', sim,temp,Nr,total_overlapped,ratio_for_sim,cntr)%print("FOR VF = {}".format(Vf))
        avg=avg+ratio_for_sim;
      end
      fprintf('Final Coating Volume Fraction: %i for Filler concentration: %i\n', avg/num_simulations,Vf);%print(avg/num_simulations)
      ploting_vals=[ploting_vals,avg/num_simulations];
    end
end
 
