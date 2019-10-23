%聚类
%作者：Pygmalion
%时间：2019-5-7
clear all
load('total.mat')
k=4;
[idx,sc] = kmeans_Gu(X,k);