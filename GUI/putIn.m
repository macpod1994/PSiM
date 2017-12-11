function newTab = putIn(Tab)

if Tab(1,:) == [0 0 0]
    Tab = Tab(2:end,:);
end
[x,y] = ginput(2);
newSample = [x(1) y(1) y(2)];
newTab = [Tab; newSample];
end

