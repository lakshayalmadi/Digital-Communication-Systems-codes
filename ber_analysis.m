EbN0dB=0:10;
 
EbN0=10.^(EbN0dB/10);
 
pe_bpsk_msk_qpsk=0.5*erfc(sqrt(EbN0));
pe_bfsk=0.5*erfc(sqrt(EbN0/2));
pe_bask=0.5*erfc(sqrt(EbN0/4));
pe_dpsk=0.5*exp(-EbN0);
pe_nbfsk=0.5*exp(-EbN0/2);
pe_nbask=0.5*exp(-EbN0/4);
 
semilogy(EbN0dB,pe_bpsk_msk_qpsk,'r*',EbN0dB,pe_bfsk,'k+',EbN0dB,pe_bask,'m>-',EbN0dB,pe_dpsk,'ko-',EbN0dB,pe_nbfsk,'g*-',EbN0dB,pe_nbask,'bo');
 
legend('BPSK/QPSK/MSK','BFSK','BASK','DPSK','NBFSK','NBASK');
xlabel('Eb/N0(dB)');
ylabel('probability of error');
grid on;
