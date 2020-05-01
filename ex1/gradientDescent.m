function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    
    h_minus_y = [];
    for i = 1: m,
      h_minus_y = [h_minus_y; ((X(i, :) * theta) - y(i, 1))];
    endfor
    
    np1 = length(theta);
    temp = zeros(np1, 1);
    for i = 1: np1,
      temp(i, 1) = X(:, i)' * h_minus_y;
    endfor
    
    temp = temp * (alpha / m);
    theta = theta - temp;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end