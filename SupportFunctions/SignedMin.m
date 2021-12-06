function temp = SignedMin(x, dim)
a = min(x,[],dim); 
b = min(abs(x),[],dim);

temp = a.*(a==b) - b.*(a~=b); 

end 