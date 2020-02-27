clear
clc

%%% Establish Intervals
matrix_size = 1000;
delta_plots = 3;
max_a = .31;
max_b = 1.2;
max_d = 3.5;
alpha_range = linspace(0, max_a, matrix_size)';
beta_range = linspace(0, max_b, matrix_size)';
delta_range = linspace(1.1,max_d,delta_plots)';

%%% Constraint 1: (b-a) < (a+b)^3
alpha_1_values = zeros(matrix_size,1);
beta_1_values = zeros(matrix_size,1);
n = 1;
for j = 1:matrix_size
    b = beta_range(j);
    for i = 1:matrix_size
        a = alpha_range(i);    
        eval = abs((b-a)-(a+b)^3);
        if eval < 0.001
            alpha_1_values(n) = a;
            beta_1_values(n) = b;
            n = n+1;
        end
    end
    if i == matrix_size && j == matrix_size
        alpha_1_values(n) = 0;
        beta_1_values(n) = 1.2;
    end
end

%%% Constraint 2: d(b-a) > (a+b)^3

delta_2_values = zeros(1,2,delta_plots);
for k = 1:delta_plots
    n = 1;
    d = delta_range(k);
    for j = 1:matrix_size
        b = beta_range(j);
        for i = 1:matrix_size
            a = alpha_range(i);    
            eval = abs(d*(b-a)-(a+b)^3);
            if eval < 0.0001
                delta_2_values(n,:,k) = [b,a];
                n = n+1;
            end
        end
    end
    delta_2_values(n,:,k) = [1.2,0];
end



plot_border2 = 0.3.*ones(length(delta_2_values(:,1,1)),1);

%%% Plot and Layer Regions

figure(1)
%clf
C = [0.7 0.8 0.9];
T = 0.4;

for k = 1:delta_plots
    hold on    
    subplot(1,3,k)
    hold on
    grid on
    box on
    axis([0,1.2,0,0.3]);
    xlabel('\beta');
    ylabel('\alpha');
    title(['\delta = ' num2str( delta_range(k) )]);


   
    constraint_2 = area(delta_2_values(:,1,k), delta_2_values(:,2,k));
    constraint_2.FaceColor = [50/255,124/255,252/255];
    constraint_2.BaseValue = 0;
    constraint_2.FaceAlpha = T;
    constraint_2.EdgeColor = [.5,.5,.5];
    
    constraint_1 = area(beta_1_values,alpha_1_values);
    constraint_1.FaceColor = 'w';
    constraint_1.BaseValue = 0;
    constraint_1.FaceAlpha = 1;
    constraint_1.EdgeColor = [.5,.5,.5];
end














