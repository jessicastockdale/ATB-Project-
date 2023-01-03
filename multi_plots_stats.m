function [multi_run_stats,multi_run_plots,n_try]=multi_plots_stats(runstuff,params,protoc,thre)

% how many simulations
num_sims=runstuff.num_sims;
% set random number seed
rng(runstuff.seed)

% intialize and make space
multi_run_plots=cell(num_sims,1);


% intialize and make space
multi_run_stats.num_immune_vax=zeros(num_sims,1);
multi_run_stats.days_asymp_lax=zeros(num_sims,1);
multi_run_stats.days_asymp_strict=zeros(num_sims,1);
multi_run_stats.total_infected=zeros(num_sims,1);
multi_run_stats.total_symptomatic=zeros(num_sims,1);
multi_run_stats.total_not_detected=zeros(num_sims,1);
multi_run_stats.students_affected=zeros(num_sims,1);
multi_run_stats.students_disrupted=zeros(num_sims,1);
multi_run_stats.shutdowntime=zeros(num_sims,1);
multi_run_stats.groups_shut_down=zeros(num_sims,1);
multi_run_stats.class_shut_down=zeros(num_sims,1);
multi_run_stats.index_asymp=zeros(num_sims,1);
multi_run_stats.secondary_infections=zeros(num_sims,1);
multi_run_stats.total_died=zeros(num_sims,1);
multi_run_stats.total_time_loss=zeros(num_sims,1);
multi_run_stats.shut_down_group=zeros(num_sims,1);
multi_run_stats.shut_down_class=zeros(num_sims,1);
multi_run_stats.t_loss=zeros(num_sims,1);


% for each simulation
for kk=1:num_sims
  
  % only plot those that have an outbreak (ignore the case where only initial infection)
  num=0;
  n=0;
  % simulate class
  while num <= thre
      [stats,~,plotdata]=shut_down(runstuff,params,protoc);
      num = stats.total_infected;
      n=n+1;
  end
  % store results
  multi_run_plots{kk}=plotdata;
  multi_run_stats(kk,1)=stats;
  n_try(kk,1)=n;  
end
end

      
