%%
%riesgo con data 5
%desviacion estandar como volatilidad
data5D=data5/100 %para quedarnos con los decimales y no los porcentajes
A1=data5D(:,1)
A2=data5D(:,2)
plot(A1) 
AS=randn(1135,1)
data=A2 
d=[]
v=100 %tamaño de ventana
l=length(data)
for j=1:l-v
    dataj=data(j:j+v-1);
    d(j)=std(dataj);
end

subplot(2,1,1)
plot(d)
subplot(2,1,2)
plot(data)


%%
%valor en riesgo var
data5D=data5/100
AS=randn(1136,1)
A1=data5D(:,1)
P=-A1 %girarlos, parte + perdidas, parte - ganancias
%hist(P)

[h p]=jbtest(P) %jarque bera test de normalidad

mu=mean(P)
sigma=std(P)

%como asumimos modelo parametrico normal con mu y sigma:
VarP=norminv(0.95,mu,sigma)

%estimación puntual
VarP2=prctile(P,95)

%version no parametrica
%bootstrap
B=bootstrp(1000, @p95,P);
hist(B);
VarP3=mean(B)

%%
function[p]=p95(P)
    p=prctile(P,95);
end
%%

%seleccion de portafolio
%simulacion de pesos
data=data12
[m n]= size(data);
w=rand(n,1000); %simulamos n conjuntos de pesos
WE=1/n*ones(n,1)
w1=[w WE]
w2=sum(w1);
wa=ones(n,1)*w2;
W=w1./wa
R=data*W; %rentabilidad
rm=mean(R) %rentabilidad media
riesgo=std(R);
SR=rm./riesgo;
MSR=max(SR)
I=find(SR==MSR )
WO=W(:,I) %peso optimo
plot(riesgo',rm','o')
hold on
plot(riesgo(I),rm(I),'ok', 'linewidth',3)
hold on
plot(riesgo(end),rm(end),'or', 'linewidth',3)


%%
%portafolio optimo de minima varianza
%problema de optimizacion cuadratica
data=datos5(1:200,:);
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
w=rand(n,10000); %simulamos n conjuntos de pesos
WE=1/n*ones(n,1);
w1=[w WE WMV];
w2=sum(w1);
wa=ones(n,1)*w2;
W=w1./wa;
R=data*W; %rentabilidad
rm=mean(R); %rentabilidad media
riesgo=std(R);
SR=rm./riesgo;
MSR=max(SR(1:end-2))
I=find(SR==MSR )
WO=W(:,I) %peso optimo
plot(riesgo',rm','o')
hold on
plot(riesgo(I),rm(I),'ok', 'linewidth',3)
hold on
plot(riesgo(end-1),rm(end-1),'or', 'linewidth',3)
hold on
plot(riesgo(end),rm(end),'og', 'linewidth',3)

%%
Rnaive=mean(data5,2)
plot(Rnaive)
DS=std(Rnaive)
P=-Rnaive
hist(p)
valorR=prctile(P,95)
I1=find(Rnaive>valorR)
I2=Rnaive(I1)
hist(I2)
CVaR= mean(I2)

%%
D2=data5(:,[1 2])
S=sum(D2,2)
PS=prctile(S,95)
PS1=prctile(D2(:,1),95)
PS2=prctile(D2(:,2),95)
PSS=PS1+PS2 %veamos la propiedad de coherencia subaditividad


%%
P=-log(0.05) %percentil teorico
X=-log(rand(1000,1)
PE=prctile(X,95)

%%




 









