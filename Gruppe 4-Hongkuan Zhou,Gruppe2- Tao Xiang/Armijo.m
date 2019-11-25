% ------------------------------------------------
% ---------- Armijo Schrittweitensuche  ----------
% ------------------------------------------------
%
% ------------------------------------------------
%  
%  INPUT: f,fx,gfx,x,s,beta,gamma,maxit
%  OUTPUT: Schrittweite sigma
% ------------------------------------------------

function [sigma] = Armijo(f,fx,gfx,x,s,beta,gamma,maxit)

% skalierte Richtungsableitung in Richtung s


% Startwert fuer sigma
sigma = 1.0;

% Schleife ueber die Armijo Schritte
for it = 1:maxit
    
    % Funktionswert an dem Kandidaten fuer die neue Iterierte
    value = f(x+sigma*s)-fx;
    
    % falls Armijo-Bedingung erfuellt
    if value <= sigma*gamma*gfx'*s
        
        break;
    % falls Armijo-Bedingung nicht erfuellt
    else
        sigma = sigma * beta;
    end
end

% Warnung falls maxit erreicht und kein Abstieg erzielt
if it >= maxit
    warning('Function Armijo was unable to find admissable step size');
end

end