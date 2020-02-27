clear
clc

lambdaP = @(U) ((1-U)+sqrt((1-U).^2-4.*U))./2;
lambdaM = @(U) ((1-U)-sqrt((1-U).^2-4.*U))./2;

p1 = 3+2*sqrt(2);
p2 = 3-2*sqrt(2);

range1 = -4:0.001:p2;
range2 = p2:0.001:p1;
range3 = p1:0.001:10;
% 
% figure(5)
% clf
% hold on
% plot([-4,10],[0,0],'k','LineWidth',3);
% plot([0,0],[-8,6],'k','LineWidth',3);
% plot(range1,lambdaP(range1),'b','LineWidth',2);
% plot(range1,lambdaM(range1),'b','LineWidth',2);
% plot(range2,0.5-range2/2,'b','LineWidth',2);
% plot(range3,lambdaP(range3),'b','LineWidth',2);
% plot(range3,lambdaM(range3),'b','LineWidth',2);
% 
% scatter([p2,1,p1],[lambdaP(p2),lambdaP(1),lambdaP(p1)]);
% 
figure(5)
hold on
% plot(range2, ((1-range2)+sqrt(-(1-range2).^2+4.*range2))./2);
% plot(range2, ((1-range2)-sqrt(-(1-range2).^2+4.*range2))./2);
plot(range2, imag(lambdaP(range2)));
plot(range2, imag(lambdaM(range2)));
%scatter([p2,1,p1],[lambdaP(p2),lambdaP(1),lambdaP(p1)]);









% 
% U = 1.5;
% p = [.51,.51];
% [t,Y] = ode23(@AH,[0:0.01:1],[p(1);p(2)],[],U);	


% figure(8)
% clf
% 
% mytitle = 'Activator-Inhibitor Concentration Time Series'; 
% xlab = '$t$'; 	
% ylab = 'Concentration'; 

% plot(t,Y(:,1),'r-','LineWidth',1.5);  
% hold on                           
% plot(t,Y(:,2),'b-','LineWidth',1.5);
% 
% 
% grid      
% fontlabs = 'Times New Roman'; 
% xlabel(xlab,'FontSize',14,'FontName',fontlabs,'interpreter','latex');  
% ylabel(ylab,'FontSize',14,'FontName',fontlabs,'interpreter','latex');  
% title(mytitle,'FontSize',16,'FontName','Times New Roman','interpreter','latex'); 
% set(gca,'FontSize',12);         
% 	
% 
% figure(9);
% clf
% 
% mytitle = 'Activator-Inhibitor Phase Portrait';
% xlab = 'Activator'; 
% ylab = 'Inhibitor';
% 
% plot(Y(:,1),Y(:,2),'m-','LineWidth',1.5);  
% hold on                           
% plot(U,U,'o','Markersize',7);
% 
% grid
% fontlabs = 'Times New Roman'; 
% xlabel(xlab,'FontSize',14,'FontName',fontlabs,'interpreter','latex');  
% ylabel(ylab,'FontSize',14,'FontName',fontlabs,'interpreter','latex');  
% title(mytitle,'FontSize',16,'FontName','Times New Roman','interpreter','latex'); 
% set(gca,'FontSize',12);  













% mytitle = 'Activator-Inhibitor Contour';
% xlab = 'Activator'; 
% ylab = 'Inhibitor';
% 
% x = linspace(0,100,151);
% y = linspace(0,100,151);
% [X,Y] = meshgrid(x,y);
% Z = 0.9272*log(X)-0.02756*X+0.4807*log(Y)-0.02482*Y;
% 
% figure(3)
% hold off
% contour(X,Y,Z)
% hold on
% 
% fontlabs = 'Times New Roman';  
% xlabel(xlab,'FontSize',14,'FontName',fontlabs,'interpreter','latex');  
% ylabel(ylab,'FontSize',14,'FontName',fontlabs,'interpreter','latex');  
% title(mytitle,'FontSize',16,'FontName','Times New Roman','interpreter','latex'); 
% set(gca,'FontSize',12);      
% 
% mytitle = 'Activator-Inhibitor Surface';
% 
% figure(4)
% hold off
% surf(X,Y,Z);
% hold on
% shading interp
% colormap(jet)
% view([-10 20])
% 
% fontlabs = 'Times New Roman';  
% xlabel(xlab,'FontSize',14,'FontName',fontlabs,'interpreter','latex');  
% ylabel(ylab,'FontSize',14,'FontName',fontlabs,'interpreter','latex');  
% title(mytitle,'FontSize',16,'FontName','Times New Roman','interpreter','latex'); 
% %xh = get(gca,'XLabel'); % Handle of the x label
% %set(xh, 'Units', 'Normalized')
% %pos = get(xh, 'Position');
% %set(xh, 'Position',pos.*[1,1,1],'Rotation',2)
% yh = get(gca,'YLabel'); % Handle of the y label
% set(yh, 'Units', 'Normalized')
% pos = get(yh, 'Position');
% set(yh, 'Position',pos.*[1,1,1],'Rotation',-55)
% set(gca,'FontSize',12); 