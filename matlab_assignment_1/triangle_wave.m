x = @(t) (t >= 0 & t < 2) .* t - ((t >= 2 & t < 4) .* (-4 + t));
figure;
plot(t_period, x(mod(t_period,4)), 'b-', 'LineWidth', 2);
title('Original Signal');
xlabel('Time');
ylabel('Amplitude');
ylim([0, 2]);

for kmax = 2:2:12
    k_values = 1:kmax;
    
    t_period = linspace(-8, 8, 400);
    
    x_reconstructed_piecewise = zeros(size(t_period));
    a0 = integral(@(t) x(t), 0, 4) / 4;
    x_reconstructed_piecewise = x_reconstructed_piecewise + a0;
    for idx = 1:length(k_values)
        k = k_values(idx);
    
        an_integral = @(t) x(t).*cos(2*pi*k*t/4);
        bn_integral = @(t) x(t).*sin(2*pi*k*t/4);
    
        an = integral(an_integral, 0, 4) / 2;
        bn = integral(bn_integral, 0, 4) / 2;
    
        x_reconstructed_piecewise = x_reconstructed_piecewise + (an*cos(2*pi*k*t_period/4) + bn*sin(2*pi*k*t_period/4)) * 2/pi;
    end
    
    figure;
    plot(t_period, real(x_reconstructed_piecewise), 'r--', 'LineWidth', 2);
    title(['Reconstructed Signal (k = ', num2str(kmax), ')']);
    xlabel('Time');
    ylabel('Amplitude');
    ylim([0, 2]);
end