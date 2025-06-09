%% taking first dataset
%%Without using PEM
y1=data1;
y2=[data2;data3];
[ytrain T]=detrend(y1,0);
ytest=detrend(y2,T);
figure(1)
plot(y1)
model1=spa(y1);
figure(2)
bode(model1('noi'))
impulse_est=impulseest(y1)
figure(3)
step(impulse_est)
fit1=oe(y1,[2,2,0]);
present(fit1)
figure(4)
resid(fit1,y1)
figure(5)
compare(fit1,y2)
%Using PEM
fit2=pem(y1);
present(fit2)
tf(fit2);
resid(fit2,y1);
compare(fir2,y2);
%% This is a test
%%Taking second dataset
%%Without PEM
y1=data2;
y2=[data1;data3];
% [y1 T]=detrend(y1,0);
% y2=detrend(y2,T);
figure(1)
plot(y1)
model1=spa(y1);
figure(2)
bode(model1('noi'))
impulse_est=impulseest(y1);
figure(3)
step(impulse_est)
fit1=oe(y1,[2,1,0]);
present(fit1)
figure(4)
resid(fit1,y1)
figure(5)
compare(fit1,y2)
%%Using PEM
fit2=pem(y1);
present(fit2)
tf(fit2);
resid(fit2,y1);
compare(fir2,y2);

%%Taking third one as train set
%%Without PEM
y1=data3;
y2=[data1;data2];
[y1 T]=detrend(y1,0);
% y2=detrend(y2,T);
figure(1)
plot(y1)
model1=spa(y1);
figure(2)
bode(model1('noi'))
impulse_est=impulseest(y1);
figure(3)
step(impulse_est)
fit1=oe(y1,[1,1,1]);
present(fit1)
figure(4)
resid(fit1,y1)
figure(5)
compare(fit1,y2)
%%Using PEM
fit2=pem(y1);
present(fit2)
tf(fit2);
resid(fit2,y1);
compare(fir2,y2);