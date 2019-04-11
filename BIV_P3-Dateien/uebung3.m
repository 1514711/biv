%% 1a)
blueten = imread('blueten.jpg');
doubleBild = double(blueten);
doubleBild = doubleBild ./ 255;
%% 1b)
imhist(doubleBild)
title('Histogramm');
% Histogram red
redhist = imhist(doubleBild(:,:,1));
% Histogram green
greenhist = imhist(doubleBild(:,:,2));
% Histogram blue
bluehist = imhist(doubleBild(:,:,3));
plot(redhist, 'r');
hold on
plot(greenhist, 'g');
plot(bluehist, 'b');
%% 1c)
% Vermutung: das Bild wird zu dunkel dargestellt, da sehr viele Werte im
% Histogramm in den dunklen Regionen vorhanden sind.
bluetenhsi=rgb2hsi(blueten);
helligkeithist = imhist(bluetenhsi(:,:,3));
plot(helligkeithist, 'black'); figure
imshow(doubleBild);
% Vermutung war richtig
showQuadView(doubleBild, doubleBild(:,:,1), doubleBild(:,:,2), doubleBild(:,:,3));
showQuadView(bluetenhsi,bluetenhsi(:,:,1),bluetenhsi(:,:,2),bluetenhsi(:,:,3)); 
%% 1d)
minhelligkeit = min(bluetenhsi(:,:,3),[],'all')
maxhelligkeit = max(bluetenhsi(:,:,3),[],'all')
kontrast = maxhelligkeit - minhelligkeit
%% 1e)
stabileKontrastWerte = stretchlim(bluetenhsi(:,:,3))
stabileKontrast = stabileKontrastWerte(2,1)-stabileKontrastWerte(1,1)
%% 1f)
imhist(bluetenhsi(:,:,3))
% Man könnte aus dem Histogram zumindest auf den größeren Unterschied
% zwischen maxIntensität und dem oberen Quantil schließen, da sich die
% Helligkeit oberhalb von 200 über einen größeren Raum auf der Achse
% bewegt.
%% 1g)
P = imhist(bluetenhsi(:,:,3));
% 0 ausschließen und Nomierung
P = P(P>0)./sum(P);
entropie = -sum((P .* log2(P)))
%% 2a)
bluetenhsi_neu = bluetenhsi;
intensity = bluetenhsi(:,:,3);
imshow(intensity); figure
grey = imhist(bluetenhsi(:,:,3));
s = stretchlim(bluetenhsi(:,:,3))
gmax = s(2,1);
gmin = s(1,1);
intensity_spreiz = (intensity - gmin) .* ((1-0)/(gmax-gmin)) + 0;
imshow(intensity_spreiz); figure
% neues RGB-Bild
bluetenhsi_neu(:,:,3) = intensity_spreiz;
bluetenrgb = hsi2rgb(bluetenhsi_neu);
imshow(bluetenrgb); figure
%% 2b)
imshow(intensity);figure
gamma = 0.5;
intensity_gamma = 1.0 .* (intensity/1.0).^gamma;
imshow(intensity_gamma); figure
% neues RGB-Bild
bluetenhsi_neu(:,:,3) = intensity_gamma;
bluetenrgb = hsi2rgb(bluetenhsi_neu);
imshow(bluetenrgb); figure
%% 2c)
intensity_histeq=histeq(intensity);
imshow(intensity_histeq);figure
intensity_lin= adapthisteq(intensity);
imshow(intensity_lin);figure
imshow(intensity); figure
% neues RGB-Bild
bluetenhsi_neu(:,:,3) = intensity_lin;
bluetenrgb = hsi2rgb(bluetenhsi_neu);
imshow(bluetenrgb); figure
% neues RGB-Bild
bluetenhsi_neu(:,:,3) = intensity_histeq;
bluetenrgb = hsi2rgb(bluetenhsi_neu);
imshow(bluetenrgb); figure
%% 2c) Optional: mit AquaTermi_lowcontrast
aquatermi = imread('AquaTermi_lowcontrast.jpg');
aquatermi_hsi=rgb2hsi(aquatermi);
aquatermi_i = aquatermi_hsi(:,:,3);
imshow(aquatermi_i);figure
equalization_aqua=histeq(aquatermi_i);
imshow(equalization_aqua);figure
aquatermi_i_neu= adapthisteq(aquatermi_i);
imshow(aquatermi_i_neu);figure
%% 2d)
% Entropie nach der Gamma-Korrektur
entropy_gamma = entropy(intensity_gamma)
% Entropie nach der Histogrammlinearisierung
entropy_histeq = entropy(intensity_histeq)
entropy_lin = entropy(intensity_lin)
%% 2e)
% Histogram nach der Histogrammspreizung
hist_before = imhist(intensity,20);
hist_spreiz = imhist(intensity_spreiz,20);
plot(hist_before, 'green');
hold on
plot(hist_spreiz, 'blue');