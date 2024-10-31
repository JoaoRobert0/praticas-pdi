import cv2 as cv
import numpy as np

im = cv.imread('lena.png')

im_gray_scale = cv.cvtColor(im, cv.COLOR_BGR2GRAY)

im_clara = im_gray_scale.copy()
for i in range(im_clara.shape[0]): # linha
    for j in range(im_clara.shape[1]): # coluna
        produto = im_clara[i, j] * 1.8

        if (produto > 255):
            produto = 255
        elif (produto < 0):
            produto = 0

        im_clara[i, j] = produto
cv.imwrite("lena_clara.png", im_clara)

im_escura = im_gray_scale.copy()
for i in range(im_escura.shape[0]): # linha
    for j in range(im_escura.shape[1]): # coluna
        produto = im_escura[i, j] * 0.2

        if (produto > 255):
            produto = 255
        elif (produto < 0):
            produto = 0

        im_escura[i, j] = produto
cv.imwrite("lena_escura.png", im_escura)