% Names: Ahmad Hamzeh, Samir Afsary
% Case Study 1

%% Recreating Figure 1
tspan = [0 1500];
initial = [5 5];

% With prey immigrants
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

exportgraphics(gcf, 'fig1.png');

% With predator immigrants
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

exportgraphics(gcf, 'fig2.png');

% Without immigrants
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

exportgraphics(gcf, 'fig3.png');


%% Strategy
