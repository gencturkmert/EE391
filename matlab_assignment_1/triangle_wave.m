x = @(t) (t >= 0 & t < 2) .* t - ((t >= 2 & t < 4) .* (-4 + t));
% Plot original signal
figure;
t = linspace(-8, 8, 400);
T0 = 4;
plot(t, x(mod(t_period,T0)), 'b-', 'LineWidth', 2);
title('Original Signal');
xlabel('Time');
ylabel('Amplitude');
ylim([0, 2]);

for kmax = 22:2:12
    k_values = 1:kmax;
    
    
    x_reconstructed = zeros(size(t));
    a0 = integral(@(t) x(t), 0, T0) / T0;
    x_reconstructed = x_reconstructed + a0;
    for idx = 1:length(k_values)
        k = k_values(idx);
    
        an = integral(@(t) x(t) .* exp(-1i * 2*t* pi * k / T0),0,T0) / T0;
        bn = integral(@(t) x(t) .* exp(-1i * 2*t* pi * -k / T0),0,T0) / T0;
        x_reconstructed = x_reconstructed + an * exp(1i * 2* pi*t * k / T0) + bn * exp(1i * 2* pi*t * -k / T0);
    end
    
    % Plot reconstructed signal in a new figure for each iteration
    figure;
    plot(t, real(x_reconstructed), 'r--', 'LineWidth', 2);
    title(['Reconstructed Signal (k = ', num2str(kmax), ')']);
    xlabel('Time');
    ylabel('Amplitude');
    ylim([-1, 3]);
end
