    
function muestraAmpliada = extensor (vectDatos, numeroDeseado)
%Punto 3 del taller ModeIV
% función que recibe muestra de tamaño n y un tamaño deseado, devolviendo una
%muestra con dicho tamaño y mismas características estadísticas que la
%muestra de entrada.
%Se asume que el núero óptimo de clases sea sqrt(n)
nClases=floor(sqrt(length(vectDatos))); %Se asume como óptimo que el número de clases sea sqrt(n)
vectOrden=sort(vectDatos); %datos ordenados
minimo=vectOrden(1);
maximo=vectOrden(length(vectOrden));
rango=maximo-minimo;
longitud=rango/nClases; %Tamaño de clase
frecAbs=zeros(1,nClases); %vector de frecuencias absolutas
%características
mediaEntrada=mean(vectDatos);
variEntrada=var(vectDatos);
medianaEntrada=median(vectDatos);
%while interno para tomar en cuenta el caso en que haya más de una
%clase vacía y así avanzar más de un índice (contador) si es necesario.
contador=1;
for i=1:length(vectOrden)
%se podría aumentar el maximo=vectOrden(length(vectOrden))+1 o 0.1
%y poner restricción >= para que los intervalos sean [) 
while vectOrden(i)> minimo+longitud*contador 
contador=contador+1;
end 
frecAbs(contador)=frecAbs(contador)+1;
end
frecRelativas=frecAbs*(1/length(vectDatos));
%ahora uso las frecRelativas para determinar el tamaño específico de
%cada clase en la muestra ampliada (ni)
for i=1:length(frecRelativas)
frecRelativas(i)=floor(frecRelativas(i)*numeroDeseado);%asigna a cada clase un tamaño en proporción
end 
celulaClases=cell(1,nClases);
for i=1:nClases
%Creo en cada entrada de la celula un vector de ni datos uniformes
%en el intervalo de la clase
celulaClases{​​​​​1,i}​​​​​=(minimo+longitud*(i-1))+longitud*rand(frecRelativas(i),1);
end
%concatenación de los vectores
muestraAmpliada=cat(1,celulaClases{​​​​​:}​​​​​); 
%Características salida
mediaSalida=mean(muestraAmpliada);
variSalida=var(muestraAmpliada);
medianaSalida=median(muestraAmpliada);
hist(muestraAmpliada);
%Imprimir
imprime (mediaEntrada,medianaEntrada,variEntrada,mediaSalida,medianaSalida,variSalida);
end
function imprime (mediaEntrada,medianaEntrada,variEntrada,mediaSalida,medianaSalida,variSalida)
nombres=["media ", "mediana", "varianza"];
valoresEntrada=[mediaEntrada, medianaEntrada,variEntrada];
valoresSalida=[mediaSalida, medianaSalida,variSalida];
fprintf('\t Tabla de comparación\n Entrada Salida\n');
for i=1:3
fprintf('%13s %8.2f %8.2f \n', nombres(i), valoresEntrada(i),valoresSalida(i));
end
end