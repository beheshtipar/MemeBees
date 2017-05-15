%% *online: Recurrence algorithm used to update mean and variance of data set given new data element
%By Muhammad Asif
%May 11, 2017
%Implements an online algorithm to calculate mean and variance
%Done through recurrence relation

%Known as Welford's algorthim, also referred to as Donald Knuth's Algorithim

%%                      *Function I/0*

% *Input*:

% * *old_mean* = old arithmetic average of dataset, without new data element
% * *old_var* = old variance of dataset, without new data element
% * *new_value* = new data element
% * *n*= number of data elements so far

% *Output*:
% * *new_mean* = new average given the inclusion of the new data element
% * *new_var*  = new variance given the inclusion of the new data element

%% *Source Code*

function [new_mean, new_var] = online(old_mean, old_var, new_value, n)

M2= old_var*(n-1);
delta1= new_value-old_mean;

%%
%Based on Recurrence relation between new mean and old mean 
new_mean = old_mean+(delta1)/n;

delta2 = new_value-new_mean;

%%
%based on Recurrence relation between new variance and old variance
M2 = M2+delta1*delta2;

new_var = M2/n;

end





