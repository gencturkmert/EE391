w = linspace(-pi, pi, 5000);

H = 1 - exp(-1i * w);

figure;
plot(w, abs(H));
title('Magnitude of Frequency Response');
xlabel('Angular Frequency \omega');
ylabel('Magnitude');
grid on;
ylim([0, 2.5]);
xticks([-pi, -pi/2, 0, pi/2, pi]);

print('H_2.png', '-dpng', '-r300');  % 300 dots per inch (dpi)

