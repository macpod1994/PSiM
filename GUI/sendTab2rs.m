function sendTab2rs(rs, Tab)

if Tab(1,:) == [0 0 0]
    Tab = Tab(2:end,:);
end
Tab = round(Tab);
liczbaProbek = numel(Tab)/3;
if liczbaProbek<1
    return;
end
fopen(rs);
fprintf(rs,'%s',num2str(liczbaProbek),'async');
for i=1:liczbaProbek
    for j=1:3
        fprintf(rs,'%s',num2str(Tab(i,j)),'async');
    end
end
fclose(rs);

end

