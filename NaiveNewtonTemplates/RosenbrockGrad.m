% -------------------------------------------------
% -------- Rosenbrock-Gradienten-Funktion  --------
% -------------------------------------------------
%
% ------------------------------------------------
%  
%  INPUT: x
%  OUTPUT: Gradient gfx an x, Hesse-Matrix Hfx (falls gefordert)
% ------------------------------------------------

function [gfx, Hfx] = RosenbrockGrad(x)

% Koordinaten von x
x1 = x(1);
x2 = x(2);

% Gradient gfx 
gfx = [-400*x1*(x2-x1^2) - 2*(1-x1); 200*(x2-x1^2)]; 

% falls nargout = geforderte Anzahl der Ausgabewerte = 2
if (nargout>1)
   
   % Hesse-Matrix Hfx 
   Hfx = [-400*(x2-3*x1^2) + 2 ,     -400*x1 ;...
                 -400*x1       ,        200]; 
    
end

end