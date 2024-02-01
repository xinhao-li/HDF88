load('S2_gapfilled_data.mat', 'vpd')
load('S2_gapfilled_data.mat', 'h')
load('S2_gapfilled_data.mat', 'le')
load('S2_gapfilled_data.mat', 'ta')
load('S2_gapfilled_data.mat', 'swin')
load('S2_gapfilled_data.mat', 'ustar')
ti=(datenum(2002,1,1,0,0,0):datenum(0,0,0,0,30,0):datenum(2022,12,31,23,30,0))';
%%
%delete daytime data
vpd(swin>20)=[];
h(swin>20)=[];
le(swin>20)=[];
ta(swin>20)=[];
ustar(swin>20)=[];
ti(swin>20)=[];
swin(swin>20)=[];
%delete ustar threshole (0.16 by Nick Lee, 2020)
vpd(ustar<0.16)=[];
h(ustar<0.16)=[];
le(ustar<0.16)=[];
ta(ustar<0.16)=[];
ti(ustar<0.16)=[];
swin(ustar<0.16)=[];
ustar(ustar<0.16)=[];
%delete nighttime le < 0
vpd(le<0)=[];
h(le<0)=[];
ta(le<0)=[];
ustar(le<0)=[];
ti(le<0)=[];
swin(le<0)=[];
le(le<0)=[];

%%
vpd=premnmx(vpd);
h=premnmx(h);
ta=premnmx(ta);
ustar=premnmx(ustar);
ti=premnmx(ti);


input_ok=[vpd h ta ustar ti];
[output_ok,minA,maxA]=premnmx(le);

%%
load('S2_gapfilled_data.mat', 'vpd')
load('S2_gapfilled_data.mat', 'h')
load('S2_gapfilled_data.mat', 'le')
load('S2_gapfilled_data.mat', 'ta')
load('S2_gapfilled_data.mat', 'ustar')
load('S2_gapfilled_data.mat', 'swin')
ti=(datenum(2002,1,1,0,0,0):datenum(0,0,0,0,30,0):datenum(2022,12,31,23,30,0))';


vpd=premnmx(vpd);
h=premnmx(h);
ta=premnmx(ta);
ustar=premnmx(ustar);
ti=premnmx(ti);


input_ok=[vpd h ta ustar ti];

e_ANN=(net61.Network(input_ok')+net62.Network(input_ok')+net63.Network(input_ok')+net64.Network(input_ok')+net65.Network(input_ok'))/5;
e_ANN=postmnmx(e_ANN,minA,maxA);

%%
load('S3_3_1_ANN.mat', 'e_ANN')
load('S3_3_1_ANN.mat', 'le')
e_ANN=e_ANN';
load('S2_gapfilled_data.mat', 'swin')
for i=1:length(le)
    if swin(i)<20
        t(i)=0;
    else
        t(i)=le(i)-e_ANN(i);
    end
end
t=t';
half_hourly_t=t./2.45/1000000*60*30; % in mm/0.5 hour
clear t
load('S3_2_TEA.mat', 'daily_et')
load('S3_2_TEA.mat', 'monthly_et')
load('S3_2_TEA.mat', 'yearly_et')
load('S3_2_TEA.mat', 'ti')
daily_t=NANave(half_hourly_t,48)*48;
