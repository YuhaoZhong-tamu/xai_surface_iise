clear;

%% Load the half FFT magnitude spectrum
sq = load('sq_final600_um.mat');
sq = sq.sq;

num = 600;  % change this to a value btw 1-600 for different outputs
surf(sq(:,:,num));
figure();
view(0,90);
xticks([0 10 20 30])
xticklabels({num2str((815/1000)*0),num2str((815/1000)*10),num2str((815/1000)*20),'24.45 \mum'})
yticks([0 10 20 30])
yticklabels({num2str((815/1000)*0),num2str((815/1000)*10),num2str((815/1000)*20),'24.45 \mum'})
a = get(gca,'XTickLabel');  
b = get(gca,'YTickLabel');  
set(gca,'XTickLabel',a,'fontsize',23,'FontWeight','bold');
set(gca,'YTickLabel',b,'fontsize',23,'FontWeight','bold');
h = colorbar;
title(h,'Height (\mum)');
set(h,'fontsize',23);
% title({'Original Height Map ',num2str(num)});

%% Load the half FFT magnitude spectrum
sq_fft = fft2(padarray(sq(:,:,num),[35 35],0,'both'));
shift_f_t = fftshift(sq_fft);
absf_t = abs(shift_f_t);
half_sq = absf_t(1:51,:);
figure();
imagesc(half_sq);
xticks([1 50 100])
xticklabels({num2str(round(1/(2*815)*10000,2)),'0',num2str(round(1/(2*815)*10000,2))})
yticks([3 50])
yticklabels({num2str(round(1/(2*815)*10000,2)),'0'})
a = get(gca,'XTickLabel');  
b = get(gca,'YTickLabel');  
set(gca,'XTickLabel',a,'fontsize',29,'FontWeight','bold');
set(gca,'YTickLabel',b,'fontsize',29,'FontWeight','bold');
ylabel('Frequency (10^{-1} \mum^{-1})');
xlabel('Frequency (10^{-1} \mum^{-1})');
h = colorbar;
set(h,'fontsize',23);
