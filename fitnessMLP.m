% Obtain the error for each input-output
function fitness = fitnessMLP(mlp, inputs, outputs)
    [m,n] = size(outputs);
    errors = zeros(m,n);
    for i = 1:n
        o = realOutput(mlp, inputs(:,i));
        errors(:,i) = abs(o - outputs(:,i));
    end
    fitness = mean(errors);
end