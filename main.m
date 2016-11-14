clear all;
clc;
close all;

t = cputime;

% Initialize the MLP
inputLayLen = 10;
HidLayLen = [6 5 4 5 6];
outputLayLen = 1;


inputLen = 2; % Size of an input
outputLen = 1; % Size of an output
inOutSetLen = 100; % Number of couples of inputs and outputs

[inputs, outputs] = generateInOut(inputLen, inOutSetLen, outputLen);

LayLen = [inputLayLen, HidLayLen, outputLayLen]; % An array containing the size of every layers in the MLP

popSize = 100; % Number of MLP that will be used for the GA

pop = generatePopulation(popSize, LayLen, inputLen); % Population of MLPs

[indfits, fitmean] = fitpop(inputs, outputs, pop); % Fitness of every chromosome and the mean of every fitness

nbFutureParents = 20; % Number of parents for each generation
nbDrawsTournament = 10; % Number of draws for chosing the parents

nbGenerations = 200;

fit = zeros(1, nbGenerations);

for i = 1:nbGenerations

    [parents, parentsN, notBest] = selectBests(pop, indfits, nbFutureParents, nbDrawsTournament);
    
    children = generateChildren(parents);

    %notBest = notBest(randperm(popSize - nbFutureParents * 1.5));
    
    %mutated = notBest(1:popSize - nbFutureParents * 1.5);
    
    %mutated = mutatePopulation(mutated);
    
    %pop = mutatePopulation([parents, children, mutated]);
    
    pop = mutatePopulation([parents, children]);

    [indfits, ~] = fitpop(inputs, outputs, pop);

    [pop, popN] = selectBests(pop, indfits, popSize, nbDrawsTournament);
    
    [indfits, fitmean] = fitpop(inputs, outputs, pop);

    fit(1,i) = fitmean;
    
    display(i);

end

[~, index] = sort(indfits, 'ascend');

pop = pop(index);
best = pop{1,1};

display(indfits(index(1,1)));

figure;
plot(1:nbGenerations, fit);

[test1, test2] = generateInOut(2,1000,1);
X = test1(1,:);
Y = test1(2,:);
Z = test2;

Z2 = zeros(1, 1000);
for i = 1:1000
    Z2(1,i) = realOutput(best, [X(1,i);Y(1,i)]);
end

figure;
scatter3(X,Y,Z);
hold on;
scatter3(X,Y,Z2);

%%%%%%%%%%%%%%%%%%%%%% MINIMISE THE FUNCTION %%%%%%%%%%%%%%%%%%%%%%

popSize = 100;

[popMinimize, ~] = generateInOut(2,popSize,1); % Our population for the optimization

[indfits, fitmean] = fitnessMinimize(popMinimize, best);

nbGenerations = 1000;

fit = zeros(1, nbGenerations);
bests = zeros(1, nbGenerations);

for i = 1:nbGenerations
    for j = 1:popSize
        mutated = mutateMin(popMinimize(:, j));
        if realOutput(best, mutated) < indfits(1, j)
            popMinimize(:, j) = mutated;
        end
    end
    [indfits, fitmean] = fitnessMinimize(popMinimize, best);
    fit(1, i) = fitmean;
    
    indfits_cpy = indfits;
    [~,index] = sort(indfits_cpy);
    bests(1, i) = indfits(index(1,1));
end

figure;
plot(1:nbGenerations, fit);
hold on;
plot(1:nbGenerations, bests);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

e = cputime-t;

display(e);