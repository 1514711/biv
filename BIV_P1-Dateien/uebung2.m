%% 1a)
moewe = imread('moewex.jpg');
moewe_double = double(moewe) / 255;
average(moewe_double(:))
