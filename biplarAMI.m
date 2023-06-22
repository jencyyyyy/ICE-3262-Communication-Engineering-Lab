clc
clear all
close all

bits=[0 1 0 0 1 1];
%bits=input('enter bit stream');
sampleRate=1000;
bitRate=1;

bitLength= length(bits);
totalTime = bitLength/bitRate;

totalSample= sampleRate*bitLength;

sampleTime = totalTime/totalSample;

time = 0:sampleTime:totalTime;

timeLength= length(time)
voltage=5;

lastbit=1*voltage;
%modulation
x = zeros(1,timeLength);

for i=1:bitLength
    if bits(i)== 1
        x((i-1)*sampleRate+1:i*sampleRate) = -lastbit;
        lastbit= -lastbit;
    end
end
disp(length(x))
%disp(x);
plot(time,x,'Linewidth',3)
title('bipolar ami');
yticks([-voltage 0 voltage]);
axis([0 totalTime -voltage-3 voltage+3])
grid on;

%demodulation

checker=0;
lastbit=1*voltage;
result = zeros(1,bitLength);
for i=1:timeLength
    if time(i)> checker
        checker= checker+1;
        
        if (x(i) == lastbit) || (x(i) == -lastbit)
            result(checker)= 1;
            lastbit=-lastbit;
        end
    end
    
end

disp('Decoding')
disp(result)



