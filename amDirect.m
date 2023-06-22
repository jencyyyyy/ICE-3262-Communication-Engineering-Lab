% carrier Frequency
Fc = 200;

% sampling frequency
Fs= 4000;

% time Duration
t = (0 : 1 / Fs : 1);

% sine Wave with time duration of 't'
x = sin(2*pi*t);

% Amplitude Modulation
y = ammod(x, Fc, Fs);

plot(y);
title('Amplitude Modulation');
xlabel('Time(sec)');
ylabel('Amplitude');
