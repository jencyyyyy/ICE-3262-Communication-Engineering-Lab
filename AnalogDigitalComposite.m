clc
clear all
close all
%Analog signal
%x(t) = A*sin(2*pi*Fm*t + Phase)

A=3;
fm=2;
Phase= pi/4;
N=1000;     %no of samples will take
T=2;        %second
dt= T/N;
t=0:dt:T;

fs=2*fm;

x = A*sin(2*pi*fs*t+Phase);

figure(1)
subplot(2,1,1)

plot(t,x)
title('Analog sine wave');
axis([0 T -fs-3 fs+3]);
yticks([-fm 0 fm]);
grid on;

%digital Signal
y=[1 0 1 0 1 1 1 0 1 0 1 0 1 0 1 0];
subplot(2,1,2)
title('Digital wave')
stem(y)


%composite
a1=10;
a2=20;
a3=40;
f1=4;
f2=8;
f3=16;
t = 0:0.001:1;
x1 = a1*sin(2*pi*f1*t);
x2 = a2*sin(2*pi*f2*t);
x3 = a3*sin(2*pi*f3*t);

x4=x1+x2+x3;

figure(2);
plot(t,x4);