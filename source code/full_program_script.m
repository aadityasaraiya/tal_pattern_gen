%% Collect your input and training data 
 training_data_collection;
 
%% Train your network

clear all;
clc;

[net] = neural_net_train();
close all; 


%% Collect and pre-process testing data 

[test_uv]= detect_red_curves();
%close all;
test_uv= test_uv'; 

%% Pass testing data to neural network

y_test=sim(net,test_uv);


save y_test.mat y_test ;
y_test= y_test' ;
x= y_test(:,1);
y= y_test(:, 2); 
figure, scatter(x,y)
figure, plot(x,y)

% f=fit(x,y,'poly2')
% figure, plot(f,x,y)
P= [435 295];
[Xout,Yout]=points2contour(x,y,P,'ccw')
figure, plot(Xout,Yout)


%p = polyfit(y_test(:,1),y_test(:, 2),3)

%error = ((output_test-y_test)./y_test)*100


%% Pass X, Y values from neural net to TAL Interface and actuate 


 