function [ C0 ] = bsmec( S,K,T,t,r,q,sigma, C )
    % returns Black-Scholes-Merton Price for vanilla european options
    %
    % S: underlying spot price
    % K: strike price
    % T: date at end of maturity
    % t: start date (T-t is time to maturity)
    % r: interest rate
    % q: dividend rate
    % sigma: volatility of returns of underlying
    % C: is 1 for call and 2 for put options
    %   
    %
    %  Author: Jonathan Frei, 2016
    %
    
    S=S(:);
    K=K(:);
    T=T(:);
    t=t(:);
    r=r(:);
    q=q(:);
    sigma=sigma(:);
    C=C(:);
    
    d1=(log(S./K)+((r-q)+0.5*sigma.^2).*(T-t) ) ./ ...
        (sigma.*sqrt(T-t));
    d2=d1-sigma.*sqrt(T-t);
    for(i=1:numel(C))
        if(C(i)==1)
            C0(i)=S(i)*normcdf(d1(i))-K(i)*exp(-(r(i)-q(i))*(T(i)-t(i)))*normcdf(d2(i));
        elseif(C(i)==2)
            C0(i)=normcdf(-d2(i))*K(i)*exp(-(r(i)-q(i))*(T(i)-t(i)))-normcdf(-d1(i))*S(i);
        else
           error('invalid option type. must be 1 for call or 2 for put'); 
        end
    end
end

