clear;

%% Load clean square datasets
pre = 'o_Ra_sq';
o_final1=load(strcat(pre,int2str(1)));
o_final2=load(strcat(pre,int2str(2)));
o_final3=load(strcat(pre,int2str(3)));
o_final4=load(strcat(pre,int2str(4)));
o_final5=load(strcat(pre,int2str(5)));
o_final6=load(strcat(pre,int2str(6)));

o_final1 = o_final1.final;   %10x
o_final2 = o_final2.final;   %10x
o_final3 = o_final3.final;   %10x
o_final4 = o_final4.final;   %10x
o_final5 = o_final5.final;   %10x
o_final6 = o_final6.final;   %10x

pre = 'Ra_sq';
final1=load(strcat(pre,int2str(1)));
final2=load(strcat(pre,int2str(2)));
final3=load(strcat(pre,int2str(3)));
final4=load(strcat(pre,int2str(4)));
final5=load(strcat(pre,int2str(5)));
final6=load(strcat(pre,int2str(6)));
final7=load(strcat(pre,int2str(7)));
final8=load(strcat(pre,int2str(8)));
final9=load(strcat(pre,int2str(9)));
final10=load(strcat(pre,int2str(10)));

final1 = final1.final;   %10x
final2 = final2.final;   %10x
final3 = final3.final;
final4 = final4.final;
final5 = final5.final;   %50x
final6 = final6.final;   %50x
final7 = final7.final;
final8 = final8.final;   %50x
final9 = final9.final;
final10 = final10.final; %50x

%% boxplot of Ra values (10x, 50x, talysurf ground truth)
% Red
r1 = [o_final1,o_final2,o_final3,final4];
r1 = r1(:);
r3 = [final8,final10];
r3 = r3(:);
r4 = [0.018 0.02 0.024 0.022 0.024 0.021 0.016 0.02];
r4 = r4(:);
% Blue
r5 = [o_final6,final1,final2];
r5 = r5(:);
r7 = [final5,final6];
r7 = r7(:);
r8 = [0.024,0.025,0.033,0.032,0.026,0.029,0.028,0.043];
r8 = r8(:);

str1 = strcat('Red_10X');
str3 = strcat('Red_50X');
str4 = strcat('True_Red');
str5 = strcat('Blue_10X');
str7 = strcat('Blue_50X');
str8 = strcat('True_Blue');

g1 = repmat({str1},length(r1),1);
g3 = repmat({str3},length(r3),1);
g4 = repmat({str4},length(r4),1);
g5 = repmat({str5},length(r5),1);
g7 = repmat({str7},length(r7),1);
g8 = repmat({str8},length(r8),1);
r = [r1;r3;r4;r5;r7;r8];
g = [g1;g3;g4;g5;g7;g8];
figure()
boxplot(r,g);
set(findobj(gca,'type','line'),'linew',1.8)
set(gca,'fontweight','bold','fontsize',22);
ylabel('Ra (\mum)','fontsize',28);
title('Ra of profile slices from 30x30 outlier-free heightmaps','fontsize',27);
set(gca,'TickLabelInterpreter','none');
set(gca,'linewidth',1.5)

% xtickangle(20);