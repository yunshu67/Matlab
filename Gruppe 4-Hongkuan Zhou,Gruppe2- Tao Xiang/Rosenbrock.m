% ------------------------------------------------
% ------------- Rosenbrock-Funktion  -------------
% ------------------------------------------------
%
% ------------------------------------------------
%  
%  INPUT: x
%  OUTPUT: Funktionswert fx an x, Gradient gfx an x (falls gefordert)
% ------------------------------------------------

function [fx, gfx] = Rosenbrock(x)

% Koordinaten von x
x1 = x(1);
x2 = x(2);

% Funktionswert fx
fx = 100*(x2-x1^2)^2+(1-x1)^2;

% falls nargout = geforderte Anzahl der Ausgabewerte = 2
if (nargout>1)
   
   % Gradient gfx 
   gfx = [-400*x1*(x2-x1^2) - 2*(1-x1); 200*(x2-x1^2)]; 
    
end

end