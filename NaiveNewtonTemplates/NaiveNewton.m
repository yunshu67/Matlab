% ------------------------------------------------
% ----------- Naives Newton-Verfahren  -----------
% ------------------------------------------------
%
% ------------------------------------------------
%  
%  INPUT:  F,x0,tol,maxit
%  OUTPUT: x, steps, res
% ------------------------------------------------

function [x, steps, res] = NaiveNewton(F,x0,tol,maxit)

xk = x0;
for k = 1:maxit
  [fxk,gfxk] = F(xk);

  
  if(norm(fxk)<tol)
      %output info
      fprintf('iterierte: (%f,%f), Residuum: %f\n',xk(1),xk(2),norm(fxk))
      break
  end
 
  % else xk += -gfxk_inv * F(x)
  %output info
  fprintf('iterierte: (%f,%f), Residuum: %f\n',xk(1),xk(2),norm(fxk))
  
  
  xk = xk - gfxk\ fxk;
  
  
end

x = xk;
steps = k;
res = abs(F(xk));
end