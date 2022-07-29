%%
mu=1
x=0:0.1:4
F=expcdf(x)

D=-log(rand(1000,1)) %exponencial
Fhat=ecdf(D) %empirica
ecdf(D)
hold
plot(x,F,'r')

%%
X=-log(rand(1000,1)) %X1,X2,...,Xn
L=length(X)
for i=1:L
for j=1:L
    I(j)=(X(j)<=X(i))    
end
Fhat(i)=mean(I) %empirica en cada dato (no estan ordenados)
I=[]
end
xc=Fhat

%%
X=-100*log(rand(1000,1)) %X1,X2,...,Xn
L=length(X)
for i=1:L
for j=1:L
    I(j)=(X(j)<=X(i))    
end
Fhat(i)=mean(I) %empirica en cada dato (no estan ordenados)
I=[]
end
yc=Fhat
%%
plot(xc,yc,'o') %copula



