clc
clear all 
close all
%bits = input('Enter the bit stream');
bits = [1 0 1 1 0 0 1 0];
bitrate = 1;              %bit rate
sampleRate = 1000;           %sample rate
bitLength= length(bits);
endT = bitLength/bitrate;       %total time
N = sampleRate*bitLength;   %total no of sample
dt = endT/N;                    %time for 1 sample
t = 0:dt:endT-dt;                  %array of total time
lenT =length(t);            %length of total units of time in x-axis (lenth of sample)

Voltage=5;

%x= repmat(Voltage, 1, lenT); %repeat voltage up to T 
x = ones(1,lenT);            %fill with one +ve voltage

%encoding
lastbit = 1*Voltage; %consider last bit positive

for i=1:bitLength
  if bits(i)==1
    x((i-1)*sampleRate+1:i*sampleRate) = -lastbit;
    lastbit=-lastbit;
  else
       x((i-1)*sampleRate+1:i*sampleRate)= lastbit;
  end
end
%disp(x)
plot(t, x, 'Linewidth', 5);
axis([0 endT -Voltage-5 Voltage+5]);
%both same
yticks([-Voltage 0 Voltage])%give ticks at -1,0,1
%yticks(-1:1)  %tick positions from -1 to 1 with a step size of 1

grid on
title('Polar Non-return to zero Inverted (nrzi)');

%decoding


check=0;
lastbit=Voltage;
result = zeros(1,bitLength);
for i=1: lenT
    if t(i)>check
        check=check+1;
        if x(i)~=lastbit
            result(check) = 1;
            lastbit = -lastbit;
        end
    end
end

disp("Demodulation of Polar NRZ I ")
disp(result)