clc;
close all;
clear all;

%s=input('enter the location of the raw images in inverted comma');
n=input('enter the number of images  ');


for i=1:n;
    name=strcat('faces',int2str(i),'.jpg');
    a=imread(name);

    A=rgb2gray(a);
    FaceDetector = vision.CascadeObjectDetector();
    BBOX=step(FaceDetector,A);
    
    I2 = imcrop(A,[BBOX(1) BBOX(2) BBOX(3) BBOX(4)]);
    k=size(I2);
    d=200/k(1);
    J = imresize(I2,d);
    size(J)
    imwrite(J,strcat(int2str(i),'.jpg'));
    
    
end
