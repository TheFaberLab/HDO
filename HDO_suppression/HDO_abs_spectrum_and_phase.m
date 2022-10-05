function [P1, phase]=HDO_abs_spectrum_and_phase(timecourse)
%Calc. the absolute spectrum for non-negative frequencies (symmetric) and
%the frequency-dependent phase

L=length(timecourse);

%%%%FFT
Y1 = fft(timecourse);
phase = angle(Y1); 

%Compute the two-sided spectrum P2. Then compute the single-sided spectrum 
%P1 based on P2 and the even-valued signal length L.
P2 = abs(Y1/L);
P1 = P2(1:round(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);

end
           
 