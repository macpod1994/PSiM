function newTab = putIn(Tab)

[x,y] = ginput(2);
newSample = [x(1) y(1) y(2)];
newTab = [Tab; newSample];
end

