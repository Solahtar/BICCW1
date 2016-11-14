% Generate the children of the chosen parents
function children = generateChildren(parents)
    n = size(parents, 2);
    children = cell(1, sum(1:n-1));
    k = 1;
    for i = 1:n-1
       for j = i+1:n 
           if randi(2) == 2 % We can take the parents in any order
               children{1,k} = child(parents{1,i}, parents{1,j});
           else
               children{1,k} = child(parents{1,j}, parents{1,i});
           end
           k = k+1;
       end
    end
end

function son = child(parent1, parent2)
    n = size(parent1, 2);
    cut = randi(n-1);
    son = {parent1{1, 1:cut}, parent2{1, cut+1:n}};
end

function son = child2(parent1, parent2)
    n = size(parent1, 2);
    random = rand(1,n);
    son = parent1;
    for i = 1:n
        if random(1,i) < 0.5
            son{1,i} = parent2{1, i};
        end
    end
end