%bits = input('prompt');
bits=[1 0 1 1 0 1 1 1 0];
bitrate = 1;
n = 1000; 
L=length(bits);
T = L/bitrate;
N = n*L;
dt = T/N;
t = 0:dt:T;
lent =length(t);
x = zeros(1,lent);

for i=1:L
  if bits(i)==1
    x((i-1)*n+1:i*n) = 1;
  end
end
plot(t, x, 'Linewidth', 3);
counter = 0;

result = zeros(1,L);
for i = 1:lent
  if t(i)>counter
    counter = counter + 1;
    result(counter) = x(i);
  end
end
disp('NRZ Unipolar Decoding:');
disp(result);