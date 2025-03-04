% Names: Ahmad Hamzeh, Samir Afsary
% Case Study 1

% Tradtion LV models forecast cyclic oscillation, but do not capture the
% true stability captured in observed wild predator-prey systems. The
% introduction of immigration in predator or prey poulation makes sense, as
% in real-world environments, animals generally move from one population
% to another. As observed in the paper, the consideration of fixed
% immigration regularly exhibits the same asymptotic stability found in
% coexisting populations in the wild.

function dsdt = system(t, sys)
    % hyper parameters
    r = 0.1;
    a = 0.1;
    b = 0.3;
    m = 0.2;
    c = 0.01;
    d = 0;

    % system
    dsdt = [r * sys(1) - a * sys(1) * sys(2) + c 
            % dx = rx - axy + c
            b * sys(1) * sys(2) - m * sys(2) + d];
            % dy = bxy - my + d
end

tspan = [0 1500];
initial = [5 5];
[t, s1] = ode45(@system, tspan, initial);

figure(1);
subplot(1, 2, 1)
plot(t, s1, 'LineWidth', 2);
xlim([-100 1500]); 
xticks(0:200:1500);
ylim([-1 15]);
yticks(0:2:14);

subplot(1, 2, 2);
plot(s1(:, 1), s1(:, 2));

% Constant migration: predictable patterns that can most likely be backed
% by studied behavior of a given species. Possible enterpretations of
% animals moving a herd/flock rather that by chance.
% Random migration: species that exhibit randomly dispersed behaviors. If
% sampling a large area
% It might be benificial to divide by total population in an area...

% 
