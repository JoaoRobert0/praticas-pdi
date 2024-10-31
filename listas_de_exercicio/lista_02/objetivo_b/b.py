import cv2 as cv
import numpy as np

def ajustar_intensidade_grayscale(imagem: np.ndarray, fator: float) -> np.ndarray:
    """Ajustar a intensidade de uma imagem 'gray scale'"""

    # Transformando para gray scalse
    imagem_final = cv.cvtColor(imagem, cv.COLOR_BGR2GRAY)

    for i in range(imagem_final.shape[0]): # linha
        for j in range(imagem_final.shape[1]): # coluna
            produto = imagem_final[i, j] * fator

            if (produto > 255):
                produto = 255
            elif (produto < 0):
                produto = 0

            imagem_final[i, j] = produto
    
    return imagem_final

im = cv.imread('imagens/lena.png')

im_clara = ajustar_intensidade_grayscale(im, 1.8)
cv.imwrite('resultados/lena_clara.png', im_clara)

im_escura = ajustar_intensidade_grayscale(im, 0.2)
cv.imwrite('resultados/lena_escura.png', im_escura)


# imagem_final = np.clip(imagem_final * fator, 0, 255).astype(np.uint8)