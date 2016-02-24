function cc = correlatecalculate(a)

x=zeros(1,1000);
y=zeros(1,1000);
for k=1:1000
%     i=fix(rand()*250);
%     j=fix(rand()*250);
    i = ceil(unifrnd(0, 1, 1) * 250);
    j = ceil(unifrnd(0, 1, 1) * 250);
    
    %% horiaontl 1112; diagonal 1122; vertical 1121.
    x(k)=a(i+1,j+1);
    y(k)=a(i+1,j+2);
end
sum=0.0;
sum=double(sum);
for i=1:1000
    sum=sum+double(x(i));
end
ex=sum/1000;
sum=0.0;
sum=double(sum);
for i=1:1000
    sum=sum+double(y(i));
end
ey=sum/1000;
sum=0.0;
sum=double(sum);
for i=1:1000
    sum=sum+double(x(i))*double(x(i));
end
ex2=sum/1000;
sum=0.0;
sum=double(sum);
for i=1:1000
    sum=sum+double(y(i))*double(y(i));
end
ey2=sum/1000;
dx=ex2-ex*ex;
dy=ey2-ey*ey;
sum=0.0;
sum=double(sum);
for i=1:1000
    sum=sum+double(x(i))*double(y(i));
end
exy=sum/1000;
cov=exy-ex*ey;
dx=double(dx);
dy=double(dy);
xg=cov/(sqrt(dx)*sqrt(dy));
cc = xg;

