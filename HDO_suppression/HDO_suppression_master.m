function timecourse_suppr = HDO_suppression_master(timecourse,resolution)
% HDO_suppression_master :  Suppresses periodic oscillations around 0.2 Hz (hemodynamic oscillations, HDO).
%
% input:
% timecourse       (double) : signal time course, extracted from MR data; Caution, the time course cannot include NaN.
% resolution       (double) : temporal resoltion of the time course (TR)
%
% output: 
% timecourse_suppr (logical): Time course where HDO were suppressed.
%-----
%Chris Lippe, 2022

L=length(timecourse);
            
if sum(abs(timecourse)>1e-5)>L/2
    %Determine sampling frequency
    Fs=1/resolution;

    %Define the frequency domain f
    f = Fs*(0:(L/2))/L;
    
    centre_bs = 0.1990;
    sigma_bs = 0.0255;
            
    %FFT to right side abs. spectrum and phase
    [P1, phase]=HDO_abs_spectrum_and_phase(timecourse);
            
    [avr_f,avr_P1] = HDO_avr_peak_range(centre_bs,sigma_bs,f,P1);
    sorted_avr_P1=sort(avr_P1);
    Astop_bs=pow2db(sorted_avr_P1(length(sorted_avr_P1))/mean(sorted_avr_P1(1:8)));
                
    Fpass1_bs = 0.1225;
    Fstop1_bs = 0.1735;
    Fstop2_bs = 0.2245;
    Fpass2_bs = 0.2754;
    Apass1_bs = 0.5000;
    Apass2_bs = 0.5000;

    %Init filter
    bsFilt = designfilt('bandstopfir', ...
    'PassbandFrequency1',Fpass1_bs,'StopbandFrequency1',Fstop1_bs, ...
    'StopbandFrequency2',Fstop2_bs,'PassbandFrequency2',Fpass2_bs, ...
    'PassbandRipple1',Apass1_bs,'StopbandAttenuation',Astop_bs, ...
    'PassbandRipple2', Apass2_bs, ...
    'DesignMethod','equiripple','SampleRate', Fs);        
            
    %perform HDO suppression          
    timecourse_suppr=filtfilt(bsFilt,timecourse);
 
else
    timecourse_suppr=timecourse;
end     
                

                

                
           

