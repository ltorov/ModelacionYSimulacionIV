
X=-1*log(rand(1000,1))
Y=3*X.^2+10+20*randn(1000,1) %dependencia con ruido
plot (X,Y,'o')
lx=length(X)
for i=1:lx
    for j=1:lx
        I(j)=(X(j)<=X(i));
    end
    fhatx(i)=mean(I); %empirica en cada dato
    I=[];
end
Xc=fhatx;

ly=length(Y)
for i=1:ly
    for j=1:ly
        I(j)=(Y(j)<=Y(i));
    end
    fhaty(i)=mean(I); %empirica en cada dato
    I=[];
end
Yc=fhaty;

plot(Xc,Yc,'o') %copula