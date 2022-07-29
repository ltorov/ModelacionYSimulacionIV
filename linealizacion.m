%%
%linealizacion de una exponencial
lambda=4
t=-log(rand(10000,1));
to=sort(t);
n=length(to);
I=0.5:1:n-0.5; %indice retrasado 0.5
E=I/n; %empírica
plot(to,E)

%exponencial(Distribución, no densidad)
%F(t)=1-exp(-lambda*t)
%-F+1=exp(-lambda*t)
F=E
t=to
%log(1-F)=lambda*t
y=log(1-F)

plot(t,y,'o')

fitlm(t,y)

%%
%linealizacion de una weibull
%primero simulemos la weibull
U=rand(10000,1)
a=2
b=5
T=a*(-log(1-U)).^(1/b);
to=sort(T);
n=length(to);
I=0.5:1:n-0.5; %indice retrasado 0.5
E=I/n; %empírica
hist(T)

y=log(-log(1-E));
x=log(to);
plot(x,y,'o')
fitlm(x,y)



