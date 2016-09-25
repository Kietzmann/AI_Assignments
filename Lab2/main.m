clear;
clc;
ids_running_times = zeros(1,100);
a_star_running_times = zeros(1,100);
load('100-puzzles.mat'); 
for index = 1:100
    current_initial_state = puzzle(puzzles(index)); 
    disp('--- IDS ---')
    disp(index)
    ids_running_times(index) = IDS(current_initial_state);
    disp('---  A* ---')
    disp(index)
    a_star_running_times(index) = A_star(current_initial_state);
end

figure 

subplot(2,2,1)
histogram(ids_running_times)
title('IDS running time distribution')
ylabel('count')
xlabel('running time (sec)')

sprintf('Mean of IDS running times: %.2f', mean(ids_running_times))
sprintf('Variance of IDS running times: %.2f', var(ids_running_times))

subplot(2,2,2)
histogram(a_star_running_times)
title('A* running time distribution')
ylabel('count')
xlabel('running time (sec)')

sprintf('Mean of A* running times: %.2f', mean(a_star_running_times))
sprintf('Variance of A* running times: %.2f', var(a_star_running_times))

disp('--- END ---')

