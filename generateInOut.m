% Create random Inputs
function [inputs, outputs] = generateInOut(inputLen, inOutSetLen, outputLen)
    inputs = rand(inputLen, inOutSetLen)*2 - 1;
    outputs = zeros(outputLen, inOutSetLen);
    for i = 1:inOutSetLen
        outputs(:,i) = inputs(1,i)^2 + inputs(2,i)^2;
    end
end