# Hemodynamic oscillations
Algorithms for detection and suppression of hemodynamic oscillations (HDO).

# Overview
Arterial vasodilation caused by cerebral vasomotion can cause oscillations of the blood flow. Rat fMRI measurements show oscillations with a characteristic frequency around 0.2 Hz. These hemodynamic oscillations (HDO) constitute a physiological noise source for fMRI measurements and affect analysis of fMRI data.
The presented algorithms detect and suppresses HDO.

HDO_detection
The script ‘HDO_detection_master’ detects oscillations and delivers the output whether the inserted time course contains HDO.

HDO_suppression
The script ‘HDO_suppression_master’ suppresses HDO from an inserted time course.
Additionally, the script ‘HDO_suppr_voxelwise_master.m’ enables the voxelwise application of the HDO suppression algorithm to a 4D-fMRI dataset in the nifty format.

# Software Requirements
The scripts run on MATLAB 2017b and all newer versions.
