clc;
close all;
lengthlink1 = 'Length of First Link: \n';
lengthlink2 = 'Length of Second Link: \n';
posendx = 'Position of End Effecter X: \n';
posendy = 'Position of End Effecter Y: \n';

a = input(lengthlink1);
b = input(lengthlink2);
c = input(posendx);
d = input(posendy);


    
z = sqrt((c^2) + (d^2));
if (z < (a + b));
A = acosd((a^2 + b^2 - z^2)/(2*a*b));
B = acosd((a^2 + z^2 - b^2)/(2*a*z));
one = atan2d(d,c) - B;
two = 180 - A;
oneprime = atan2d(d,c) + B;
twoprime = -(180 - A);

fprintf('Theta1:');
fprintf('%f\n',one);
fprintf('Theta2:');
fprintf('%f\n',two);
fprintf('OR\n');
fprintf('Theta1:');
fprintf('%f\n',oneprime);
fprintf('Theta2:');
fprintf('%f\n',twoprime);
maxaxis = a + b;
x = a*cosd(one);
y = a*sind(one);
v = a*cosd(oneprime);
w = a*sind(oneprime);
line ([0 x],[0 y],'color','b')
line ([x c],[y d],'color','b')
line ([0 c],[0 d],'color','g')
line ([0 v],[0 w],'color','b')
line ([v c],[w d])
axis([-maxaxis maxaxis -maxaxis maxaxis])
title('2-Link Planar Inverse Kinematics')
xlabel('X-Axis')
ylabel('Y-Axis')
grid on

else
    disp('****Youre Entering Invalid Data****');
end


disp('Type [TwoLinkInverseTrigo] in Command Window to Input again :)')

clear all

