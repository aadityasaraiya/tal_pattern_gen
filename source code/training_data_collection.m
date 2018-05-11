% clear all;
% clc;

U_train=[];
V_train=[];
% X_train=[];
% Y_train=[];

%Z= 388.351; 
 n=50;

for i=1:n
% Collect the X and Y values 

x= input('Enter the X value');
y= input('Enter the Y value');

%Concatenate and create a matrix 
X_train= vertcat(X_train,x);
Y_train= vertcat(Y_train,y);
fprintf('This is the %d th image \n',i);
end 

save X_train2.mat X_train;
save Y_train2.mat Y_train;

pause;

disp('Wait for manipulator to shift');

%Create webcam object 
cam= webcam('Logitech');

%Start video preview 
preview(cam)

%Pause till enter 
pause;

%Take snapshot using the camera 
img = snapshot(cam);
figure,imshow(img);

% Collect the U and V values 
for i=1:n
%Take u and v values as input
disp('Enter the u value');
disp('Enter the v value');

[u, v]= ginput(1); 

%Concatenate and create a matrix 
U_train= vertcat(U_train,u);
V_train= vertcat(V_train,v);
disp('Finished image number');
disp(i);

end 

% Save the image coordinates training data 
save U_train2.mat U_train;
save V_train2.mat V_train;




