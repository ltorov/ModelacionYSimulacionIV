%%
for j=1:100
    X=rand(1000,j); %datos de distribución uniforme
    xbar=mean(X,2);
    pause(0.2)
    hist(xbar)
    h(j)=jbtest(xbar)
end

%%
X=5+0.3*rand(100,5)
xbar=mean(X,2)
R=range(X,2)
xbarbar=mean(xbar)
rbar=mean(R)
A2=0.577 %constante para n=5
LCS=xbarbar+A2*rbar
LCI=xbarbar-A2*rbar

plot(LCS*ones(100,1),'r')
hold on
plot(LCI*ones(100,1),'r')
hold on
plot(xbarbar*ones(100,1),'b')
hold on
plot(xbar,'k')


%%
[h p]=jbtest(data0)
varx=var(data0)
vary=var(data1)
xbarx=mean(data0)
xbary=mean(data1)
