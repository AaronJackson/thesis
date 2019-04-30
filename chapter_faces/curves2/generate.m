close all


% --------------------------------------------------------------------
% AFLW2000
figure
set(gcf, 'Position', [100 100 500 500])
load aflw2000-abguided; E=E(:,2); roc(E,'-', 1);
load aflw2000-intersup-abguided; roc(E, '-', 2)
load aflw2000-stack1; roc(E, '-', 3)
load aflw2000-stack3; roc(E, '-', 4)
load aflw2000-stack4; roc(E, '-', 5)

load aflw2000-lighter; roc(E, '-.', 1)
load aflw2000-light; roc(E, '-.', 2)
load aflw2000-heavy; roc(E, '-.', 3)
load aflw2000-volumetric; roc(E, '--', 5);

legend({'Guided (Standard - 2 Hour Glasses)',
        'Guided (+Intermediate Supervision)',
        'Guided (1 Hour Glass)',
        'Guided (3 Hour Glass)',
        'Guided (4 Hour Glass)',
        'Guided (1 Hourglass Lighter)',
        'Guided (1 Hourglass Light)',
        'Guided (1 Hourglass Heavy)',
        'Guided (Volumetric)'}, ...
       'Location', 'NorthWest', ...
       'Box', 'off')
axis square
print('aflw', '-depsc')

% close
