% Names: Ahmad Hamzeh, Samir Afsary
% Case Study 1

% similar to other but handles cases where C(x) = c/x and D(x) = d/x
function dsdt = system_x(t, sys, r, a, b, m, c, d)
    % system
    dsdt = [r * sys(1) - a * sys(1) * sys(2) + c / sys(1); 
            % dx = rx - axy + c
            b * sys(1) * sys(2) - m * sys(2) + d / sys(2)];
            % dy = bxy - my + d
end