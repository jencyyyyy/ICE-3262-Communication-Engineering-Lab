%MATLAB CODE For FM (Frequency Modulation)

clc
clear all
close all
t = 0:0.001:1; %upto 1000 samples
vm =5 %input('Enter Amplitude (Message) = ');
vc =10% input('Enter Amplitude (Carrier) = ');
fM =2% input('Enter Message frequency = ');
fc =5% input('Enter Carrier frequency = ');
m =1% input('Enter Modulation Index = ');
msg = vm*sin(2*pi*fM*t);
subplot(3,1,1); %plotting message signal
plot(t,msg);
xlabel('Time');
ylabel('Amplitude');
title('Message ');

carrier = vc*sin(2*pi*fc*t);
subplot(3,1,2); %plotting carrier signal
plot(t,carrier);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');

y = vc*sin(2*pi*fc*t+m.*cos(2*pi*fM*t));
subplot(3,1,3);%plotting FM (Frequency Modulated) signal
plot(t,y);
xlabel('Time');
ylabel('Amplitude');
title('FM Signal');


%Sample MATLAB Input:
%Enter Amplitude (Message) = 5
%Enter Amplitude (Carrier) = 5
%Enter Message frequency = 8
%Enter Carrier frequency = 100
%Enter Modulation Index = 10
