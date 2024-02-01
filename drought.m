% standard_t3=[daily_t3(find(t==2002)) daily_t3(find(t==2003)) daily_t3(find(t==2005)) daily_t3(find(t==2006)) daily_t3(find(t==2007)) daily_t3(find(t==2009)) daily_t3(find(t==2010)) daily_t3(find(t==2011)) daily_t3(find(t==2013)) daily_t3(find(t==2014)) daily_t3(find(t==2015)) daily_t3(find(t==2017)) daily_t3(find(t==2018)) daily_t3(find(t==2019)) daily_t3(find(t==2021)) daily_t3(find(t==2022))];
% a=daily_t3(find(t==2004));a(end)=[];
% standard_t3=[standard_t3 a];
% a=daily_t3(find(t==2008));a(end)=[];
% standard_t3=[standard_t3 a];
% a=daily_t3(find(t==2012));a(end)=[];
% standard_t3=[standard_t3 a];
% a=daily_t3(find(t==2016));a(end)=[];
% standard_t3=[standard_t3 a];
% a=daily_t3(find(t==2020));a(end)=[];
% standard_t3=[standard_t3 a];
% standard_t3=nanmean(standard_t3,2);
%%
load('S3_3_3.mat', 'daily_et')
load('S3_3_3.mat', 'daily_t1')
load('S3_3_3.mat', 'daily_t2')
load('S3_3_3.mat', 'daily_t3')
load('S4_1_mean_data.mat', 'swc')

swc(:,2:end)=[];swc=swc/100;
t=(datenum(2002,1,1):datenum(2022,12,31))';
t=datevec(t);t(:,2:end)=[];
for i=1:21
    ind=find(t==i+2001);
    ind2{i}=find(swc(ind)<0.11);
end
ind2{18}=[];ind2{21}=[];

a=daily_et(find(t==2020));a(end)=[];
standard_et=[daily_et(find(t==2019)) a daily_et(find(t==2022))];standard_et=nanmean(standard_et,2);
ind=find(t==2002);et2=daily_et(ind);delta_et(1)=nansum(standard_et(ind2{1})-et2(ind2{1}))./nansum(standard_et(ind2{1}));
ind=find(t==2003);et2=daily_et(ind);delta_et(2)=nansum(standard_et(ind2{2})-et2(ind2{2}))./nansum(standard_et(ind2{2}));
ind=find(t==2004);et2=daily_et(ind);delta_et(3)=nansum(standard_et(ind2{3})-et2(ind2{3}))./nansum(standard_et(ind2{3}));
ind=find(t==2005);et2=daily_et(ind);delta_et(4)=nansum(standard_et(ind2{4})-et2(ind2{4}))./nansum(standard_et(ind2{4}));
ind=find(t==2006);et2=daily_et(ind);delta_et(5)=nansum(standard_et(ind2{5})-et2(ind2{5}))./nansum(standard_et(ind2{5}));
ind=find(t==2007);et2=daily_et(ind);delta_et(6)=nansum(standard_et(ind2{6})-et2(ind2{6}))./nansum(standard_et(ind2{6}));
ind=find(t==2008);et2=daily_et(ind);delta_et(7)=nansum(standard_et(ind2{7})-et2(ind2{7}))./nansum(standard_et(ind2{7}));
ind=find(t==2009);et2=daily_et(ind);delta_et(8)=nansum(standard_et(ind2{8})-et2(ind2{8}))./nansum(standard_et(ind2{8}));
ind=find(t==2010);et2=daily_et(ind);delta_et(9)=nansum(standard_et(ind2{9})-et2(ind2{9}))./nansum(standard_et(ind2{9}));
ind=find(t==2011);et2=daily_et(ind);delta_et(10)=nansum(standard_et(ind2{10})-et2(ind2{10}))./nansum(standard_et(ind2{10}));
ind=find(t==2012);et2=daily_et(ind);delta_et(11)=nansum(standard_et(ind2{11})-et2(ind2{11}))./nansum(standard_et(ind2{11}));
ind=find(t==2013);et2=daily_et(ind);delta_et(12)=nansum(standard_et(ind2{12})-et2(ind2{12}))./nansum(standard_et(ind2{12}));
ind=find(t==2014);et2=daily_et(ind);delta_et(13)=nansum(standard_et(ind2{13})-et2(ind2{13}))./nansum(standard_et(ind2{13}));
ind=find(t==2015);et2=daily_et(ind);delta_et(14)=nansum(standard_et(ind2{14})-et2(ind2{14}))./nansum(standard_et(ind2{14}));
ind=find(t==2017);et2=daily_et(ind);delta_et(15)=nansum(standard_et(ind2{16})-et2(ind2{16}))./nansum(standard_et(ind2{16}));
ind=find(t==2018);et2=daily_et(ind);delta_et(16)=nansum(standard_et(ind2{17})-et2(ind2{17}))./nansum(standard_et(ind2{17}));
ind=find(t==2021);et2=daily_et(ind);delta_et(17)=nansum(standard_et(ind2{20})-et2(ind2{20}))./nansum(standard_et(ind2{20}));
%%
a=daily_t1(find(t==2020));a(end)=[];
standard_t1=[daily_t1(find(t==2019)) a daily_t1(find(t==2022))];standard_t1=nanmean(standard_t1,2);
ind=find(t==2002);et2=daily_t1(ind);delta_t1(1)=nansum(standard_t1(ind2{1})-et2(ind2{1}))./nansum(standard_t1(ind2{1}));
ind=find(t==2003);et2=daily_t1(ind);delta_t1(2)=nansum(standard_t1(ind2{2})-et2(ind2{2}))./nansum(standard_t1(ind2{2}));
ind=find(t==2004);et2=daily_t1(ind);delta_t1(3)=nansum(standard_t1(ind2{3})-et2(ind2{3}))./nansum(standard_t1(ind2{3}));
ind=find(t==2005);et2=daily_t1(ind);delta_t1(4)=nansum(standard_t1(ind2{4})-et2(ind2{4}))./nansum(standard_t1(ind2{4}));
ind=find(t==2006);et2=daily_t1(ind);delta_t1(5)=nansum(standard_t1(ind2{5})-et2(ind2{5}))./nansum(standard_t1(ind2{5}));
ind=find(t==2007);et2=daily_t1(ind);delta_t1(6)=nansum(standard_t1(ind2{6})-et2(ind2{6}))./nansum(standard_t1(ind2{6}));
ind=find(t==2008);et2=daily_t1(ind);delta_t1(7)=nansum(standard_t1(ind2{7})-et2(ind2{7}))./nansum(standard_t1(ind2{7}));
ind=find(t==2009);et2=daily_t1(ind);delta_t1(8)=nansum(standard_t1(ind2{8})-et2(ind2{8}))./nansum(standard_t1(ind2{8}));
ind=find(t==2010);et2=daily_t1(ind);delta_t1(9)=nansum(standard_t1(ind2{9})-et2(ind2{9}))./nansum(standard_t1(ind2{9}));
ind=find(t==2011);et2=daily_t1(ind);delta_t1(10)=nansum(standard_t1(ind2{10})-et2(ind2{10}))./nansum(standard_t1(ind2{10}));
ind=find(t==2012);et2=daily_t1(ind);delta_t1(11)=nansum(standard_t1(ind2{11})-et2(ind2{11}))./nansum(standard_t1(ind2{11}));
ind=find(t==2013);et2=daily_t1(ind);delta_t1(12)=nansum(standard_t1(ind2{12})-et2(ind2{12}))./nansum(standard_t1(ind2{12}));
ind=find(t==2014);et2=daily_t1(ind);delta_t1(13)=nansum(standard_t1(ind2{13})-et2(ind2{13}))./nansum(standard_t1(ind2{13}));
ind=find(t==2015);et2=daily_t1(ind);delta_t1(14)=nansum(standard_t1(ind2{14})-et2(ind2{14}))./nansum(standard_t1(ind2{14}));
ind=find(t==2017);et2=daily_t1(ind);delta_t1(15)=nansum(standard_t1(ind2{16})-et2(ind2{16}))./nansum(standard_t1(ind2{16}));
ind=find(t==2018);et2=daily_t1(ind);delta_t1(16)=nansum(standard_t1(ind2{17})-et2(ind2{17}))./nansum(standard_t1(ind2{17}));
ind=find(t==2021);et2=daily_t1(ind);delta_t1(17)=nansum(standard_t1(ind2{20})-et2(ind2{20}))./nansum(standard_t1(ind2{20}));
%%
a=daily_t2(find(t==2020));a(end)=[];
standard_t2=[daily_t2(find(t==2019)) a daily_t2(find(t==2022))];standard_t2=nanmean(standard_t2,2);
ind=find(t==2002);et2=daily_t2(ind);delta_t2(1)=nansum(standard_t2(ind2{1})-et2(ind2{1}))./nansum(standard_t2(ind2{1}));
ind=find(t==2003);et2=daily_t2(ind);delta_t2(2)=nansum(standard_t2(ind2{2})-et2(ind2{2}))./nansum(standard_t2(ind2{2}));
ind=find(t==2004);et2=daily_t2(ind);delta_t2(3)=nansum(standard_t2(ind2{3})-et2(ind2{3}))./nansum(standard_t2(ind2{3}));
ind=find(t==2005);et2=daily_t2(ind);delta_t2(4)=nansum(standard_t2(ind2{4})-et2(ind2{4}))./nansum(standard_t2(ind2{4}));
ind=find(t==2006);et2=daily_t2(ind);delta_t2(5)=nansum(standard_t2(ind2{5})-et2(ind2{5}))./nansum(standard_t2(ind2{5}));
ind=find(t==2007);et2=daily_t2(ind);delta_t2(6)=nansum(standard_t2(ind2{6})-et2(ind2{6}))./nansum(standard_t2(ind2{6}));
ind=find(t==2008);et2=daily_t2(ind);delta_t2(7)=nansum(standard_t2(ind2{7})-et2(ind2{7}))./nansum(standard_t2(ind2{7}));
ind=find(t==2009);et2=daily_t2(ind);delta_t2(8)=nansum(standard_t2(ind2{8})-et2(ind2{8}))./nansum(standard_t2(ind2{8}));
ind=find(t==2010);et2=daily_t2(ind);delta_t2(9)=nansum(standard_t2(ind2{9})-et2(ind2{9}))./nansum(standard_t2(ind2{9}));
ind=find(t==2011);et2=daily_t2(ind);delta_t2(10)=nansum(standard_t2(ind2{10})-et2(ind2{10}))./nansum(standard_t2(ind2{10}));
ind=find(t==2012);et2=daily_t2(ind);delta_t2(11)=nansum(standard_t2(ind2{11})-et2(ind2{11}))./nansum(standard_t2(ind2{11}));
ind=find(t==2013);et2=daily_t2(ind);delta_t2(12)=nansum(standard_t2(ind2{12})-et2(ind2{12}))./nansum(standard_t2(ind2{12}));
ind=find(t==2014);et2=daily_t2(ind);delta_t2(13)=nansum(standard_t2(ind2{13})-et2(ind2{13}))./nansum(standard_t2(ind2{13}));
ind=find(t==2015);et2=daily_t2(ind);delta_t2(14)=nansum(standard_t2(ind2{14})-et2(ind2{14}))./nansum(standard_t2(ind2{14}));
ind=find(t==2017);et2=daily_t2(ind);delta_t2(15)=nansum(standard_t2(ind2{16})-et2(ind2{16}))./nansum(standard_t2(ind2{16}));
ind=find(t==2018);et2=daily_t2(ind);delta_t2(16)=nansum(standard_t2(ind2{17})-et2(ind2{17}))./nansum(standard_t2(ind2{17}));
ind=find(t==2021);et2=daily_t2(ind);delta_t2(17)=nansum(standard_t2(ind2{20})-et2(ind2{20}))./nansum(standard_t2(ind2{20}));
%%
a=daily_t3(find(t==2020));a(end)=[];
standard_t3=[daily_t3(find(t==2019)) a daily_t3(find(t==2022))];standard_t3=nanmean(standard_t3,2);
ind=find(t==2002);et3=daily_t3(ind);delta_t3(1)=nansum(standard_t3(ind2{1})-et3(ind2{1}))./nansum(standard_t3(ind2{1}));
ind=find(t==2003);et3=daily_t3(ind);delta_t3(2)=nansum(standard_t3(ind2{2})-et3(ind2{2}))./nansum(standard_t3(ind2{2}));
ind=find(t==2004);et3=daily_t3(ind);delta_t3(3)=nansum(standard_t3(ind2{3})-et3(ind2{3}))./nansum(standard_t3(ind2{3}));
ind=find(t==2005);et3=daily_t3(ind);delta_t3(4)=nansum(standard_t3(ind2{4})-et3(ind2{4}))./nansum(standard_t3(ind2{4}));
ind=find(t==2006);et3=daily_t3(ind);delta_t3(5)=nansum(standard_t3(ind2{5})-et3(ind2{5}))./nansum(standard_t3(ind2{5}));
ind=find(t==2007);et3=daily_t3(ind);delta_t3(6)=nansum(standard_t3(ind2{6})-et3(ind2{6}))./nansum(standard_t3(ind2{6}));
ind=find(t==2008);et3=daily_t3(ind);delta_t3(7)=nansum(standard_t3(ind2{7})-et3(ind2{7}))./nansum(standard_t3(ind2{7}));
ind=find(t==2009);et3=daily_t3(ind);delta_t3(8)=nansum(standard_t3(ind2{8})-et3(ind2{8}))./nansum(standard_t3(ind2{8}));
ind=find(t==2010);et3=daily_t3(ind);delta_t3(9)=nansum(standard_t3(ind2{9})-et3(ind2{9}))./nansum(standard_t3(ind2{9}));
ind=find(t==2011);et3=daily_t3(ind);delta_t3(10)=nansum(standard_t3(ind2{10})-et3(ind2{10}))./nansum(standard_t3(ind2{10}));
ind=find(t==2012);et3=daily_t3(ind);delta_t3(11)=nansum(standard_t3(ind2{11})-et3(ind2{11}))./nansum(standard_t3(ind2{11}));
ind=find(t==2013);et3=daily_t3(ind);delta_t3(12)=nansum(standard_t3(ind2{12})-et3(ind2{12}))./nansum(standard_t3(ind2{12}));
ind=find(t==2014);et3=daily_t3(ind);delta_t3(13)=nansum(standard_t3(ind2{13})-et3(ind2{13}))./nansum(standard_t3(ind2{13}));
ind=find(t==2015);et3=daily_t3(ind);delta_t3(14)=nansum(standard_t3(ind2{14})-et3(ind2{14}))./nansum(standard_t3(ind2{14}));
ind=find(t==2017);et3=daily_t3(ind);delta_t3(15)=nansum(standard_t3(ind2{16})-et3(ind2{16}))./nansum(standard_t3(ind2{16}));
ind=find(t==2018);et3=daily_t3(ind);delta_t3(16)=nansum(standard_t3(ind2{17})-et3(ind2{17}))./nansum(standard_t3(ind2{17}));
ind=find(t==2021);et3=daily_t3(ind);delta_t3(17)=nansum(standard_t3(ind2{20})-et3(ind2{20}))./nansum(standard_t3(ind2{20}));
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%算夏季干旱期t/et与正常期t/et
load('S3_3_3.mat', 'daily_et')
load('S3_3_3.mat', 'daily_t1')
load('S3_3_3.mat', 'daily_t2')
load('S3_3_3.mat', 'daily_t3')
load('S4_1_mean_data.mat', 'swc')

swc(:,2:end)=[];swc=swc/100;
t=(datenum(2002,1,1):datenum(2022,12,31))';
t=datevec(t);t(:,2:end)=[];
for i=1:21
    ind=find(t==i+2001);
    ind2{i}=find(swc(ind)<0.11);
end
ind2{18}=[];ind2{21}=[];

a=daily_et(find(t==2020));a(end)=[];
standard_et=[daily_et(find(t==2019)) a daily_et(find(t==2022))];standard_et=nanmean(standard_et,2);
ind=find(t==2002);et2=daily_et(ind);delta_et(1)=nansum(et2(ind2{1}));standard_delta_et(1)=nansum(standard_et(ind2{1}));
ind=find(t==2003);et2=daily_et(ind);delta_et(2)=nansum(et2(ind2{2}));standard_delta_et(2)=nansum(standard_et(ind2{2}));
ind=find(t==2004);et2=daily_et(ind);delta_et(3)=nansum(et2(ind2{3}));standard_delta_et(3)=nansum(standard_et(ind2{3}));
ind=find(t==2005);et2=daily_et(ind);delta_et(4)=nansum(et2(ind2{4}));standard_delta_et(4)=nansum(standard_et(ind2{4}));
ind=find(t==2006);et2=daily_et(ind);delta_et(5)=nansum(et2(ind2{5}));standard_delta_et(5)=nansum(standard_et(ind2{5}));
ind=find(t==2007);et2=daily_et(ind);delta_et(6)=nansum(et2(ind2{6}));standard_delta_et(6)=nansum(standard_et(ind2{6}));
ind=find(t==2008);et2=daily_et(ind);delta_et(7)=nansum(et2(ind2{7}));standard_delta_et(7)=nansum(standard_et(ind2{7}));
ind=find(t==2009);et2=daily_et(ind);delta_et(8)=nansum(et2(ind2{8}));standard_delta_et(8)=nansum(standard_et(ind2{8}));
ind=find(t==2010);et2=daily_et(ind);delta_et(9)=nansum(et2(ind2{9}));standard_delta_et(9)=nansum(standard_et(ind2{9}));
ind=find(t==2011);et2=daily_et(ind);delta_et(10)=nansum(et2(ind2{10}));standard_delta_et(10)=nansum(standard_et(ind2{10}));
ind=find(t==2012);et2=daily_et(ind);delta_et(11)=nansum(et2(ind2{11}));standard_delta_et(11)=nansum(standard_et(ind2{11}));
ind=find(t==2013);et2=daily_et(ind);delta_et(12)=nansum(et2(ind2{12}));standard_delta_et(12)=nansum(standard_et(ind2{12}));
ind=find(t==2014);et2=daily_et(ind);delta_et(13)=nansum(et2(ind2{13}));standard_delta_et(13)=nansum(standard_et(ind2{13}));
ind=find(t==2015);et2=daily_et(ind);delta_et(14)=nansum(et2(ind2{14}));standard_delta_et(14)=nansum(standard_et(ind2{14}));
ind=find(t==2017);et2=daily_et(ind);delta_et(15)=nansum(et2(ind2{16}));standard_delta_et(15)=nansum(standard_et(ind2{16}));
ind=find(t==2018);et2=daily_et(ind);delta_et(16)=nansum(et2(ind2{17}));standard_delta_et(16)=nansum(standard_et(ind2{17}));
ind=find(t==2021);et2=daily_et(ind);delta_et(17)=nansum(et2(ind2{20}));standard_delta_et(17)=nansum(standard_et(ind2{20}));
%%
a=daily_t1(find(t==2020));a(end)=[];
standard_t1=[daily_t1(find(t==2019)) a daily_t1(find(t==2022))];standard_t1=nanmean(standard_t1,2);
ind=find(t==2002);et2=daily_t1(ind);delta_t1(1)=nansum(et2(ind2{1}));standard_delta_t1(1)=nansum(standard_t1(ind2{1}));
ind=find(t==2003);et2=daily_t1(ind);delta_t1(2)=nansum(et2(ind2{2}));standard_delta_t1(2)=nansum(standard_t1(ind2{2}));
ind=find(t==2004);et2=daily_t1(ind);delta_t1(3)=nansum(et2(ind2{3}));standard_delta_t1(3)=nansum(standard_t1(ind2{3}));
ind=find(t==2005);et2=daily_t1(ind);delta_t1(4)=nansum(et2(ind2{4}));standard_delta_t1(4)=nansum(standard_t1(ind2{4}));
ind=find(t==2006);et2=daily_t1(ind);delta_t1(5)=nansum(et2(ind2{5}));standard_delta_t1(5)=nansum(standard_t1(ind2{5}));
ind=find(t==2007);et2=daily_t1(ind);delta_t1(6)=nansum(et2(ind2{6}));standard_delta_t1(6)=nansum(standard_t1(ind2{6}));
ind=find(t==2008);et2=daily_t1(ind);delta_t1(7)=nansum(et2(ind2{7}));standard_delta_t1(7)=nansum(standard_t1(ind2{7}));
ind=find(t==2009);et2=daily_t1(ind);delta_t1(8)=nansum(et2(ind2{8}));standard_delta_t1(8)=nansum(standard_t1(ind2{8}));
ind=find(t==2010);et2=daily_t1(ind);delta_t1(9)=nansum(et2(ind2{9}));standard_delta_t1(9)=nansum(standard_t1(ind2{9}));
ind=find(t==2011);et2=daily_t1(ind);delta_t1(10)=nansum(et2(ind2{10}));standard_delta_t1(10)=nansum(standard_t1(ind2{10}));
ind=find(t==2012);et2=daily_t1(ind);delta_t1(11)=nansum(et2(ind2{11}));standard_delta_t1(11)=nansum(standard_t1(ind2{11}));
ind=find(t==2013);et2=daily_t1(ind);delta_t1(12)=nansum(et2(ind2{12}));standard_delta_t1(12)=nansum(standard_t1(ind2{12}));
ind=find(t==2014);et2=daily_t1(ind);delta_t1(13)=nansum(et2(ind2{13}));standard_delta_t1(13)=nansum(standard_t1(ind2{13}));
ind=find(t==2015);et2=daily_t1(ind);delta_t1(14)=nansum(et2(ind2{14}));standard_delta_t1(14)=nansum(standard_t1(ind2{14}));
ind=find(t==2017);et2=daily_t1(ind);delta_t1(15)=nansum(et2(ind2{16}));standard_delta_t1(15)=nansum(standard_t1(ind2{16}));
ind=find(t==2018);et2=daily_t1(ind);delta_t1(16)=nansum(et2(ind2{17}));standard_delta_t1(16)=nansum(standard_t1(ind2{17}));
ind=find(t==2021);et2=daily_t1(ind);delta_t1(17)=nansum(et2(ind2{20}));standard_delta_t1(17)=nansum(standard_t1(ind2{20}));
%%
a=daily_t2(find(t==2020));a(end)=[];
standard_t2=[daily_t2(find(t==2019)) a daily_t2(find(t==2022))];standard_t2=nanmean(standard_t2,2);
ind=find(t==2002);et2=daily_t2(ind);delta_t2(1)=nansum(et2(ind2{1}));standard_delta_t2(1)=nansum(standard_t2(ind2{1}));
ind=find(t==2003);et2=daily_t2(ind);delta_t2(2)=nansum(et2(ind2{2}));standard_delta_t2(2)=nansum(standard_t2(ind2{2}));
ind=find(t==2004);et2=daily_t2(ind);delta_t2(3)=nansum(et2(ind2{3}));standard_delta_t2(3)=nansum(standard_t2(ind2{3}));
ind=find(t==2005);et2=daily_t2(ind);delta_t2(4)=nansum(et2(ind2{4}));standard_delta_t2(4)=nansum(standard_t2(ind2{4}));
ind=find(t==2006);et2=daily_t2(ind);delta_t2(5)=nansum(et2(ind2{5}));standard_delta_t2(5)=nansum(standard_t2(ind2{5}));
ind=find(t==2007);et2=daily_t2(ind);delta_t2(6)=nansum(et2(ind2{6}));standard_delta_t2(6)=nansum(standard_t2(ind2{6}));
ind=find(t==2008);et2=daily_t2(ind);delta_t2(7)=nansum(et2(ind2{7}));standard_delta_t2(7)=nansum(standard_t2(ind2{7}));
ind=find(t==2009);et2=daily_t2(ind);delta_t2(8)=nansum(et2(ind2{8}));standard_delta_t2(8)=nansum(standard_t2(ind2{8}));
ind=find(t==2010);et2=daily_t2(ind);delta_t2(9)=nansum(et2(ind2{9}));standard_delta_t2(9)=nansum(standard_t2(ind2{9}));
ind=find(t==2011);et2=daily_t2(ind);delta_t2(10)=nansum(et2(ind2{10}));standard_delta_t2(10)=nansum(standard_t2(ind2{10}));
ind=find(t==2012);et2=daily_t2(ind);delta_t2(11)=nansum(et2(ind2{11}));standard_delta_t2(11)=nansum(standard_t2(ind2{11}));
ind=find(t==2013);et2=daily_t2(ind);delta_t2(12)=nansum(et2(ind2{12}));standard_delta_t2(12)=nansum(standard_t2(ind2{12}));
ind=find(t==2014);et2=daily_t2(ind);delta_t2(13)=nansum(et2(ind2{13}));standard_delta_t2(13)=nansum(standard_t2(ind2{13}));
ind=find(t==2015);et2=daily_t2(ind);delta_t2(14)=nansum(et2(ind2{14}));standard_delta_t2(14)=nansum(standard_t2(ind2{14}));
ind=find(t==2017);et2=daily_t2(ind);delta_t2(15)=nansum(et2(ind2{16}));standard_delta_t2(15)=nansum(standard_t2(ind2{16}));
ind=find(t==2018);et2=daily_t2(ind);delta_t2(16)=nansum(et2(ind2{17}));standard_delta_t2(16)=nansum(standard_t2(ind2{17}));
ind=find(t==2021);et2=daily_t2(ind);delta_t2(17)=nansum(et2(ind2{20}));standard_delta_t2(17)=nansum(standard_t2(ind2{20}));
%%
a=daily_t3(find(t==2020));a(end)=[];
standard_t3=[daily_t3(find(t==2019)) a daily_t3(find(t==2022))];standard_t3=nanmean(standard_t3,2);
ind=find(t==2002);et2=daily_t3(ind);delta_t3(1)=nansum(et2(ind2{1}));standard_delta_t3(1)=nansum(standard_t3(ind2{1}));
ind=find(t==2003);et2=daily_t3(ind);delta_t3(2)=nansum(et2(ind2{2}));standard_delta_t3(2)=nansum(standard_t3(ind2{2}));
ind=find(t==2004);et2=daily_t3(ind);delta_t3(3)=nansum(et2(ind2{3}));standard_delta_t3(3)=nansum(standard_t3(ind2{3}));
ind=find(t==2005);et2=daily_t3(ind);delta_t3(4)=nansum(et2(ind2{4}));standard_delta_t3(4)=nansum(standard_t3(ind2{4}));
ind=find(t==2006);et2=daily_t3(ind);delta_t3(5)=nansum(et2(ind2{5}));standard_delta_t3(5)=nansum(standard_t3(ind2{5}));
ind=find(t==2007);et2=daily_t3(ind);delta_t3(6)=nansum(et2(ind2{6}));standard_delta_t3(6)=nansum(standard_t3(ind2{6}));
ind=find(t==2008);et2=daily_t3(ind);delta_t3(7)=nansum(et2(ind2{7}));standard_delta_t3(7)=nansum(standard_t3(ind2{7}));
ind=find(t==2009);et2=daily_t3(ind);delta_t3(8)=nansum(et2(ind2{8}));standard_delta_t3(8)=nansum(standard_t3(ind2{8}));
ind=find(t==2010);et2=daily_t3(ind);delta_t3(9)=nansum(et2(ind2{9}));standard_delta_t3(9)=nansum(standard_t3(ind2{9}));
ind=find(t==2011);et2=daily_t3(ind);delta_t3(10)=nansum(et2(ind2{10}));standard_delta_t3(10)=nansum(standard_t3(ind2{10}));
ind=find(t==2012);et2=daily_t3(ind);delta_t3(11)=nansum(et2(ind2{11}));standard_delta_t3(11)=nansum(standard_t3(ind2{11}));
ind=find(t==2013);et2=daily_t3(ind);delta_t3(12)=nansum(et2(ind2{12}));standard_delta_t3(12)=nansum(standard_t3(ind2{12}));
ind=find(t==2014);et2=daily_t3(ind);delta_t3(13)=nansum(et2(ind2{13}));standard_delta_t3(13)=nansum(standard_t3(ind2{13}));
ind=find(t==2015);et2=daily_t3(ind);delta_t3(14)=nansum(et2(ind2{14}));standard_delta_t3(14)=nansum(standard_t3(ind2{14}));
ind=find(t==2017);et2=daily_t3(ind);delta_t3(15)=nansum(et2(ind2{16}));standard_delta_t3(15)=nansum(standard_t3(ind2{16}));
ind=find(t==2018);et2=daily_t3(ind);delta_t3(16)=nansum(et2(ind2{17}));standard_delta_t3(16)=nansum(standard_t3(ind2{17}));
ind=find(t==2021);et2=daily_t3(ind);delta_t3(17)=nansum(et2(ind2{20}));standard_delta_t3(17)=nansum(standard_t3(ind2{20}));
%%
delta_tet1=delta_t1./delta_et;
delta_tet2=delta_t2./delta_et;
delta_tet3=delta_t3./delta_et;
standard_delta_tet1=standard_delta_t1./standard_delta_et;
standard_delta_tet2=standard_delta_t2./standard_delta_et;
standard_delta_tet3=standard_delta_t3./standard_delta_et;
