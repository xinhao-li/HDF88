load('S2_gapfilled_data.mat')
%%
%g,lwin,lwout,swc有问题
lwin(lwin==-9999)=nan;
lwout(lwout==-9999)=nan;
parout(parout>200)=nan;
swout(swout>200)=nan;
ta(ta>40)=nan;

%%
g(174340:185030)=nan;
gpp(gpp<0)=0;
re(re<0)=0;
swc(243102:263447,:)=nan;
%%
t=(datenum(2002,1,1):datenum(2022,12,31))';
gpp=gpp*12.011/1000000*60*30; % in g C/m2 (半小时累积)
nee=nee*12.011/1000000*60*30; % in g C/m2 (半小时累积)
re=re*12.011/1000000*60*30; % in g C/m2 (半小时累积)
et=le./2.45/1000000*60*30; % in mm/0.5 hour
dvpd=vpd;
dgpp=gpp;
det=et;
dnee=nee;
dvpd(swin<20)=nan;
dgpp(swin<20)=nan;
det(swin<20)=nan;
dnee(swin<20)=nan;
co2=NANave(co2,48);
et=nansum(reshape(et,48,7670))';
g=NANave(g,48);
gpp=nansum(reshape(gpp,48,7670))';
h=NANave(h,48);
h2o=NANave(h2o,48);
le=NANave(le,48);
lwin=NANave(lwin,48);
lwout=NANave(lwout,48);
nee=nansum(reshape(nee,48,7670))';
pa=NANave(pa,48);
parin=NANave(parin,48);
parout=NANave(parout,48);
ppt=NANave(ppt,48)*48;
re=NANave(re,48)*48;
rh=NANave(rh,48);
rn=NANave(rn,48);
swc=NANave(swc,48);
swout=NANave(swout,48);
ta=NANave(ta,48);
ts=NANave(ts,48);
vpd=NANave(vpd,48);
wd=NANave(wd,48);
ws=NANave(ws,48);
dvpd=NANave(dvpd,48);
%dgpp=NANave(dgpp,48)*48;
%det=NANave(det,48)*48;
dgpp=nansum(reshape(dgpp,48,7670))';
det=nansum(reshape(det,48,7670))';
dnee=nansum(reshape(dnee,48,7670))';
swin=NANave(swin,48);

[co2Monmean,~,co2Yearmean,~,~,~,tMonmean,tYearmean] = Month_mean(t,co2,7670);
[gMonmean,~,gYearmean,~,~,~] = Month_mean(t,g,7670);
[~,~,~,~,gppMonsum,gppYearsum] = Month_mean(t,gpp,7670);
[hMonmean,~,hYearmean,~,~,~] = Month_mean(t,h,7670);
[h2oMonmean,~,h2oYearmean,~,~,~] = Month_mean(t,h2o,7670);
[leMonmean,~,leYearmean,~,~,~] = Month_mean(t,le,7670);
[~,~,~,~,etMonsum,etYearsum] = Month_mean(t,et,7670);
[lwinMonmean,~,lwinYearmean,~,~,~] = Month_mean(t,lwin,7670);
[lwoutMonmean,~,lwoutYearmean,~,~,~] = Month_mean(t,lwout,7670);
[~,~,~,~,neeMonsum,neeYearsum] = Month_mean(t,nee,7670);
[paMonmean,~,paYearmean,~,~,~] = Month_mean(t,pa,7670);
[parinMonmean,~,parinYearmean,~,~,~] = Month_mean(t,parin,7670);
[paroutMonmean,~,paroutYearmean,~,~,~] = Month_mean(t,parout,7670);
[~,~,~,~,pptMonsum,pptYearsum] = Month_mean(t,ppt,7670);
[~,~,~,~,reMonsum,reYearsum] = Month_mean(t,re,7670);
[rhMonmean,~,rhYearmean,~,~,~] = Month_mean(t,rh,7670);
[rnMonmean,~,rnYearmean,~,~,~] = Month_mean(t,rn,7670);

for i=1:4
[swcMonmean(:,i),~,swcYearmean(:,i),~,~,~] = Month_mean(t,swc(:,i),7670);
end
[swinMonmean,~,swinYearmean,~,~,~] = Month_mean(t,swin,7670);
[swoutMonmean,~,swoutYearmean,~,~,~] = Month_mean(t,swout,7670);
[taMonmean,~,taYearmean,~,~,~] = Month_mean(t,ta,7670);
for i=1:8
[tsMonmean(:,i),~,tsYearmean(:,i),~,~,~] = Month_mean(t,ts(:,i),7670);
end
[vpdMonmean,~,vpdYearmean,~,~,~] = Month_mean(t,vpd,7670);
[wdMonmean,~,wdYearmean,~,~,~] = Month_mean(t,wd,7670);
[wsMonmean,~,wsYearmean,~,~,~] = Month_mean(t,ws,7670);
[dvpdMonmean,~,dvpdYearmean,~,~,~] = Month_mean(t,dvpd,7670);
[~,~,~,~,dgppMonsum,dgppYearsum] = Month_mean(t,dgpp,7670);
[~,~,~,~,detMonsum,detYearsum] = Month_mean(t,det,7670);
[~,~,~,~,dneeMonsum,dneeYearsum] = Month_mean(t,dnee,7670);
clear i

%%
load('E:\Paper\HDF88\data\NDVI\matlab.mat')
ndvi(ndvi<0.7)=nan;
ndvi=ta_interp_points(ndvi,5);
[ndviMonmean,~,ndviYearmean] = Month_mean(ndvitime,ndvi,483);
clear lai laitime
