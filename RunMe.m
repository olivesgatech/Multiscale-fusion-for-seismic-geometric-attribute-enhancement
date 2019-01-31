%% 
% This code is is to generate multiscale-fused attributes as proposed in the paper: 

% M. Alfarraj, H. Di, and G. AlRegib, ?Multiscale Fusion for Seismic 
% Geometric Attribute Enhancement,? 87th Annual SEG Meeting Extended
% Abstracts, Houston, Texas, 2017.

% By: Motaz Alfarraj
% Email: motaz@gatech.edu 
% Last edited: 6/24/2017

%% %%%%%%%%%%%%%%%%%%%%%%%%%
clear all; 
close all; 
clc; 

addpath(genpath('./SupportFunctions')); 
load('SampleVolume')
%%
scales = 3; 

%%
parfor  i=1:size(SeisVol,3)
    [Dipx_original(:,:,i), Dipx_median(:,:,i)] = CalcMSAttribute(squeeze(SeisVol(:,:,i)),scales); 
end 

parfor  i=1:size(SeisVol,2)
    [Dipy_original(:,i,:), Dipy_median(:,i,:)] = CalcMSAttribute(squeeze(SeisVol(:,i,:)),scales); 
end 


%% Curvature Calculations  
Curvature_original = CalcCurvature(Dipx_original, Dipy_original);
a = Curvature_original.a; 
b = Curvature_original.b; 
c = Curvature_original.c; 
d = Curvature_original.d; 
e = Curvature_original.e; 

Kmp_original = (a+b)+sqrt((a-b).^2+c.^2); 
Kmn_original = (a+b)-sqrt((a-b).^2+c.^2); 
DipAngle_original = atan(sqrt(d.^2+e.^2)); 

%%

Curvature_median = CalcCurvature(Dipx_median, Dipy_median);
a = Curvature_median.a; 
b = Curvature_median.b; 
c = Curvature_median.c; 
d = Curvature_median.d; 
e = Curvature_median.e; 

Kmp_median = (a+b)+sqrt((a-b).^2+c.^2); 
Kmn_median = (a+b)-sqrt((a-b).^2+c.^2); 
DipAngle_median = atan(sqrt(d.^2+e.^2)); 


%% Showing results 

imagesc(squeeze(Kmp_original(1,:,:)),[-0.3,0.3]); 
colormap(redblue(256));
title('Original Most Positive Curvature'); 

figure 
imagesc(squeeze(Kmp_median(1,:,:)),[-0.3,0.3]); 
colormap(redblue(256));
title('Enhanced Most Positive Curvature'); 




