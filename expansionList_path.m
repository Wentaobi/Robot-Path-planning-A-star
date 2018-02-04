% Expansion list
%
clear,clc
% grid = [0 0 1 0 0 0;
%         0 0 1 0 0 0;
%         0 0 0 0 1 0;
%         0 0 1 1 1 0;
%         0 0 0 0 1 0];
    
% Grid for Testing A*
grid = [0 1 0 0 0 0;
        0 1 0 0 0 0;
        0 1 0 0 0 0;
        0 1 0 0 0 0;
        0 0 0 0 0 0];
    
heuristic = [9 8 7 6 5 4;
            8 7 6 5 4 3;
            7 6 5 4 3 2;
            6 5 4 3 2 1;
            5 4 3 2 1 0];    
 
start = [2, 1];


[goal] = size(grid); % Make sure that the goal definition stays in the function.

%delta = [-1 0;0 -1;1 0;0 1]; 
delta = [1 0;0 -1;-1 0;0 1]; 

%        up  left down right
global delta_name
delta_name = ['v', '<', '^', '>'];

cost = 1;
disp('Expansion list output');
[a,b,c]=searchgrid(grid,goal,start,delta,cost);
fprintf('\n');
disp('A_star output');
[a,b,c]=A_star(grid,goal,start,delta,cost,heuristic);


