clear;clc;
%this file generates figures for the ATB report

%load data 
S1=load('20_0.61_yes.mat');
S2=load('20_0.5_yes.mat');
S3=load('20_0.4_yes.mat');
S4=load('20_0.2_yes.mat');
S5=load('20_0.61_no.mat');
S6=load('20_0.5_no.mat');
S7=load('20_0.4_no.mat');
S8=load('20_0.4_yes_mask.mat');
S9=load('20_0.2_no.mat');

ndays=541; %60 days 9 hours per day
ntry=100;

%%%%%%%%%%%%%%%%%%%%%%%
%save all the data

%"S1"
ci1 = nonpar(S1,ndays,ntry);
mu1 = meaninf(S1,ndays,ntry);
mu_try1 = num_try(S1,ntry);
mu_inf1 = num_inf(S1,ntry);
mu_time1 = total_time(S1,ntry);
med1=medinf(S1,ndays,ntry);
mu_iqr1=iqrinf(S1,ntry);
try_iqr1=iqrtry(S1,ntry);
time_iqr1=iqrtime(S1,ntry);

%"S2"
ci2 = nonpar(S2,ndays,ntry);
mu2 = meaninf(S2,ndays,ntry);
mu_try2 = num_try(S2,ntry);
mu_inf2 = num_inf(S2,ntry);
mu_time2 = total_time(S2,ntry);
med2=medinf(S2,ndays,ntry);
mu_iqr2=iqrinf(S2,ntry);
try_iqr2=iqrtry(S2,ntry);
time_iqr2=iqrtime(S2,ntry);

%"S3"
ci3 = nonpar(S3,ndays,ntry);
mu3 = meaninf(S3,ndays,ntry);
mu_try3 = num_try(S3,ntry);
mu_inf3 = num_inf(S3,ntry);
mu_time3 = total_time(S3,ntry);
med3=medinf(S3,ndays,ntry);
mu_iqr3=iqrinf(S3,ntry);
try_iqr3=iqrtry(S3,ntry);
time_iqr3=iqrtime(S3,ntry);

%"S4"
ci4 = nonpar(S4,ndays,ntry);
mu4 = meaninf(S4,ndays,ntry);
mu_try4 = num_try(S4,ntry);
mu_inf4 = num_inf(S4,ntry);
mu_time4 = total_time(S4,ntry);
med4=medinf(S4,ndays,ntry);
mu_iqr4=iqrinf(S4,ntry);
try_iqr4=iqrtry(S4,ntry);
time_iqr4=iqrtime(S4,ntry);

%"S5"
ci5 = nonpar(S5,ndays,ntry);
mu5 = meaninf(S5,ndays,ntry);
mu_try5 = num_try(S5,ntry);
mu_inf5 = num_inf(S5,ntry);
mu_time5 = total_time(S5,ntry);
med5=medinf(S5,ndays,ntry);
mu_iqr5=iqrinf(S5,ntry);
try_iqr5=iqrtry(S5,ntry);
time_iqr5=iqrtime(S5,ntry);

%"S6"
ci6 = nonpar(S6,ndays,ntry);
mu6 = meaninf(S6,ndays,ntry);
mu_try6 = num_try(S6,ntry);
mu_inf6 = num_inf(S6,ntry);
mu_time6 = total_time(S6,ntry);
med6=medinf(S6,ndays,ntry);
mu_iqr6=iqrinf(S6,ntry);
try_iqr6=iqrtry(S6,ntry);
time_iqr6=iqrtime(S6,ntry);

%"S7"
ci7 = nonpar(S7,ndays,ntry);
mu7 = meaninf(S7,ndays,ntry);
mu_try7 = num_try(S7,ntry);
mu_inf7 = num_inf(S7,ntry);
mu_time7 = total_time(S7,ntry);
med7=medinf(S7,ndays,ntry);
mu_iqr7=iqrinf(S7,ntry);
try_iqr7=iqrtry(S7,ntry);
time_iqr7=iqrtime(S7,ntry);

%"S8"
ci8 = nonpar(S8,ndays,ntry);
mu8 = meaninf(S8,ndays,ntry);
mu_try8 = num_try(S8,ntry);
mu_inf8 = num_inf(S8,ntry);
mu_time8 = total_time(S8,ntry);
med8=medinf(S8,ndays,ntry);
mu_iqr8=iqrinf(S8,ntry);
try_iqr8=iqrtry(S8,ntry);
time_iqr8=iqrtime(S8,ntry);

%"S9"
ci9 = nonpar(S9,ndays,ntry);
mu9 = meaninf(S9,ndays,ntry);
mu_try9 = num_try(S9,ntry);
mu_inf9 = num_inf(S9,ntry);
mu_time9 = total_time(S9,ntry);
med9=medinf(S9,ndays,ntry);
mu_iqr9=iqrinf(S9,ntry);
try_iqr9=iqrtry(S9,ntry);
time_iqr9=iqrtime(S9,ntry);

%plots figures
x = 1:ndays;
days = 1:45:ndays-1;
labels=1:12;

fig=figure;
subplot(3,3,1);
plot(x,mu1)
ax = gca;
ax.FontSize = 8;
set(gca,'XTick',days);
set(gca,'XTickLabel',labels);
xtickangle(45)
hold on
plot(x,med1)
patch([x, fliplr(x)], [ci1(:,1)' fliplr(ci1(:,2)')], 'b', 'EdgeColor','none', 'FaceAlpha',0.25)
hold off


subplot(3,3,2);
plot(x,mu2)
ax = gca;
ax.FontSize = 8;
set(gca,'XTick',days);
set(gca,'XTickLabel',labels);
xtickangle(45)
hold on
plot(x,med2)
patch([x, fliplr(x)], [ci2(:,1)' fliplr(ci2(:,2)')], 'b', 'EdgeColor','none', 'FaceAlpha',0.25)
hold off

subplot(3,3,3);
plot(x,mu3)
ax = gca;
ax.FontSize = 8;
set(gca,'XTick',days);
set(gca,'XTickLabel',labels);
xtickangle(45)
hold on
plot(x,med3)
patch([x, fliplr(x)], [ci3(:,1)' fliplr(ci3(:,2)')], 'b', 'EdgeColor','none', 'FaceAlpha',0.25)
legend('mean','median')
hold off


subplot(3,3,4);
plot(x,mu4)
ax = gca;
ax.FontSize = 8;
set(gca,'XTick',days);
set(gca,'XTickLabel',labels);
xtickangle(45)
hold on
plot(x,med4)
patch([x, fliplr(x)], [ci4(:,1)' fliplr(ci4(:,2)')], 'b', 'EdgeColor','none', 'FaceAlpha',0.25)
hold off


subplot(3,3,5);
plot(x,mu5)
ax = gca;
ax.FontSize = 8;
set(gca,'XTick',days);
set(gca,'XTickLabel',labels);
xtickangle(45)
hold on
plot(x,med5)
patch([x, fliplr(x)], [ci5(:,1)' fliplr(ci5(:,2)')], 'b', 'EdgeColor','none', 'FaceAlpha',0.25)
hold off


subplot(3,3,6);
plot(x,mu6)
ax = gca;
ax.FontSize = 8;
set(gca,'XTick',days);
set(gca,'XTickLabel',labels);
xtickangle(45)
hold on
plot(x,med6)
patch([x, fliplr(x)], [ci6(:,1)' fliplr(ci6(:,2)')], 'b', 'EdgeColor','none', 'FaceAlpha',0.25)
hold off



subplot(3,3,7);
plot(x,mu7)
ax = gca;
ax.FontSize = 8;
set(gca,'XTick',days);
set(gca,'XTickLabel',labels);
xtickangle(45)
hold on
plot(x,med7)
patch([x, fliplr(x)], [ci7(:,1)' fliplr(ci7(:,2)')], 'b', 'EdgeColor','none', 'FaceAlpha',0.25)
hold off


subplot(3,3,8);
plot(x,mu3)
ax = gca;
ax.FontSize = 8;
set(gca,'XTick',days);
set(gca,'XTickLabel',labels);
xtickangle(45)
hold on
plot(x,med8)
patch([x, fliplr(x)], [ci8(:,1)' fliplr(ci8(:,2)')], 'b', 'EdgeColor','none', 'FaceAlpha',0.25)
hold off


subplot(3,3,9);
plot(x,mu9)
ax = gca;
ax.FontSize = 8;
set(gca,'XTick',days);
set(gca,'XTickLabel',labels);
xtickangle(45)
hold on
plot(x,med9)
patch([x, fliplr(x)], [ci9(:,1)' fliplr(ci9(:,2)')], 'b', 'EdgeColor','none', 'FaceAlpha',0.25)
hold off


han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
ylabel(han,'Active cases','fontweight','bold','fontsize',10);
xlabel(han,'Week','fontweight','bold','fontsize',10);

%save the plot
saveas(gcf,'Edmonton_overall.png')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%functions 
function ci = nonpar(data,ndays,ntry)
    ci = zeros(ndays,2);
    for j = 1:ndays
    vec = [];
        for i = 1:ntry
        vec(i) = data.big_multi{i}(j);
        end
    sorted = sort(vec);
    lower = 0.05*ntry;
    upper = 0.95*ntry;
    ci(j,1) = sorted(lower);
    ci(j,2) = sorted(upper);
    end  
end

function mu = meaninf(data,ndays,ntry)
    mu = [];
    for j = 1:ndays
    val = 0;
    for i = 1:ntry
    val = val + data.big_multi{i}(j);
    end
    mu(j) = val/ntry;
    end
end

function mu_iqr=iqrinf(data,ntry)
    inf=[];
    for i=1:ntry
        ss=data.big_multi(i,2);
        ss=ss{1};
        inf(i)=ss.total_infected;
    end
    mu_iqr=quantile(inf,[0.25,0.75]);
end

function try_iqr=iqrtry(data,ntry)
    inf=[];
    for i=1:ntry
        ss=data.big_multi(i,3);
        %ss=ss{1};
        inf(i)=ss{1};
    end
    try_iqr=quantile(inf,[0.25,0.75]);
end

function time_iqr=iqrtime(data,ntry)
    inf=[];
    for i=1:ntry
        ss=data.big_multi(i,2);
        ss=ss{1};
        inf(i)=ss.total_time_loss;
    end
    time_iqr=quantile(inf,[0.25,0.75]);
end


function med = medinf(data,ndays,ntry)
    med = [];
    for j = 1:ndays
    ind=[];
    for i = 1:ntry
    ind(i)=data.big_multi{i}(j);
    end
    med(j)=median(ind);
    end
end

function mu_try = num_try(data,ntry)
    mu_try = 0;

    for i=1:ntry
    ss  = data.big_multi(i,3);
    mu_try = mu_try+ss{1};
    end
mu_try = mu_try/ntry;

end



function mu_inf = num_inf(data,ntry)
    mu_inf = 0;

    for i=1:ntry
    ss  = data.big_multi(i,2);
    ss = ss{1};
    mu_inf = mu_inf+ss.total_infected;
    end
mu_inf = mu_inf/ntry;
end


function mu_time = total_time(data,ntry)
    mu_time = 0;
    for i=1:ntry
    ss  = data.big_multi(i,2);
    ss = ss{1};
    mu_time = mu_time+ss.t_loss;
    end
mu_time = mu_time/ntry;
end