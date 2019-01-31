function Curvature = CalcCurvature(Dipx, Dipy)
Dipx = Dipx(:,:,2:end-1); 
Dipy = Dipy(:,2:end-1,:); 

    for i = 2:size(Dipx,1)-1
        i
        for j=2:size(Dipx,2)-1
            for k=2:size(Dipx,3)-1
            
               Tempxx = squeeze(Dipx(i-1:i+1,j,k-1:k+1));
               Tempxy = squeeze(Dipy(i-1:i+1,j,k-1:k+1));

               Tempyx = squeeze(Dipx(i-1:i+1,j-1:j+1,k));
               Tempyy = squeeze(Dipy(i-1:i+1,j-1:j+1,k));

               [hxr, hxl] = GetKernels(-Dipx(i,j,k)); 
               [hyr, hyl] = GetKernels(-Dipy(i,j,k));

                DipxR(i-1,j-1,k-1) = sum(sum(hxr.*Tempxx)); 
                DipyR(i-1,j-1,k-1) = sum(sum(hxr.*Tempxy)); 

                DipxL(i-1,j-1,k-1) = sum(sum(hxl.*Tempxx)); 
                DipyL(i-1,j-1,k-1) = sum(sum(hxl.*Tempxy)); 

                DipxU(i-1,j-1,k-1) = sum(sum(hyr.*Tempyx)); 
                DipyU(i-1,j-1,k-1) = sum(sum(hyr.*Tempyy)); 

                DipxD(i-1,j-1,k-1) = sum(sum(hyl.*Tempyx)); 
                DipyD(i-1,j-1,k-1) = sum(sum(hyl.*Tempyy)); 


            end 
        end 
    end 
%% 


Curvature.a = (DipxR - DipxL)./2; 
Curvature.b = (DipyU - DipyD)/2; 
Curvature.c = 1/4*(DipyR - DipyL +DipxU - DipxD); 
Curvature.d = 1/3*(DipxL+Dipx(2:end-1,2:end-1,2:end-1)+ DipxR); 
Curvature.e = 1/3*(DipyD + Dipy(2:end-1,2:end-1,2:end-1) + DipyU); 

end 