
% Leia a imagem "moon.png" e armazene na variável "im"
im = imread('moon.png');



% Limiarização usando um valor fixo
limiar_fixo = 128;
im_limiar_fixo = im > limiar_fixo;


% Negativo na imagem original
im_negativo = 255 - im;

% Máscara para a região da lua
mascara_lua = im > 50 & im < 150;

% Transformação de potência na região da lua
gamma = 1.3;
im_potencia_lua = im_negativo;
im_potencia_fundo = im_negativo;
for i = 1 : size(im,1)
    for j = 1 : size(im,2)
        if mascara_lua(i, j)
            im_potencia_lua(i,j) = uint8(double(im_negativo(i,j)) .^ gamma);
        else
            im_potencia_fundo(i,j) =  uint8(double(im_negativo(i,j)) .^ gamma);
        end
    end
end

% Salvar os resultados em arquivos de imagem
imwrite(im_limiar_fixo, 'limiar_fixo.png');
imwrite(im_negativo, 'negativo.png');
imwrite(im_potencia_lua, 'potencia_lua.png');
imwrite(im_potencia_fundo, 'potencia_fundo.png');
