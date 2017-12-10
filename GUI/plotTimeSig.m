function [t,y] = plotTimeSig(Tab)

Tab = round(Tab);
liczbaProbek = numel(Tab)/3;
freqs = Tab(:,1);
amps = Tab(:,2);
phs = Tab(:,3);
freqMax = max(freqs);
frqsNoZero = freqs(freqs>0);
lowFreq = min(frqsNoZero);
if length(lowFreq)<1
    display('Sygna³ niezmienny w czasie!');
    return;
end
longstPeriod = 1/lowFreq;
step = 1/(50*freqMax);
t = 0:step:2*longstPeriod';
y = zeros(size(t));
for i=1:length(y)
    for j=1:liczbaProbek
        y(i) = y(i) + amps(j)*cos(2*pi*freqs(j)*t(i)+phs(j)*pi/180);
    end
end
figure(2);
plot(t,y,'r');
title('Time Domain Signal');
xlabel('time [s]')
ylabel('value');
grid on;
end

