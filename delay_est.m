function  D = delay_est(yk1,uk1)

%Initialisation
W=(pi/128:pi/128:pi);
data=iddata(yk1,uk1);
d=detrend(data,0);
yk=d.OutputData;
uk=d.InputData;

%Genertaing the phase & the amplitude
I=spa(d);
[amp pha wout]=bode(I);

%Constructing weights
[S W]=mscohere(yk,uk,hamming(4),2,256);
S=S(1:length(W'));
weight=zeros(length(S),1);
for j=1:1:128
weight(j)=(abs(S(j)))^2/(1-(abs(S(j)))^2);   
end
%Construction of argument of transfer function
% e=zeros(length(S),1);
G=zeros(length(S),1);
for j1=1:1:length(S)
for j2=1:1:length(S)
if(j1~=j2)
G(j1)=G(j1)+((1/(2*length(W)))*abs(amp(j2))*(cot((W(j1)-W(j2))/2)+ cot((W(j1)+ W(j2))/2)));
end
end
end
z=zeros(11,1);

%Optimization problem
p=[0:1:10];
for A=1:1:11
for j3=1:1:128
z(A)=z(A)+weight(j3)*(cos(pha(j3)*(pi/180)-G(j3)+(p(A))*W(j3)));
end
end
for j4=1:1:length(z)
if (z(j4)==max(z))
Delay=j4-1 %delay
end
end
end


