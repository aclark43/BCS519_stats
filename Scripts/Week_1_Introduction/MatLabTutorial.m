%%% Matlab tutorial for BCS 519 stats course
%
% 08/2020  Ashley M. Clark 

clear all
clc

%% Types of Data
struct.matrix = [1 2 3; 4 5 6; 7 8 9];
struct.vector = [1 2 3 4 5 6 7 8 9];

%test = struct.matrix * struct.vector;

%% load in data .mat file
load tutorialData.mat

%% create concatenated vector of all data
x = [];
y = [];
for numTrials = 1:length(data.individualSizeChar.strokeWidth_4.position)
    x = [x data.individualSizeChar.strokeWidth_4.position(numTrials).x];
    y = [y data.individualSizeChar.strokeWidth_4.position(numTrials).y];
end

%% plot histograms
figure;
histogram(x);
hold on
histogram(y);

%% Create heatmap histogram

n_bins = 30;
limit.xmin = floor(min(x));
limit.xmax = ceil(max(x));
limit.ymin = floor(min(y));
limit.ymax = ceil(max(y));

figure;
temp = histogram2(x, y, n_bins);%[limit.xmin,limit.xmax,n_bins;limit.ymin,limit.ymax,n_bins]);
temp2 = temp.Values;
result = temp2./(max(max(temp2)));

