    clear;clc;

%%%no shut down
%%%work from home (once a week) with no shut down
%%%shut down (less than 10% working from home)

%%%plots, the number of times that the there is no outbreak, 
%%%shut down threshold (<10 or fraction)



% parameters that don't change
% parameters to do with running the simulations
runstuff.num_sims = 5;  % number of simulations per choice of params
runstuff.maxDays=100; % how many days each sim
runstuff.seed=123456; % random number seed

big_multi = cell(runstuff.num_sims,3);


params.frac_asymp=0.4; % fraction of people infected who are asymptomatic
params.num_real_groups=1; % number of contact groups
params.hour_per_day=9; % hours of contact per day, 8:00am to 5:00pm
params.beta_k_baseline=0.1; % baseine dispersion for beta rate. Set to Inf for no dispersion
params.fraction_vuln=0.062; % which fraction of people are vulnerable, 85 60+
params.fraction_vax_vuln=0.95; % fraction of vulnerable people who are vaccinated
params.cfr_unvax=0.0; %set death rate to 0
params.cfr_vax_symp=0.0;
params.frac_work=1.0;
params.frac_mask=0.0;
params.mask_hesitancy=0.0;
%params.frac_customer=0.15; 20%<
params.beta_customer=0.0; %home etc. transmission within workers not customers
params.mu_pip=2;
params.beta_aerosol_factor=0.1; % how much less infectious outside groups
params.asymp_ratio=0.6; % how much less infectious are totic people
params.beta_intervention_factor=0.25; % after an intervention occurs, what is tranmsission reduced by
params.beta_symp_factor=0.0;  % when somone becomes symptomatic how much is transmission reduced
params.beta_mask_factor=0.81; % reference Gavin et al.       
params.vax_eff_sickness=0.7; %%%maybe lower this to lower the number of ays workers 
thre=5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%params.class_size=1400; % Calgary Campus
params.class_size=503; % change number of workers according data
%params.beta_mu_baseline=5.357e-05; 
params.beta_mu_baseline=1.4911e-04; 

params.frac_vax=0.9495;
params.frac_customer=0.1133; 
params.vax_eff_inf=0.61;

protoc.days_delay=100; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=1000; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;


[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                params.frac_mask=0.0;
params.mask_hesitancy=0.0;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('1400_0.61_no.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%params.class_size=1400; % Calgary Campus
params.class_size=503; % change number of workers according data
%params.beta_mu_baseline=5.357e-05; 
params.beta_mu_baseline=1.4911e-04; 
params.frac_vax=0.9495;
params.frac_customer=0.1133; 

params.vax_eff_inf=0.61;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                params.frac_mask=0.0;
params.mask_hesitancy=0.0;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('1400_0.61_yes.mat','big_multi')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%with mask and essential

%params.class_size=1400; % Calgary Campus
params.class_size=503; % change number of workers according data
%params.beta_mu_baseline=5.357e-05; 
params.beta_mu_baseline=1.4911e-04; 
params.frac_vax=0.9495;
params.frac_customer=0.1133; 

params.vax_eff_inf=0.61;

protoc.days_delay=100; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=1000; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;


[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                params.frac_mask=0.2;
                params.mask_hesitancy=0.001;

                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('1400_0.61_no_mask_ess.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%params.class_size=1400; % Calgary Campus
params.class_size=503; % change number of workers according data
%params.beta_mu_baseline=5.357e-05; 
params.beta_mu_baseline=1.4911e-04; 
params.frac_vax=0.9495;
params.frac_customer=0.1133; 

params.vax_eff_inf=0.61;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                params.frac_mask=0.2;
                params.mask_hesitancy=0.001;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('1400_0.61_yes_mask_ess.mat','big_multi')



params.frac_mask=0.0;
params.mask_hesitancy=0.0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%params.class_size=1400; % Calgary Campus
params.class_size=503; % change number of workers according data
%params.beta_mu_baseline=5.357e-05; 
params.beta_mu_baseline=1.4911e-04; 
params.frac_vax=0.9495;
params.frac_customer=0.1133; 

params.vax_eff_inf=0.4;

protoc.days_delay=100; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=1000; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('1400_0.4_no.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%params.class_size=1400; % Calgary Campus
params.class_size=503; % change number of workers according data
%params.beta_mu_baseline=5.357e-05; 
params.beta_mu_baseline=1.4911e-04; 
params.frac_vax=0.9495;
params.vax_eff_inf=0.4;
params.frac_customer=0.1133; 

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end


save('1400_0.4_yes.mat','big_multi')




params.class_size=1400; % Calgary Campus
%params.class_size=503; % change number of workers according data
params.beta_mu_baseline=5.357e-05; 
%params.beta_mu_baseline=1.4911e-04; 
params.frac_vax=0.9495;
params.frac_customer=0.1133; 
params.vax_eff_inf=0.61;

protoc.days_delay=100; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=1000; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;


[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                params.frac_mask=0.0;
params.mask_hesitancy=0.0;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('1400_true_0.61_no.mat','big_multi')


params.class_size=1400; % Calgary Campus
%params.class_size=503; % change number of workers according data
params.beta_mu_baseline=5.357e-05; 
%params.beta_mu_baseline=1.4911e-04; 
params.frac_vax=0.9495;
params.frac_customer=0.1133; 
params.vax_eff_inf=0.4;

protoc.days_delay=100; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=1000; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;


[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                params.frac_mask=0.0;
params.mask_hesitancy=0.0;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('1400_true_0.4_no.mat','big_multi')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
params.class_size=1400; % Calgary Campus
%params.class_size=503; % change number of workers according data
params.beta_mu_baseline=5.357e-05; 
%params.beta_mu_baseline=1.4911e-04; 
params.frac_vax=0.9495;
params.frac_customer=0.1133; 

params.vax_eff_inf=0.61;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                params.frac_mask=0.0;
params.mask_hesitancy=0.0;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('1400_true_0.61_yes.mat','big_multi')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
params.class_size=1400; % Calgary Campus
%params.class_size=503; % change number of workers according data
params.beta_mu_baseline=5.357e-05; 
%params.beta_mu_baseline=1.4911e-04; 
params.frac_vax=0.9495;
params.frac_customer=0.1133; 

params.vax_eff_inf=0.4;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                params.frac_mask=0.0;
params.mask_hesitancy=0.0;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('1400_true_0.4_yes.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
params.class_size=1400; % Calgary Campus
%params.class_size=503; % change number of workers according data
params.beta_mu_baseline=5.357e-05; 
%params.beta_mu_baseline=1.4911e-04; 
params.frac_vax=0.9495;
params.frac_customer=0.1133; 

params.vax_eff_inf=0.2;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                params.frac_mask=0.0;
params.mask_hesitancy=0.0;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('1400_true_0.2_yes.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
params.class_size=1400; % Calgary Campus
%params.class_size=503; % change number of workers according data
params.beta_mu_baseline=5.357e-05; 
%params.beta_mu_baseline=1.4911e-04; 
params.frac_vax=0.9495;
params.frac_customer=0.1133; 

params.vax_eff_inf=0.5;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                params.frac_mask=0.0;
params.mask_hesitancy=0.0;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('1400_true_0.5_yes.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
params.class_size=1400; % Calgary Campus
%params.class_size=503; % change number of workers according data
params.beta_mu_baseline=5.357e-05; 
%params.beta_mu_baseline=1.4911e-04; 
params.frac_vax=0.9495;
params.frac_customer=0.1133; 

params.vax_eff_inf=0.8;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                params.frac_mask=0.0;
params.mask_hesitancy=0.0;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('1400_true_0.8_yes.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%params.class_size=900; % Edmonton ATB Place Corp
params.class_size=408;
%params.beta_mu_baseline=8.33e-05;
params.beta_mu_baseline=1.8382e-04;
params.frac_vax=0.9618;
params.frac_customer=0.2255; 

params.vax_eff_inf=0.61;

protoc.days_delay=100; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=1000; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;


[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('900_0.61_no.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%params.class_size=900; % Edmonton ATB Place Corp
params.class_size=408;
%params.beta_mu_baseline=8.33e-05;
params.beta_mu_baseline=1.8382e-04;
params.frac_vax=0.9618;
params.vax_eff_inf=0.61;
params.frac_customer=0.2255; 

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('900_0.61_yes.mat','big_multi')





params.class_size=900; % Edmonton ATB Place Corp
%params.class_size=408;
params.beta_mu_baseline=8.33e-05;
%params.beta_mu_baseline=1.8382e-04;
params.frac_vax=0.9618;
params.vax_eff_inf=0.61;
params.frac_customer=0.2255; 

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('900_true_0.61_yes.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%params.class_size=900; % Edmonton ATB Place Corp
params.class_size=408;
%params.beta_mu_baseline=8.33e-05;
params.beta_mu_baseline=1.8382e-04;
params.frac_vax=0.9618;
params.frac_customer=0.2255; 

params.vax_eff_inf=0.4;

protoc.days_delay=100; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=1000; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('900_0.4_no.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%params.class_size=900; % Edmonton ATB Place Corp
params.class_size=408;
%params.beta_mu_baseline=8.33e-05;
params.beta_mu_baseline=1.8382e-04;
params.frac_vax=0.9618;
params.frac_customer=0.2255; 

params.vax_eff_inf=0.4;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end


save('900_0.4_yes.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %params.class_size=500; % Calgary Eighth Ave Place Corp
            params.class_size=358;
            %params.beta_mu_baseline=1.5e-04;
            params.beta_mu_baseline=2.095e-04;
            params.frac_vax=0.9670;
            params.frac_customer=0.5503; 


params.vax_eff_inf=0.61;

protoc.days_delay=100; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=1000; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;


[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('500_0.61_no.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %params.class_size=500; % Calgary Eighth Ave Place Corp
            params.class_size=358;
            %params.beta_mu_baseline=1.5e-04;
            params.beta_mu_baseline=2.095e-04;
            params.frac_vax=0.9670;
            params.frac_customer=0.5503; 

params.vax_eff_inf=0.61;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('500_0.61_yes.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %params.class_size=500; % Calgary Eighth Ave Place Corp
            params.class_size=358;
            %params.beta_mu_baseline=1.5e-04;
            params.beta_mu_baseline=2.095e-04;
            params.frac_vax=0.9670;
            params.frac_customer=0.5503; 

params.vax_eff_inf=0.4;

protoc.days_delay=100; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=1000; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('500_0.4_no.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %params.class_size=500; % Calgary Eighth Ave Place Corp
            params.class_size=358;
            %params.beta_mu_baseline=1.5e-04;
            params.beta_mu_baseline=2.095e-04;
            params.frac_vax=0.9670;
            params.frac_customer=0.5503; 

params.vax_eff_inf=0.4;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end



save('500_0.4_yes.mat','big_multi')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %params.class_size=50; % Toronto Corp
            params.class_size=29;
            %params.beta_mu_baseline=0.0015;
            params.beta_mu_baseline=0.003;
            params.frac_vax=0.9808;
            params.frac_customer=1.0; 
           
params.vax_eff_inf=0.61;

protoc.days_delay=100; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=1000; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;


[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('50_0.61_no.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %params.class_size=50; % Toronto Corp
            params.class_size=29;
            %params.beta_mu_baseline=0.0015;
            params.beta_mu_baseline=0.003;
            params.frac_vax=0.9808;
                        params.frac_customer=1.0; 


params.vax_eff_inf=0.61;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('50_0.61_yes.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %params.class_size=50; % Toronto Corp
            params.class_size=29;
            %params.beta_mu_baseline=0.0015;
            params.beta_mu_baseline=0.003;
            params.frac_vax=0.9808;
            params.frac_customer=1.0; 

params.vax_eff_inf=0.4;

protoc.days_delay=100; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=1000; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('50_0.4_no.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %params.class_size=50; % Toronto Corp
            params.class_size=29;
            %params.beta_mu_baseline=0.0015;
            params.beta_mu_baseline=0.003;
            params.frac_vax=0.9808;
            params.frac_customer=1.0; 

params.vax_eff_inf=0.4;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end



save('50_0.4_yes.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %params.class_size=20; % Edmoton Metro Branch
            params.class_size=12;
            params.beta_mu_baseline=0.003;
            params.frac_vax=0.9346;
            params.frac_customer=1.0; 


params.vax_eff_inf=0.61;

protoc.days_delay=100; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=1000; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;


[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('20_0.61_no.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %params.class_size=20; %    
            params.class_size=12;
            params.beta_mu_baseline=0.003;
            params.frac_vax=0.9346;

            params.frac_customer=1.0; 

params.vax_eff_inf=0.61;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('20_0.61_yes.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %params.class_size=20; % Edmoton Metro Branch
            params.class_size=12;
            params.beta_mu_baseline=0.003;
            params.frac_vax=0.9346;
            params.frac_customer=1.0; 


params.vax_eff_inf=0.4;

protoc.days_delay=100; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=1000; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end

save('20_0.4_no.mat','big_multi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %params.class_size=20; % Edmoton Metro Branch
            params.class_size=12;
            params.beta_mu_baseline=0.003;
            params.frac_vax=0.9346;
            params.frac_customer=1.0; 


params.vax_eff_inf=0.4;

protoc.days_delay=2; protoc.num_control_groups=1;
protoc.tests_to_shutdown_group=5; protoc.tests_to_shutdown_class=1;
protoc.pooled_testing_freq=1e6; 
protoc.pooled_testing_delay=1e6;



[multi_stats,multi_plot,n_try]=multi_plots_stats(runstuff,params,protoc,thre);
                for k=1:runstuff.num_sims
                %multi_stats(k).setting=setting;
                multi_stats(k).asymp_ratio=params.asymp_ratio;
                multi_stats(k).beta_aerosol_factor=params.beta_aerosol_factor;
                multi_stats(k).mu_pip=params.mu_pip;
                %multi_stats(k).world=world;
                %multi_stats(k).protocol=prot;
                multi_stats(k).simulation_number=k;
                multi_stats(k).beta_mu_baseline=params.beta_mu_baseline;
                multi_stats(k).beta_k_baseline=params.beta_k_baseline;
                multi_stats(k).frac_vax=params.frac_vax;
                multi_stats(k).vax_eff_inf=params.vax_eff_inf;
                multi_stats(k).vax_eff_sickness=params.vax_eff_sickness;
                end
           for k=1:runstuff.num_sims
                I = multi_plot{k}.I;
                num_inf = sum(I);
                big_multi{k,1}=num_inf;
                big_multi{k,2}=multi_stats(k);
                big_multi{k,3}=n_try(k);
           end



save('20_0.4_yes.mat','big_multi')




