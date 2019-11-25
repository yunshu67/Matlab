% ------------------------------------------------
% ------------- Himmelblau-Funktion  -------------
% ------------------------------------------------
%
% ------------------------------------------------
%  
%  INPUT: x
%  OUTPUT: Funktionswert fx an x, Gradient gfx an x (falls gefordert)
% ------------------------------------------------

function [fx, gfx] = Himmelblau(x)

% Koordinaten von x
x1 = x(1);
x2 = x(2);

% Funktionswert fx  
fx = (x1^2+x2-11)^2 + (x1+x2^2-7)^2;

% falls nargout = geforderte Anzahl der Ausgabewerte = 2
if (nargout>1)
   
   % Gradient gfx 
   gfx = [ 2*(x1^2+x2-11)*2*x1 + 2*(x1+x2^2-7); 2*(x1^2+x2-11) + 2*(x1+x2^2-7)*2*x2]; 
    
end
end