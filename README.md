# Hemodynamic oscillations
Algorithms for detection and suppression of hemodynamic oscillations (HDO).

# Overview
Arterial vasodilation caused by cerebral vasomotion can cause oscillations of the blood flow. fMRI measurements of medetomidine sedated animals show oscillations with a characteristic frequency around 0.2 Hz. These hemodynamic oscillations (HDO) constitute a physiological noise source for fMRI measurements and affect analysis of fMRI data.
The presented algorithms detect and suppress HDO.

HDO_detection <br>
The script ‘HDO_detection_master’ detects oscillations and delivers the output whether an inserted time course contains HDO. An fMRI signal time course is to insert as one dimensional double array.

HDO_suppression<br>
The script ‘HDO_suppression_master’ suppresses HDO from an inserted time course. An fMRI signal time course is to insert as one dimensional double array. <br>
Additionally, the script ‘HDO_suppr_voxelwise_master.m’ enables the voxel-wise application of the HDO suppression algorithm to a 4D-fMRI dataset in the NIfTI format.

# Software Requirements
The scripts run on MATLAB 2017b and all later versions.
