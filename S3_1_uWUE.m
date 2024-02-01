load('S2_gapfilled_data.mat', 'gpp')
load('S2_gapfilled_data.mat', 'le')
load('S2_gapfilled_data.mat', 'vpd')
load('S2_gapfilled_data.mat', 't')
load('S2_gapfilled_data.mat', 'swin')
load('S2_gapfilled_data.mat', 'ppt')

gpp=gpp*12.011/1000000*60*30; % in g C/m2 (半小时累积)
et=le./2.45/1000000*60*30; % in mm/0.5 hour
gpp = FillSmallGapsByLinInterp(gpp,4);
gpp(find(isnan(gpp)))=0;

[y,m,d,~,~,~]=datevec(t);   %原为：mydatevec
yi=unique(y);
mi=unique(m);
di=unique(d);
gxv=gpp.*vpd.^0.5;
gxv(swin<20)=0;
et(swin<20)=0;

for i=1:length(yi)
    [p,~]=quantreg(et(find(y==yi(i))),gxv(find(y==yi(i))),.95,1);
    uwuep(i)=p(1);
end


%%

uwuea=[];
% for i=1:7670
%     [xData, yData] = prepareCurveData( et((i-1)*48+1:48*i), gxv((i-1)*48+1:48*i) );
%     ft = fittype( 'a*x', 'independent', 'x', 'dependent', 'y' );
%     opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
%     opts.Display = 'Off';
%     opts.StartPoint = 0;
%     [fitresult, ~] = fit( xData, yData, ft, opts );
%     uwuea(i)=fitresult.a;
% end

gxv(swin<20)=nan;
et(swin<20)=nan;
gxv(ppt>0.2)=nan;
et(ppt>0.2)=nan;
for i=1:7670
    if length(find(isnan(et((i-1)*48+1:48*i)))) <48
    [xData, yData] = prepareCurveData( et((i-1)*48+1:48*i), gxv((i-1)*48+1:48*i) );
    ft = fittype( 'a*x', 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'Off';
    opts.StartPoint = 0;
    [fitresult, ~] = fit( xData, yData, ft, opts );
    uwuea(i)=fitresult.a;
    else
        uwuea(i)=nan;
    end
end
%%
load('S2_gapfilled_data.mat', 'le')
et=le./2.45/1000000*60*30; % in mm/0.5 hour
et=NANave(et,48)*48;
t=(datenum(2002,1,1):datenum(2022,12,31))';
[y,~,~,~,~,~]=datevec(t);

for i=1:length(y)
    uwuepp(i)=uwuep(find(y(i)==yi));
end

for i=1:length(y)
    tet(i)=uwuea(i)./uwuepp(i);
    
end

tet(tet<0|tet>2)=nan;
t=tet'.*et;