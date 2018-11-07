%Bit Error Rate 	calculates bit error rate in an array
%       
%       	bits=sent bits
%       	uncoded_bits=recieved bits
%       	SNR=signal to noise ratio
%       	
%           
%		

%%

function [ber]=Bit_Error_Rate(bits,uncoded_bits,SNR)
be=0;

for x=1:length(bits)
    if(bits(x)~=uncoded_bits(x))
        be=be+1;
    end
end
ber(SNR+1)=be/length(bits);