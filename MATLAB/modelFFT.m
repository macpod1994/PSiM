close all;
clear all;
%% FFT
Fs = 1000;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = 0.7*sin(2*pi*50*t) + sin(2*pi*20*t);
figure(1);
plot(1000*t(1:50),S(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('X(t)');
[x,y]=ginput(3)
Y = fft(S);
figure(2);
A = abs(2*Y/L);
A = A(1:end/2+1);
f = Fs*(0:(L/2))/L;
plot(f,A);
%% IFFT
REC = ifft(Y);
figure(3);
plot(1000*t(1:50),REC(1:50));

%% Implement

w = 0:255;
G = zeros(size(w));
G(2) = 0;
G(3) = 1;
G(50) = 0;
G(100:200) = 1:0.01:2;
% G(1:15) = 0;

Wyj = zeros(1000,1);
t_plot = linspace(0,30,1000);
for i = 1:length(t_plot)
    for k = 1:length(w)
        Wyj(i) = Wyj(i) + G(k)*(cos(2*pi*w(k)*t_plot(i)));
    end
end

figure(5);
subplot(2,1,1)
plot(w,G);
title('Sygna³ w dziedzinie czêstotliwoœci')
xlabel('\omega (Hz)')
ylabel('|G(j\omega)|');
subplot(2,1,2)
plot(t_plot,Wyj);
grid on;
title('Sygna³ w dziedzinie czasu')
xlabel('t (sec)')
ylabel('X(t)');

