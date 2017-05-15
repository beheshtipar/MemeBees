%% *Project* *" _MemeBees_ "*
% A Matlab adaptation of the algorithm from article
% "Memetic Artificial Bee Colony Algorithm for Large-Scale Global Optimization" by _Fister et al_. 
%
% Created on May 10, 2017
% 
% A collaborative effort by Parsa Beheshti and Muhammad Asif

%% Run Constants
% A prompt menu opens, asking the user to enter some constsnts that will be
% used throughout the algorithm:
%
% * *Number of Bees*
% * *Number of Parameters*
% * *Crossover Probability _CR_*
% * *Local Search _ratio_*
% * *Scout Limit*
% * *Maximum Number of Function Evaluations _FE_*
 
prompt = {'Enter number of bees:','Enter number of parameters:','Enter CR:', 'Enter Search Ratio: ', 'Enter Scout Limit: ', 'Enter maximum number of FE: '};
dlg_title = 'Algorithm Constants';
num_lines = 1;

const = inputdlg(prompt,dlg_title,num_lines);
const = str2double(const);

%% Upper and Lower Bounds
% The bounds of the search are not prompted to be changed, and so much be
% edited before starting the algorithm. Enter parameters in order as row
% vectors.

upperBound = []; 

lowerBound = []; 

%% <init.html Initialization>
% Calls the *init* function to obtain the intial candidate solution set.
[solutionDB, objValDB, fitnessDiv] = init(const(1), const(2), upperBound, lowerBound);

%% Program Loop
% This loop runs the algorithm for a number of generations equal to the
% maximum FE value entered in the prompt menu earlier.
%
% _*globalBest*_ is pre-allocated so the values are not lost. 

globalBest = {};

for i=1:const(6)
    %% <sendEmployedBees.html SendEmployedBees: Stochastic Long-Distance Exploration>
   
    [solutionDB, objValDB] = sendEmployedBees(solutionDB, objValDB, const(3));
    %% <sendOnlookerBees.html SendOnlookerBees: Stochastic Moderate-Distance Exploration>
   
    [solutionDB, objValDB] = sendOnlookerBees(solutionDB, objValDB, const(3));

    %% Global Best
    % The following two lines stores the global best at any given generation.
    % Once the main while loop ends, it will output the index, parameters, and
    % value of the best solution it has found.

    indexGlobal = find(min([objValDB.objVal]));

    globalBest = {[solutionDB(indexGlobal).params], objValDB(indexGlobal).objVal};
    
    %% <localImproveBestBee.html LocalImproveBestBee>
    % Given the search ratio, *localImproveBestBee* will run based on a
    % ratio of overall runs, and is triggered with a modulus operator to
    % track the ratio. Within the function, depending on the fitness of
    % solution diversity, an explorative or exploitative method will be
    % used to locally optimize solutions.
    
    if mod(i,const(4)) == 0
        [solutionDB, objValDB, fitnessDiv] = localImproveBestBee (solutionDB, objValDB, fitnessDiv);
    end

    %% <sendScouts.html SendScouts>
    % Checks to see if any of the candidate solutions have met or exceeded the
    % scouting limit, returns a binary matrix where 1's are positions that have
    % met the condition of the inequality.
    
    numScouted = [objValDB.scouted] >= const(5);
    
    %%
    % *needNewPoints* returns a value of 1 if there is at least one solution that
    % has reached the scouting limit; This is the trigger condition for
    % *sendScout* in order to ensure new solutions are only assigned to candidates when they 
    % violate their scouting limit.
    
    %% 
    needNewPoints = size(find(newScouts),1) ~= 0;

    if needNewPoints
        [solutionDB, objValDB] = sendScouts(solutionDB, objValDB, numScouted, upperBound, lowerBound);
    end

end

%% Solution Display
% The following displays the solution the algorithm has determined to be the best solution out of all candidate solutions. 
disp('- - - - - - - - - - - - - ')
disp('||                      ||')
disp('||    Solution Found    ||')
disp('||                      ||')
disp('- - - - - - - - - - - - - ')
fprintf('\n')
disp(['Best objective value found: ', num2str(globalBest{1,2})]) 
disp(' ')
disp('Corresponding Candidate Solution:')
disp(' ')
disp(globalBest{1,1}')


    