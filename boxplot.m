clear;clc;
%this file generates box plots for the ATB report

%Edmonton Branch
%load the data
S1=load('20_0.61_yes.mat');
S2=load('20_0.5_yes.mat');
S3=load('20_0.4_yes.mat');
S4=load('20_0.2_yes.mat');
S5=load('20_0.61_no.mat');
S6=load('20_0.5_no.mat');
S7=load('20_0.4_no.mat');
S8=load('20_0.4_yes_mask.mat');
S9=load('20_0.2_no.mat');
ntry=100;

%add to ind to plot the figures
ind = zeros(10,9);
ind = addind(ind,S1,1);
ind = addind(ind,S2,2);
ind = addind(ind,S3,3);
ind = addind(ind,S4,4);
ind = addind(ind,S5,5);
ind = addind(ind,S6,6);
ind = addind(ind,S7,7);
ind = addind(ind,S8,8);
ind = addind(ind,S9,9);

indt=zeros(10,9);
indt=addindt(ind,S1,1);
indt=addindt(ind,S2,2);
indt=addindt(ind,S3,3);
indt=addindt(ind,S4,4);
indt=addindt(ind,S5,5);
indt=addindt(ind,S6,6);
indt=addindt(ind,S7,7);
indt=addindt(ind,S8,8);
indt=addindt(ind,S9,9);

%box plot for number of infections
boxplot(ind(:,1:9),'Labels',{'Onsite efficacy 0.6', ...
    'Onsite efficacy 0.5','Onsite efficacy 0.4', ...
    'Onsite efficacy 0.2','Remote policy not in effect; efficacy 0.6', ...
    'Remote policy not in effect; efficacy 0.5','Remote policy not in effect; efficacy 0.4', ...
    'Masking recommendations; efficacy 0.4','Remote policy not in effect; efficacy 0.2'})

ylabel('Number of infections')
saveas(gcf,'Edmonton10_boxplot.png')


%box plot for number of time loss
boxplot(indt(:,1:9),'Labels',{'Onsite efficacy 0.6', ...
    'Onsite efficacy 0.5','Onsite efficacy 0.4', ...
    'Onsite efficacy 0.2','Remote policy not in effect; efficacy 0.6', ...
    'Remote policy not in effect; efficacy 0.5','Remote policy not in effect; efficacy 0.4', ...
    'Masking recommendations; efficacy 0.4','Remote policy not in effect; efficacy 0.2'})
ylabel('Time loss')
saveas(gcf,'Edmonton10_boxplot_timeloss.png')




%functions used
function ve = addind(ind_vec,data,j)
    for i=1:10
    ss  = data.big_multi(i,2);
    ss = ss{1};
    ind_vec(i,j) = ss.total_infected;
    end
    ve = ind_vec;
end


function time=addindt(ind_vec,data,j)
    for i=1:10
        ss=data.big_multi(i,2);
        ss=ss{1};
        ind_vec(i,j)=ss.t_loss;
    end
    time=ind_vec;
end


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
        inf(i)=ss.t_loss;
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
