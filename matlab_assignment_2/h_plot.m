w = linspace(-pi, pi, 5000);

L_values = [ 21, 31, 41];

figure;
figure('Position', [100, 100, 1600, 1200]);
hold on;

for i = 1:length(L_values)
    L = L_values(i);
    
    H = (1/L) * (1 - exp(-1j * w * L)) ./ (1 - exp(-1j * w));
    
    plot(w, abs(H), 'DisplayName', ['L = ' num2str(L)]);
end

title('Frequency Response Magnitude for Different L Values');
xlabel('Angular Frequency (w)');
ylabel('Magnitude');

legend('show');
grid on;

print('high_resolution_plot.png', '-dpng', '-r300');  % 300 dots per inch (dpi)

