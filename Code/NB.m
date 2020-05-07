close all; clear all; clc

global pihat ghat_01 ghat_02 ghat_11 ghat_12

z=dlmread('spambase.data',',');
rng(0);
rp=randperm(size(z,1));
z=z(rp,:);
x=z(:,1:end-1);
y=z(:,end);
med=median(x);
x=quant(x,med);

x_train=x(1:2000,:);
y_train=y(1:2000);
x_test=x(2001:end,:);
y_test=y(2001:end);

n=size(y_train,1);
n_1=sum(y_train);
pihat=n_1/n;

for j=1:size(x_train,2)
    sum=0;
    for i=1:size(x_train,1)
        if x_train(i,j)==2 && y_train(i)==1
            sum=sum+1;
        end
    end
    n_12(j)=sum;
    ghat_12(j)=n_12(j)/n_1;
    ghat_11(j)=1-ghat_12(j);
end

for j=1:size(x_train,2)
    sum=0;
    for i=1:size(x_train,1)
        if x_train(i,j)==2 && y_train(i)==0
            sum=sum+1;
        end
    end
    n_02(j)=sum;
    ghat_02(j)=n_02(j)/(n-n_1);
    ghat_01(j)=1-ghat_02(j);
end

for i=1:size(x_test,1)
    y_pred(i)=fhat(x_test(i,:));
end
y_pred=y_pred';
error=abs(y_pred-y_test);
errorSum=0;
for i=1:numel(error)
    errorSum=errorSum+error(i);
end

errorSum
misclas_rate=errorSum/numel(y_test)