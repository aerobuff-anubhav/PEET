%{
Purpose: Computation of time-constant and time-random bias pointing error

Author: Anubhav Gupta
Creation Date:  Feb. 27, 2018
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Begins

clear
clc
close all

% configure the input parameters
config;
e_k = peet(msg, 1);
et = peet(msg, 2);

% Script Ends
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%