% Create MLP
function mlp = createMLP(LayLen, inputLen)
    m = size(LayLen, 2);
    mlp = cell(1, m);
    mlp{1,1} = rand(LayLen(1,1), inputLen) * 2 - 1;
    if m > 2
        for i=2:m
            mlp{1,i} = rand(LayLen(1,i),LayLen(1,i-1))*2 - 1;
        end
    end
end