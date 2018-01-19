%Main file
clc;close all;clear all; %#ok<*CLSCR>
% 
%reading audio file 
% [samp,fs]=audioread('file address here',[1,7000]);
% 
% disp(length(samp));
% 
% sound(samp,fs);

for SNR=0:12
    
samp=[9 5 7 6 5];
 
[bits,quan_lvl,pm]=quan(samp);

[coded_bits,g]=Linearblockcode(bits);

[syms,bp,t1]=symbols(coded_bits);

[mod,ss]=FSK_Modulation(syms,bp);

[mod]=AWGN(mod,SNR);

[rec]=FSK_Demodulation(mod,bp,ss);

[rec_bits]=de_symbol(rec);

[uncoded_bits]=channel_decode(rec_bits,g);

[uncoded_bits]=equalizer(uncoded_bits,bits);

[ber]=Bit_Error_Rate(bits,uncoded_bits,SNR);

[recsamps]=dequan(uncoded_bits,quan_lvl,pm);

end
subplot(3,1,1);
plot(ber);
subplot(3,1,2);
plot(samp);
subplot(3,1,3);
plot(recsamps);

% disp(' Binary information at Reciver :');
% disp(rec);
% 
% t3=bp/99:bp/99:bp*length(bits);
% 
% 
% subplot(3,1,1);
% plot(t3,mod);
% axis([ 0 bp*length(bits) -10 10]);
% 
% xlabel('Time(sec)');
% ylabel('Amplitude(volt)');
% title('Binary FSK Modulation');
% 
% subplot(3,1,2);
% plot(t1,syms);
% grid on;
% axis([ 0 bp*length(bits) -2 2]);
% ylabel('Amplitude(volt)');
% xlabel('Time(sec)');
% title('Information transmitted as digital signal');
% 
% disp(' Binary information at Transmitter :');
% disp(samp);
% disp(' Binary information at Reciever :');
% disp(recsamps);