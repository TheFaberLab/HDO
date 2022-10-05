function HDO_suppr_voxelwise_master(nifti_orig,nifti_suppr,resolution)

% HDO_suppr_voxelwise_master :  Extracts from each voxel a time course and suppresses HDO.
%
% input:
% nifti_orig  (string) : Path and name of 4D nifti of the dataset where HDO are to suppress.
%                         e.g. C:\Documents\MATLAB\HDO_algorithms\example_nifti_4D.nii
% nifti_suppr (string) : Path and name where the new 4D nifti (after HDO suppression) is to save.
%                         e.g. C:\Documents\MATLAB\HDO_algorithms\example_nifti_4D_suppr.nii
% resolution  (double) : temporal resoltion of the time course (TR)
%-----
%Chris Lippe, 2022

V=niftiread(nifti_orig);
V_info=niftiinfo(nifti_orig);

for z=1:size(V,3) 
    for x=1:size(V,1)
        for y=1:size(V,2)
            timecourse=double(reshape(V(x,y,z,:),[size(V,4),1])); %timecourse_ROI
            timecourse_suppr = HDO_suppression_master(timecourse,resolution);
            V_corr(x,y,z,:)=int16(timecourse_suppr);
        end 
    end
end

niftiwrite(V_corr,nifti_suppr,V_info);
