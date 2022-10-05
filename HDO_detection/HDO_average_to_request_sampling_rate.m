function trace_ds=HDO_average_to_request_sampling_rate(timecourse,sr,sr_w)

% sr   - sampling rate in Hz 
% sr_w - wish sampling rate data are averaged to this sampling rate
n=sr/sr_w; %number of points that will be averaged

%%%%average data to get the wished sampling rate
trace_sr_w=[];
for m=1:length(timecourse)/n
    peace=timecourse(n*(m-1)+1:n*m);
    trace_av=mean(peace,1, 'omitnan');
    trace_sr_w=[trace_sr_w trace_av];
end
trace_ds=trace_sr_w;


