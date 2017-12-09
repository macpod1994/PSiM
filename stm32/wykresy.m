close all
clear all

f = fopen('log.txt','r');
d = fscanf(f, '%d');
plot(d)
fclose(f)