% ------------------------------------------------
% ------------- Gradientenverfahren  -------------
% ------------------------------------------------
%
% ------------------------------------------------
%  
%  INPUT: f,x0,tol,maxit
%  OUTPUT: x, fx, steps
% ------------------------------------------------

function [x, fx, steps] = GradientenVerf(f,x0,tol,maxit)

% Armijo Parameter
Armijo_beta = 0.055;
Armijo_gamma = 1e-4;
Armijo_maxit = 20;

% Initialisiere die Iterierte x
x = x0;

% n-dimensional
nDim = length (x0);

% Plotten der Niveaumengen
...

% Schleife ueber die Iterationen
for steps = 1 : maxit
   
    % Berechne aktuellen Funktionswert und Gradienten
        % 1): function value
        fx = f(x);

        % 2): gradient
        % 2.1): initialising the gradient vector as empty array,
        gfx = [];

        % 2.2): then append each partial derivative to it, ($(nDim) partial derivatives)
        for t = 1 : nDim
            % the partial der:= (f(x1,...,xt+delta,...,xn) - f(x1,...,xt,...,xn)) / delta 
            % where delta is a very small number
            delta = 0.001;

            % x1,...,xt+delta,...,xn
            tmpX = x;
            tmpX(t,1) += delta;

            % the partial derivative
            pd = (f(tmpX)-fx) / delta;
            

            % append it to gfx
            gfx = cat(1,gfx,[pd]);
        end
    
    % Checke Abbruchkriterium
    if (norm (gfx,2) < tol)
        break;
    end
    
    % Definiere Suchrichtung
    %!!! normalising !!!
    s = -gfx / (norm(gfx,2));
    
    
    % Bestimme Schrittweite mit Armijo-Backtracking
    % function [sigma] = Armijo(f,fx,gfx,x,s,beta,gamma,maxit)
    sig = Armijo(f,f(x),gfx,x,s,Armijo_beta,Armijo_gamma,Armijo_maxit);
    
    % Update der Iterierten
    x += sig * s; 
    % Plotten der Iterierten
    plot(x(1,1),x(2,1),'*')
end

% Warnung, falls Abbruchkriterium nicht erreicht. 
if (norm(gfx,2)>=tol)
    warning('Function GradientenVerf was unable to reach the desired tolerance')
end

% Definition des Rueckgabewertes fx
fx = f (x);
the_final_gradient =  norm(gfx,2)
end