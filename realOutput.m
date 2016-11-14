% What is the real output
function o = realOutput(mlp, input)
    m = size(mlp, 2);
    bias = 0.55;
    o = input;
    for i=1:m-1
        o = tansig(mlp{1,i} * o) + bias;
    end
    o = tansig(mlp{1,m} * o)*2.5;
end