x = @(t) -1*(t>=0 & t<1) + 1*(t>=1 & t<2);

figure;
plot(t_period, x(mod(t_period,2)), 'b-', 'LineWidth', 2);
title('Original Signal');
xlabel('Time');
ylabel('Amplitude');
ylim([-1.5, 1.5]);

for kmax = 2:2:12
    k_values = 1:kmax;
    
    t_period = linspace(-4, 4, 400);
    
    x_reconstructed = zeros(size(t_period));
    a0 = integral(@(t) x(t), 0, 2) / 2;
    x_reconstructed = x_reconstructed + a0;
    for idx = 1:length(k_values)
        k = k_values(idx);
    
        an_integral = @(t) x(t).*cos(2*pi*k*t/2);
        bn_integral = @(t) x(t).*sin(2*pi*k*t/2);
    
        an = integral(an_integral, 0, 2) / 2;
        bn = integral(bn_integral, 0, 2) / 2;
    
        x_reconstructed = x_reconstructed + (an*cos(2*pi*k*t_period/2) + bn*sin(2*pi*k*t_period/2)) * 2/pi;
    end
    
    figure;
    plot(t_period, real(x_reconstructed), 'r--', 'LineWidth', 2);
    title(['Reconstructed Signal (k = ', num2str(kmax), ')']);
    xlabel('Time');
    ylabel('Amplitude');
    ylim([-1.5, 1.5]);
end