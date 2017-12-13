im=imread('lena.png');
im=im2double(im);
uni=unique1(im);
im=rgb2gray(im);
fr=fft2(im);
old=real(fr);
[m,n]=size(old);
im=1i*csvread('ss');
key=floor(uni*10);
newimg=imread('new.bmp');
newimg=im2double(newimg)+im;
frn=fft2(newimg);
frnr=real(frn);
after=real(frnr)-old;
result=[];
itt=1;
for c=1:m
    for r=1:n
        if(after(c,r)<10)
            after(c,r)=0;
        else
            after(c,r)=round(after(c,r)/key);
            result(itt)=after(c,r);
            itt=itt+1;
        end
    end
end

caesar_D(char(result),(key))