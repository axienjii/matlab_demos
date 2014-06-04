function initialise_variables
%Written by Xing 29/05/14
%Example of how variables get reset within loops and data may
%unintentionally get carried from one loop to another. 
%If the variable 'result' is not initialised, the number of sessions for
%the second animal becomes longer than it's supposed to be (20 instead of 10).

animalSessions=[20 10];%20 sessions for animal 1, 10 session for animal 2

for animalIndex=1:2
    %Initialise the variable, 'result':
    result=[];
    for i=1:animalSessions(animalIndex)
        result(i)=i;
    end
    %print the results for each animal:
    result
end