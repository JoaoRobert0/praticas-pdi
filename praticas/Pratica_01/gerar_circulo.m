% Geração da Imagem "círculo.jpg"

% Passo 1: Criar uma imagem 20x20
tam = 20;
fundoPreto = zeros(tam, tam, 'uint8'); % Matriz preta

% Passo 2: Desenhar um círculo branco
centro = [10, 10]; % Coordenadas do centro do círculo
raio = 6; % Raio do círculo
for i = 1:tam
    for j = 1:tam
        distancia = sqrt((i - centro(1))^2 + (j - centro(2))^2);
        if distancia <= raio
            fundoPreto(i, j) = 255; % Definir valor branco para o pixel dentro do círculo
        end
    end
end

% Passo 3: Salvar a Imagem "círculo.jpg"
imwrite(fundoPreto, 'circulo.png');
