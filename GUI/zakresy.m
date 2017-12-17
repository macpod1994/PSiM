figure(3)
plot(t,y,'r')

hold on
plot(Second2,Volt2)
hold off
ylim([1.2 1.75])
xlim([-0.09 0.12])
xlabel('time[s]')
ylabel('voltage[V]')