% binaryだとなぜか読みこむ度に配列の番号が変わるので注意
clear
%data = readPcd('/home/yuta/Documents/ROS/forest_ws/src/forest_robot_project/fr01_ndt_mapping/result20160720063829.pcd');
%data = readPcd('/home/yuta/Documents/ROS/forest_ws/src/forest_robot_project/fr01_ndt_mapping/result20160701021711.pcd');
%data = readPcd('/home/yuta/Documents/ROS/forest_ws/src/forest_robot_project/fr01_ndt_mapping/resized20160720063829.pcd');
%data1 = readPcd('/home/yuta/Documents/source-codes/my_cloud_tools/cloud_transformer/build/transformed_cloud.pcd');
%data1 = readPcd('/home/yuta/Documents/source-codes/my_cloud_tools/clouds/lum/slamed/second/201611292350/merged20161130010922.pcd');
data1 = readPcd('/home/yuta/Documents/source-codes/my_cloud_tools/clouds/lum/slamed/second/201611292350/merged20161130012835.pcd');
data2 = readPcd('/home/yuta/Documents/source-codes/my_cloud_tools/clouds/lum/ground_removed/second/201611292353/merged20161130013156.pcd');

%data2 = readPcd('/home/yuta/Desktop/bun0-mls-2.pcd');
%data3 = readPcd('/home/yuta/Desktop/bun0-mls-0.3.pcd');

f1 = figure(1);
p1 = scatter3(data1(:,1), data1(:,2), data1(:,3), 9, data1(:,3), '.')
colormap(jet)
axis equal
axis([-20 45 -40 35 -4 7])

f2 = figure(2);
p2 = scatter3(data2(:,1), data2(:,2), data2(:,3), 9, data2(:,3), '.')
colormap(jet)
axis equal
axis([-20 45 -40 35 -4 7])

%f3 = figure(3);
%p3 = scatter3(data3(:,1), data3(:,2), data3(:,3), 9, data3(:,3), '.')
%colormap(jet)
%axis equal
%axis([-20 45 -20 35 -4 7])
%c = colorbar('southoutside')
%c.Label.String = 'Elevation[m]'
% figureの表示されている画面のサイズで保存する
% set(gcf,'PaperPositionMode','auto')

% ファイルに保存する -r解像度
%print('-dpng','-r300','figure1.png')