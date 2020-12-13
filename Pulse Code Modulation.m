clc
clear all
close all
a=2;
fo=5;
t=0:0.01:1;
x1=(a.*sin(2*pi*fo*t));
subplot(3,2,1);
plot(x1);
title("Original Signal");
subplot(3,2,2);
m=stem(t,x1);
title("Sampled Signal")
[index,quants]=quantiz(x1,[-2:0.5:2],[-2:0.5:2.5]);
subplot(3,2,3);
stairs(quants);
title("Quantised Signal");
code=de2bi(index,'left-msb');
k=1;
for i=1:length(index)
 for j=1:3
 coded(k)=code(i,j);
 j=j+1;
 k=k+1;
 end
 i=i+1;
end
subplot(3,2,4);
stem(coded);
axis([0 100 -2 3]);
title("BinaryEncoded  Signal")
[b,a]=butter(2,0.2,'low');
k=filter(b,a,quants);
subplot(3,2,5);
plot(t,k);
title("Reconstructed  Signal");
