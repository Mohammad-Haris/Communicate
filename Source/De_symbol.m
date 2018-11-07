%de_symbol	convertes symbols to bits
%       
%       	rec=recieved symbols
%		rec_bits=bits from symbols	

%%

function [rec_bits]=de_symbol(rec)

rec_bits=[];

for g=99:99:length(rec)
    if g==99
    if rec(45)==1
    rec_bits=[rec_bits '1']; %#ok<*AGROW>
    else
    rec_bits=[rec_bits '0'];   
    end
    else    
    if rec(g-45)==1
    rec_bits=[rec_bits '1']; %#ok<*AGROW>
    else
    rec_bits=[rec_bits '0'];   
    end
    end
end
    
    
