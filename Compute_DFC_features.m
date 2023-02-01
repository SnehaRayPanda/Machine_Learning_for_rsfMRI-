% To Compute DFC features
clc
close all
%%
[HC_meta, HC_sync, ~, HC_dFC_cos, HC_int, HC_seg] = dynamicMetrics_2(HC_cl,2.5);  
[ET_meta, ET_sync, ~, ET_dFC_cos, ET_int, ET_seg] = dynamicMetrics_2(ET_cl,2.5);
%% Ploting Whole Brain mean Syncronisation
HC_sync_mean=mean(HC_sync,2); ET_sync_mean=mean(ET_sync,2);
Grp_HC = ones(length(HC_sync_mean),1); Grp_ET = 2*(ones(length(ET_sync_mean),1)); 
Grp = [Grp_HC; Grp_ET];
Grp_sync = [HC_sync_mean; ET_sync_mean];
figure(1); notBoxPlot(Grp_sync,Grp,0.5,'patch',ones(length(Grp_sync),1));
xticklabels({'HC','ET'});
ylabel('Mean syncronisation')
title('Whole brain mean Syncronisation')
%% Ploting metastability Whole Brain
Grp_meta = [HC_meta'; ET_meta'];
figure(1); notBoxPlot(Grp_meta,Grp,0.5,'patch',ones(length(Grp_meta),1));
xticklabels({'HC','ET'});
ylabel('metastability')
title('Metastability')
%% Ploting wholebrain intigration Whol Brain
HC_wb_int = mean(HC_int,2);ET_wb_int = mean(ET_int,2);
Grp_integ = [HC_wb_int; ET_wb_int];
figure (2); notBoxPlot(Grp_integ,Grp,0.5,'patch',ones(length(Grp_integ),1));
xticklabels({'HC','ET'});
ylabel('Whole brain mean intigration')
title('Whole brain intigration')
%% Ploting wholebrain Segrigation Whol Brain
HC_wb_seg = mean(HC_seg,2);ET_wb_seg = mean(ET_seg,2);
Grp_seg = [HC_wb_seg; ET_wb_seg];
figure (3); notBoxPlot(Grp_seg,Grp,0.5,'patch',ones(length(Grp_seg),1));
xticklabels({'HC','ET'});
ylabel('Whole brain mean segrigation')
title('Whole brain segrigation')
%% Compute the mean Connectivity
for i=1:size(HC_dFC,2)
%HC_dFC_all(i,:,:) = mean(abs(HC_dFC {1,i}),3);
HC_dFC_all(i,:,:) = mean((HC_dFC_cos {1,i}),3);
end
for i=1:size(ET_dFC,2)
%ET_dFC_all(i,:,:) = mean(abs(ET_dFC {1,i}),3);
ET_dFC_all(i,:,:) = mean((ET_dFC_cos {1,i}),3);
end
%% Mean Connectivity of HC and ET matrix Plot
close all
figure;
subplot(1,2,1); imagesc(squeeze(mean(HC_dFC_all,1)));colorbar;caxis([-0.2 0.5])
title ('Mean DFC of Healthy Control')
xlabel('No of ROIs', 'FontName','Calibri', 'FontSize', 14);
ylabel('No of ROIs', 'FontName','Calibri', 'FontSize', 14);
set(gca,'FontSize',14, 'FontName','Calibri', 'FontWeight', 'bold')
%figure; 
subplot(1,2,2);imagesc(squeeze(mean(ET_dFC_all,1)));colorbar;caxis([-0.2 0.5])
title ('Mean DFC of ET patient')
xlabel('No of ROIs', 'FontName','Calibri', 'FontSize', 14);
ylabel('No of ROIs', 'FontName','Calibri', 'FontSize', 14);
set(gca,'FontSize',14, 'FontName','Calibri', 'FontWeight', 'bold')
%% Graph plot of Whole Brain Connectivity (mean of all the links/connections) of HC and ET
HC_dFC_all_wb=mean(mean(HC_dFC_all,3),2);
ET_dFC_all_wb=mean(mean(ET_dFC_all,3),2);
Grp_dFC_wb = [HC_dFC_all_wb; ET_dFC_all_wb];
Grp_HC = ones(length(HC_dFC_all_wb),1); Grp_ET = 2*(ones(length(ET_dFC_all_wb),1)); 
Grp = [Grp_HC; Grp_ET];
figure; notBoxPlot(Grp_dFC_wb,Grp,0.5,'patch',ones(length(Grp_dFC_wb),1)); title ('Whole brain mean dFC')
xticklabels({'HC','ET'}); set(gca,'FontSize',14, 'FontName','Times New Roman', 'FontWeight', 'bold')