%dequan  	Recovering samples from quantized input
%       uncoded_bits=bits after channel decode
%	quan_lvl=array of levels of quantization
%	pm=what to add and subtract in quan_lvl
%	recsamps=samples recieved after dequantization 

%%

function 	[recsamps]=dequan(uncoded_bits,quan_lvl,pm)

n=1;
for h=1:9:length(uncoded_bits)
    recsamps(n)=quan_lvl(bin2dec(uncoded_bits(h:h+8))+1)-(pm/2);   %#ok<*AGROW>
    n=n+1;
end