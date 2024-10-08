% Leia a imagem "fractal.png" e armazene na variável "im"
im = imread('fractal.png');

% Inicialize uma matriz para armazenar as imagens decompostas bit a bit
decomposed_images = zeros(size(im, 1), size(im, 2), 8, 'uint8');

% Realize a decomposição da imagem bit a bit
for i = 1:8
    bit_plane = bitget(im, i);
    decomposed_images(:,:,i) = bit_plane * 255; % Escala de 0-1 para 0-255
end

% Crie a imagem "imSaida" usando os planos de bits 7 e 8
bit_7 = decomposed_images(:,:,7);
bit_8 = decomposed_images(:,:,8);
imSaida = uint8(bit_8);
imSaida(bit_7 > 255) = 127;
% Calcule a diferença entre a imagem original e a imagem "imSaida"
imDif = im - imSaida;


% Imagens decompostas bit a bit
for i = 1:8
    imwrite(decomposed_images(:,:,i),  ['fractal_' num2str(i) '_bit.png']);
end

imwrite(imSaida, 'fractal_imSaida.png');

imwrite(imDif, 'fractal_imDif.png');