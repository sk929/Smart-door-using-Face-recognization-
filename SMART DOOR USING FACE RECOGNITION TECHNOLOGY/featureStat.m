function [f]=featureStat(im)
im = double(im);
m=mean(mean(im));
s=std(std(im));
f=[m s];