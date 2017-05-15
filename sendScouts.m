%% *SendScouts: Generation of New Candidate Solutions for "Lost" Solutions*
%
% Solutions that have reached the scouting limit, or have not improved in a
% certain number of generations, are said to be "lost". In order to maintain
% the flow of program and ensure smooth operation of algorithm, we must
% replace lost solutions with new solutions. We generate these new
% solutions using the formula given below. We use the same code as *init*
% to ensure we are not creating "blindspots" in our solution space.
%
% Created on May 12, 2017
% By Parsa Beheshti
%
% From "Memetic Artificial Bee Colony Algorithm for Large-Scale Global
% Optimization" by _Fister et al_.
%
% <runMB.html Back to Main Method>
%%                             Function I/O
% *Input:*
%    
% 
% * *solutionDB*, *objValDB*: data structure to be updated with the new
%      candidate solutions.
% * *upperBound*, *lowerBound*:required to implement functionality of
%      equation,
%
% <<eq1.PNG>>
% 
% * *numScouted*: Index of solutions that will be replaced. 
%
% *Output:*
% 
% * *solutionDB*, *objValDB*: Updated data structures. 
%
%
%%                             Source Code
    
function [solutionDB, objValDB] = sendScouts (solutionDB, objValDB, numScouted, upperBound, lowerBound)
    
%%
% Finds the indices of candidate solutions who have reached or exceeded the
% scouting limit.
    newPoints = find(numScouted);
    
%%
% Creates a list of a random(0,1) with one random for each item in
% _newPoints_.

    randoms = rand(length(newPoints),1);
    
    r = 0;
    
%% 
% Assigns new candidate solutions to the indexes who are listed in
% _newPoints_.

    for i = newPoints
        r = r + 1;
        solutionDB(i).params = ((upperBound-lowerBound) * randoms(r)) + lowerBound;
       
        objValDB(i).objVal = 0; 
        objValDB(i).scouted = 0;
        
    end
end
%%
% <runMB.html Back to Main Method>