clear all;
clc;

cam= webcam('Logitech');

%Start video preview 
preview(cam)
pause;
img = snapshot(cam);
figure,imshow(img);

%Save the required picture
imwrite(img, 'training_points_image.jpg');