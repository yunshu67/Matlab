% -----------------------------------------------
% ------- Himmelblau-Gradienten-Funktion  -------
% -----------------------------------------------
%
% ------------------------------------------------
%  
%  INPUT: x
%  OUTPUT: Gradient gfx an x, Hesse-Matrix Hfx (falls gefordert)
% ------------------------------------------------

function [gfx, Hfx] = HimmelblauGrad(x)


% Koordinaten von x
x1 = x(1);
x2 = x(2);

% Gradient gfx 
gfx = [4*x1*(x1*x1+x2-11);2*(x1*x1+x2-11)+4*x2*(x1+x2*x2-7)]; 

% falls nargout = geforderte Anzahl der Ausgabewerte = 2
if (nargout>1)
   
   % Hesse-Matrix Hfx 
   Hfx = [4*(3*x1*x1+x2-11)+2,      4*(x1+x2);
          4*(x1+x2),                2+4*(x1+3*x2*x2-7)];
end

end