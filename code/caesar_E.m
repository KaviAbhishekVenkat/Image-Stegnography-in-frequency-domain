function C=caesar_E(P,k)
if k>26
    error('Key must be in rang from 1 to 26')
end

C=double(P)+k;
l=find(C>122);
C(l)=C(l)-26;
l=find(C>90);
l=find(C(l)<97);
C(l)=C(l)-26;
l=find(P==32);
C(l)=32;
C=char(C);
