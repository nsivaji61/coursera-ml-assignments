function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
sigma_test = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
c_test =[0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
index = 1;
results = eye(64,3);

for i=1: size(c_test,2)
 for j = 1:size(sigma_test,2)
   model = svmTrain(X, y, c_test(i), @(x1, x2) gaussianKernel(x1, x2, sigma_test(j))); 
    predictions = svmPredict(model, Xval);
     m = (mean(double(predictions ~= yval)));
     results(index,:)= [c_test(i),sigma_test(j),m];
    index++;
 end 

end

sortedResults = sortrows(results, 3);
C =sortedResults(1,1);
sigma = sortedResults(1,2);




% =========================================================================

end
