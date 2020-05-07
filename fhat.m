function y_pred=fhat(x_test)

global pihat ghat_01 ghat_02 ghat_11 ghat_12

g1=pihat;
for j=1:numel(x_test)
    if x_test(j)==2
        g1=g1*ghat_12(j);
    else
        g1=g1*ghat_11(j);
    end
end

g0=1-pihat;

for j=1:numel(x_test)
    if x_test(j)==2
        g0=g0*ghat_02(j);
    else
        g0=g0*ghat_01(j);
    end
end

if g1>g0 || g1==g0
    y_pred=1;
else
    y_pred=0;
end
end