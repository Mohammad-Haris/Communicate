%AWGN 	Adds noise to symbols
%       
%       	mod = modulated signal
%       	SNR = signal to noise ratio
%		
%
%%

function [mod]=AWGN(mod,SNR)

    mod=awgn(mod,SNR,10*log10(81/2));
    
    