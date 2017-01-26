%face classifier
clc ;
close all;
clear all;

[fname path]=uigetfile('.jpg','provide a face');
fname=strcat(path,fname);
im=imread(fname);
imshow(im);
title('Test face');

ftest=featureStat(im);

load db.mat
ftrain=db(:,1:2);
Ctrain=db(:,3);
for(i=1:size(ftrain,1))
    dist(i,:)=sum(abs(ftrain(i,:)-ftest));
end
Min=min(dist)
if(Min<3)
    m=find(dist==Min,1);
    det_class=Ctrain(m);
    msgbox(strcat('detected class ',num2str(det_class)));
else
    msgbox('NOT FOUND');
end
    