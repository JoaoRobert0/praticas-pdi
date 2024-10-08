% Carregando as imagens de entrada
img_rgb = imread('dance.png'); % Imagem em escala de cinza das pessoas
img_depth = imread('dance_depth_2.png'); % Imagem de profundidade

% Definindo níveis de intensidade para fatiamento
nivel_claro = 180 - 250; % Nível para a pessoa mais à frente
nivel_escuro = 100 - 170; % Nível para a pessoa mais atrás

% Criando máscaras com base nos níveis de intensidade
mask_claro = img_depth >= 180 & img_depth <= 250;
mask_escuro = img_depth >= 100 & img_depth <= 170;
% Salvando as imagens resultantes
imwrite(mask_claro, 'mask_pessoa_frente.png');
imwrite(mask_escuro, 'mask_pessoa_atras.png');

% Aplicando as máscaras na imagem em escala de cinza
img_destaque_claro = img_rgb .* uint8(mask_claro);
img_destaque_escuro = img_rgb .* uint8(mask_escuro);

% Salvando as imagens resultantes
imwrite(img_destaque_claro, 'pessoa_frente.png');
imwrite(img_destaque_escuro, 'pessoa_atras.png');

% Criando e salvando o histograma
hist_values = zeros(256, 1);
for i = 1:size(img_depth, 1)
    for j = 1:size(img_depth, 2)
        pixel_value = img_depth(i, j);
        hist_values(pixel_value + 1) = hist_values(pixel_value + 1) + 1;
    end
end

histogram_image = bar(hist_values);
xlabel('Níveis de Intensidade');
ylabel('Frequência');
title('Histograma da Imagem de Profundidade');
saveas(histogram_image, 'histograma.png');
