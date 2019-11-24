%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test Script fuer das Gradientenverfahren %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

format long;
clear all;
close all;

% function-handle zur Zielfunktion
%f = @Himmelblau;
 f = @Rosenbrock;

% Startpunkt
%  x0 = [-0.26;0];
 x0 = [-0.27;0];
% x0 = [-0.28;0];
% x0 = [-1.2;1.0];

% Toleranz des Abbruchkriteriums
tol = 10^-5; 
% tol = 10^-4; 
% tol = 10^-3; 
% tol = 10^-2; 
% tol = 10^-1; 

% Maximale Anzahl der Gradienten-Schritte
maxit = 1000;

% Ausfuehren des Gradientenverfahrens
% [x, fx, steps] = GradientenVerf(f,x0,tol,maxit)
[x, fx, steps] = GradientenVerf(f,x0,tol,maxit)


     