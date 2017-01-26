%modtrain
clc;
clear all;
close all;

a=input('enter 1 for entry '); 
while(a==1)

    [fname path]=uigetfile('open a face','.jpg');
    fname= strcat(path,fname);
    im =imread(fname);
    imshow(im);
    title('Input face');
    c=input('enter the class(NUMBER)');

    %Feature Extraction
    f=featureStat(im);
    try
        load db;
        f=[f c];
        db=[db;f];
        save db.mat db
    catch
        db=[f c];
        save db.mat db
    end
    
    
    a=input('enter 1 for continue '); 
    
end   