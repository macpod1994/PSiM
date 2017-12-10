function drawFig(handleAm, handlePh, Tab, freqMax, ampMax)

    scatter(handleAm,Tab(:,1),Tab(:,2),'Marker','o','MarkerFaceColor',[0.5 0.05 0.05],'MarkerEdgeColor',[1 0 0]);
    axis(handleAm,[0 freqMax 0 ampMax]);
    ylabel(handleAm,'Amplitude');
    grid(handleAm,'on');

    scatter(handlePh,Tab(:,1),Tab(:,3),'Marker','o','MarkerFaceColor',[0.5 0.05 0.05],'MarkerEdgeColor',[1 0 0]);
    axis(handlePh,[0 freqMax 0 360]);
    xlabel('Frequency [Hz]');
    ylabel(handlePh,'Phase [°]');
    grid(handlePh,'on');
    
end

