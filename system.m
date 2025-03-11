% Names: Ahmad Hamzeh, Samir Afsary
% Case Study 1

% this function makes is easy to pass in hyperparamters
function dsdt = system(t, sys, r, a, b, m, c, d)
    % system
    dsdt = [r * sys(1) - a * sys(1) * sys(2) + c 
            % dx = rx - axy + c
            b * sys(1) * sys(2) - m * sys(2) + d];
            % dy = bxy - my + d
end