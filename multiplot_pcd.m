% binaryだとなぜか読みこむ度に配列の番号が変わるので注意
clear
data1 = readPcd('/home/yuta/Documents/ROS/forest_ws/src/forest_robot_project/fr01_ndt_mapping/result20160720063829.pcd');
data2 = readPcd('/home/yuta/Documents/ROS/forest_ws/src/forest_robot_project/fr01_ndt_mapping/result20160701021711.pcd');
%data = readPcd('/home/yuta/Documents/ROS/forest_ws/src/forest_robot_project/fr01_ndt_mapping/resized20160720063829.pcd')
f1 = figure(1);
subplot(1, 2, 1)
p1 = scatter3(data1(:,1), data1(:,2), data1(:,3), 9, data1(:,3), '.')
colormap(jet)
axis equal
axis([-25 45 -35 35 -4 7])
subplot(1, 2, 2)
p2 = scatter3(data2(:,1), data2(:,2), data2(:,3), 9, data2(:,3), '.')
colormap(jet)
axis equal
axis([-25 45 -35 35 -4 7])
c = colorbar('eastoutside')
c.Label.String = 'Elevation[m]'
% figureの表示されている画面のサイズで保存する
% set(gcf,'PaperPositionMode','auto')

% ファイルに保存する -r解像度
%print('-dpng','-r300','figure1.png')