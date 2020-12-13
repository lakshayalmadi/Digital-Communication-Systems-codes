clc;
clear all;
fm=4;
fs=20*fm;
am=2;
t=0:1/fs:1;
x1=am*sin(2*pi*fm*t);
subplot(4,1,1);
plot(t,x1);
title("x1=am*sin(2*pi*fm*t)");
x2=am+am*sin(2*pi*fm*t);
subplot(4,1,2)
plot(t,x2);
title("x2=am+am*sin(2*pi*fm*t)");
hold on;
t1=0:0.01:1;
x11=2+sin(2*pi*fm*t1);
subplot(4,1,3)
stem(t1,x11)
title('Sampled Signal')
for n=1:length(x1)
if n==1
e(n)=x1(n);
eq(n)=round(e(n));
xq(n)=eq(n);
else
e(n)=x1(n)-xq(n-1);
eq(n)=round(e(n));
 xq(n)=eq(n)+xq(n-1);
end
end
subplot(4,1,4)
stem(t,e);
title('DPCM')
figure
l =zeros(1,100,'int32');
m =zeros(1,100,'int32');
for N=1:length(t)
m(N)=x1(N);
end
for N=2:99
if m(N-1)<m(N)
l(N)=1;
elseif m(N-1)==m(N)
l(N)=0;
else
l(N)=-1;
end
end
subplot(4,1,1);
plot(t,xq);
title('Quantized Signal');
subplot(4,1,2)
z1 = dec2bin(l);
z1 = bin2dec(z1);
stem(z1);
title("Binary Encoded Signal")
for n=1:length(x1)
if n==1
xqr(n)=eq(n);
else
xqr(n)=eq(n)+xqr(n-1);
end
end
%LOWPASS FILTER
[num den] = butter(2,4*fm/fs);
rec_op = filter(num,den,xqr);
subplot(4,1,3);
plot(t,rec_op,'k-');
title("Smooth Reconstructed Signal"); 
