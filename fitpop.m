% Calculate fitness for each individual
function [indfits, fitmean] = fitpop(inputs, outputs, pop)
    n = size(pop, 2);
    indfits = zeros(1, n);
    for i = 1:n
        indfits(1, i) = fitnessMLP(pop{1,i}, inputs, outputs);
    end
    fitmean = mean(indfits);
end