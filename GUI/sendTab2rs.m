function sendTab2rs(rs, Tab)

if Tab(1,:) == [0 0 0]
    Tab = Tab(2:end,:);
end
Tab = round(Tab);
liczbaProbek = numel(Tab)/3;
liczbaProbek
if liczbaProbek<1
    return;
end
fopen(rs);
fprintf(rs,'%s\t',num2str(liczbaProbek),'async');
pause(0.2)
% fprintf(rs,'\t');
pause(1)
for i=1:liczbaProbek
    for j=1:3
        fprintf(rs,'%s\t',num2str(Tab(i,j)),'async');
%         fprintf(rs,'\t');
        pause(0.2)
        num2str(Tab(i,j))
    end
end
fclose(rs);
end

