clc
clear
close all

bits = [1 1 0 1  0 0 1];
%bits=input('Enter bit stream: ');

bitrate = 1;

sampling_rate = 100;
sampling_time = 1/sampling_rate;

end_time = length(bits)/bitrate;
time = 0:sampling_time:end_time;
lenTime=length(time);


%input digital data
x=zeros(1,lenTime);
for i = 1:length(bits)
  if bits(i) == 1
    x((i-1)*sampling_rate+1:i*sampling_rate) =1;
  end
end

subplot(3,1,1);
plot(time, x, 'linewidth', 3);
ylim([-2, 2]);
title("Input Signal");
grid on;
a = 5; %Amplitude
f = 3; %Frequency
modulation = a*sin(2*pi*f*time);

subplot(3,1,2);
plot(time, modulation);
title("Carrier signal"); 
grid on;


%modulation  

in = 1; %Bitstream in

lower_signal= a*sin(2*pi*1*time(1:lenTime));

for i = 1:length(time)
    if bits(in) == 0
        modulation(i)=lower_signal(i);
        %modulation((i-1)*sampling_rate+1:i*sampling_rate) = lower_signal;
    end
    if time(i)*bitrate >= in
        in = in+1;
    end
end


%axis([0 end_time -12 12]);
subplot(3,1,3);
plot(time, modulation, "LineWidth", 1);
grid on;



%Demodulation

in = 1;

for i = 1:length(modulation)
    if modulation(i) ~= 0
        demodultaion(in) = 1;
    else
        demodultaion(in) = 0;
    end
    if time(i)*bitrate >= in
        in = in+1;
    end
end

disp(demodultaion);
