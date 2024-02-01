fmet=['S2_gapfilled_data_1.csv'];
fnamemet=['E:\Paper\HDF88\data\',fmet];
a=readtable(fnamemet);

ta=a.Tair_f;
co2=a.co2_f;
g=a.g_f;
h=a.H_f;
le=a.LE_f;
h2o=a.h2o_f;
lwin=a.lwin_f;
lwout=a.lwout_f;
pa=a.pa_f;
parout=a.parout_f;
parin=a.parin_f;
ppt=a.ppt_f;
rh=a.rh_f;
rn=a.rn_f;
swc(:,1)=a.swc1_f;
swc(:,2)=a.swc2_f;
swc(:,3)=a.swc3_f;
swc(:,4)=a.swc4_f;
swin=a.Rg_f;
swout=a.swout_f;
ts(:,1)=a.Tsoil1_f;

clear a

fmet=['S2_gapfilled_data_2.csv'];
fnamemet=['E:\Paper\HDF88\data\',fmet];
aa=readtable(fnamemet);

ts(:,2)=aa.Tsoil2_f;
ts(:,3)=aa.Tsoil3_f;
ts(:,4)=aa.Tsoil4_f;
ts(:,5)=aa.Tsoil5_f;
ts(:,6)=aa.Tsoil6_f;
ts(:,7)=aa.Tsoil7_f;
ts(:,8)=aa.Tsoil8_f;
ustar=aa.Ustar_f;
vpd=aa.vpd_f;
ws=aa.ws_f;
wd=aa.wd_f;

clear aa

load('S1_1_amr_flux_data.mat', 'nee')
load('S1_1_amr_flux_data.mat', 're')
load('S1_1_amr_flux_data.mat', 'gpp')
load('S1_2_combined_data.mat', 'ti')
t=ti;clear ti

vpd(vpd<=0)=0.001;

%%
%download data from ubc database
rn=read_bor('\\annex001.landfood.ubc.ca\database\yyyy\Yf\clean\thirdstage\radiation_net_main',[],[],2002:2022);