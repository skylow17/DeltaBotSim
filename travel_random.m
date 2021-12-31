clc;clear;close all;

travel(:,1) = 200 .* rand(100,1);
travel(:,2) = 200 .* rand(100,1);
travel(:,3) = -80 .* rand(100,1) -170;

save("random.dat", "travel", '-ascii', '-double', '-tabs');