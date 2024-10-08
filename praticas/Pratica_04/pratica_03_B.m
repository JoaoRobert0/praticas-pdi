clearvars;
close all;

% Ler a imagem "lena.jpg"
im = imread('lena.png');

% Ajustar a intensidade da imagem (clarear/escurecer) em 50 unidades
imClara = im .* 1.8;
imEscura = im .* 0.2;

% Exibir as imagens ajustadas
figure('name', 'Parte 1');
subplot(1, 3, 1);
imshow(im);
title('Imagem Original');

subplot(1, 3, 2);
imshow(imClara);
title('Imagem Clareada');
imwrite(imClara, 'lena_clareada.png');

subplot(1, 3, 3);
imshow(imEscura);
title('Imagem Escurecida');
imwrite(imEscura, 'lena_escurecida.png');