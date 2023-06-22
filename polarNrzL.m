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

x= repmat(Voltage, 1, lenT); %repeat voltage up to T 
%x = ones(1,lenT);            %fill with one +ve voltage

%encoding

for i=1:bitLength
  if bits(i)==1
    x((i-1)*sampleRate+1:i*sampleRate) = -Voltage;
  
  end
end
%disp(x)
plot(t, x, 'Linewidth', 5);
axis([0 endT -Voltage-5 Voltage+5]);
%both same
yticks([-Voltage 0 Voltage])%give ticks at -1,0,1
%yticks(-1:1)  %tick positions from -1 to 1 with a step size of 1

grid on
title('Polar Non-return to zero Level (nrzl)');

%decoding


counter=0;
result = zeros(1,bitLength);
for i=1: lenT
    if t(i)>counter
        counter=counter+1;
        if x(i)<0
            result(counter) = 1;
        end
    end
end

disp("Demodulation of Polar NRZ L ")
disp(result)