%% *RWDE: Random Walk with Direction Exploitation*
%
% Created on May 11 2017
% By Muhammad Asif
%
% Random Walk with Direction Exploitation(RWDE)
% Second Deterministic Short-distance exploration, used to find the local optimum around the best solution
%
% From "Memetic Artificial Bee Colony Algorithm for Large-Scale Global
% Optimization" by Fister et al.
%
% Inspired from Engineering Optimization: Theory and Practice by SS Rao

%% *Function I/O*
%
% *Input*:
%
% * *Solution*: The position of the candidate solution to be improved. Passed as a vector.
%
% * *dim*: The number of variables
%
% * *step*: The Starting Random Walk Distance
%
% * *minstep*: Minimum walking distance
%
% * *N*: Maximum Number of iterations with no improvement before switching to a smaller step size
%
%
% *Output*: 
%
% * *newSolution*: The improved solution's position. Passed as a 1bydim vector
%
% * *Fitness is the fitness value of the new solution


%% Source Code
function [newSolution, newObjVal] = RWDE(oldSolution, dim, step, minStep, N)


xPrev = oldSolution; %Initial Guess
fPrev = objFunc(xPrev); %Initial Function Value

%% 
%
% Initializing diagnostic variables.
fcalls=0;
fHistory = []; 

%% Main Loop 

while (step>minStep)
    i=1;
    while i<=N
        
%%
% Generate random vector with dim elements with range between 1 and -1
        u= rand(1,dim).*(1-(-1))+(-1.*(ones(1,dim)));
        
         %if(norm(u)>1) %to avoid bias
            %continue %regenerate the random vector
         %end
        
%%
% Normalize to unit vector.
        u = u.*(1/norm(u)); 
        x= xPrev+step.*(u);
        f = objFunc(x);
        fcalls= fcalls+1;
        
        %%
		% Compare
        if (f<fPrev)
            %%
			% Direction Exploitation Step. See..[Insert Link]
			[exploitedstep, fmorecalls] = directionExploit(xPrev,u,step,minStep);
            
            fcalls = fcalls+fmorecalls;
            
            x = xPrev+exploitedstep.*(u);
            f = objFunc(x);
            
            fHistory(length(fHistory)+1) = f;
            
            xPrev= x;
            fPrev= f;
            i=1;
        else
            i= i+1;
        end
    end
    
    step = step/2;
    
    
end

%%
% Return variables back to method call.
newSolution= xPrev;
newObjVal = fPrev;

end





