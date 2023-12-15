M_values = [21, 31, 41];
N = imread('Apples.bmp');
G = N(:,:,2);
G = mat2gray(G, [0 255]);

for M=M_values
    
    filteredArray = zeros(size(G));
    [rows, cols] = size(G);
    
    
    for i = 1:rows
        for j = 1:rows
            row = G(i,:);
            neighborhood = row(max(1, j - floor((M - 1) / 2)):min(cols, j + floor((M + 1) / 2)-1));
            
            filteredArray(i, j) =  min(max(sum(neighborhood) / M, 0), 1);
        end
    end
    colormap(gray);
    figure;
    
    
    imshow(filteredArray);
    title(['Filtered Image M = ' num2str(M)]);
end
