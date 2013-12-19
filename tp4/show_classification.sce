function show_classification(X, T)
// Visualise a classification.
//
//   show_classification(X, T)
//
// Inputs:
//   - X: instances (p x 2 vector)
//   - T: instances labels (p x 1 vector), optional
//
// A figure is created and the instances are shown as dots.
// Instances are colored according to their labels.
//
// Valid values for classes are -1 (red) and +1 (blue).
//
// Author: Benoit Frenay (2013) - benoit.frenay@uclouvain.be
// Version: 04-12-13-11:35


//// check arguments
if ~exists('X', 'l')
    error('input X is missing');
end
if size(X, 2) ~= 2
    error('incorrect size for argument X');
end

if ~exists('T', 'l')
    error('input T is missing');
end
if size(T, 2) ~= 1
    error('incorrect size for argument T');
end


//// show classification
figure;

plot(X(T==-1, 1), X(T==-1, 2), 'r.', 'MarkerSize', 5);
plot(X(T==+1, 1), X(T==+1, 2), 'b.', 'MarkerSize', 5);

xlabel('X_1');
ylabel('X_2');
title(msprintf('binary classification (%d samples)', size(X, 1)));
