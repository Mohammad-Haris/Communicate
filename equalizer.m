%eualizer	this is a custom block 
%		this block just simply equalizes the recieved and sent bits by concatenating
%		required number of zeros at the end of recieved bits
%		
%		uncoded_bits=bits after de quantization
%		bits=sent bits

%%

function [uncoded_bits]=equalizer(uncoded_bits,bits)

c=length(bits);
d=length(uncoded_bits);

e=c-d;

for f=1:e
    uncoded_bits(d+f)='0';
end
