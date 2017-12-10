%% Init
close all;
clear all;

fig = figure('Name','Procesory Sygna≥owe');
Tab = zeros(1,3);
freq = 0;
amp = 0;
phase = 0;
freqMax = 1e6;
ampMax = 20;
%% Layout
%% Menu
set(fig, 'MenuBar','None');
menu1 = uimenu('Label','GUI');
autoScale = uimenu(menu1,'Label','Auto Scale','CallBack',['axis(axPh,[0 max(Tab(:,1)) 0 ampMax]);'...
     'axis(axAm,[0 max(Tab(:,1)) 0 ampMax]);']);
manuLog = uimenu(menu1,'Label','Log Scale','CallBack',...
    ['axPh.XScale = ''log'';' 'axis(axPh,[1e-2 freqMax 0 ampMax]);'...
     'axis(axAm,[1e-2 freqMax 0 ampMax]);' 'axAm.XScale = ''log'';']);
manuRes = uimenu(menu1,'Label','Reset','CallBack','Tab = zeros(1,3);');
wyjscie = uimenu(menu1,'Label','closeConnection(rs)');
set(wyjscie,'CallBack','close');
%% Manual Input
freqTxt = uicontrol(gcf,'Style','text','Units','normalized',...
    'position',[0.1 0.9 0.1 0.05],'String','Frequency');
freqIn = uicontrol(gcf,'Style','edit','Units','normalized',...
    'position',[0.1 0.85 0.1 0.05],'String','0',...
    'CallBack',['h = get(gco, ''String'');' 'freq = str2num(h);']);
ampTxt = uicontrol(gcf,'Style','text','Units','normalized',...
    'position',[0.25 0.9 0.1 0.05],'String','Amplitude');
ampIn = uicontrol(gcf,'Style','edit','Units','normalized',...
    'position',[0.25 0.85 0.1 0.05],'String','0',...
    'CallBack',['h = get(gco, ''String'');' 'amp = str2num(h);']);
phaseTxt = uicontrol(gcf,'Style','text','Units','normalized','position',...
    [0.4 0.9 0.1 0.05],'String','Phase');
phaseIn = uicontrol(gcf,'Style','edit','Units','normalized','position',...
    [0.4 0.85 0.1 0.05],'String','0','CallBack',...
    ['h = get(gco, ''String'');' 'phase = str2num(h);']);
adButton = uicontrol(gcf, 'Style','push','String','Add','Units','normalized'...
    ,'position',[0.55 0.85 0.2 0.1],'CallBack',['Tab = [Tab; [freq, amp, phase]];']);
%% Figure Amplitude
axAm = axes('Units','normalized','position',[0.1 0.45 0.85 0.25]);
axis([0 freqMax 0 ampMax]);
grid on;
ylabel('Amplitude');
drawButton = uicontrol(gcf, 'Style','push','String','Draw','Units',...
    'normalized','position',[0.75 0.85 0.2 0.1],...
    'CallBack',['drawFig(axAm, axPh, Tab,freqMax,ampMax)']);
putButton = uicontrol(gcf, 'Style','push','String','Put','Units','normalized',...
    'position',[0.55 0.75 0.2 0.1],'CallBack',['Tab = putIn(Tab);' 'drawFig(axAm, axPh, Tab,freqMax,ampMax);']);
%% Figure Phase
axPh = axes('Units','normalized','position',[0.1 0.1 0.85 0.25]);
axis([0 freqMax 0 360]);
grid on;
ylabel('Phase [∞]');
xlabel('Frequency [Hz]');
%% RS 232 interface
rs = serial('COM3','BaudRate',115200);
sendButton = uicontrol(gcf, 'Style','push','String','Send to device','Units','normalized',...
    'position',[0.75 0.75 0.2 0.1],'CallBack',['sendTab2rs(rs,Tab);']);
%% Time domain signal
plotButton = uicontrol(gcf, 'Style','push','String','Plot time domain signal','Units','normalized',...
    'position',[0.55 0.7 0.4 0.05],'CallBack',['plotTimeSig(Tab);']);
% [x,y] = ginput(1);
% set(freqIn,'String','Odpowiedü skokowa');
% set(ste,'Units','normalized','position',[0.05 0.85 0.35 0.1]);
% ax = axes('Units','normalized','position',[0.05 0.05 0.85 0.65]);
% axis([0 50 0 2]);
% ste = uicontrol;
% set(ste,'String','Odpowiedü skokowa');
% set(ste,'Units','normalized','position',[0.05 0.85 0.35 0.1]);
% imp = uicontrol(gcf, 'Style', 'push','String','Odpowiedü impulsowa','Units','normalized','position',[0.50 0.85 0.35 0.1]);
% %set(imp,'String','Odpowiedü impulsowa','Units','normalized','position',[0.50 0.85 0.35 0.1]);
% tlumienie = uicontrol(gcf,'Style','edit','Units','normalized','position',[0.55 0.75 0.15 0.04],'String','1','CallBack',['tl = get(gco, ''String'');' 'tlum = str2num(tl);']);
% napis = uicontrol(gcf,'Style','text','Units','normalized','position',[0.40 0.75 0.1 0.04],'String','T≥umienie:');
% set(ste,'CallBack',['stepplot(a,tf([1],[1 tlum 1]),0:0.1:50)']);
% set(imp,'CallBack',['impulseplot(a,tf([1],[1 tlum 1]),0:0.1:50)']);
% set(h, 'MenuBar','None');
% me = uimenu('Label','Polecenia');
% wyjscie = uimenu(me,'Label','Wyjúcie');
% set(wyjscie,'CallBack','close');
%set(tlumienie,'Units','normalized','position',[0.2 0.75 0.15 0.04]);
%text = uicontrol(gcf,'Style','text',);
%set(text,'String','T≥umienie','Units','normalized','position',[0.05 0.75 0.1 0.04]);