%% 2a)
moewe=imread('moewex.jpg');
figure
imshow(moewe)
size(moewe) %bildhöhe=768px, bildbreite=1024px, farben=rgb
showQuadView(moewe,moewe(:,:,1),moewe(:,:,2),moewe(:,:,3))
%% 2a) Zusatzaufgabe
moewe_red = moewe;
moewe_green = moewe;
moewe_blue = moewe;
moewe_red(:,:,2)=0;
moewe_red(:,:,3)=0;
moewe_green(:,:,1)=0;
moewe_green(:,:,3)=0;
moewe_blue(:,:,1)=0;
moewe_blue(:,:,2)=0;
showQuadView(moewe,moewe_red,moewe_green,moewe_blue)
%% 2b)
moewehsi=rgb2hsi(moewe);
showQuadView(moewehsi,moewehsi(:,:,1),moewehsi(:,:,2),moewehsi(:,:,3))
%% 2c)
%RGB: im blauen Farbkanal
%HSI: Intensität
%% 2d)
%RGB: Rot: R>95, G>155, B<184
%HSI: <0,5 und >0,9
moewebin_1= moewe(:,:,3)<184;
moewebin_2= moewe(:,:,1)>95;
moewebin = moewebin_1 | moewebin_2;
figure
imshow(moewebin)
%% 2e)
moewebin_int=uint8(moewebin); %konvertierung
moewebin_int=repmat(moewebin_int, [1 1 3]); %binärbild mit farbkanälen
moewe_fertig= moewe .* moewebin_int; %ausschneiden
figure
imshow(moewe_fertig)
%% 2f)
bryce=imread('bryce.jpg');
bryce(moewebin_int == 1) = 0;
bryce_moewe = moewe_fertig + bryce;
figure
imshow(bryce_moewe);