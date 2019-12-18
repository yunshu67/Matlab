% --------------------------------------------------
% -------- Beispiel Vektorfeld fuer Newton  --------
% --------------------------------------------------
%
% ------------------------------------------------
%  
%  INPUT: x
%  OUTPUT: Wert Fx an x, Jacobi-Matrix gFx an x (falls gefordert)
% ------------------------------------------------

function [Fx, gFx] = ExampleF(x)

x1 = x(1);
x2 = x(2);

% Fx 
Fx = (1/sqrt(x1*x1+x2*x2+1)) * [x1 ;x2 ];

%gFx
temp = x1*x1 + x2*x2 + 1;
sqrt_temp = sqrt(temp);

gFx = (1/temp) * [sqrt_temp - (x1*x1/sqrt_temp),        -(x1*x2/sqrt_temp);
                  -(x1*x2)/(sqrt_temp),                 sqrt_temp - (x2*x2/sqrt_temp)];


end