% Names: Ahmad Hamzeh, Samir Afsary
% Case Study 1
% Part 1

%% Recreating Figure 1 - Exploring Dynamics without Immigration
clear; clc;
tspan = [0 1500]; % Sim time interval
initial = [5 5]; % Initial Pop: [Pred, Prey]

% --- Case 1: With Prey Immigration ---
 % Using two different prey immigration models:
 % test1: constant prey immigration (C(x) = c, D(y) = 0)
 % test2: inverse prey immigration (C(x) = c/x, D(y) = 0)
test1 = @(t, x) system(t, x, 0.1, 0.1, 0.3, 0.2, 0.01, 0);
[t1, s1] = ode45(test1, tspan, initial);
test2 = @(t, x) system_x(t, x, 0.1, 0.1, 0.3, 0.2, 0.01, 0);
[t2, s2] = ode45(test2, tspan, initial);

figure(1);
sgtitle('With Prey Immigrants', 'FontSize', 11, 'FontWeight', 'bold');
annotation('textbox', [0.42, 0.905, 1, 0.05], 'String', ...
    'C(x) = c, D(y) = 0', 'FontSize', 8, 'EdgeColor', 'none');
annotation('textbox', [0.42, 0.48, 1, 0.05], 'String', ...
    'C(x) = c/x, D(y) = 0', 'FontSize', 8, 'EdgeColor', 'none');
subplot(2, 2, 1)
plot(t1, s1, 'LineWidth', 2);
xlim([-100 1500]); 
xticks(0:200:1500);
ylim([-1 15]);
yticks(0:2:14);
axis square;

subplot(2, 2, 2);
plot(s1(:, 1), s1(:, 2), 'Color', '#2E8B57');
xlim([-0.2 5.1]);
xticks(0:1:5);
ylim([-0.5 16]);
yticks(0:2:14);
axis square;

subplot(2, 2, 3)
plot(t2, s2, 'LineWidth', 2);
xlim([-100 1500]); 
xticks(0:200:1500);
ylim([-1 15]);
yticks(0:2:14);
axis square;

subplot(2, 2, 4);
plot(s2(:, 1), s2(:, 2), 'Color', '#2E8B57');
xlim([-0.1 5.1]);
xticks(0:1:5);
ylim([0 16]);
yticks(0:2:14);
axis square;

exportgraphics(gcf, 'Part1Plots/fig1.png');

% --- Case 2: With Predator Immigration ---
 % test3: constant predator immigration (D(y) = d)
 % test4: inverse predator immigration (D(y) = d/y)
test3 = @(t, x) system(t, x, 0.1, 0.1, 0.3, 0.2, 0, 0.01);
[t3, s3] = ode45(test3, tspan, initial);
test4 = @(t, x) system_x(t, x, 0.1, 0.1, 0.3, 0.2, 0, 0.01);
[t4, s4] = ode45(test4, tspan, initial);

figure(2);
sgtitle('With Predator Immigrants', 'FontSize', 11, 'FontWeight', 'bold');
annotation('textbox', [0.42, 0.905, 1, 0.05], 'String', ...
    'C(x) = 0, D(y) = d', 'FontSize', 8, 'EdgeColor', 'none');
annotation('textbox', [0.42, 0.48, 1, 0.05], 'String', ...
    'C(x) = 0, D(y) = d/y', 'FontSize', 8, 'EdgeColor', 'none');
subplot(2, 2, 1)
plot(t3, s3, 'LineWidth', 2);
xlim([-100 1500]); 
xticks(0:200:1500);
ylim([-1 15]);
yticks(0:2:14);
axis square;

subplot(2, 2, 2);
plot(s3(:, 1), s3(:, 2), 'Color', '#2E8B57');
xlim([-0.2 5.1]);
xticks(0:1:5);
ylim([-0.5 16]);
yticks(0:2:14);
axis square;

subplot(2, 2, 3)
plot(t4, s4, 'LineWidth', 2);
xlim([-100 1500]); 
xticks(0:200:1500);
ylim([-1 15]);
yticks(0:2:14);
axis square;

subplot(2, 2, 4);
plot(s4(:, 1), s4(:, 2), 'Color', '#2E8B57');
xlim([-0.2 5.1]);
xticks(0:1:5);
ylim([-0.2 16]);
yticks(0:2:14);
axis square;

exportgraphics(gcf, 'Part1Plots/fig2.png');

% --- Case 3: No Immigration ---
 % Baseline system dynamics with no immigration (c = d = 0)
test5 = @(t, x) system(t, x, 0.1, 0.1, 0.3, 0.2, 0, 0);
[t5, s5] = ode45(test5, tspan, initial);

figure(3);
sgtitle('Without Immigrants', 'FontSize', 11, 'FontWeight', 'bold');
annotation('textbox', [0.42, 0.905, 1, 0.05], 'String', ...
    'C(x) = 0, D(y) = 0', 'FontSize', 8, 'EdgeColor', 'none');
subplot(1, 2, 1)
plot(t5, s5, 'LineWidth', 2);
xlim([-100 1500]); 
xticks(0:200:1500);
ylim([-1 15]);
yticks(0:2:14);
axis square;

subplot(1, 2, 2);
plot(s5(:, 1), s5(:, 2), 'Color', '#2E8B57');
xlim([-0.2 6.1]);
xticks(0:1:6);
ylim([-0.5 16]);
yticks(0:2:14);
axis square;

exportgraphics(gcf, 'Part1Plots/fig3.png');


%% --- Control Strategy ---
clear; clc;
tspan = [0 1500];
initial1 = [2 2];
initial2 = [1.5 1.5];

% --- Predator Control Strategies ---
% Trying different combinations of immigration (c: prey, d: predator)
strat1 = @(t, x) system(t, x, 0.1, 0.1, 0.3, 0.2, 0.01, 0.01);
[t6, s6] = ode45(strat1, tspan, initial1);
strat2 = @(t, x) system(t, x, 0.1, 0.1, 0.3, 0.2, 0.01, 0.07);
[t7, s7] = ode45(strat2, tspan, initial1);
strat3 = @(t, x) system(t, x, 0.1, 0.1, 0.3, 0.2, 0.07, 0.01);
[t8, s8] = ode45(strat3, tspan, initial1);
strat4 = @(t, x) system(t, x, 0.1, 0.1, 0.3, 0.2, 0.07, 0.07);
[t9, s9] = ode45(strat4, tspan, initial1);


figure(4);
subplot(2, 2, 1);
plot(s6(:, 1), s6(:, 2), 'Color', '#2E8B57');
xlim([-0.2 2.1]);
xticks(0:0.5:2);
ylim([-0.5 5.1]);
yticks(0:1:5);
xlabel('Prey');
ylabel('Predator');
axis square;
title('Control: c = 0.01, d = 0.01');

subplot(2, 2, 2);
plot(s7(:, 1), s7(:, 2), 'Color', '#2E8B57');
xlim([-0.2 2.1]);
xticks(0:0.5:2);
ylim([-0.5 5.1]);
yticks(0:1:5);
xlabel('Prey');
ylabel('Predator');
axis square;
title('Increasing Predator Immigration: c = 0.01, d = 0.07');

subplot(2, 2, 3);
plot(s8(:, 1), s8(:, 2), 'Color', '#2E8B57');
xlim([-0.2 2.1]);
xticks(0:0.5:2);
ylim([-0.5 5.1]);
yticks(0:1:5);
xlabel('Prey');
ylabel('Predator');
axis square;
title('Increasing Prey Immigration: c = 0.07, d = 0.01');


subplot(2, 2, 4);
plot(s9(:, 1), s9(:, 2), 'Color', '#2E8B57');
xlim([-0.2 2.1]);
xticks(0:0.5:2);
ylim([-0.5 5.1]);
yticks(0:1:5);
xlabel('Prey');
ylabel('Predator');
axis square;
title('Increasing Both: c = 0.07, d = 0.07');
exportgraphics(gcf, 'Part1Plots/Controls1.png');


% --- Prey Control Strategies ---
% Exploring different predator/prey immigration levels to manage population
strat5 = @(t, x) system(t, x, 0.1, 0.1, 0.3, 0.2, 0.04, 0.04);
[t10, s10] = ode45(strat5, tspan, initial2);
strat6 = @(t, x) system(t, x, 0.1, 0.1, 0.3, 0.2, 0.04, 0.1);
[t11, s11] = ode45(strat6, tspan, initial2);
strat7 = @(t, x) system(t, x, 0.1, 0.1, 0.3, 0.2, 0.07, 0.01);
[t12, s12] = ode45(strat7, tspan, initial2);
strat8 = @(t, x) system(t, x, 0.1, 0.1, 0.3, 0.2, 0.07, 0);
[t13, s13] = ode45(strat8, tspan, initial2);


figure(5);
subplot(2, 2, 1);
plot(s10(:, 1), s10(:, 2), 'Color', '#2E8B57');
xlim([0 1.5]);
xticks(0:0.5:1.5);
ylim([1 4]);
yticks(1:1:4);
xlabel('Prey');
ylabel('Predator');
axis square;
title('Control: c = 0.04, d = 0.04');

subplot(2, 2, 2);
plot(s11(:, 1), s11(:, 2), 'Color', '#2E8B57');
xlim([0 1.5]);
xticks(0:0.5:1.5);
ylim([1 4]);
yticks(1:1:4);
xlabel('Prey');
ylabel('Predator');
axis square;
title('Increased Predator Immigration: c = 0.04, d = 0.08');

subplot(2, 2, 3);
plot(s12(:, 1), s12(:, 2), 'Color', '#2E8B57');
xlim([0 1.5]);
xticks(0:0.5:1.5);
ylim([1 4]);
yticks(1:1:4);
xlabel('Prey');
ylabel('Predator');
axis square;
title('Small Predator Immigration: c = 0.07, d = 0.01');


subplot(2, 2, 4);
plot(s13(:, 1), s13(:, 2), 'Color', '#2E8B57');
xlim([0 1.5]);
xticks(0:0.5:1.5);
ylim([1 4]);
yticks(1:1:4);
xlabel('Prey');
ylabel('Predator');
axis square;
title('No Predator Immigration: c = 0.07, d = 0');
exportgraphics(gcf, 'Part1Plots/Controls2.png');