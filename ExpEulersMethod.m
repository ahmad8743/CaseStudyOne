% Names: Ahmad Hamzeh, Samir Afsary
% Case Study 1

% Exponential function Euler's Method (for easier scalability)
function x = ExpEulersMethod(h, k, tspan, x0)
    t = tspan(1):h:tspan(2);
    x = zeros(size(t));
    x(1) = x0;

    for i = 1 : numel(x) - 1
        x(i + 1) = x(i) + h * k * x(i);
    end
end