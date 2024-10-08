clearvars;
close all;

% Criar uma imagem degradê
im = uint8(zeros(256, 256));

% zeros() cria uma matriz de zeros com o tamanho especificado
% uint8() converte a matriz para o tipo uint8 (unsigned integer 8 bits)

for i = 1:256
    for j = 1:256
        im(i, j) = i - 1;
    end
end

% Exibir a imagem degradê
figure('name', 'gradiente'); % cria uma nova janela para exibir a imagem
subplot(1, 2, 1);
imshow(im); % exibe a imagem
title('Imagem Degradê'); % adiciona um título à imagem

imwrite(im, 'gradiente.png'); % salva a imagem em um arquivo


% Criar uma moldura com bordas de largura 16 e espaço de 8 pixels da borda
largura = 16;
margem = 8;

% Adicionar borda à imagem
for i = 1:256
    for j = 1:256
        if i >= margem && i <= margem + largura
            im(i, j) = 127;
        elseif i >= 256 - margem - largura && i <= 256 - margem
            im(i, j) = 127;
        elseif j >= margem && j <= margem + largura
            im(i, j) = 127;
        elseif j >= 256 - margem - largura && j <= 256 - margem
            im(i, j) = 127;
        end
    end
end

% Exibir a imagem com moldura
%figure('name', 'moldura');
subplot(1, 2, 2);
imshow(im);
title('Imagem com Moldura');

imwrite(im, 'gradiente_emoldurado.png');