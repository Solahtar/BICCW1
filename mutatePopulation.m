function mutPop = mutatePopulation(pop)
    n = size(pop, 2);
    mutPop = pop;
    for i = 1:n
        if randi(5) == 1
            mutPop{1, i} = mutateChromosome(pop{1, n});
        end
    end
end

function mutChrom = mutateChromosome(chromosome)
    mutChrom = chromosome;
    n = size(mutChrom, 2);
    for j = 1:n
        if randi(2) == 1
            mutChrom = mutation1(j, mutChrom);
        else
            mutChrom = mutation3(j, mutChrom);
        end
        if randi(5) == 1
            mutChrom = mutation2(j, mutChrom);
        end
    end
end

% We invert the weights of two neurons in a layer
function mutChrom = mutation1(nLayer, chrom)
    layer = chrom{1, nLayer};
    nbLines = size(layer, 1);
    k1 = randi(nbLines);
    k2 = randi(nbLines);
    tmp = layer(k1,:);
    layer(k1,:) = layer(k2,:);
    layer(k2,:) = tmp;
    mutChrom = chrom;
    mutChrom{1, nLayer} = layer;
end

function mutChrom = mutation2(nLay, chrom)
    layer = chrom{1, nLay};
    [n,m] = size(layer);
    layer = rand(n,m) * 2 - 1;
    mutChrom = chrom;
    mutChrom{1, nLay} = layer;
end

function mutChrom = mutation3(nLayer, chrom)
    layer = chrom{1, nLayer};
    nbCol = size(layer, 2);
    k1 = randi(nbCol);
    k2 = randi(nbCol);
    tmp = layer(:, k1);
    layer(:, k1) = layer(:, k2);
    layer(:, k2) = tmp;
    mutChrom = chrom;
    mutChrom{1, nLayer} = layer;
end