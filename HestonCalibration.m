load('Options2011.mat');
indx = find(dateO==min(dateO)&PC==1); % indices of first Wednesday and puts

K = K(indx);
S = S(indx);
T = T(indx);
r = r(indx);
q = q(indx);
PC = PC(indx);
MarketPrice = Price(indx);
MarketIV = blsimpv(S, K, r, T, MarketPrice, [], q, [], (PC==1))*100;

t = zeros(size(T));
tic
startparameters = [0.2^2 2 -0.6 0.25^2 1  ];
options = optimoptions('lsqnonlin', 'Display', 'iter');
xopt = lsqnonlin(@(x) Heston1993KahlJaeckelLordRev3(PC, S,K,T,t,r,q,x(1),x(2),x(3),x(4),x(5)) - MarketPrice,...
    startparameters, ... %start values
    ... % v0,theta,rho,kappa,sigma
    [eps eps -1+eps eps eps  ], ... % lower bound for parameter vector
    [Inf Inf 1-eps Inf  Inf  ], ...  % upper bound for parameter vector
    options);
toc



disp(['Optimal parameter vector: ' num2str(xopt)]);
ModelPrices =  Heston1993KahlJaeckelLordRev3(PC, S,K,T,t,r,q,xopt(1),xopt(2),xopt(3),xopt(4),xopt(5))
ModelIV = blsimpv(S, K, r, T, ModelPrices, [], q, [], (PC==1))*100;
disp(['RMSE: ' num2str(sqrt(mean((ModelPrices-MarketPrice).^2)))]);
figure;
DifferentT = sort(unique(T));
for i=1:numel(DifferentT)
   subplot(ceil(numel(unique(T))/2),2,i);
   indx = (T==DifferentT(i));
   plot(K(indx)./S(indx), MarketIV(indx), 'Marker', 'o', 'LineStyle', 'no');
   title([num2str(round(DifferentT(i)*365)) ' days to maturity']);
   hold on; plot(K(indx)./S(indx), ModelIV(indx), 'Marker', 'x', 'LineStyle', 'no', 'Color', 'r');
   legend({'Market', 'Model'});
   xlabel('Moneyness K/S'); ylabel('implied volatility');
end


