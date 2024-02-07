clc;
%getting the input from the user
prompt1 = 'Length of first Link: \n';
x = input(prompt1);
prompt2 = 'Length of second Link: \n';
y = input(prompt2);
prompt3 = 'First Angle in Degrees: \n';
z = input(prompt3);
prompt4 = 'Second Angle in Degrees: \n';
w = input(prompt4);
% x output, x coordinate of the end effector
outputX1 = x * cosd(z);
outputX2 = y * cosd(w + z);
outputX = outputX1 + outputX2;
% y output, y coordinate of the end effector
outputY1 = x * sind(z);
outputY2 = y * sind(w + z);
outputY = outputY1 + outputY2;
%displaying of the output
disp('X:');
disp(outputX);
disp('Y:');
disp(outputY);
%plotting in the xy coordinate system
axiss = x +y;
line ([0 outputX1],[0 outputY1] , 'color', 'r')
line ([outputX1 outputX],[outputY1 outputY])
title('2-Link Forward Kinematics')
xlabel('X-Axis')
ylabel('Y-Axis')
axis([-axiss axiss -axiss axiss])
grid on
%clear
clear all
disp('Type [Robotics1] in Command Window to Input again :)')