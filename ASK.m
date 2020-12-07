clc;
clear all;
close all;
f1=7;
f2=5;
a=1;
n = [1 0 1 1 0 0 0];
l=length(n);
t1=0:0.01:l;
t2=0:l-1
subplot(4,1,1);
stairs(t2,n);
title('MESSAGE SIGNAL');
xlabel('TIME');
ylabel('AMPLITUDE');
y1=a*sin(2*pi*f1*t1);
subplot(4,1,2);
plot(t1,y1);
title('FIRST CARRIER SIGNAL');
xlabel('TIME');
ylabel('AMPLITUDE');
y2=a*sin(2*pi*f2*t1);
subplot(4,1,3);
plot(t1,y2);
title('SECOND CARRIER SIGNAL');
xlabel('TIME');
ylabel('AMPLITUDE');
for i = 1:l
    for j=(i-1)*100:i*100
        if(n(i)==1)
            s(j+1)=y1(j+1)
        else
            s(j+1)=y2(j+1)
        end
    end
end
subplot(4,1,4);
plot(t1,s);
title('MODULATED SIGNAL');
xlabel('TIME');
ylabel('AMPLITUDE');
for i = 1:l
    for j=(i-1)*100:i*100
        if(s(j+1)==y1(j+1))
            k(j+1)=1;
        else
            k(j+1)=0;
        end
    end
end
