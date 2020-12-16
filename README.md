# Golomb Code

Matlab code to study the efficiency of Golomb code for geometric distribution with

![image](https://user-images.githubusercontent.com/33042545/102414158-e1c97a80-3faa-11eb-8e3f-2f7a60cd97f4.png)


To simplify the problem, I assumed X can only take the integer values of [0, 1, 2, …, 19], based on the formula above, and normalized their total probability to one.

Let ρ be 0.7, 0.8, and 0.9, respectively. In each case, calculated the entropy of the normalized and truncated geometric distribution as above. In addition, found the average codeword length if we encode the truncated X using Golomb code with parameter m=2, m=3, m=4, and exponential Golomb code, respectively. 

We can find the codeword length of each value of X based on the definition of various Golomb codes from online resources, and hard-code the length in the Matlab file - (I didn't do it that way, I wrote a function to get the Golomb code). For example, the codeword length for X=1 is 3 if exponential Golomb code is used. 

Note: Used the standard codeword length for the last group, and ignored the fact that we can actually design slightly more efficient codewords for the truncated range of [0, …, 19].


Probability for each integer and ⍴ for a geometric distribution: 

![image](https://user-images.githubusercontent.com/33042545/102414840-0a05a900-3fac-11eb-93f7-f4a75ffffcdb.png)


Entropy is an indication of the minimumm number of bits needed to losslessly represented any of the integers in the Sample source. Entropy for each probability distribution tabulated above is given below: 

![image](https://user-images.githubusercontent.com/33042545/102415238-af208180-3fac-11eb-8ab0-2edbfa9484b2.png)

Golomb Codes for m=2, m=3, m=4 and exponential golomb coding for the non-negative integers:

![image](https://user-images.githubusercontent.com/33042545/102415852-c0b65900-3fad-11eb-95a9-00dfcb0762db.png)

The Average codeword length for each type of Golomb coding shown above: 

![image](https://user-images.githubusercontent.com/33042545/102416022-ff4c1380-3fad-11eb-9ae9-4a9d0b7e743a.png)

Results

Based on the entropy table above, the minimum number of bits needed to represent the source [0,1,2,…,19] with ρ =0.7 is 2.93 [bits/sample]. According to the table above for the average codeword length, Golomb codeword with m=2 is the best for ρ =0.7 because it is the closest coding scheme to the minimum bits needed to represent the source losslessly.

Similarly, based on the entropy table above, the minimum number of bits needed to represent the source [0,1,2,…,19] with ρ =0.8 is 3.49 [bits/sample]. According to the table above for the average codeword length, Golomb codeword with m=4 is the best for ρ =0.8 because it is the closest coding scheme to the minimum bits needed to represent the source losslessly.

Similarly, based on the entropy table above, the minimum number of bits needed to represent the source [0,1,2,..,19] with ρ =0.9 is 3.75 [bits/sample]. According to the table above for the average codeword length, Golomb codeword with m=2 is the best for ρ =0.9 because it is the closest coding scheme to the minimum bits needed to represent the source losslessly.

