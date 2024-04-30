% Define the function
f = @(x) x - 2*sin(x);

% Initial interval [a, b]
a = 1;
b = 2;

% Set tolerance
tolerance = 0.001; % 0.1%

% Check if f(a) and f(b) have opposite signs
if f(a) * f(b) >= 0
    error('The false position method cannot be applied because f(a) and f(b) do not have opposite signs.');
end

% Iterative false position method
while (b - a) >= tolerance
    % Calculate new approximation
    x_new = (a * f(b) - b * f(a)) / (f(b) - f(a));

    % Check the sign of f(x_new)
    if f(x_new) * f(a) < 0
        b = x_new;
    else
        a = x_new;
    end
end

% Return the final approximation
root = (a + b) / 2;
disp(['Approximate root: ', num2str(root)]);
