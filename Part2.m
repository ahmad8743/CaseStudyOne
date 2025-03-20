% Name: Ahmad Hamzeh
% Case Study 1
% Part 2

clear; clc;
tspan = [0 10];
x0 = 1;

x1 = ExpEulersMethod(0.1, -1, tspan, x0);
x2 = ExpEulersMethod(1, -2, tspan, x0);
x3 = ExpEulersMethod(2, -10, tspan, x0);
x4 = ExpEulersMethod(0.5, -5, tspan, x0);
x5 = ExpEulersMethod(5, 1, tspan, x0);


figure(1);
plot(x1);
title('h = 0.1, k = -1');
axis square;
exportgraphics(gcf, 'Part2Plots/Plot1.png', 'Resolution', 300);

figure(2);
plot(x2);
title('h = 1, k = -2');
axis square;
exportgraphics(gcf, 'Part2Plots/Plot2.png', 'Resolution', 300);

figure(3);
plot(x3);
title('h = 2, k = -10');
axis square;
exportgraphics(gcf, 'Part2Plots/Plot3.png', 'Resolution', 300);

figure(4);
plot(x4);
title('h = 0.5, k = -5');
axis square;
exportgraphics(gcf, 'Part2Plots/Plot4.png', 'Resolution', 300);

figure(5);
plot(x5);
title('h = 5, k = 1');
axis square;
exportgraphics(gcf, 'Part2Plots/Plot5.png', 'Resolution', 300);