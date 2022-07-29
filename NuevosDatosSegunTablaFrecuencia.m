%%
%simulación de un número n de datos de la tabla
n=10000 %En la tabla son 20 pero aca lo cambiamos a 1000
n1=floor(0.069*n) %floor para que quede un número entero
n2=floor(0.172*n)
n3=floor(0.172*n)
n4=floor(0.207*n)
n5=floor(0.172*n)
n6=floor(0.138*n)
n7=floor(0.069*n)
%%
%simular números aleatorios uniformes en el intervalo [a,b] es
%a+(b-a)*rand(n,1)
d1=150+5*rand(n1,1)
d2=155+5*rand(n2,1)
d3=160+5*rand(n3,1)
d4=165+5*rand(n4,1)
d5=170+5*rand(n5,1)
d6=175+5*rand(n6,1)
d7=180+5*rand(n7,1)
ds=[d1
    d2
    d3
    d4
    d5
    d6
    d7] %datos simulados

media=mean(ds)
mediana=median(ds)
p30=prctile(ds,30)
p25=prctile(ds,25)
p75=prctile(ds,75)
hist(ds,7)

%%
std(tipoI)
std(tipoII)

finv(0.025,14,14)

