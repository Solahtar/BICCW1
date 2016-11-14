% Obtain the error for each input-output
function [indfits, fitmean] = fitnessMinimize(population, mlp)
    n = size(population, 2);
    indfits = zeros(1,n);
    for i = 1:n
        indfits(1,i) = realOutput(mlp, population(:,i));
    end
    fitmean = mean(indfits);
end