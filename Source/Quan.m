%Quantizes samples 	(512 level quantization)
%       
%       	samp = input sequence
%       	bits = quantized output
%       	quan_lvl =a rray of quantization levels from max sample value to
%       	least sample value
%           pm = quantization step i.e. range/512
%		

%%
% funtion for quantization
function 	[bits,quan_lvl,pm]=quan(rec_bits)

range=max(rec_bits)-min(rec_bits);
rl_mx=max(rec_bits);
rl_mn=min(rec_bits);
ql=512;
pm=range/ql;
mn=rl_mn+(pm/2); %usable min
mx=rl_mx-(pm/2);

for a=1:((range/pm))
    if a==1
        quan_lvl(a)=mn+pm; %#ok<*SAGROW>
    else
        quan_lvl(a)=quan_lvl(a-1)+pm;
    end
end

n=9;
comb=[];
for i=0:2^n-1,
    comb = [comb dec2bin(i,9)]; %#ok<*AGROW>
end

v=2;
u(1)=0;
for k=2:1:512
    if k==2
        u(k)=v;
    else
        u(k)=u(k-1)+5;
    end
end
    
for c=1:length(rec_bits)
    if c>2
        v=v+5;
    end 
    for d=1:length(quan_lvl)-1
        
        if rec_bits(c)<mn+(pm/2)
                if c==1
                bits(1:9)=comb(1:9);
                break;
                else 
                bits(((c*4)+v):((c*4)+v+8))=comb(1:9);
                break;
                end
        elseif rec_bits(c)>quan_lvl(d) && rec_bits(c)<quan_lvl(d+1)
                if c==1
                bits(1:9)=comb(((d+1)*4+u(d)):((d+1)*4+u(d)+8));
                break;
                else
                bits(((c*4)+v):((c*4)+v+8)) = comb(((d+1)*4+u(d+1)):((d+1)*4+u(d+1)+8));
                break;
                end
        elseif rec_bits(c)>mx-(pm/2)
                if c==1
                bits(1:9)=comb(4600:4608);
                break;
                else
                bits(((c*4)+v):((c*4)+v+8))=comb(4600:4608);
                break;
                end
        end
    end
end




