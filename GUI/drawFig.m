function drawFig(handleAm, handlePh, handleTime, Tab, freqMax, ampMax)

    scatter(handleAm,Tab(:,1),Tab(:,2),'Marker','o','MarkerFaceColor',[0.5 0.05 0.05],'MarkerEdgeColor',[1 0 0]);
    axis(handleAm,[0 freqMax 0 ampMax]);
    ylabel(handleAm,'Amplitude');
    grid(handleAm,'on');

    scatter(handlePh,Tab(:,1),Tab(:,3),'Marker','o','MarkerFaceColor',[0.5 0.05 0.05],'MarkerEdgeColor',[1 0 0]);
    axis(handlePh,[0 freqMax 0 360]);
    xlabel('Frequency [Hz]');
    ylabel(handlePh,'Phase [°]');
    grid(handlePh,'on');
    
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
           y(i) = y(i) + amps(j)*cos(2*pi*freqs(j)*t(i)-phs(j)*pi/180);
        end
    end
    plot(handleTime,t,y,'r');
%     title(handleTime,'Time Domain Signal');
    xlabel(handleTime,'Time [s]')
    ylabel(handleTime,'Value');
    grid(handleTime,'on');
    
end

