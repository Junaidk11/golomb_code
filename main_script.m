clear 
clc
%% Defining Inputs
positive_integers=0:1:19;  % n=0, 1,2,...,19
positive_integers = transpose(positive_integers);
ro=0.7:0.1:0.9; % ro=0.7, 0.8, 0.9 
%% Probability Matrix of 20x3 
% column 1: 0.7^n*(1-0.7); n = 0,1,2,...,19
% column 2: 0.8^n*(1-0.8); n = 0,1,2,...,19
% column 3: 0.9^n*(1-0.8); n = 0,1,2,...,19
probability = zeros(20,3);
probability_sum =zeros(1,3);
%% Entropy 
% column 1: Entropy for ro = 0.7 
% column 2: Entropy for ro = 0.8 
% column 3: Entropy for ro = 0.9
entropy = zeros(1,3); 

%% Entropy calculation
temp_ = zeros(20,3);
for column=1:1:3
    for row=1:1:20
        % Probability Calculations for each ro: P(n) = ro^n*(1-ro);
            probability(row,column) = ro(column)^positive_integers(row);
            probability(row,column) = probability(row,column)*(1-ro(column));
        % Entropy Calculation below: sum of ( P(n)*log2(1/P(n)) )
            temp_(row,column)=1/(probability(row,column)); 
            temp_(row,column)=log2(temp_(row,column));
            temp_(row,column)=probability(row,column)*temp_(row,column);
    end
    probability_sum(1,column) = sum(probability(:,column));
    entropy(1,column) = sum(temp_(:,column));  
end

%% Golomb Codes 
golombCodes = strings(20,9);
 
for i=1:1:20
    golombCodes(i,1) = num2str(positive_integers(i));  % Column 1: The non-zero integer
    [golombCodes(i,2),golombCodes(i,3)] = golomb(2,positive_integers(i)); % Column 2: Golomb code for m=2,Column 3: length for m=2 
    [golombCodes(i,4),golombCodes(i,5)] = golomb(5,positive_integers(i)); % Column 4: Golomb code for m=3, Column 5: length for m=3
    [golombCodes(i,6),golombCodes(i,7)] = golomb(4,positive_integers(i)); % Column 6: Golomb code for m=4, Column 7: length for m=4 
    [golombCodes(i,8),golombCodes(i,9)] = exponential_golomb(positive_integers(i)); % Column 8: Exponential Golomb code, Column 9: length of exponential Golomb code
end

%% Avergage Codeword Length [ro,golomb_code] ->
% e.g, : AverageCodeLenght(1,1) = AverageCodelenght(ro=0.7, m=2)
%  Column 1: Average codeword lenght for m=2
%  Column 2: Average codeword lenght for m=3
%  Column 3: Average codeword lenght for m=4
%  Column 4: Average codeword lenght for exponential Golomb Code
%  Row 1: For ro = 0.7
%  Row 2: For ro = 0.8
%  Row 3: For ro = 0.9

averageCodeLength = zeros(3,4);
column_tracker = 3; % columns 3,5,7 and 9 of GoloumbCodes matrix are lengths of the codeword
for w =1:1:3
    for q=1:1:4
        averageCodeLength(w,q) = average_length(probability(:,w), golombCodes(:,column_tracker));
        column_tracker = column_tracker+2;
    end
    column_tracker =3;
end