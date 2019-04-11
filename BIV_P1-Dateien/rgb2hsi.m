function hsi = rgb2hsi(rgb)
r=im2double(rgb(:,:,1));
g=im2double(rgb(:,:,2));
b=im2double(rgb(:,:,3));
th=acos((0.5*((r-g)+(r-b)))./((sqrt((r-g).^2+(r-b).*(g-b)))+eps));
H=th;
H(b>g)=2*pi-H(b>g);
H=H/(2*pi);
S=1-3.*(min(min(r,g),b))./(r+g+b+eps);
I=(r+g+b)/3;
hsi=cat(3,H,S,I);
end
