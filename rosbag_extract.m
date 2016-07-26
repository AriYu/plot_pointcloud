clear
%filepath = fullfile('~/Documents/ROS/forest_ws/bag/straight_slow_five_meter_2016-02-04-13-55-58.bag');
%filepath = fullfile('~/Documents/ROS/forest_ws/bag/straight_slow_five_meter2_2016-02-04-13-57-16.bag');
%filepath = fullfile('~/Documents/ROS/forest_ws/bag/straight_slow_five_meter3_2016-02-04-13-59-28.bag');
%filepath = fullfile('~/Documents/ROS/forest_ws/bag/straight_slow_five_meter4_2016-02-04-14-04-13.bag');

%filepath = fullfile('~/Documents/ROS/forest_ws/bag/straight_fast_five_meter_2016-02-04-14-06-14.bag');
%filepath = fullfile('~/Documents/ROS/forest_ws/bag/straight_fast_five_meter2_2016-02-04-14-07-11.bag');
%filepath = fullfile('~/Documents/ROS/forest_ws/bag/straight_fast_five_meter3_2016-02-04-14-08-25.bag');

%filepath = fullfile('~/Documents/ROS/forest_ws/bag/turn_test_2016-02-04-14-52-29.bag');
filepath = fullfile('~/Documents/ROS/forest_ws/bag/turn_test_fast_2016-02-04-14-54-48.bag');

bag = rosbag(filepath);
wheel_state_select = select(bag, 'Topic', '/wheel_state');
wheel_ctrl_select = select(bag, 'Topic', '/wheel_joint_ctrl');
motor_input_select = select(bag, 'Topic', '/motor_input');

wheel_state_ts = timeseries(wheel_state_select)
wheel_state_message = readMessages(wheel_state_select);
wheel_ctrl_ts = timeseries(wheel_ctrl_select);
wheel_ctrl_message = readMessages(wheel_ctrl_select);
motor_input_ts = timeseries(motor_input_select);
motor_input_message = readMessages(motor_input_select);

clf reset;
figure;
for num_wheel = 1:6
    for idx = 1:numel(wheel_state_message);
        wheel_state_data(idx) = -wheel_state_message{idx, 1}.Velocity(num_wheel);
    end
    for idx = 1:numel(wheel_ctrl_message);
        wheel_ctrl_data(idx) = wheel_ctrl_message{idx, 1}.Velocity(num_wheel);
    end
    ylim([0, 0.6]);
    plot(wheel_state_ts.Time, wheel_state_data);
    hold on;
    plot(wheel_ctrl_ts.Time, wheel_ctrl_data);
    hold on;
end
figure;
for num_wheel = 1:6
    for idx = 1:numel(motor_input_message);
        motor_input_data(idx) = motor_input_message{idx, 1}.Data(num_wheel);
    end
    plot(motor_input_ts.Time, motor_input_data);
    hold on;
end

