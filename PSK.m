clc;
clear all;
close all;
a=1;
f1=7;
f2=5;
n=[1 0 1 1 0 0 0];
t=0:0.01:length(n);
t2=0:length(n)-1;
subplot(5,1,1)
stairs(t2,n)
title('MESSAGE SIGNAL')
xlabel('TIME')
ylabel('AMPLITUDE')
%1st carrier
y1=a*sin(2*pi*f1*t);
subplot(5,1,2);
plot(t,y1)
title('FIRST CARRIER')
xlabel('TIME')
ylabel('AMPLITUDE')
%2nd carrier
y2=-a*sin(2*pi*f2*t);
subplot(5,1,3)
plot(t,y2)
title('SECOND CARRIER')
xlabel('TIME')
ylabel('AMPLITUDE')
%modulation
for i=1:7
    for j=(i-1)*100:i*100
        if(n(i)==1)
            s(j+1)=y1(j+1)
        else
            s(j+1)=y2(j+1)
        end
    end
end
subplot(5,1,4)
plot(t,s)
title('MODULATED SIGNAL')
xlabel('TIME')
ylabel('AMPLITUDE')
%demodulation
for i=1:7
    for j=(i-1)*100:i*100
        if(s(j+1)==y1(j+1))
            d(j+1)=1
        else
            d(j+1)=0
        end
    end
end
subplot(5,1,5)
plot(t,d)
title('DEMODULATED SIGNAL')
xlabel('TIME')
ylabel('AMPLITUDE')
