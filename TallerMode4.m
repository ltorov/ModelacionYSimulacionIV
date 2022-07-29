%% 
%punto 1.c)
%inversiones con pesos ponderados
data=datos48;
vol=[]; %volatilidad
VaR=[]; %value at risk
CVaR=[];
v=100; %tamaño de ventana
l=length(data);
for j=1:l-v
    dataj=data(j:j+v-1);
    vol(j)=std(dataj);
    rnaive = mean(dataj,2); 
    perdidas = -rnaive;
    VaR(j)= prctile(perdidas,95);
    I1 = find(rnaive>VaR(j));
    I2 = rnaive(I1);
    CVaR(j)=  mean(I2);
end
plot(vol)



%%
%punto 1.d) 
%ventanas móviles 
%como aplico esto con lo otro??

data=datos5;
d=[];
v=100; %tamaño de ventana
l=length(data);
for j=1:l-v
    dataj=data(j:j+v-1);
    d(j)=std(dataj);
end
plot(d)

%%
%portafolio optimo de minima varianza
%problema de optimizacion cuadratica
data=datos5
[m n]= size(data);
%cosas que necesita matlab para quadprob
H=cov(data);
f=zeros(n,1);
A=[];
b=[];
Aeq=ones(1,n);
beq=1;
lb=zeros(n,1);
ub=ones(n,1);
WMV=quadprog(H,f,A,b,Aeq,beq,lb,ub) %peso de minima varianza

[m n]= size(data);
w=rand(n,100000); %simulamos n conjuntos de pesos
WE=1/n*ones(n,1)%pesos ponderados
w1=[w WE];
w2=sum(w1);
wa=ones(n,1)*w2;
W=w1./wa;
R=data*W; %rentabilidad
rm=mean(R); %rentabilidad media
riesgo=std(R);
SR=rm./riesgo;
MSR=max(SR);
I=find(SR==MSR );
WO=W(:,I) %peso optimo

plot(riesgo',rm','o')
hold on
plot(riesgo(I),rm(I),'ok', 'linewidth',3)
hold on
plot(riesgo(end-1),rm(end-1),'or', 'linewidth',3)
hold on
plot(riesgo(end),rm(end),'og', 'linewidth',3)

%%
hist(datospuntos28,7)

media=mean(datospunto28)
var(datospunto28)
std(datospunto28)

var2=(1/length(datospunto28))*sum((datospunto28-media).^2)
desv=sqrt(var2)

1-normcdf(10000,media,desv)

%%
l=[]
for i=1:59
    l(i)=135
end
x=[datospunto27 l]
media=mean(x)
var(x)
std(x)

var2=(1/length(x))*sum((x-media).^2)
desv=sqrt(var2)

1-normcdf(200,media,desv)
