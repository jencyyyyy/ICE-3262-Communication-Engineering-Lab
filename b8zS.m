clear 
bits = [0 0 0 0 0 0 0 0 1 0 1 0 1 0 1];

count=0;
bitLength= length(bits);
for i= 1:bitLength
    if bits(i)==0
        count =  count+1;
    else 
        count =0;
        
    end
    if count == 8
        bits(i-4)=-1;
        bits(i-3)=1;
        bits(i-1)=-1;
        bits(i)=1;
        count=0;
    end
end
disp(bits)        
bitrate = 1;
voltage = 5;

samplingRate = 1000;
samplingTime = 1/samplingRate;

endTime = length(bits)/bitrate;
time = 0:samplingTime:endTime;

index=1;
sign=1;

for i=1:length(time)
    if bits(index) ~=0
         modulation(i) = sign*voltage;
    else
        modulation(i) = 0;
    end
    if time(i)*bitrate >= index
        index = index+1;
        if index <= length(bits) && bits(index) ~= 0
            sign = -1*sign*bits(index);
        end
    end
end
plot(time, modulation, "LineWidth", 1);
axis([0 endTime -voltage-4 voltage+4]);
grid on;
xticks(0:endTime);
yticks([-voltage 0 voltage]);
    
%demodulation
index = 1;
for i = 1:length(modulation)
    if modulation(i) ~= 0
        demodulation(index) = modulation(i)/voltage;
    else
        demodulation(index) = 0;
    end
    if time(i)*bitrate >= index
        index = index+1;
    end
end

last = 1;
for i = 1:length(demodulation)
    if demodulation(i) ~= 0
        if (demodulation(i) == last) 
            demodulation(i) = 0;
            demodulation(i+1) = 0;
            demodulation(i+3) = 0;
            last = demodulation(i+4);
            demodulation(i+4) = 0;
        else
            last = demodulation(i);
        end
    end
end

for i = 1:length(demodulation)
    if demodulation(i) ~= 0
        demodulation(i) = 1;
    end
end

disp(demodulation);
