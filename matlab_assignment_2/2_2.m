M_values = [21, 31, 41];
N = imread('Apples.bmp');
G = im2gray(G);

    
    filteredArray = zeros(size(G));
    [rows, cols] = size(G);
    
    
    for i = 1:rows
        for j = 1:rows
            row = G(i,:);
            
            prevVal = 0;

            if j ~= 1
                prevVal = row(j-1);
            end
            filteredArray(i, j) =min(max(row(j)-prevVal, 0), 1);  
        end
    end
    figure;
    filteredArray = imcomplement(filteredArray);
    imshow(filteredArray);
    title(['Differenced Image']);

