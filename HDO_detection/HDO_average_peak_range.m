function [avr_f,avr_P1] = HDO_average_peak_range(mu,sigma,f,P1)

%Chris Lippe, 2022

f_to_avr=f(f>(mu-4*sigma)&f<(mu+4*sigma));
P1_to_avr=P1(f>(mu-4*sigma)&f<(mu+4*sigma));
P1_to_avr=detrend(P1_to_avr)+mean(P1_to_avr);

avr_f=zeros(16,1);
avr_P1=zeros(16,1);

for i=-8:7
    
    f_it=f_to_avr>mu+i/2*sigma&f_to_avr<mu+(i+1)/2*sigma;
    avr_P1(i+9)=mean(P1_to_avr(f_it));
    avr_f(i+9)=mean(f_to_avr(f_it));
    
end
