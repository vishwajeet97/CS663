%% MyMainScript

tic;
%% Yale Dataset reconstruction of face and plot of eigenfaces
[train_X, train_Y, test_X, test_Y] = myDataset('yale'); 
[train_mean, V] = myEigenFace(train_X, 'svd');
ks = [2,10,20,50,75,100,125,150,175];
train_X = bsxfun(@minus, train_X, train_mean);
[N, M] = size(V);
myReconstruction(train_mean, V, train_X, test_X(:, 420), ks);
figure;
myPlotEigenFaces(train_mean, V);
toc;
