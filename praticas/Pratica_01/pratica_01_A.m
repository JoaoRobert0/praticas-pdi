% Prática 1 – Laboratório de PDI

% Objetivo A

% Passo 1: Abrir a Imagem "círculo.jpg"
m1 = imread('circulo.png');

% Passo 2: Exibir a Matriz "m1" em uma Janela
figure('name', 'Imagem m1');
imshow(m1);

% Passo 3: Mostrar a Matriz "m1" no Console
disp('Matriz m1:');
disp(m1);

% Passo 4: Pintar o Círculo de Cinza Médio
for i=1:size(m1,1)
    for j=1:size(m1,2)
        if m1(i,j) > 127
            m2(i,j) = 127;
        end
    end
end

% Passo 5: Gravar a Matriz "m2" no Disco
imwrite(m2, 'circulo2.png');

% Objetivo B, C e Desafio Opcional: (continuação)
% ... (continuação conforme a descrição anterior)

figure('name', 'asa');
subplot(1, 2, 1);
imshow(m1);
title("Imagem original")

subplot(1, 2, 2);
imshow(m2);
title("Imagem cinza")
