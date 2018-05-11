function [test_uv] = detect_red_curves()
% %Create webcam object 
cam= webcam('Logitech');

%Start video preview 
preview(cam)

%Pause till enter 
pause;

%Take snapshot using the camera 
img = snapshot(cam);
figure,imshow(img);

% %Take image input (For Simulation purposes)
% img= imread('line_red.jpg');

% [img] = imcrop(img);
%Convert image to HSV
hsvI= rgb2hsv(img);
% Hue is the color space
hueI = hsvI(:,:,1);
%Applying median filter
Kmedian = medfilt2(hueI);

% % Value in grayscale
% satI = hsvI(:,:,2);
% 
% % Brightness 
% valI = hsvI(:,:,3);

figure,imshow(img),title('Original Image');
figure, imshow(hsvI),title('HSV Image');
figure, imshow(hueI), title('Hue Image');
figure, imshow(Kmedian), title('Median Filtered Image');

%Threshold the image as per the Hue channel 
hueI_thresh= hueI.*(hueI> 0.85); 
figure, imshow(hueI_thresh), title('Thresholded Hue image');

%Remove small pixels in connected components 
BW2 = bwareaopen(hueI_thresh,3);
figure, imshow(BW2), title('Removal of small areas');

BW3= BW2; 

% %Connecting all the connected components 
% CC = bwconncomp(BW2)
% figure, imshow(CC), title('Connected Components');

%Create a vertical line shaped structuring element.

%se = strel('line',11,90);
se = strel('disk',3);
%se = strel('square',6);

%se = offsetstrel('ball',5,5);


%Dilate the image with a vertical line structuring element and compare the results.

% BW3 = imdilate(BW2,se);
% figure, imshow(BW3), title('Dilated Image');


%Close preview and cleaning up the camera object 
closePreview(cam)
clear('cam');

test_uv=[];

[rows columns] = find(BW3 == 1);

test_uv= [columns rows];

end



