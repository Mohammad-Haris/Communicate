%FSK demodulation 	
%       
%       	rec=recieved symbols
%		mod=modulated array
%		bp=bit period
%		ss=length of t2(used for plotting)
%		

%%

function 	[rec]=FSK_Demodulation(mod,bp,ss)


 
  br=1/bp;                                              % bit rate
  f1=br*9;                           
  f2=br*3; 
  rec=[];
  t=bp/99:bp/99:bp;
  y1=cos(2*pi*f1*t);                                    % carrier signal for information 1
  y2=cos(2*pi*f2*t);                    %#ok<*NASGU>    % carrier signal for information 0

for n=ss:ss:length(mod)  
  var=y1.*mod((n-(ss-1)):n);
  t4=bp/99:bp/99:bp;
  z1=trapz(t4,var);                                             % intregation 
  zz1=round(2*z1/bp);
   o=ones(1,99);
   z=zeros(1,99);
  if  zz1 > 0    
    rec=[rec o];  %#ok<*AGROW>
  else 
    rec=[rec z];
  end
end
