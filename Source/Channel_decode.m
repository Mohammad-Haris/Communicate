%Channel decode 	decodes the 7x4 linear block code
%       
%       	rec_bits=recieved bits
%       	g=generator matrix
%       	uncoded_bits=bits after channel decode 
%		

%%

function [uncoded_bits]=channel_decode(rec_bits,g)

[n,k] = size(transpose(g));
p = g(:,n-k+2:n);
h = [transpose(p),eye(n-k)];
ht = transpose(h);
syn=[];

for r=1:7:length(rec_bits)
    if(r+6)>length(rec_bits)
        syn=[syn rec_bits(r:length(rec_bits))]; %#ok<*AGROW>
        break;
    end
    res=rec_bits(r:(r+6))*ht;
    syn=[syn res];
end

for corr=1:length(syn)
    if syn(corr)>1
        if (mod(syn(corr),2)==0)
            syn(corr)=0; %#ok<*SAGROW>
        else
            syn(corr)=1;
        end
    end
end

addarr=[];
for tmp=-1:1:length(syn)
    addarr=[addarr tmp];
end
    
 adnm=1;   
for fs=1:3:length(syn)
   
    
    if(fs+2)>length(syn)
        break;
    end
    temp=bin2dec(int2str(syn(fs:fs+2)));
    if temp~=0
        switch temp
            case 5
              rec_bits((fs*2)+addarr(adnm))=num2str(not(str2num(rec_bits((fs*2)+addarr(adnm)))));            %#ok<*ST2NM>
            case 7
                rec_bits((fs*2)+addarr(adnm)+1)=num2str(not(str2num(rec_bits((fs*2)+addarr(adnm)+1))));
            case 6
                rec_bits((fs*2)+addarr(adnm)+2)=num2str(not(str2num(rec_bits((fs*2)+addarr(adnm)+2))));
            case 3
                rec_bits((fs*2)+addarr(adnm)+3)=num2str(not(str2num(rec_bits((fs*2)+addarr(adnm)+3))));  
            case 4
                rec_bits((fs*2)+addarr(adnm)+4)=num2str(not(str2num(rec_bits((fs*2)+addarr(adnm)+4))));
            case 2
                rec_bits((fs*2)+addarr(adnm)+5)=num2str(not(str2num(rec_bits((fs*2)+addarr(adnm)+5))));  
            otherwise
                rec_bits((fs*2)+addarr(adnm)+6)=num2str(not(str2num(rec_bits((fs*2)+addarr(adnm)+6))));
        end       
    end
    adnm=adnm+1;
end


uncoded_bits=[];

for recov=1:7:length(rec_bits)
    if (recov+3)>length(rec_bits)
        uncoded_bits(recov:length(rec_bits))=rec_bits(recov:length(rec_bits));
        break;
    else
    uncoded_bits=[uncoded_bits rec_bits(recov:(recov+3))];
    end
end