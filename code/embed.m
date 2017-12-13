clear
clc
im=imread('lena.png');
im=im2double(im);
uni=unique1(im);
key=floor(uni*10);
msg= input('enter your message','s');
msg=caesar_E(msg,(key));
im=rgb2gray(im);
imc=im;
fr=fft2(im);
rl=real(fr);
old=rl;
im=1i*imag(fr);
[m,n]=size(rl);
outl=[];
outh=[];
arr1=double(msg);
arr=arr1*key;
for c=1:m
    for r=1:n
        if(rl(c,r)<0)
            outl(c,r)=rl(c,r);
        else
            outh(c,r)=rl(c,r);
        end
    end
end
itt=1;
len=numel(arr);
for c=1:m
    for r=1:n
        if(outh(c,r)==0)
            if(itt<=len)
                outh(c,r)=arr(itt);
                itt=itt+1;
            end
        end
    end
end
combine=(outl+outh+im);
temp=combine-outl-im;
im=ifft2(combine);
te=real(fft2((im)));
imwrite(real(im),'new.bmp');     
csvwrite('ss',imag(im));