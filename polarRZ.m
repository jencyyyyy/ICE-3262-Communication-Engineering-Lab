clc
clear all
close all
%bits = input('Enter the bit stream');
bits = [1 0 1 0 1 1  0];
bitrate = 1;        %bit rate
n = 100;           %sample rate
bitLength= length(bits);
endT = bitLength/bitrate;       %total time
N = n*bitLength;   %total no of sample
dt = endT/N;                    %time for 1 sample
t = 0:dt:endT;                 %array of total time
lenT =length(t);            %length of total units of time in x-axis (lenth of sample)

Voltage=5;

x = zeros(1,lenT);           %fill with one +ve voltage

%encoding
halfSR = n/2;

for i=1: bitLength
  if bits(i)== 1
    x((i-1)*n+1:(i-1)*n+halfSR) = Voltage;
  else
    x((i-1)*n+1:(i-1)*n+halfSR)= -Voltage;
  end
end
disp(x);
plot(t, x, 'Linewidth', 3);
axis([0 endT -Voltage-5 Voltage+5]);
%both same
yticks([-Voltage 0 Voltage])%give ticks at -1,0,1
%yticks(-1:1)  %tick positions from -1 to 1 with a step size of 1

grid on
title('Polar RZ');

%decoding


check=0;

result = zeros(1,bitLength);
for i=1: lenT
    if t(i)>check
        check=check+1;
        if x(i)>0
            result(check) = 1;
        end
    end
end

disp("Demodulation of Polar RZ")
disp(result)