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
% ?? used in Armijo unequation at line 27
scaled_direction_derivative_in_s = gamma * gfx.' * s;

% Startwert fuer sigma
sigma = 1.0;

% Schleife ueber die Armijo Schritte
for it = 1:3
    
    % Funktionswert an dem Kandidaten fuer die neue Iterierte
    fnext = f(x + sigma * s);
    
    % falls Armijo-Bedingung erfuellt
    if fnext <= (fx + sigma * scaled_direction_derivative_in_s)
        break;
    % falls Armijo-Bedingung nicht erfuellt: updating sigma
    else
        sigma *= beta;
    end
end

% Warnung falls maxit erreicht und kein Abstieg erzielt
if f(x + sigma*s) > (fx + sigma * scaled_direction_derivative_in_s)
    warning('Function Armijo was unable to find admissable step size')
end

end

