clear all
close all
f=2;
fs=20;
t1 =0:1/fs:(2/f-1/fs);
x=2+2*sin(2*pi*f*t1);
subplot(5,1,1);
plot(t1,x);
title('Message signal x(t)');
subplot(5,1,2);
stem(t1,x);
title('Sampled Signal');
del=0.05;
for n=1:19
 if x(n+1)>x(n)
 del(n+1)=del(n)+1;
 p(n)=1;
 else
 del(n+1)=del(n)-1;
 p(n)=0;
 end
end
subplot(5,1,3);
stairs(t1,del);
title('Quantized Signal');
subplot(5,1,4);
stem(p);
title('Encoded Signal');
[b,a]=butter(2,0.5,'low');
a1=filter(b,a,del);
subplot(5,1,5);
plot(t1,a1);
title('Reconstructed Signal')
