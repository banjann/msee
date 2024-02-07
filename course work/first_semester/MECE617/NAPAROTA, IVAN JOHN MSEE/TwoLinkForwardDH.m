clc;
clear all
close all

depth1 = 'Provide Depth for Joint1:';
depth2 = 'Provide Depth for Joint2:';
alpha1 = 'Provide Offset Angle for Joint1:';
alpha2 = 'Provide Offset Angle for Joint2:';
length1 = 'Provide Length of Link 1:';
length2 = 'Provide Length of Link 2:';
theta1 = 'Provide Angle Theta for Joint 1: ';
theta2 = 'Provide Angle Theta for Joint 2: ';
d1 = input(depth1);
d2 = input(depth2);
a1 = input(alpha1);
a2 = input(alpha2);
l1 = input(length1);
l2 = input(length2);
t1 = input(theta1);
t2 = input(theta2);

transformation1 = [cosd(t1) -(cosd(a1)*sind(t1)) sind(a1)*sind(t1) l1*cosd(t1)
sind(t1) cosd(a1)*cosd(t1) -(sind(a1)*cosd(t1)) l1*sind(t1)
0 sind(a1) cosd(a1) d1
0 0 0 1];

transformation2 = [cosd(t2) -(cosd(a2)*sind(t2)) sind(a2)*sind(t2) l2*cosd(t2)
sind(t2) cosd(a2)*cosd(t2) -(sind(a2)*cosd(t2)) l2*sind(t2)
0 sind(a2) cosd(a2) d2
0 0 0 1];

multiply = transformation1 * transformation2;   
output = [multiply(1,4) multiply(2,4)]';
disp('End Effecter is Located on Point(x,y):');
disp(output);

maxaxis = l1 + l2;
line([0 (l1*cosd(t1))],[0 (l1*sind(t1))],'color','r');
line([(l1*cosd(t1)) ((l1*cosd(t1))+(l2*cosd(t1+t2)))],[(l1*sind(t1)) ((l1*sind(t1)) + (l2*sind(t1+t2)))],'color','g');
axis([-maxaxis maxaxis -maxaxis maxaxis]);
title('2-Planar Forward Kinematics via DH')
xlabel('X-Axis');
ylabel('Y-Axis')
clear all;
grid on


disp('Type [TwoLinkForwardDH] in Command Window to Try Again');
