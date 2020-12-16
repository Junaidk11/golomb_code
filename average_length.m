function [length]=average_length(probability, codelength)
    length = 0;
    for i=1:1:20
        length = length + probability(i)*str2num(codelength(i));
    end
end