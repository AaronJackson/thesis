close all


% --------------------------------------------------------------------
% BU4DFE with ICP
figure
set(gcf, 'Position', [100 100 500 350])
load bu4dfe-abguided-icp; E=E(:,2); roc(E,'-', 2)
load bu4dfe-multitask-icp; E=E(:,2); roc(E, '-', 6);
load bu4dfe-baseline-icp; E=E(:,2); roc(E, '-', 3)
load bu4dfe-3ddfa-icp; E=E(:,2); roc(E, '--', 4)
load bu4dfe-eos-icp; roc(E, '--', 5)
legend({'VRN - Guided (ours)',
        'VRN - Multitask (ours)',
        'VRN (ours)',
        '3DDFA',
        'EOS \lambda = 5000'}, ...
       'Location', 'NorthWest')
print('bu4dfe', '-depsc')
% close


% --------------------------------------------------------------------
% Florence
figure
set(gcf, 'Position', [100 100 500 350])
load florence_detected-icp; E=E(:,2); E(E==0) = []; roc(E,'-', 2)
load florence_multitask-icp; E=E(:,2); E(E==0) = []; roc(E, '-', 6);
load florence_baseline-icp; E=E(:,2); E(E==0) = []; roc(E,'-', 3)
load florence_3ddfa-icp; E=E(:,2); roc(E,'--', 4)
load florence_eos-icp; E(E==0) = []; roc(E, '--', 5)
legend({'VRN - Guided (ours)'
        'VRN - Multitask (ours)',
        'VRN (ours)',
        '3DDFA',
        'EOS \lambda = 5000'}, ...
       'Location', 'NorthWest')
print('florence', '-depsc')
% close

% --------------------------------------------------------------------
% AFLW2000
figure
set(gcf, 'Position', [100 100 500 350])
load aflw2000-abguided-icp; E=E(:,2); roc(E,'-', 2);
load aflw2000_multitask-icp; E=E(:,2); roc(E, '-', 6);
load aflw2000-baseline-icp; E=E(:,2); roc(E,'-', 3);
load ../../asj2017recon/curves/aflw2000-3ddfa; roc(E,'--', 4);
load aflw2000-eos-icp; roc(E, '--', 5)
legend({'VRN - Guided (ours)',
        'VRN - Multitask (ours)',
        'VRN (ours)',
        '3DDFA',
        'EOS \lambda = 5000'}, ...
       'Location', 'NorthWest')
print('aflw', '-depsc')
% close
