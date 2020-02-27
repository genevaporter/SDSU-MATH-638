clear
clc

%%% Establish Intervals
density = 1000;
max_a = 0.25;
max_b = 1;
A = linspace(0.0001, max_a, density);
B = linspace(0.0001, max_b, density);

hopfA = zeros(density,1);
hopfB = hopfA;
n = 1;

%%% Solve Hopf Bifurcation Line
for j = 1:density
    b = B(j);
    for i = 1:density
        a = A(i);    
        eval = abs((b-a)-(a+b)^3);
        if eval < 0.001
            hopfA(n) = a;
            hopfB(n) = b;
            n = n+1;
        end
    end
    if j == density
       hopfA(n) = 0;
       hopfB(n) = 1.2;
    end
end

%%% Plot Hopf Bifurcation
figure(4)
clf
grid on
hold on
A = area(hopfB, hopfA);
    A.FaceColor = [249/255,251/255,21/255];
    A.BaseValue = 0.3;
    A.FaceAlpha = .4;
    A.EdgeColor = [.5,.5,.5];
xlabel('\beta ');
ylabel('\alpha');

% %%% Plot Stable Phase Plane Solutions
% figure(2)
% clf
% hold on
% a = 0.2;
% b = 1.2;
% X = linspace(-1,3,20);
% Y = linspace(-1,3,20);
% [x,y] = meshgrid(X,Y);
% du = (a-x+x.^2.*y);
% dv = (b-x.^2.*y);
% normal = sqrt(du.^2+dv.^2);
% quiver(x,y,du./normal,dv./normal);
% startx1 = [-1 -0.5 0 0.5 1 2 3];
% startx2 = .4;
% starty1 = -1.*ones(1,length(startx1));
% starty2 = 3.*ones(1,length(startx1));
% starty3 = 1.3.*ones(1,length(startx2));
% streamline(x,y,du,dv,startx1,starty1);
% streamline(x,y,du,dv,startx1,starty2);
% streamline(x,y,du,dv,startx2,starty3);
% streamline(x,y,du,dv,[-1 -1 -1],[0 1 2]);
% plot(a+b,b/(a+b)^2,'o')
% 
% %%% Plot Unstable Phase Plane Solutions
% figure(3)
% clf
% hold on
% a = 0.05;
% b = .7;
% X = linspace(-1,3,20);
% Y = linspace(-1,3,20);
% [x,y] = meshgrid(X,Y);
% du = (a-x+x.^2.*y);
% dv = (b-x.^2.*y);
% normal = sqrt(du.^2+dv.^2);
% quiver(x,y,du./normal,dv./normal);
% startx1 = [-1 -0.5 0 0.5 1 2 3];
% startx2 = .4;
% starty1 = -1.*ones(1,length(startx1));
% starty2 = 3.*ones(1,length(startx1));
% starty3 = 1.3.*ones(1,length(startx2));
% streamline(x,y,du,dv,startx1,starty1);
% streamline(x,y,du,dv,startx1,starty2);
% streamline(x,y,du,dv,startx2,starty3);
% streamline(x,y,du,dv,[-1 -1 -1],[0 1 2]);
% plot(a+b,b/(a+b)^2,'o')


