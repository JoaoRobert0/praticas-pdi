clearvars;
close all;

im_background = imread('background_3.jpg');
im_object = imread('object_5.jpg');
im_mask = imread('mask_1.bmp');
im_mask(im_mask > 127) = 1;

im = im_background;
im = im .* (1-im_mask);

im_background = imread('background_5.jpg');
im = (im_background .* (im_mask)) + im;


im_object = imread('object_2.jpg');
im = im + im_object;
im = im + im_object;

figure('name', 'resultado')
imshow(im)