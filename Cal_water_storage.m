load('S2_gapfilled_data.mat', 'swc')
swc(243102:263447,:)=nan;
swc=swc/100;
swc(swc>0.6)=0.6;

storage(:,1)=swc(:,1)*5;%in cm
storage(:,2)=swc(:,2)*15;%in cm
storage(:,3)=swc(:,3)*30;%in cm
storage(:,4)=swc(:,4)*50;%in cm

storage=nansum(storage,2)/100;%in m
storage(storage==0)=nan;

%%
daily_storage=NANave(storage,48);
t=(datenum(2002,1,1):datenum(2022,12,31))';
[storageMonmean,~,storageYearmean,~,~,~] = Month_mean(t,daily_storage,7670);

%%
delta_storage=reshape(storage,48,7670);

for i=1:7669
    a(i,1)=delta_storage(1,i+1)-delta_storage(1,i);
end
a(7670)=delta_storage(48,7670)-delta_storage(1,7670);
delta_storage=a;
clear i a
[~,~,~,~,delta_storageMonsum,delta_storageYearsum] = Month_mean(t,delta_storage,7670);
delta_storageMonsum(delta_storageMonsum==0)=nan;
delta_storageYearsum(delta_storageYearsum==0)=nan;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('S4_1_mean_data.mat', 'ppt')
load('S4_1_mean_data.mat', 'et')
runoff=ppt-et-delta_storage*1000;
[~,~,~,~,runoffMonsum,runoffYearsum] = Month_mean(t,runoff,7670);
runoffMonsum(runoffMonsum==0)=nan;
runoffYearsum(runoffYearsum==0)=nan;