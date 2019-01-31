function [A_original, A_median] = CalcMSAttribute(x,scales)
    
    Attribute(:,:,1) = CalcDip(x); 
    TempSection = x;  
    for s=2:scales
        TempSection = impyramid(TempSection,'reduce');
        TempAttribute = CalcDip(TempSection);
        for k = 1:s-1
        TempAttribute = impyramid(TempAttribute,'expand');
        end 
        Attribute(:,:,s) = imresize(TempAttribute,size(Attribute(:,:,1))); 
    end

A_original = Attribute(:,:,1); 
A_median = median(Attribute,3); 

end 