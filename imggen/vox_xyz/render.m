clear all
close all

[v, f] = ply_to_tri_surface('bun_zipper.ply');
v = v';

v = v - repmat(min(v), size(v,1), 1) + 0.005;
v = v * 800;

Q.vertices = v;
Q.faces = f';
Q.FaceColor = [204,204,204]/255;
Q.EdgeColor = 'none';

figure,
imshow(ones(512), 'Border', 'tight'), hold on
QQ = Q;
QQ.vertices = QQ.vertices * 4;
patch(QQ)
view(-180,90)
camlight
material dull
F = getframe;
imwrite(fliplr(F.cdata), 'bunny_original.png')


vol = VOXELISE(0:0.2:128, 0:0.2:128, 0:0.2:128, Q, 'xyz');
volXYZ = vol;
vol = imresize3(single(vol), [128 128 128 ]);

figure,
imshow(ones(512), 'Border', 'tight'), hold on
QQ = isosurface(vol)
QQ.vertices = QQ.vertices * 4;
QQ.FaceColor = [204,204,204]/255;
QQ.EdgeColor = 'none';
patch(QQ)
camlight
material dull
% axis([0 100 0 128 0 128]*4)
% axis equal
% axis off
view(-90,90)
F = getframe;
imwrite(F.cdata, 'bunny_voxXYZ.png')


vol = VOXELISE(0:0.2:128, 0:0.2:128, 0:0.2:128, Q, 'x');
bad = volXYZ ~= vol;
vol = imresize3(single(vol), [128 128 128]);
bad = imresize3(single(bad), [128 128 128]);

figure,
imshow(ones(512), 'Border', 'tight'), hold on
QQ = isosurface(vol)
QQ.vertices = QQ.vertices * 4;
QQ.FaceColor = [204,204,204]/255;
QQ.EdgeColor = 'none';
patch(QQ)
QQ = isosurface(bad)
QQ.vertices = QQ.vertices * 4;
QQ.FaceColor = [255,63,64]/255;
QQ.EdgeColor = 'none';
hold on, patch(QQ)
camlight
material dull
% axis([0 100 0 128 0 128]*4)
% axis equal
% axis off
view(-90,90)
F = getframe;
imwrite(F.cdata, 'bunny_voxX.png')

vol = VOXELISE(0:0.2:128, 0:0.2:128, 0:0.2:128, Q, 'y');
bad = volXYZ ~= vol;
vol = imresize3(single(vol), [128 128 128]);
bad = imresize3(single(bad), [128 128 128]);

figure,
imshow(ones(512), 'Border', 'tight'), hold on
QQ = isosurface(vol)
QQ.vertices = QQ.vertices * 4;
QQ.FaceColor = [204,204,204]/255;
QQ.EdgeColor = 'none';
patch(QQ)
QQ = isosurface(bad)
QQ.vertices = QQ.vertices * 4;
QQ.FaceColor = [255,63,64]/255;
QQ.EdgeColor = 'none';
hold on, patch(QQ)
camlight
material dull
% axis([0 100 0 128 0 128]*4)
% axis equal
% axis off
view(-90,90)
F = getframe;
imwrite(F.cdata, 'bunny_voxY.png')






vol = VOXELISE(0:0.2:128, 0:0.2:128, 0:0.2:128, Q, 'z');
bad = volXYZ ~= vol;
vol = imresize3(single(vol), [128 128 128]);
bad = imresize3(single(bad), [128 128 128]);

figure,
imshow(ones(512)', 'Border', 'tight'), hold on
QQ = isosurface(vol)
QQ.vertices = QQ.vertices * 4;
QQ.FaceColor = [204,204,204]/255;
QQ.EdgeColor = 'none';
patch(QQ)
QQ = isosurface(bad)
QQ.vertices = QQ.vertices * 4;
QQ.FaceColor = [255,63,64]/255;
QQ.EdgeColor = 'none';
hold on, patch(QQ)
camlight
material dull
% axis([0 100 0 128 0 128]*4)
% axis equal
% axis off
view(-90,90)
F = getframe;
imwrite(F.cdata, 'bunny_voxZ.png')
