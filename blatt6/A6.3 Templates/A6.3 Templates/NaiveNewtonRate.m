% ----------------------------------------------------------
% ----------- Naives Newton-Verfahren mit Raten  -----------
% ----------------------------------------------------------
%
% ------------------------------------------------
%  
%  INPUT: F, x0, tol, maxit
%  OUTPUT: x, steps, res, rate1, rate2
% ------------------------------------------------

function [x, steps, res, rate1, rate2] = NaiveNewtonRate(F,x0,tol,maxit)

% Initialisiere die Iterierte x
x = x0;

% Array zum Speichern der Iterierten 
% the first is xk, the second is xk-1
its = [x; 0; 0; 0];

% Initialisiere Variablen fuer die Raten
rate1 = 0;
rate2 = 0;

% Schleife ueber die Iterationen
for steps = 1:maxit
       
    % Berechne das aktuelle Residuum
    Fx = F(x);
    res = norm(Fx);

    % Checke Abbruchkriterium
    if res < tol
        break;
    end
    
    % Berechne Jacobi-Matrix in der aktuellen Iterierten
    [~,Hx] = F(x); 
    
    % Loese Newton-LGS
    s =  - Hx\Fx;
    
    
    % Update der Iterierten
    x = x + s;
    
    % Speichern der Iterierten 
    xk = x;
    xk_1 = its(1);
    xk_2 = its(2);
    xk_3 = its(3);
    its = [xk;xk_1;xk_2;xk_3];
   

end

% Warnung, falls Abbruchkriterium nicht erreicht. 
if res >=tol
    error('Function NaiveNewtonRef was unable to reach the desired tolerance')
end

% Berechne experimentelle Konvergenzraten
xk = x;
xk_1 = its(1);
xk_2 = its(2);
xk_3 = its(3);
m = [1; 1];
if steps > 3   
    rate1 = log(norm(xk - m)/norm(xk_1-m))/log(norm(xk_1-m)/norm(xk_2-m));
    rate2 = log(norm(xk-xk_1)/norm(xk_1-xk_2)) / log(norm(xk_1-xk_2)/norm(xk_2-xk_3));
elseif steps > 2
    rate1 = log(norm(xk - m)/norm(xk_1-m))/log(norm(xk_1-m)/norm(xk_2-m));
    rate2 = 0;
else
    rate1 = 0;
    rate2 = 0;
end

end