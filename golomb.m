function [golombCode, length]=golomb(m,n)
  %% Variables
  unarycode = string; 
  fixed_lengthCode = string;
  golombCode =string;
  %% Quotient and Remainder Calculation
  quotient = floor(n/m);
  remainder = n - quotient*m;
  bits_counter = 0;
  %% GroupID 
  while quotient>0
    unarycode = unarycode + '1';
    quotient = quotient-1;
    bits_counter=bits_counter+1;
  end
  unarycode = unarycode+'0';
  bits_counter=bits_counter+1;
  %% Fixed-length Code calculation
   % Created a string matrix for all the possible remainders
   % Column 1: Remainder
   % Column 2: Remainder in the respective bits 
   % Column 3: Length
   possible_remainders = strings(m,3);
   
   lower_remainder_bits = floor(log2(m));
   higher_remainder_bits = ceil(log2(m));
   
   for i=1:1:m
       possible_remainders(i,1)=num2str(i-1); % Fill column 1 with the remainder
       % Column 2 is the representation of the remainder
       if i<=((2^higher_remainder_bits)-m) %The first x remainders are represented with lower_remainder_bits
           possible_remainders(i,2)=possible_remainders(i,2) + dec2bin(str2num(possible_remainders(i,1)),lower_remainder_bits);
           possible_remainders(i,3)=lower_remainder_bits;
       elseif i>((2^higher_remainder_bits)-m) %The Remaining m-x remainders are represented with higher_remainder_bits
           value_to_encode = (i-1) + (2^higher_remainder_bits)-m;
           possible_remainders(i,2)=possible_remainders(i,2) + dec2bin(value_to_encode,higher_remainder_bits);
           possible_remainders(i,3)=higher_remainder_bits;
       end
   end
  
   %% Need to figure out a way to check if m is a power of 2: m = 2^K, K = 0,1,2... integer - this step was taking too long for execution with convergence, so hardcoded it.
   if m==2
    % remainder is represented with log2(2) bits; 1 bit
    fixed_lengthCode = fixed_lengthCode + dec2bin(remainder,log2(m));
    bits_counter = bits_counter + log2(m);
  elseif m==3
    % Find r from possible_remainders(:,1) and the corresponding
    % possible_remainders(:,2) is the remainder value
    fixed_lengthCode = fixed_lengthCode + possible_remainders(remainder+1,2);
    bits_counter = bits_counter +str2num(possible_remainders(remainder+1,3));
  elseif m==4
    % remainder is represented with log2(4) bits; 2 bits
    fixed_lengthCode = fixed_lengthCode + dec2bin(remainder,log2(m));
    bits_counter = bits_counter + log2(m);
  elseif m==5
    % Find r from possible_remainders(:,1) and the corresponding
    % possible_remainders(:,2) is the remainder value
    fixed_lengthCode = fixed_lengthCode + possible_remainders(remainder+1,2);
    bits_counter = bits_counter + str2num(possible_remainders(remainder+1,3));
   end
   %% Combine the UnaryCode and Fixed-length code for the given positive integer and m
    golombCode = unarycode + fixed_lengthCode;
    length= bits_counter;
end