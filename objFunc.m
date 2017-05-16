%% *objFunc*
% Created May 16 2017.
%
% By Parsa Behestri and Muhammad Asif.
%
% This function evaluates the objective/cost function to be optimized.


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

%n-variable Rsenbrock Generalization function % VALLEY
% func = @(X) sum( 100*(X(:, 2:2:end) - X(:, 1:2:end-1).^2).^2 + (1 - X(:, 1:2:end-1)).^2, 2); 

%n-variable Rastrigin function % MULTI-MODAL
% func =@(X) 10*length(X)+sum(X.^2-A*cos(2*pi.*X)) where xi is in the domain [-5.12, 5.12] ;

%n-variable Ackley function % MULTI-MODAL
%a=20;
%b=0.2;
%c=2*pi
% func =@(X) -a*exp(-b*sqrt(( (1/length(X)).*sum(X.^2)))-exp( (1/length(X)).*sum(cos(c.*X)))+a+exp(1);

%n-variable Sphere function %Bowl

% func = @(X) sum(X.^2);

%n-variable STYBLINSKI-TANG function

% func = @(X) (1/2)*(sum(X.^4-16.*(X.^2)+5.*X)); where xi is in the domain [-5 5]

%n-variable Sum Of Powers function %BOWL

% func =@(X) sum(abs(X).^(1:1:(length(X)+1)))

% n-variable Rotated Hyper Ellipsoid Function %BOWL

%func  =@(X) sum(cumsum(X.^2));

% n-variable MICHALEWICZ function -%RIDGE

%func = @(X) -1*sum(sin(X).*(sin( (1:1:length(X)).*X./(pi)))

% n-variable Dixon-Price function %VALLEY



%%
function [outVal] = objFunc(inData)
    
    
    outVal = zeros(length(inData),1);
    
     
    
    
    
    %{
        here, must go
    
        {input parameters for each case} 
            -> [objective Function] ->
        {output as singular value to respective data matrix}
    
        
    %}
    
    
    
    


end