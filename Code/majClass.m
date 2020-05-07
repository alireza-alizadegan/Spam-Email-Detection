close all; clear all; clc

z=dlmread('spambase.data',',');
rng(0);
rp=randperm(size(z,1));
z=z(rp,:);
x=z(:,1:end-1);
y=z(:,end);
med=median(x);
x=quant(x,med);

ind_nonzero=find(y);
numel(ind_nonzero)


ind_zero=find(y-1);
numel(ind_zero)