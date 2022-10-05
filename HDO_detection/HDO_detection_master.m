function oscillation=HDO_detection_master(timecourse,resolution)

% HDO_detection_master :  Checks MR signals for periodic oscillations around 0.2 Hz (hemodynamic oscillations, HDO).
% The script can be applied to time courses extracted from MR data recorded with a TR of one second or less. 
%
% input:
% timecourse  (double) : signal time course, extracted from MR data; Caution, the time course cannot include NaN.
% resolution  (double) : temporal resoltion of the time course (TR)
%
% output: 
% oscillation (logical): true  - the ANN found HDO in the inserted time course
%                        false - the ANN found no HDO in the inserted time course
%-----
%Chris Lippe, 2022

warning('off')

Fs_w=1; 
centre_bs=0.198969;
sigma_bs=0.025486;


% Determine sampling frequency
Fs=1/resolution;

timecourses_norm=timecourse'/mean(timecourse)-1;

Y1= fft(timecourses_norm);
L=length(timecourses_norm);
%Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L.
P2 = abs(Y1/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
%Define the frequency domain f 
f = Fs*(0:(L/2))/L; 

    
    
%%% Calculate input for ANN
timecourses_norm_1s=HDO_average_to_request_sampling_rate(timecourses_norm,Fs,Fs_w);
[acf,~]=autocorr(timecourses_norm_1s,'NumLags',15);

detrended_acf=detrend(acf(2:end));
corr_data=(detrended_acf(1:5)+detrended_acf(6:10)+detrended_acf(11:15))/3;

[~,avr_P1]=HDO_average_peak_range(centre_bs,sigma_bs,f,P1);
P1_to_check=avr_P1'/mean(avr_P1);

%actual check for oscillations
oscillation=HDO_detection_ANN(cat(2,P1_to_check,corr_data))>0.5; 

warning('on')
