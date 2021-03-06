function [K] = ku0u0(x, xp, hyp, ubar, ubarp, dt, i)

logsigma = hyp(1);
logtheta = hyp(2);

alpha = hyp(3);

n_x = size(x,1);
n_xp = size(xp,1);

x = repmat(x,1,n_xp);
xp = repmat(xp',n_x,1);

ubar = repmat(ubar,1,n_xp);
ubarp = repmat(ubarp',n_x,1);

switch i


case 0

K=exp(1).^logsigma.*(exp(1).^((-1).*logtheta)).^(1/2).*(exp(1).^logtheta) ...
  .^(1/2).*pi.^(-1/2).*(exp(1).^((-1/2).*exp(1).^((-1).*logtheta).*(x+(-1) ...
  .*xp).^2).*pi.^(1/2)+2.^alpha.*dt.^2.*(exp(1).^logtheta).^((-1).*alpha) ...
  .*gamma((1/2)+alpha).*Hypergeometric1F1((1/2)+alpha,(1/2),(-1/2).*exp(1) ...
  .^((-1).*logtheta).*(x+(-1).*xp).^2)+2.^(1+(1/2).*alpha).*dt.*(exp(1) ...
  .^logtheta).^((-1/2).*alpha).*gamma((1/2).*(1+alpha)).* ...
  Hypergeometric1F1((1/2).*(1+alpha),(1/2),(-1/2).*exp(1).^((-1).* ...
  logtheta).*(x+(-1).*xp).^2));


case 1 % logsigma

K=exp(1).^logsigma.*(exp(1).^((-1).*logtheta)).^(1/2).*(exp(1).^logtheta) ...
  .^(1/2).*pi.^(-1/2).*(exp(1).^((-1/2).*exp(1).^((-1).*logtheta).*(x+(-1) ...
  .*xp).^2).*pi.^(1/2)+2.^alpha.*dt.^2.*(exp(1).^logtheta).^((-1).*alpha) ...
  .*gamma((1/2)+alpha).*Hypergeometric1F1((1/2)+alpha,(1/2),(-1/2).*exp(1) ...
  .^((-1).*logtheta).*(x+(-1).*xp).^2)+2.^(1+(1/2).*alpha).*dt.*(exp(1) ...
  .^logtheta).^((-1/2).*alpha).*gamma((1/2).*(1+alpha)).* ...
  Hypergeometric1F1((1/2).*(1+alpha),(1/2),(-1/2).*exp(1).^((-1).* ...
  logtheta).*(x+(-1).*xp).^2));


case 2 % logtheta

K=exp(1).^logsigma.*(exp(1).^((-1).*logtheta)).^(1/2).*(exp(1).^logtheta) ...
  .^(1/2).*pi.^(-1/2).*((1/2).*exp(1).^((-1).*logtheta+(-1/2).*exp(1).^(( ...
  -1).*logtheta).*(x+(-1).*xp).^2).*pi.^(1/2).*(x+(-1).*xp).^2+(-1).* ...
  2.^alpha.*alpha.*dt.^2.*(exp(1).^logtheta).^((-1).*alpha).*gamma((1/2)+ ...
  alpha).*Hypergeometric1F1((1/2)+alpha,(1/2),(-1/2).*exp(1).^((-1).* ...
  logtheta).*(x+(-1).*xp).^2)+(-1).*2.^((1/2).*alpha).*alpha.*dt.*(exp(1) ...
  .^logtheta).^((-1/2).*alpha).*gamma((1/2).*(1+alpha)).* ...
  Hypergeometric1F1((1/2).*(1+alpha),(1/2),(-1/2).*exp(1).^((-1).* ...
  logtheta).*(x+(-1).*xp).^2)+2.^alpha.*((1/2)+alpha).*dt.^2.*(exp(1) ...
  .^logtheta).^((-1)+(-1).*alpha).*(x+(-1).*xp).^2.*gamma((1/2)+alpha).* ...
  Hypergeometric1F1((3/2)+alpha,(3/2),(-1/2).*exp(1).^((-1).*logtheta).*( ...
  x+(-1).*xp).^2)+2.^((1/2).*alpha).*(1+alpha).*dt.*(exp(1).^logtheta).^(( ...
  -1)+(-1/2).*alpha).*(x+(-1).*xp).^2.*gamma((1/2).*(1+alpha)).* ...
  Hypergeometric1F1((1/2).*(3+alpha),(3/2),(-1/2).*exp(1).^((-1).* ...
  logtheta).*(x+(-1).*xp).^2));


case 3 % alpha

K=2.^((1/2).*alpha).*dt.*exp(1).^logsigma.*(exp(1).^((-1).*logtheta)).^( ...
  1/2).*(exp(1).^logtheta).^((1/2)+(-1).*alpha).*pi.^(-1/2).*(2.^((1/2).* ...
  alpha).*dt.*gamma((1/2)+alpha).*Hypergeometric1F1((1/2)+alpha,(1/2),( ...
  -1/2).*exp(1).^((-1).*logtheta).*(x+(-1).*xp).^2).*log(2)+(exp(1) ...
  .^logtheta).^((1/2).*alpha).*gamma((1/2).*(1+alpha)).*Hypergeometric1F1( ...
  (1/2).*(1+alpha),(1/2),(-1/2).*exp(1).^((-1).*logtheta).*(x+(-1).*xp) ...
  .^2).*log(2)+(-1).*2.^((1/2).*alpha).*dt.*gamma((1/2)+alpha).* ...
  Hypergeometric1F1((1/2)+alpha,(1/2),(-1/2).*exp(1).^((-1).*logtheta).*( ...
  x+(-1).*xp).^2).*log(exp(1).^logtheta)+(-1).*(exp(1).^logtheta).^((1/2) ...
  .*alpha).*gamma((1/2).*(1+alpha)).*Hypergeometric1F1((1/2).*(1+alpha),( ...
  1/2),(-1/2).*exp(1).^((-1).*logtheta).*(x+(-1).*xp).^2).*log(exp(1) ...
  .^logtheta)+2.^((1/2).*alpha).*dt.*gamma((1/2)+alpha).* ...
  Hypergeometric1F1((1/2)+alpha,(1/2),(-1/2).*exp(1).^((-1).*logtheta).*( ...
  x+(-1).*xp).^2).*psi(0,(1/2)+alpha)+(exp(1).^logtheta).^((1/2).* ...
  alpha).*gamma((1/2).*(1+alpha)).*Hypergeometric1F1((1/2).*(1+alpha),( ...
  1/2),(-1/2).*exp(1).^((-1).*logtheta).*(x+(-1).*xp).^2).*psi(0,( ...
  1/2).*(1+alpha))+2.^((1/2).*alpha).*dt.*gamma((1/2)+alpha).*...
  Derivative100Hypergeometric1F1((1/2)+alpha,(1/2),(-1/2).*exp(1).^((-1).* ...
  logtheta).*(x+(-1).*xp).^2)+(exp(1).^logtheta).^((1/2).*alpha).*gamma(( ...
  1/2).*(1+alpha)).*Derivative100Hypergeometric1F1((1/2).*(1+alpha), ...
  (1/2),(-1/2).*exp(1).^((-1).*logtheta).*(x+(-1).*xp).^2));


otherwise
        
        K = zeros(n_x, n_xp);
end

if K == 0

    K = zeros(n_x, n_xp);

end

end
