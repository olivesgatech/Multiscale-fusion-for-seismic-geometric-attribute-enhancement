function theta = CalcDip(x)
        z = hilbert(x);  
        T = 1; 
        At = angle(z(3:end,:)./z(2:end-1,:)); 
        Bt = angle(z(2:end-1,:)./z(1:end-2,:));
        ft = 1/(4*pi*T)*(At+Bt); 


        Ax =angle(z(:,3:end,:)./z(:,2:end-1)); 
        Bx = angle(z(:,2:end-1)./z(:,1:end-2));
        fx = 1/(4*pi*T)*(Ax+Bx); 

        ft = ft(:,1:end-2);
        fx = fx(1:end-2,:); 

        theta = -atan(fx./ft); 
end 