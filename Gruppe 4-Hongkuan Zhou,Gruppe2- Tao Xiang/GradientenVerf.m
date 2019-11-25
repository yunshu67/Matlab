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
% Differenz Parameter
Epsilon = 1e-9;
rx = [Epsilon,0];
ry = [0,Epsilon];
% Armijo Parameter
Armijo_beta = 0.5;
Armijo_gamma = 1e-4;
Armijo_maxit = 20;

% Initialisiere die Iterierte x
x = x0;

% Plotten der Niveaumengen
xs = -4:0.1:4;
ys = -4:0.1:4;
[X,Y] = meshgrid(xs,ys);
Z = zeros(size(X,1),size(X,2));
for i = 1:size(X,1)
    for j = 1:size(X,2)
        Z(i,j)=f([X(i,j),Y(i,j)]);
    end
end
contour(X,Y,Z,100);
hold on;
plot(x(1),x(2),'*');
% Schleife ueber die Iterationen
for steps = 1 : maxit
   
    % Berechne aktuellen Funktionswert und Gradienten
    [fx,gfx] = f(x);
    % Checke Abbruchkriterium
    if (gfx(1)^2 + gfx(2)^2<tol)
        break;
    end
    
    % Definiere Suchrichtung
    s = -gfx;
    
    % Bestimme Schrittweite mit Armijo-Backtracking
    [sig] = Armijo(f,fx,gfx,x,s,Armijo_beta,Armijo_gamma,Armijo_maxit);
    
    % Update der Iterierten
    x = x + sig*s;
        
    % Plotten der Iterierten
    plot(x(1),x(2),'*');
end

% Warnung, falls Abbruchkriterium nicht erreicht. 
if (norm(gfx,2)>=tol)
    warning('Function GradientenVerf was unable to reach the desired tolerance')
end

% Definition des Rueckgabewertes fx
fx = f(x);
hold off;
end