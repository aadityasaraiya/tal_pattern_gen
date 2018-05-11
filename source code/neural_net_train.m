function [net] = neural_net_train()

load('U_train2.mat');
load('V_train2.mat');
load('X_train2.mat');
load('Y_train2.mat');

input_data=[U_train V_train];
target_data=[X_train Y_train];

% input_train=input_data(1:2:end, :);
input_train=input_data;

%input_test=input_data(2:2:end, :);

output_train= target_data;
%output_test= target_data(2:2:end, :);

input_train= input_train'; 
output_train= output_train' ;

% input_test= input_test'; 
% output_test= output_test'; 

% net = newff([min(input_train(1,:)) max(input_train(1,:)); min(input_train(2,:)) max(input_train(2,:))],[2 3 2],{'logsig' 'logsig' 'logsig'},'trainscg');

net = newff([min(input_train(1,:)) max(input_train(1,:)); min(input_train(2,:)) max(input_train(2,:))],[2 3 2],{'purelin' 'purelin' 'purelin'},'trainscg');
%net = newff([min(input_train(1,:)) max(input_train(1,:));min(input_train(2,:)) max(input_train(2,:));],[3],{'purelin'},'trainscg');
net.trainParam.epochs = 2000;
net.trainParam.goal=0;
net.trainParam.max_fail=5; 
net.trainParam.mem_reduc=1;
net.trainParam.min_grad=1e-10;
net.trainParam.mu=0.1;
net.trainParam.mu_dec=0.10;
net.trainParam.mu_inc=10; 
net.trainParam.mu_max=1e10;
net.trainParam.show=25;
net.trainParam.time=inf;
[net,tr]=train(net,input_train,output_train);
grid

% [net,tr]=train(net,I1,Out2(1,:));
% [net,tr]=train(net,I1,Out2(2,:));
% [net,tr]=train(net,I1,Out2(3,:));




end

