%
%Linear block code		codes the bits in the order 7x4
%
%				bits=transmitted bits
%				coded_bits=linear block coded bits
%				g=generator matrix								

%%

function [coded_bits,g]=Linearblockcode(bits)

g=[1 0 0 0 1 0 1;0 1 0 0 1 1 1;0 0 1 0 1 1 0;0 0 0 1 0 1 1];
e=bits;
coded_bits=[];

for l=1:4:length(e)      
if (l+3)>length(e)
    b=l;
    n=(length(e)-l)+1;
    while l<n || l==n
    coded_bits=[coded_bits str2num(e(b))];  %#ok<*AGROW,*NASGU>
    b=b+1;
    end
    break;
end
b=str2num(e(l)).*g(1,:); %#ok<*ST2NM>
c=str2num(e(l+1)).*g(2,:);
d=str2num(e(l+2)).*g(3,:);
f=str2num(e(l+3)).*g(4,:);
res1=xor(b,c);
res2=xor(d,f);
res=xor(res1,res2);
coded_bits=[coded_bits res];  
end


