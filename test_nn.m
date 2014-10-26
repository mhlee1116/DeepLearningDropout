clc
clear
close all
home
addpath util;
%%
load data/gisette

%% 

rand('state',0)

nn.layers = {
    struct('type', 'I') %input layer
    struct('type', 'F') %fully connected layer
    struct('type', 'F') %fully connected layer
    struct('type', 'O') %output layer
};
size(train_x)
size(train_y)
alpha = 1;
batchSize = 50;
numEpochs = 1;
nn = setup_cnn(nn, train_x, train_y);
nn = train_cnn(nn, train_x, train_y, alpha, batchSize, numEpochs);

%% testing

[er, bad] = testerror(nn, test_x, test_y);

fprintf('error = %d\n', er);

