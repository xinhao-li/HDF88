%%
load('S2_gapfilled_data.mat', 'g')
load('S2_gapfilled_data.mat', 'ta')
load('S2_gapfilled_data.mat', 'ustar')
load('S2_gapfilled_data.mat', 'ws')
load('S2_gapfilled_data.mat', 'vpd')
load('S2_gapfilled_data.mat', 'le')
load('S2_gapfilled_data.mat', 'rn')
load('S2_gapfilled_data.mat', 'swin')
load('S4_1_mean_data.mat', 'ppt')
load('S4_1_mean_data.mat', 't')
g(174340:185030)=nan;

gama=66.5*10^(-3);
sanjiao=4098.*(0.6108.*exp(17.27.*ta./(ta+237.3)))./(ta+237.3).^2;
ga=1./(ws./ustar./ustar+6.2.*ustar.^(-0.67));%in m/s
cp=1030;

halfhour_gs=gama.*le.*ga./(sanjiao.*(rn-g)+1.23.*cp.*vpd./10.*ga-le.*(sanjiao+gama))*1000;%in mm/s
halfhour_omega=(sanjiao+gama)./(sanjiao+gama.*(1+(ga./halfhour_gs*1000)));
leeq=sanjiao.*(rn-g)./(sanjiao+gama);    % 计算 the equilibrium LE
halfhour_alpha=le./leeq;


halfhour_gs(halfhour_gs<0|halfhour_gs>14)=nan;
halfhour_gs(swin<20)=nan;
%[halfhour_gs]=highclean_3std(halfhour_gs);
gs=NANave(halfhour_gs,48);
gs(ppt>1)=nan;
[gsMonmean,~,gsYearmean,~,~,~] = Month_mean(t,gs,7670);


halfhour_omega(halfhour_omega<0|halfhour_omega>1)=nan;
halfhour_omega(swin<20)=nan;
%[halfhour_omega]=highclean_3std(halfhour_omega);
omega=NANave(halfhour_omega,48);
omega(ppt>1)=nan;
[omegaMonmean,~,omegaYearmean,~,~,~] = Month_mean(t,omega,7670);
omegaMonmean(199)=nan;omegaYearmean(17)=nan;

halfhour_alpha(halfhour_alpha<0|halfhour_alpha>1.26)=nan;
halfhour_alpha(swin<20)=nan;
%[halfhour_alpha]=highclean_3std(halfhour_alpha);
alpha=NANave(halfhour_alpha,48);
alpha(ppt>1)=nan;
%alpha(alpha>0.9)=nan;
[alphaMonmean,~,alphaYearmean] = Month_mean(t,alpha,7670);
clear cp g ga gama halfhour_alpha halfhour_gs halfhour_omega le leeq ppt rn sanjiao swin t ta ustar vpd ws

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%忽略缺失g，补全alpha、gs、omega
load('S2_gapfilled_data.mat', 'g')
load('S2_gapfilled_data.mat', 'ta')
load('S2_gapfilled_data.mat', 'ustar')
load('S2_gapfilled_data.mat', 'ws')
load('S2_gapfilled_data.mat', 'vpd')
load('S2_gapfilled_data.mat', 'le')
load('S2_gapfilled_data.mat', 'rn')
load('S2_gapfilled_data.mat', 'swin')
load('S4_1_mean_data.mat', 'ppt')
load('S4_1_mean_data.mat', 't')
g(174340:185030)=nan;

gama=66.5*10^(-3);
sanjiao=4098.*(0.6108.*exp(17.27.*ta./(ta+237.3)))./(ta+237.3).^2;
ga=1./(ws./ustar./ustar+6.2.*ustar.^(-0.67));
cp=1030;

halfhour_gs=gama.*le.*ga./(sanjiao.*(rn-g)+1.23.*cp.*vpd./10.*ga-le.*(sanjiao+gama))*1000;
ind=find(isnan(halfhour_gs));
halfhour_gs(ind)=gama.*le(ind).*ga(ind)./(sanjiao(ind).*(rn(ind))+1.23.*cp.*vpd(ind)./10.*ga(ind)-le(ind).*(sanjiao(ind)+gama))*1000;
halfhour_omega=(sanjiao+gama)./(sanjiao+gama.*(1+(ga./halfhour_gs*1000)));
leeq=sanjiao.*(rn-g)./(sanjiao+gama);% 计算 the equilibrium LE
ind=find(isnan(leeq));
leeq(ind)=sanjiao(ind).*(rn(ind))./(sanjiao(ind)+gama);
halfhour_alpha=le./leeq;


halfhour_gs(halfhour_gs<0|halfhour_gs>14)=nan;
halfhour_gs(swin<20)=nan;
%[halfhour_gs]=highclean_3std(halfhour_gs);
gs=NANave(halfhour_gs,48);
gs(ppt>1)=nan;
[gsMonmean,~,gsYearmean,~,~,~] = Month_mean(t,gs,7670);


halfhour_omega(halfhour_omega<0|halfhour_omega>1)=nan;
halfhour_omega(swin<20)=nan;
%[halfhour_omega]=highclean_3std(halfhour_omega);
omega=NANave(halfhour_omega,48);
omega(ppt>1)=nan;
[omegaMonmean,~,omegaYearmean,~,~,~] = Month_mean(t,omega,7670);


halfhour_alpha(halfhour_alpha<0|halfhour_alpha>1.26)=nan;
halfhour_alpha(swin<20)=nan;
%[halfhour_alpha]=highclean_3std(halfhour_alpha);
alpha=NANave(halfhour_alpha,48);
alpha(ppt>1)=nan;
%alpha(alpha>0.9)=nan;
[alphaMonmean,~,alphaYearmean] = Month_mean(t,alpha,7670);
clear cp g ga gama halfhour_alpha halfhour_gs halfhour_omega le leeq ppt rn sanjiao swin t ta ustar vpd ws ind


