
Z = load('florence_detected.mat'); % Keep this one fixed

X = load('florence_detected.mat');
X = load('florence_multitask.mat');
err = X.E;

goodimg = load(['/cvl/home/public/goodimgs.mat']);
goodimg = goodimg.idx;

E = zeros(size(err,1), 3); % err yaw patch

i=1;
for f=1:numel(Z.names)
    if sum(ismember(goodimg, Z.names(f).name(10:11), 'rows')) == 0
        disp('cont')
        continue
    end

    imname = Z.names(f).name(1:end-8);
    parts = strsplit(imname, '_');
    yaw = str2num(parts{4});
    pitch = str2num(parts{3});

    E(i,:) = [ err(i,1) yaw pitch ];
    i = i + 1;
end

pose = -80:40:80;
yaws = knnsearch(pose', E(:,2));
pitches = knnsearch(pose', E(:,3));

D = zeros(length(pose),1);
for yaw=1:length(pose)
    D(yaw) = mean(E(yaws==yaw,1));
end


poseYaw = pose;
poseYaw(isnan(D)) = [];
D(isnan(D)) = [];



% figure('Position', [100 100 400 200])
hold on, plot(poseYaw,D, '-', 'LineWidth', 2)
ylabel('Mean NME')
xlabel('Yaw rotation in degrees')
set(gca, 'XTick', [-80 -40 0 40 80])
axis([-90 90 0.03 0.2])
print('ablation_pose.eps', '-depsc')