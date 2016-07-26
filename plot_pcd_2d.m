% binaryだとなぜか読みこむ度に配列の番号が変わるので注意
clear
% data = readPcd('/home/yuta/Documents/ROS/forest_ws/src/forest_robot_project/fr01_ndt_mapping/result20160720063829.pcd');
%data = readPcd('/home/yuta/Documents/ROS/forest_ws/src/forest_robot_project/fr01_ndt_mapping/result20160701021711.pcd');
%data = readPcd('/home/yuta/Documents/ROS/forest_ws/src/forest_robot_project/fr01_ndt_mapping/resized20160720063829.pcd');
data = readPcd('/home/yuta/Documents/source-codes/my_cloud_tools/cloud_transformer/build/transformed_cloud.pcd');

f1 = figure(1);
p1 = scatter(data(:,1), data(:,2), 9, data(:,3), '.')
colormap(jet)
axis equal
%axis([-35 35 -4 7])
c = colorbar('southoutside')
c.Label.String = 'Elevation[m]'
% figureの表示されている画面のサイズで保存する
% set(gcf,'PaperPositionMode','auto')

% ファイルに保存する -r解像度
%print('-dpng','-r300','figure1.png')