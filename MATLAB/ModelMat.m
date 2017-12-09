close all;
clear all;
%% Wejœcia
w = 0:255;
wLog = logspace(0,wMax,w_roz);
wLog = [0 logspace
G = zeros(size(w));
G(2) = 0;
G(3) = 1;
G(50) = 0;
G(100:200) = 1:0.01:2;


Wyj = zeros(1000,1);
t_plot = linspace(0,30,1000);

%% Algorytm
for i = 1:length(t_plot)
    for k = 1:length(w)
        Wyj(i) = Wyj(i) + G(k)*(cos(2*pi*w(k)*t_plot(i)));
    end
end

%% Wyjœcia
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