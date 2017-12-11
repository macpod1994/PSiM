function Tab = addSample(handF,handA,handP,Tab)

if Tab(1,:) == [0 0 0]
    Tab = Tab(2:end,:);
end
freq = get(handF,'String');
freq = str2num(freq);
amp = get(handA,'String');
amp = str2num(amp);
phase = get(handP,'String');
phase = str2num(phase);

Tab = [Tab; [freq, amp, phase]];

end

