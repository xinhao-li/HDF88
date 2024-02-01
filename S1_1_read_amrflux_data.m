fmet=['AMF_CA-Ca3_BASE_HH_5-5.csv'];
fnamemet=['E:\Paper\HDF88\data\AMF_CA-Ca3_BASE-BADM_5-5\',fmet];
[~,~,rawmet]=xlsread(fnamemet);
xmet=cell2mat(rawmet(2:end,3:end));
xmetname=rawmet(1,3:end)';
ti=datenum(2001,1,1,0,30,0):datenum(0,0,0,0,30,0):datenum(2021,12,31,24,0,0);

%a=readtable(fnamemet);
%%
%plot
for i=1:length(xmetname)
    x1=xmet(:,i);

    x1(x1<-9997)=NaN;


    figure(i);
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperUnits', 'centimeters');
    set(gcf, 'PaperPosition', [1 2 34 14]);
    set(gcf,'units','centimeters');
    set(gcf,'position',[1 2 34 14]);
    subplot('position',[0.07,0.12,0.92,0.85])
    %---------------------------------
    hold on;
    plot(ti,x1,'.');
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel([xmetname{i}],'fontsize',16);
    pause
end


%%
%merge and check

%ta
ita=mystrmatch('TA',xmetname);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
aa=xmetname(ita);
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

ta=x1(:,1);ta2=x1(:,11);ta(280513:end)=[];ta2(1:280512)=[];ta=[ta;ta2];clear ta2

%rh
ita=mystrmatch('RH',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

rh=x1(:,2);rh2=x1(:,3);rh(174761:end)=[];rh2(1:174760)=[];rh=[rh;rh2];clear rh2

%ts
ita=mystrmatch('TS',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

x1(:,10:15)=[];x1(:,3)=[];ts=x1;

%G
ita=mystrmatch('G_',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

x1(:,7:end)=[];g=x1;g(:,2)=[];

%co2
ita=mystrmatch('CO2_',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

co2=x1(:,1);co22=x1(:,3);co2(175297:end)=[];co22(1:175296)=[];co2=[co2;co22];clear co22

%h2o
ita=mystrmatch('H2O',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

h2o=x1;

%ustar
ita=mystrmatch('USTAR',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

ustar=x1;

%le
ita=mystrmatch('LE',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

le=x1(:,4);

%h
ita=mystrmatch('H',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

h=x1(:,3);

%FC
ita=mystrmatch('FC',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

fc=x1;

%SC
ita=mystrmatch('SC',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

sc=x1;

%SG, SH, SLE, SB
ita=mystrmatch('S',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

sg=x1(:,39);sh=x1(:,8);sle=x1(:,7);sb=x1(:,9);

%ws
ita=mystrmatch('WS',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

ws=x1(:,3);ws2=x1(:,4);ws(175297:end)=[];ws2(1:175296)=[];ws=[ws;ws2];clear ws2

%nee
ita=mystrmatch('NEE',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

nee=x1(:,2);nee2=x1(:,3);nee(175297:end)=[];nee2(1:175296)=[];nee=[nee;nee2];clear nee2

%re
ita=mystrmatch('RECO',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

re=x1(:,2);re2=x1(:,3);re(175297:end)=[];re2(1:175296)=[];re=[re;re2];clear re2

%gpp
ita=mystrmatch('GPP',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

gpp=x1(:,2);gpp2=x1(:,3);gpp(175297:end)=[];gpp2(1:175296)=[];gpp=[gpp;gpp2];clear gpp2

%wd
ita=mystrmatch('WD',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

wd=x1;

%rn
ita=mystrmatch('NETRAD',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

rn=x1(:,3);rn2=x1(:,4);rn(175297:end)=[];rn2(1:175296)=[];rn=[rn;rn2];clear rn2
rn2=x1(:,2);rn(105169:122689)=rn2(105169:122689);clear rn2

%swin  swout
ita=mystrmatch('SW_',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

swin=x1(:,2);swin2=x1(:,7);swin(175297:end)=[];swin2(1:175296)=[];swin=[swin;swin2];clear swin2
swout=x1(:,5);swout2=x1(:,8);swout(175297:end)=[];swout2(1:175296)=[];swout=[swout;swout2];clear swout2
swout2=x1(:,3);swout(1:26677)=swout2(1:26677);clear swout2

%parin  parout
ita=mystrmatch('PPFD_',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

parin=x1(:,5);parin2=x1(:,6);parin(175297:end)=[];parin2(1:175296)=[];parin=[parin;parin2];clear parin2
parout=x1(:,4);

%ppt
ita=mystrmatch('RAIN_',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

ppt=x1(:,3);ppt2=x1(:,4);ppt(175297:end)=[];ppt2(1:175296)=[];ppt=[ppt;ppt2];clear ppt2

%pa
ita=mystrmatch('PA',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

pa=x1;

%lwin  lwout
ita=mystrmatch('LW_',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

lwin=x1(:,1);lwout=x1(:,2);

%swc
ita=mystrmatch('SWC',xmetname);aa=xmetname(ita);
x1=xmet(:,ita);
x1(x1<-9997)=NaN;
for i=1:length(aa)
    figure(i)
    plot(ti,x1(:,i))
    xlim([datenum(2001,1,1,0,30,0),datenum(2021,12,31,24,0,0)]);
    grid on;datetick('x','yyyy','keeplimits');
    ylabel(aa{i})
    pause
end

swc=[x1(:,3) x1(:,7) x1(:,4) x1(:,8) x1(:,5) x1(:,6)];

%vpd
vpd=0.61078.*(1-rh./100).*exp(17.27.*ta./(ta+237.3))*10;