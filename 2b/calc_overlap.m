function volume_overlapping=calc_overlap(d1,d2,coating1,coating2,dst_in_x,dst_in_y,dst_in_z,factor)
  d=(d1+d2)/2;
  volume_overlapping=0;
  if dst_in_x < (d + coating1+coating2) && dst_in_x > d               %###overlap in x direction of cube - only coating surface

    if dst_in_y < (d + coating1+coating2) && dst_in_y > d                  % ###overlap in y direction of cube - only coating surface

      if dst_in_z < (d + coating1+coating2) && dst_in_z > d                           %###overlap in z direction of cube - only coating surface
        %##overlap of coating in x y z directions 
        dim1=((d + coating1+coating2)-dst_in_x)/factor;
        dim2=((d + coating1+coating2)-dst_in_y)/factor;
        dim3=((d + coating1+coating2)-dst_in_z)/factor;
        volume_overlapping=dim1*dim2*dim3;
      end
      if dst_in_z < d                                                          %###overlap in z direction of cube - cubes overlap 

        %##overlap of coating in x y directions and cube overlap in z directions
        dim1=((d + coating1+coating2)-dst_in_x)/factor;
        dim2=((d + coating1+coating2)-dst_in_y)/factor;
        dim3=((d + coating1+coating2)-dst_in_z)/factor;
        volume_overlapping=dim1*dim2*dim3;
      end
    end
    if dst_in_y < d                                                  %###overlap in y direction of cube - cubes overlap 

      if dst_in_z < (d + coating1+coating2) && dst_in_z > d                           %###overlap in z direction of cube - only coating surface
        %##overlap of coating in x z directions and cube overlap in y direction
        dim1=((d + coating1+coating2)-dst_in_x)/factor;
        dim2=((d + coating1+coating2)-dst_in_y)/factor;
        dim3=((d + coating1+coating2)-dst_in_z)/factor;
        volume_overlapping=dim1*dim2*dim3;
      end
      if dst_in_z < d                                                          %###overlap in z direction of cube - cubes overlap 
        %##overlap of coating in x direction and cube overlap in y z directions
        dim1=((d + coating1+coating2)-dst_in_x)/factor;
        dim2=((d + coating1+coating2)-dst_in_y)/factor;
        dim3=((d + coating1+coating2)-dst_in_z)/factor;
        volume_overlapping=dim1*dim2*dim3;
      end
    end
  end
  if dst_in_x < d                                              %###overlap in x direction of cube - cubes overlap 

    if dst_in_y < (d + coating1+coating2) && dst_in_y > d                    %###overlap in y direction of cube - only coating surface

      if dst_in_z < (d + coating1+coating2) && dst_in_z > d                           %###overlap in z direction of cube - only coating surface
        %##overlap of coating in y z directions and cube overlap in x direction
        dim1=((d + coating1+coating2)-dst_in_x)/factor;
        dim2=((d + coating1+coating2)-dst_in_y)/factor;
        dim3=((d + coating1+coating2)-dst_in_z)/factor;
        volume_overlapping=dim1*dim2*dim3;
      end
      if dst_in_z < d                                                          %###overlap in z direction of cube - cubes overlap 
        %##overlap of coating in y direction and cube overlap in x z direction
        dim1=((d + coating1+coating2)-dst_in_x)/factor;
        dim2=((d + coating1+coating2)-dst_in_y)/factor;
        dim3=((d + coating1+coating2)-dst_in_z)/factor;
        volume_overlapping=dim1*dim2*dim3;
      end
    end
    if dst_in_y < d                                                  %###overlap in y direction of cube - cubes overlap 

      if dst_in_z < (d + coating1+coating2) && dst_in_z > d                          %###overlap in z direction of cube - only coating surface
        %##overlap of coating in z direction and cube overlap in x y direction
        dim1=((d + coating1+coating2)-dst_in_x)/factor;
        dim2=((d + coating1+coating2)-dst_in_y)/factor;
        dim3=((d + coating1+coating2)-dst_in_z)/factor;
        volume_overlapping=dim1*dim2*dim3;
      end
      if dst_in_z < d                                                          %###overlap in z direction of cube - cubes overlap 
       % ##overlap of coating in no direction and cube overlap in x y z direction
        dim1=((d + coating1+coating2)-dst_in_x)/factor;
        dim2=((d + coating1+coating2)-dst_in_y)/factor;
        dim3=((d + coating1+coating2)-dst_in_z)/factor;
        volume_overlapping=coating1*dim1*dim3*2+coating2*dim2*dim3*2-2*min(max(0,dim1-coating1),coating2)*min(max(0,dim2-coating1),coating2)*dim3;
      end
    end
  end
end