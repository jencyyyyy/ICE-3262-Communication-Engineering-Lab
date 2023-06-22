%Analog Signal
A=5;
f=2;
sample=100;
sampleRate=1/sample;
t=0:sampleRate:(2-sampleRate);

xt=A*sin(2*pi*f*t);

figure(1);
subplot(1,2,1);
plot(t,xt);
xlabel('Time(t)');
ylabel('Amplitude');
title('x(t)= A*sin(2*pi*f*t)');


%digital
fs=6*f;
Ts=1/fs;
n=0:Ts:(2-Ts);
xn=A*sin(2*pi*f*n);


subplot(1,2,2);
stem(n,xn);
xlabel('Time(t)');
ylabel('Amplitude');
title('x(n)= A*sin(2*pi*f*n)');

%composite

A1=4;
A2=5;
A3=2;

f1=2;
f2=3;
f3=1;

x1=A1*sin(2*pi*f1*t);
x2=A2*sin(2*pi*f2*t);
x3=A3*sin(2*pi*f3*t);

xf=x1+x2+x3;

figure(2);
stem(t,xf);


grid on;


