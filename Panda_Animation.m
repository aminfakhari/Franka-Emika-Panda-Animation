clc
clearvars

robot = importrobot('.\franka_description\panda_arm_hand.urdf');
robot.DataFormat = 'column';

% Home Configuration
Config_home = homeConfiguration(robot);
figure
show(robot,Config_home,'Frames','off');
title("Home Configurationn")

% Animation
s = 50;
theta_1 = linspace(0,pi/3,s);
theta_2 = linspace(0,pi/3,s);
theta_4 = linspace(0,-pi/3,s);
theta_6 = linspace(0,2*pi/3,s);
theta_7 = linspace(0,2*pi/3,s);

figure
for i=1:s
    configNow = [theta_1(i) theta_2(i) 0 theta_4(i) 0 theta_6(i) theta_7(i) 0 0].';
    show(robot,configNow,'PreservePlot',false,'Frames','off');
    
    % Supporting Plane
    hold on
    XL = [-1 1];
    YL = [-1 1];
    patch('Faces',[1 2 3 4],'Vertices',[XL(1) YL(1) 0; XL(2) YL(1) 0; XL(2) YL(2) 0; XL(1) YL(2) 0],'FaceColor',[1,1,1])
    
    axis([-1 1 -1 1 0 1.5]);
    view(45,10)    

    drawnow
end
