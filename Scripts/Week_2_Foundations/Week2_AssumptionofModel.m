%% Week 2 Assignment
%
%
load('data.mat')

sizeData = size(data.x);

figure;
for ii = 1:sizeData(2)
    x = data.x(:,ii);
    y = data.y(:,ii);
    
    subplot(3,3,ii)
    b1 = x\y; % Find the linear regression relation y=?1*x. The \ operator performs a least-squares regression.

    yCalc1 = b1*x;
    scatter(x,y)
    hold on
    plot(x, yCalc1)
    
    %Improve the fit by including a y-intercept ?0 in your model as y=?0+?1x. Calculate ?0by padding x with a column of ones and using the \ operator.
    hold on
    X = [ones(length(x),1) x];
    b = X\y;
    yCalc2 = X*b;
    plot(x,yCalc2,'--')
    
    grid on
    title(sprintf('Var %i',ii));
    xlabel('X Data')
    ylabel('Y Data');
end

legend('Data','Slope','Slope & Intercept','Location','best');
