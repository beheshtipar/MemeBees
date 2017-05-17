%% *objFunc*
% Created May 16 2017.
%
% By Parsa Behestri and Muhammad Asif.
%
% This function evaluates the objective/cost function to be optimized.
%
% Test Functions found on: 
% Surjanovic, S. & Bingham, D. (2013). Virtual Library of Simulation Experiments: Test Functions and Datasets. Retrieved May 17, 2017, from http://www.sfu.ca/~ssurjano. 
%comment
%% *Function I/O*
%
% *Input*:
%
% * *inData*: n-by-m matrix with m-variables describing position of n
% canidate solutions
%
% *Output*:
%
% * *outdata*: n-by-1 matrix with one value describing the objective value
% of n soltuions

%% *Source Code*



%%
% *Test Functions*:

%%
% Valley Functions: 
% Unimodal functions with a global minimum located in a central valley. The valley itself is easy to find, but finding the global minimum is much harder.

% n-variable Dixon-Price function %VALLEY
%func = @(X) (X(1,1)-1)^2+sum( 2:1:length(X).*(2.*X(2:length(X))-X(1:(length(X)-1))).^2);
% xi is in the domain [-10 10]
% Global minimim 2^(2^i-2/(2^i))

%n-variable Rosenbrock Generalization function % VALLEY
% func = @(X) sum( 100*(X(:, 2:2:end) - X(:, 1:2:end-1).^2).^2 + (1 - X(:, 1:2:end-1)).^2, 2);

%%
% Multi Modal Functions: 
% Functions with multiple local minima. Extremely difficult for hill-walking algorithms

%n-variable Ackley function % MULTI-MODAL
%a=20;
%b=0.2;
%c=2*pi
% func =@(X) -a*exp(-b*sqrt(( (1/length(X)).*sum(X.^2)))-exp( (1/length(X)).*sum(cos(c.*X)))+a+exp(1);

% n-variable Griewank function %MULTI-MODAL
%func =@(X) sum((X.^2)./4000)-prod(cos(X./sqrt(i)))+1;
% xi is in the domain [-600 600]

%n-variable Rastrigin function % MULTI-MODAL
% func =@(X) 10*length(X)+sum(X.^2-A*cos(2*pi.*X)) where xi is in the domain [-5.12, 5.12] ;

% n-variable Schwefel function %MULTI-MODAL
%func = @(X) 418.9829*length(X)-sum(X.*(sin(sqrt(abs(X))))

%% 
% Bowl Functions:
% Shaped like a bowl. Unimodal, continous, and convex

%n-variable Sphere function %BOWL
% func = @(X) sum(X.^2);

%n-variable Sum Of Powers function %BOWL
% func =@(X) sum(abs(X).^(1:1:(length(X)+1)))

% n-variable Rotated Hyper Ellipsoid Function %BOWL
%func  =@(X) sum(cumsum(X.^2));

%  n-variable Sum of Squares function %BOWL
%func = @(X) sum((1:length(X)).*(X.^2))
% xi is in the domain [-10 10]

% n-variable Trid function %BOWL
%func = @(X) sum((X-1).^2)-sum(X(2:length(X)).*(X(1:(length(X)-1))));
% xi is in the domain [-d^2 d^2]

%% 
% Other Functions

%n-variable STYBLINSKI-TANG function
% func = @(X) (1/2)*(sum(X.^4-16.*(X.^2)+5.*X)); where xi is in the domain [-5 5]



% n-variable MICHALEWICZ function %RIDGE
%func = @(X) -1*sum(sin(X).*(sin( (1:1:length(X)).*X./(pi)))


% n-variable Zakharov function %PLATE
%func = @(X) sum(X.^2)+(sum(0.5.*(1:length(X)).*X)))^2+(sum(0.5.*(1:length(X)).*X)))^4;
%xi is in the domain [-5 10]


%% *Code*


function [outVal] = objFunc(inData)
    
    
    outVal = zeros(length(inData),1);
    
     
    
    
    
    %{ 
        here, must go
    
        {input parameters for each case} 
            -> [objective Function] ->
        {output as singular value to respective data matrix}
    
        % For testing purposes
       % for i=1:length(X(1,:))
            %outval(i,1) = func(X(i,:))
         %end
    
        
    %}
 


    
    
    


end