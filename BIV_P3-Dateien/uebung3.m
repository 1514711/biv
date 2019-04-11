%% 1a)
blueten = imread('blueten.jpg');
doubleBild = double(blueten);
doubleBild = doubleBild ./ 255;
%max(doubleBild,[],'all')
%% 1b)
figure
imhist(doubleBild)
title('Histogramm');
% Histogram red
redhist = imhist(doubleBild(:,:,1));
% Histogram green
greenhist = imhist(doubleBild(:,:,2));
% Histogram blue
bluehist = imhist(doubleBild(:,:,3));
figure
plot(redhist, 'r');
hold on
plot(greenhist, 'g');
plot(bluehist, 'b');
%% 1c)
% Vermutung: das Bild wird zu dunkel dargestellt, da sehr viele Werte im
% Histogramm in den dunklen Regionen vorhanden sind.
bluetenhsi=rgb2hsi(blueten);
helligkeithist = imhist(bluetenhsi(:,:,3));
plot(helligkeithist, 'black');
figure
imshow(doubleBild);
% Vermutung war richtig
showQuadView(doubleBild, doubleBild(:,:,1), doubleBild(:,:,2), doubleBild(:,:,3));
showQuadView(bluetenhsi,bluetenhsi(:,:,1),bluetenhsi(:,:,2),bluetenhsi(:,:,3))
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
P = P(P>0)./sum(P);
entropie = -sum((P .* log2(P)))
%% 2a)
intensity = bluetenhsi(:,:,3);
imshow(intensity);
grey = imhist(bluetenhsi(:,:,3));
s = stretchlim(bluetenhsi(:,:,3))
gmax = s(2,1);
gmin = s(1,1);
intensitynei = (intensity - gmin) .* ((1-0)/(gmax-gmin)) + 0;
figure
imshow(intensityneu);
figure
histogramintensityneu = imhist(intensityneu);
plot(grey, 'green');
hold on
plot(histogramintensityneu, 'blue');
entropy(intensityneu)
%Transferfunktion funktioniert nicht richtig
%% 2b)
imshow(intensity);
gamma = 2;
intensityneu = 1.0 .* (intensity/1.0).^gamma;
figure
plot(imhist(intensity), 'red')
hold on
plot (imhist(intensityneu), 'yellow');
figure
imshow(intensityneu);
%% 2c)
equalization=histeq(g);
plot(equalization, 'red');
imshow(equalization);
bluetenhsi_neu= adapthisteq(bluetenhsi(:,:,3));
imshow(bluetenhsi_neu);
imshow(bluetenhsi(:,:,3));
% TODO: mit AquaTermi_lowcontrast
%% 2d)
% Berechung der Entropie nach der Gamma-Korrektur und
% Histogrammlinearisierung
%% 2e)
% Optional: Lassen Sie sich die Histogramme des I-Kanals vor und nach den drei verschiedenen
% Kontrastkorrekturen mit der Funktion imhist(I) anzeigen. Die Anzahl der verwendeten
% Intervalle lässt sich einstellen: imhist(I,n). Testen Sie auch n=10. Übernehmen Sie je ein
% Histogramm in die Auswertung
