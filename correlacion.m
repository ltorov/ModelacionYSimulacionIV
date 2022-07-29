
%%coeficiente de correlación
x=0:0.1:5
y=0.0001*x.^2
y1=5*x+1
plot(x,y)
hold on %graficar dos cosas en misma grafica
plot(x,y1)
corrcoef([x,y]) %coeficiente de correlacion de pearson
corr([x' y'], 'type', 'kendall')
corr([x' y1'])
corr([x' y1],'type','spearman')

%%
%covarianza pearson, kendall, spearman mad mad

data=data5;

[nf nc]=size(data);

for j=1:nc

    for i=1:nc

        rho1=corr(data(:,i),data(:,j),'type','spearman');

        rho2=rho1;

        cov1(i,j)=rho2*mad(data(:,i))*mad(data(:,j)); %mad es desviacion robusta

    end

end

cov1

