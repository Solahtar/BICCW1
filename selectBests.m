% Select the nbSelected best chromosome of the population with a tournament
% method.
function [bests, bestsN, notBest] = selectBests(pop, indfits, nbSelected, nbDrawsTournament)
    bests = cell(1, nbSelected);
    n = size(pop, 2);
    bestChrom = -1;
    alreadyChosen = false(1,n);
    bestsN = zeros(1, nbSelected);
    for i = 1:nbSelected
        for j = 1:nbDrawsTournament
            newChromN = randi(n);
            while (alreadyChosen(1,newChromN))
                newChromN = randi(n);
            end
            if bestChrom==-1 || indfits(1, newChromN) < indfits(1, bestChrom)
                bestChrom = newChromN;
            end
        end
        bests(1,i) = pop(1, bestChrom);
        bestsN(1,i) = bestChrom;
        alreadyChosen(1,bestChrom) = true;
        bestChrom = - 1;
    end
    notBest = cell(1, n - nbSelected);
    k = 1;
    for i = 1:n
        if ~alreadyChosen(1,i)
            notBest{1,k} = pop{1:i};
            k = k + 1; 
        end
    end
end