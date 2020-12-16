function [golombCode, length]=exponential_golomb(n)
%% Variables
  unarycode = string; 
  golombCode =string;
  %% Quotient and Remainder Calculation
  groupID = floor(log2(n+1));
  bits_counter = 0;
  temp_=groupID;
  %% GroupID 
  while temp_>0
    unarycode = unarycode + '1';
    temp_ = temp_-1;
    bits_counter=bits_counter+1;
  end
  unarycode = unarycode+'0';
  bits_counter=bits_counter+1; % count GroupID bits
  
  %% Fixed-length Code
  if n==0
      golombCode = golombCode + unarycode;
  elseif n~=0
      index = n - (bitshift(1,groupID)-1);
      index_binary = dec2bin(index,groupID);
      golombCode = unarycode + index_binary;
  end
  length = bits_counter + groupID; %Added index bits, same as GroupID
  
end
