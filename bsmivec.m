function [ sigmas, dates ] = bsmivec( C0, S,K,T,t,r, q, C )
    % returns the implied volatility of the BSM model
    %  with a root finding algorithm
    %
    % params:
    % C0: option price
    % S: underlying spot price
    % K: strike price
    % T: maturity date
    % t: date of spot price
    % r: vector of interest rates
    % q: vector of dividend rates
    % C: is 1 for call and 2 for put options
    %
    %  Author: Jonathan Frei, 2016
    %
    
    
    if (nargout > 1)
       dates = t;
    end
    % turning all into column vectors
    C0 = C0(:);
    S = S(:);
    K = K(:);
    T = T(:);
    t = t(:);
    C = C(:);
    r = r(:);
    q = q(:);
    
    fun = @(x, C0i, Sti, Ki, Ti, ti, ri, qi, Ci) C0i-bsmec( Sti,Ki,Ti,ti,ri,qi,x, Ci );
    if (size(K,1) ~= size(T,1) || size(K,1) ~= size(C0,1)  || size(K,1) ~= size(t,1) || size(K,1) ~= size(S,1) || size(C,1) ~= size(S,1) )
       disp ('K, T, t, C0 must have same dimensions');
       return; 
    end
    sigmas = zeros(size(K,1),1);
    for (i=1:size(K,1))
        % approximation by Brenner and Subrahmanyam (1988) 
        sigmastar = sqrt(2*pi/T(i,1))*(C0(i,1)/S(i,1));
        sigmas(i) = max(fzero( @(x)fun(x,C0(i,1),S(i,1),K(i,1),T(i,1),t(i,1), r(i,1), q(i,1), C(i,1)), sigmastar),0);
    end
end

