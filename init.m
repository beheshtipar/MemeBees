%% *Initialization Function for _MemeBees_*
% Created on May 8, 2017
% By Parsa Beheshti
%
% From "Memetic Artificial Bee Colony Algorithm for Large-Scale Global
% Optimization" by _Fister et al_.
%
% <runMB.html Back to Main Method>
%% Function I/O
% *Input*:
% 
% * *numBees*: # of bees the search is started with; determines # of
% rows for data matrix sampleData.
%
% * *numParam*: # of design parameters we are exploring; determines # of
%      columns for data matrix sampleData.
%
% * *upperBound*: row vector representing the upper bound for each
%     parameter in sampleData.
%
% * *lowerBound*: row vector representing the lower bound for each
%     parameter in sampleData.
%
% *Output*:
%
% * *solutionDB*: Data structure of candidate solutions.
%
% * *objValDB*: Data structure of candidate solutions' objective values.
%
% * *fitnessDiv*: Dynamic matrix of fitness diversity metric values (ends
%      up becoming row vector).

%% Source Code

function [solutionDB, objValDB, fitnessDiv] = init(numBees, numParam, upperBound, lowerBound)

    %% 
    % Generates a random number betweeen 0 and 1 in the same size as the
    % sample matrix. Then, creates a vectorized equivalent of the formula
    % given by,
    %
    % <<eq1.PNG>>
    
    randMat = rand(numBees,numParam);     
    
    genData = (repmat((upperBound-lowerBound), numBees, 1) .* randMat) + repmat(lowerBound,  numBees, 1);
    
    %%
    % Initializes two structures and a matrix:
    %
    % * *solutionDB*: Candidate solutions;
    % * *objValDB*: Objective Values, scouted count, and best objective
    % values for corresponding candidate solutions;
    % * *fitnessDiv*: Fitness diversity metric storage.
    
    solutionDB = repmat(struct('x',1,'params',[]), numBees, 1);
    objValDB = repmat(struct('x',1,'objVal',0, 'best', 0, 'scouted', 0),numBees,1);
    fitnessDiv = [];
    
    %%
    % Inserts generated data into the structures.
    
    for i=1:numBees
        solutionDB(i).x = i;
        solutionDB(i).params = genData(i,:);
        
        objValDB(i).x = i;
    end
end
%%
% <runMB.html Back to Main Method>
