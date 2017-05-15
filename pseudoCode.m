
% Created by Parsa Beheshti on May 5, 2017

% Uses MABC method for Large-Scale Global Optimization 
% From "Memetic Artificial Bee Colony Algorithm for Large-Scale Global
% Optimization" by Fister et al.


% Pseudo code of MABC algorithm
%%
%{

Initial Function(input #of bees, #design variables, upper bound, and lower bound column vectors)
    sample = zeros(# of bees, #of design variables);
    for i=1:#of bees+1
        for j=1:#of design variables + 1
            sample(i,j) = randi([0,1]) * (UpperBound(j,1) - LowerBound(j,1)) + LowerBound(j,1)
        end
    end

while !TerminationConditionMeet()
    
    SendEmployedBees(); 
        sending employed bees onto the food sources and evaluating their
        nectar amounts
        
        numBees = [1:# of bees]
        randChoice = zeros(1,3)
        for i=1:3
            a = randsample(numBees, 1);
            randChoice(1,i) = a;
            numBees(a) = [];
        
        
        v = x(randChoice(1),:) + (x(randChoice(2),:) - x(randChoice(3),:)); <- rough code
            t represents   generation number, r1/r2/r3 denotes each 
            randomly selected candidate solution 


        - stochastic long-distance exploration

    SendOnlookerBees();
        sharing information about food sources with employed bees,
        selecting their proper food source and evaluating their nectar
        amounts
        
        q(i) = (f(i) - fWorst)/(fBest - fWorst)
            q(i) is the property that the ith onlooker bee should visit the
            nectar amount, where f(i) is nectar amounts of ith bee, and the
            other two represent the best and worst food sources
        
        if q(i) < r0  <--- r0 represents the rand(0,1)
        v(i,t) = x(i,t) + (xBest(t) - x(i,t)) + (xr1(t) - xr2(t))
        
        
        - stochastic moderate-distance exploration

    LocalImproveBestBee();
        determining the best food source and improve it

        - deterministic short-distance exploration

    SendScouts();
        determining scout bees and then sending them to find new possibly
        better food sources
        
        - random long distance exploration
end
%}

