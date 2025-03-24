% Name: Ahmad Hamzeh, Samir Afsary
% Case Study 1 - Part 2: Exploring Explicit Euler’s Method with Varying Parameters

clear; clc;

% Define time interval for simulation
tspan = [0 10];

% Initial condition for all simulations
x0 = 1;

% Run simulations using the custom ExpEulersMethod function
% Each call varies the step size (h) and growth/decay constant (k)

% Simulation 1: Small step size, slow decay
x1 = ExpEulersMethod(0.1, -1, tspan, x0);    

% Simulation 2: Large step size, moderate decay
x2 = ExpEulersMethod(1, -2, tspan, x0);     

% Simulation 3: Very large step size, fast decay
x3 = ExpEulersMethod(2, -10, tspan, x0);    

% Simulation 4: Moderate step size, rapid decay
x4 = ExpEulersMethod(0.5, -5, tspan, x0);   

% Simulation 5: Very large step size, exponential growth
x5 = ExpEulersMethod(5, 1, tspan, x0);      


% Plotting each result in a separate figure
figure(1);
plot(x1);
title('h = 0.1, k = -1');     % Slow decay, small steps
axis square;
exportgraphics(gcf, 'Part2Plots/Plot1.png', 'Resolution', 300);

figure(2);
plot(x2);
title('h = 1, k = -2');       % Moderate decay, large steps
axis square;
exportgraphics(gcf, 'Part2Plots/Plot2.png', 'Resolution', 300);

figure(3);
plot(x3);
title('h = 2, k = -10');      % Fast decay, very large steps
axis square;
exportgraphics(gcf, 'Part2Plots/Plot3.png', 'Resolution', 300);

figure(4);
plot(x4);
title('h = 0.5, k = -5');     % Rapid decay, moderate step size
axis square;
exportgraphics(gcf, 'Part2Plots/Plot4.png', 'Resolution', 300);

figure(5);
plot(x5);
title('h = 5, k = 1');        % Exponential growth, unstable with large steps
axis square;
exportgraphics(gcf, 'Part2Plots/Plot5.png', 'Resolution', 300);
