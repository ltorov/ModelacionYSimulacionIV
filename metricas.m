%métricas
X=data
[ nf nc ]=size(X)
media=mean(X)
for j=1:nf
    d(j)=norm(X(j,:)-media,2); %distancia del jésimo a la media
end
I1=prctile(d,90)
I2=find(d>=I1) %las coordenadas de las 10 peores distancias.

plot(X(:,1),X(:,2),'o')
hold on
plot(X(I2,1),X(I2,2),'or')
