%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test Script fuer das naive Newton-Verfahren %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

% function-handle zu F
F = @RosenbrockGrad;

% Toleranz des Abbruchkriteriums
tol = 10^-8; 

% Maximale Anzahl der Newton-Schritte
maxit = 20;

% Arrays zum Speichern der Daten
rate1s = [];
rate2s = [];

% Schleife ueber alle Startwerte
for i = 1:10000  
    
    % waehle zufaelligen Startpunkt (mit der Matlab-Funktion rand)
    % in dem gewuenschten Bereich
    x0 = 2 * rand(2,1);

    % Ausfuehren des naiven Newton-Verfahrens
    [x, steps, res, rate1, rate2] = NaiveNewtonRate(F, x0, tol, maxit);
    % [x, steps, res, rate1, rate2] = NaiveNewtonRateRef(F, x0, tol, maxit);
    
    % Speichere Raten, falls nicht degeneriert
    if ((rate1 ~= Inf) & (rate1 ~= -Inf) &(~isnan(rate1)))
        rate1s = [rate1s;rate1];
    end
    if ((rate2 ~= Inf) & (rate2 ~= -Inf) &(~isnan(rate2)))
        rate2s = [rate2s;rate2];
    end
end

% Berechne die durchschnittlichen Konvergenzraten
avg_rate1 = sum(rate1s) / length(rate1s)
avg_rate2 = sum(rate2s) / length(rate2s)




