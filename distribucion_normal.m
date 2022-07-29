%simulación de una normal
mu=3.5
sigma=0.2
notas=mu+sigma*randn(1000,1)
hist(notas)

%veamos la probabilidad a que este a menos de 3 desviaciones típicas de la
%media.
P=normcdf(3)-normcdf(-3)

%en las notas, calcular los datos que necesitamos (si no los tuvieramos)
xbar=mean(notas) %media
s=std(notas) %desviación estandar
z=(notas-xbar)/s %estandarizar o tipificar.
Is=find(z>3) %da la coordenada de cuales estan encima de 3 (indicador superior)
Ii=find(z<-3) %da la coordenada de cuales estan por debajo de 3 (indicador inferior)
I3=[Is
    Ii]
Raros=notas(I3) %forma de identificar datos raros (outliers)

%prueba de normalidad: prueba Jarque Bera para Normalidad, si sale h=1 hay
%evidencia que los datos no salen de una normal, si sale h=0 no hay
%evidencia de que no haya normalidad.
h=jbtest(notas) 

%en command window, escribimos directamente data5=[...] y en los tres
%puntos pegamos los datos que copiamos de industry portfolio
size(data5)
%data5(:,1)=[] %elimina la primera columna (lo comente porque cada vez que
%se corre se borra una columna)
rm=mean(data5) %rentabilidad media historicamente
riesgo=std(data5) %riesgo medido con la desviación estándar
SR=rm./riesgo %sharpe-ratio es un criterio de decisión

%veamos el activo 4
A4=data5(:,4) %separar solo la columna 4
mediaA4=mean(A4) %media del activo 4
sdA4=std(A4) %desviacion del activo 4
z=(A4-mediaA4)/sdA4 %estandarizacion o tipificacion

Is=find(z>3) %ganancias mas altas de lo esperado
Ii=find(z<-3) %perdidas extremas

I3=[Is
    Ii]
Outliers=A4(I3) %datos raros

A4Limpio=A4
A4Limpio(I3)=[] %asi le quitamos todos los outliers

%diagrama de cajas y bigotes: permite identificar si hay outliers.
boxplot(data5)

%mediana
mediana=median(data5) 
A1=data5(:,1) %extraer el activo 1
M1=median(A1) %mediana del activo 1
I1=find(A1>=0) %el find dice las posiciones en los que hubo ganancia
I2=A1(I1) %extrae aquellos en los que hubo ganancias (la condición)
P1=mean(A1>0) %porcentaje de veces que se cumple la condicion (ganancias)

%simular tiempos de vida
mu=2
Tv=-mu*log(rand(1000,1)) %exponencial con media mu
hist(Tv)
[mean(Tv) median(Tv)]
Asimetria = skewness(Tv)


