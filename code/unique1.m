function [ var ] = unique1( img )
gray=rgb2gray(img);
var=sum(sum(sum(gray)));
len=max(ceil(log10(var)),1);
var=var/(10^(len-2));
tr=gray<var;
var=sum(sum(sum(tr)));
len=max(ceil(log10(var)),1);
var=var/(10^(len));
return

end

