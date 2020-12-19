m=4;
N=2^m-1;
x1=1;
x2=0;
x3=1;
x4=0;
states=[];
for i=1:N
    x1(i+1)=xor(x3(i),x4(i));
    x2(i+1)=x1(i);
    x3(i+1)=x2(i);
    x4(i+1)=x3(i);
    states=[states; x1(i) x2(i) x3(i) x4(i)];
end
  
disp('States of LFSR');
states;
  
disp('PN Sequence');
pn=x4(1:N);
  
n0 = sum(pn==1);
n1 = sum(pn==0);
  
for i=1:N
    if pn(i)==0
        pnv(i)=1;
    else
        pnv(i)=-1;
    end
end
  
arr=[];
for d=-1:N+1
   p=circshift(pnv,d);
   d=sum(pnv.*p)/N;
   arr=[arr d];
end
  
figure;
d=-1:N+1;
plot(d,arr,'k');
title('PN Sequence, 18BEC0391')
