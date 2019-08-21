close all
clear all

files = dir(['/mnt/beast/home/psxasj/proj-recon3/networks/guided-' ...
             'gtland2/output/3dexpr/*.raw']);

load 'bu4dfe-abguided-expression'
E = E(:,2);

err = [];
err.Happy = [];
err.Sad = [];
err.Fear = [];
err.Angry = [];
err.Disgust = [];
err.Surprise = [];

for f=1:numel(files)
    parts = strsplit(files(f).name, {'_','.'});
    expr = parts{3};
    err.(expr) = [ err.(expr) E(f) ];
end

means = structfun(@mean, err);
fields = fields(err);

figure('Position', [100 100 500 200])
bar(means)
set(gca, 'XTickLabel', fields)
ylabel('Normalised NME')
print('ablation_expression.eps', '-depsc')
