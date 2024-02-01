h2=h+sh;
le2=le+sle;
for i=1:length(h)
    if isnan(h2(i))
        h2(i)=h(i);
    end
end

for i=1:length(le)
    if isnan(le2(i))
        le2(i)=le(i);
    end
end

le=le2;
h=h2;
clear h2 le2 i


g=nanmean(g,2);
swc2=swc(:,1:2);swc2=nanmean(swc2,2);swc3=swc(:,3:4);swc3=nanmean(swc3,2);swc(:,1)=swc2;swc(:,2)=swc3;swc(:,3:4)=[];
parin(parin<5)=0;
swin(swin<20)=0;
a=[co2 g h h2o le lwin lwout pa parin parout ppt rh rn swc swin swout ta ts ustar vpd ws wd];