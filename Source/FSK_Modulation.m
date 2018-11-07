%FSK Modulation 	Fsk modulates symbols
%       
%       	syms=symbols array
%		bp=bit period(used for plotting)
%		ss=length of t2(used for plotting)
%		mod=modulated array
%	

%%

function 	[mod,ss]=FSK_Modulation(syms,bp)


A=9;                                          % Amplitude of carrier signal
br=1/bp;                                                         % bit rate
f1=br*9;                           % carrier frequency for information as 1
f2=br*3;                           % carrier frequency for information as 0
t2=bp/99:bp/99:bp;                 
ss=length(t2); %#ok<*NASGU>
mod=[];


rt=A.*syms;
for i=99:99:length(syms)
    if i==99
        if rt(1)==9
        y=rt(1:i).*cos(2*pi*f1*t2);
        else
        y=rt(1:i).*cos(2*pi*f2*t2);    
        end
    else
        n=i-99;
        if rt(i)==9
        y=rt(n+1:i).*cos(2*pi*f1*t2);
        else
        y=rt(n+1:i).*cos(2*pi*f2*t2);
        end
    end
    mod=[mod y]; %#ok<*AGROW>
end
