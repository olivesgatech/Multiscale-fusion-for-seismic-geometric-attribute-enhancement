function [hr, hl] = GetKernels(theta)

dx2 = sqrt(2-2*sin(abs(theta))); 
dx3  = sqrt(3-2*(sin(abs(theta))+cos(abs(theta)))); 
dx5 = 1;
dx6 = sqrt(2-2*cos(abs(theta)));

wx2 = 1/dx2; 
wx3 = 1/dx3; 
wx5 = 1/dx5; 
wx6 = 1/dx6; 

hr = [0 wx2 wx3;
         0 wx5 wx6
         0  0   0]; 
          
hr = hr/sum(hr(:));     
hr(isnan(hr)) =1;    
hr = hr.*(theta<0) + flipud(hr).*(theta>=0); 

hl = rot90(hr,2);
end 