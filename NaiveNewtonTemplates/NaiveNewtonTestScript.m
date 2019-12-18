%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test Script fuer das naive Newton-Verfahren %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

% function-handle zu F
% F = @ExampleF;
%F = @RosenbrockGrad;
 F = @HimmelblauGrad;

% Startpunkt
 x0 = [0.999;0];
 %x0 = [1;0];
% x0 = [1.001;0];

%x0 = [-1.2;1.0];

% x0 = [-133/78; -119/78];  
% x0 = [-119/78; -119/78];  
% x0 = [-35/26; -119/78]; 
% x0 = [-7/6; -119/78];  

% Toleranz des Abbruchkriteriums
tol = 10^-8; 

% Maximale Anzahl der Newton-Schritte
maxit = 20;

% Ausfuehren des naiven Newton-Verfahrens
 [x, steps, res] = NaiveNewton(F,x0,tol,maxit);
%[x, steps, res] = NaiveNewtonRef(F,x0,tol,maxit);
