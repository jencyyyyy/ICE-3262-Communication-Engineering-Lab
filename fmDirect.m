clc
clear all 
close all
% Frequency Modulation (FM)
Fs = 1000;             % Sampling frequency
T = 1/Fs;               % Sampling period
t = 0.1:T:0.2;            % Time vector
fc = 200;               % Carrier frequency
kf = 50;               % Frequency deviation constant
Am = 1;                 % Message signal amplitude

% Message signal
m = sin(2*pi*30*t)+2*sin(2*pi*60*t);  % Example: sinusoidal message signal

% Frequency modulation
s = fmmod(m, fc, Fs, kf); % Modulated signal

% Plotting the modulated signal
figure;
plot(t, s);
xlabel('Time (s)');
ylabel('Amplitude');
title('Frequency Modulated Signal');

% Frequency Demodulation (Coherent Detection)
dem = fmdemod(s, fc, Fs, kf); % Demodulated signal

% Plotting the demodulated signal
figure;
plot(t, dem);
xlabel('Time (s)');
ylabel('Amplitude');
title('Demodulated Signal');
