M_values = [21, 31, 41];
N = imread('Apples.bmp');
G = N(:,:,2);
G = mat2gray(G, [0 255]);

% Define the values of b
b_values = [0.4, 0.9];

for b = b_values
    noise = (rand(size(G)) - 0.5) * b;
    G_with_noise = G + noise;

    for M = M_values

        filteredArray = zeros(size(G));
        [rows, cols] = size(G);

        for i = 1:rows
            for j = 1:cols
                row = G_with_noise(i,:);
                neighborhood = row(max(1, j - floor((M - 1) / 2)):min(cols, j + floor((M + 1) / 2)-1));

                filteredArray(i, j) =  min(max(sum(neighborhood) / M, 0), 1);
            end
        end


        figure;

        subplot(1, 2, 1);
        imshow(G_with_noise);
        title(['Noisy Image M = ' num2str(M) ', b = ' num2str(b)]);

        subplot(1, 2, 2);
        imshow(filteredArray);
        title(['Filtered Image M = ' num2str(M) ', b = ' num2str(b)]);
        saveas(gcf, ['figure_M_' num2str(M) '_b_' num2str(b) '.png']);
    end
end
