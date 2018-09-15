clear
clc



x=-10:.1:10;  %length in the x direction
y=(-12:.1:12)'; %length in the y direction

xgrid=ones(size(y,1),1)*x; %create an x grid
ygrid=y*ones(1,size(x,2));  %create a y grid

%we now have a 2-d plate representing our experiment form lab

r=sqrt(xgrid.^2+ygrid.^2); %change to polar coordinated
theta=atan2(ygrid,xgrid); %change to polar coordinate


a=2; %hole size
Sigma_0=1; %nominal stress


%create our stress equations
sigma_r= (1/2).*((1-(a.*a)./(r.*r))-(1-(4.*a.*a)./(r.*r)+(3.*a.*a.*a.*a)./(r.*r.*r.*r)).*cos(2*theta));
sigma_t= (1/2).*((1+(a.*a)./(r.*r))+((1+3.*a.*a.*a.*a)./(r.*r.*r.*r)).*cos(2*theta));
tau_rt=(1/2).*(1+(2.*a.*a)./(r.*r)-(3.*a.*a.*a.*a)./(r.*r.*r.*r)).*sin(2*theta);


%subtract the are of the hole
sigma_r(find(r < a))=0;  
sigma_t(find(r < a))=0; 
tau_rt(find(r < a))=0; 

%plots
imagesc(sigma_r);
figure
imagesc(sigma_t);
figure
imagesc(tau_rt);
figure

%difference of principal stresses
p1_p2=2*sqrt(((sigma_r-sigma_t)/2).*((sigma_r-sigma_t)/2)+tau_rt.*tau_rt);

colormap([jet;jet;jet]) 
imagesc(p1_p2)






