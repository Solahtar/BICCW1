% Create popultation
function population = generatePopulation (popSize, LayLen, inputLen)
    population = cell(1,popSize);
    for i = 1:popSize
        population{1,i} = createMLP(LayLen, inputLen);
    end
end