function x_quant=quant(x,med)
x=x-repmat(med,[size(x,1) 1]);
for i=1:size(x,1)
    for j=1:size(x,2)
        if x(i,j)<0 || x(i,j)==0
            x_quant(i,j)=1;
        else
            x_quant(i,j)=2;
        end
    end
end
end
