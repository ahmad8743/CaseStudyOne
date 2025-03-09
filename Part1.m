% Names: Ahmad Hamzeh, Samir Afsary
% Case Study 1

% Tradtion LV models forecast cyclic oscillation, but do not capture the
% true stability captured in observed wild predator-prey systems. The
% introduction of immigration in predator or prey poulation makes sense, as
% in real-world environments, animals generally move from one population
% to another. As observed in the paper, the consideration of fixed
% immigration regularly exhibits the same asymptotic stability found in
% coexisting populations in the wild.

% this function makes is easy to pass in hyperparamters
function dsdt = system(t, sys, r, a, b, m, c, d)
    % system
    dsdt = [r * sys(1) - a * sys(1) * sys(2) + c 
            % dx = rx - axy + c
            b * sys(1) * sys(2) - m * sys(2) + d];
            % dy = bxy - my + d
end

% similar to above but handles cases where C(x) = c/x and D(x) = d/x
function dsdt = system_x(t, sys, r, a, b, m, c, d)
    % system
    dsdt = [r * sys(1) - a * sys(1) * sys(2) + c / sys(1); 
            % dx = rx - axy + c
            b * sys(1) * sys(2) - m * sys(2) + d / sys(2)];
            % dy = bxy - my + d
end

tspan = [0 1500];
initial = [5 5];
test1 = @(t, x) system(t, x, 0.1, 0.1, 0.3, 0.2, 0.01, 0);
[t1, s1] = ode45(test1, tspan, initial);
test2 = @(t, x) system_x(t, x, 0.1, 0.1, 0.3, 0.2, 0.01, 0);
[t2, s2] = ode45(test2, tspan, initial);


figure(1);
subplot(1, 2, 1)
plot(t1, s1, 'LineWidth', 2);
xlim([-100 1500]); 
xticks(0:200:1500);
ylim([-1 15]);
yticks(0:2:14);

subplot(1, 2, 2);
plot(s1(:, 1), s1(:, 2));
exportgraphics(gca, 'fig1.png');

figure(2);
subplot(1, 2, 1)
plot(t2, s2, 'LineWidth', 2);
xlim([-100 1500]); 
xticks(0:200:1500);
ylim([-1 15]);
yticks(0:2:14);

subplot(1, 2, 2);
plot(s2(:, 1), s2(:, 2));

% rest of plots are easy...


% Constant migration: predictable patterns that can most likely be backed
% by studied behavior of a given species. Possible enterpretations of
% animals moving a herd/flock rather that by chance.
% Random migration: species that exhibit randomly dispersed behaviors. If
% sampling a large area
% It might be benificial to divide by total population in an area...

% 
