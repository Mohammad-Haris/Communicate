%symbol generator  	Assigns symbols to bits
%       
%       	coded_bits=linear block coded bits
%		syms=symbols array
%		bp=bit period
%		t1=used for graphing


%%

function 	[syms,bp,t1]=symbols(coded_bits)
x=coded_bits;                                    
bp=.00001;                                  %bit period
% representing binary information as digital signal
syms=[]; 

s1=ones(1,99);
s0=(-1).*ones(1,99);
for n=1:length(x)
    if x(n)==1
        se=s1;
    else 
        se=s0;
    end
     syms=[syms se]; %#ok<*AGROW>

end
t1=bp/99:bp/99:99*length(x)*(bp/99);
