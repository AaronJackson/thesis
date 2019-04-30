function roc(E, spec, c)

colours = [ 0         0.4470    0.7410
            0.8500    0.3250    0.0980
            0.9290    0.6940    0.1250
            0.4940    0.1840    0.5560
            0.4660    0.6740    0.1880
            0.3010    0.7450    0.9330
            0.6350    0.0780    0.1840];

q = numel(E);
T = 0:0.001:0.1;
Z = [];
for t=T
    Z = [ Z ; sum(E < t) ];
end


plot(T, Z./q, [spec 'k'], 'LineWidth', 1.5, 'Color', colours(c,:))
hold on
axis([min(T) max(T) 0 1])
xlabel('NME normalised by outer interocular distance')
ylabel('% of images')
grid on
set(gca, 'YTick', 0:0.1:1, ...
         'YTickLabel', sprintf('%0d%%\n', 0:10:100))
