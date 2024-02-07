clc;
clear all
close all

%depth
d1 = 0;
d2 = 149.09;
d3 = 0;
d4 = 433.07;
d5 = 0;
d6 = 56.25;

%alpha
a1 = -90;
a2 = 0;
a3 = 90;
a4 = -90;
a5 = 90;
a6 = 0;

%length
l1 = 0;
l2 = 431.8;
l3 = -20.32;
l4 = 0;
l5 = 0;
l6 = 0;

%theta
theta1 = 'Provide Angle Theta for Joint 1: ';
theta2 = 'Provide Angle Theta for Joint 2: ';
theta3 = 'Provide Angle Theta for Joint 3: ';
theta4 = 'Provide Angle Theta for Joint 4: ';
theta5 = 'Provide Angle Theta for Joint 5: ';
theta6 = 'Provide Angle Theta for Joint 6: ';
t1 = input(theta1);
t2 = input(theta2);
t3 = input(theta3);
t4 = input(theta4);
t5 = input(theta5);
t6 = input(theta6);

%transformation matrices
transformation1 = [cosd(t1) -(cosd(a1)*sind(t1)) sind(a1)*sind(t1) l1*cosd(t1)
sind(t1) cosd(a1)*cosd(t1) -(sind(a1)*cosd(t1)) l1*sind(t1)
0 sind(a1) cosd(a1) d1
0 0 0 1];

transformation2 = [cosd(t2) -(cosd(a2)*sind(t2)) sind(a2)*sind(t2) l2*cosd(t2)
sind(t2) cosd(a2)*cosd(t2) -(sind(a2)*cosd(t2)) l2*sind(t2)
0 sind(a2) cosd(a2) d2
0 0 0 1];

transformation3 = [cosd(t3) -(cosd(a3)*sind(t3)) sind(a3)*sind(t3) l3*cosd(t3)
sind(t3) cosd(a3)*cosd(t3) -(sind(a3)*cosd(t3)) l3*sind(t3)
0 sind(a3) cosd(a3) d3
0 0 0 1];

transformation4 = [cosd(t4) -(cosd(a4)*sind(t4)) sind(a4)*sind(t4) l4*cosd(t4)
sind(t4) cosd(a4)*cosd(t4) -(sind(a4)*cosd(t4)) l4*sind(t4)
0 sind(a4) cosd(a4) d4
0 0 0 1];

transformation5 = [cosd(t5) -(cosd(a5)*sind(t5)) sind(a5)*sind(t5) l5*cosd(t5)
sind(t5) cosd(a5)*cosd(t5) -(sind(a5)*cosd(t5)) l5*sind(t5)
0 sind(a5) cosd(a5) d5
0 0 0 1];

transformation6 = [cosd(t6) -(cosd(a6)*sind(t6)) sind(a6)*sind(t6) l6*cosd(t6)
sind(t6) cosd(a6)*cosd(t6) -(sind(a6)*cosd(t6)) l6*sind(t6)
0 sind(a2) cosd(a2) d6
0 0 0 1];

%multiply
multiply1 = transformation1 * transformation2;
multiply2 = transformation1 * transformation2 * transformation3;
multiply3 = transformation1 * transformation2 * transformation3 * transformation4;
multiply4 = transformation1 * transformation2 * transformation3 * transformation4 * transformation5;
multiply = transformation1 * transformation2 * transformation3 * transformation4 * transformation5 * transformation6;

%output
output = [multiply(1,4) multiply(2,4) multiply(3,4)]';
disp('End Effecter is Located on Point(x,y,z):');
disp(num2str(output,'%.2f'))

%plot
line([0 0],[0 0],[-660.4 0],'LineWidth',2)
line([0 multiply1(1,4)],[0 multiply1(2,4)],[0 0],'LineWidth',2, 'color','r');
line([multiply1(1,4) multiply2(1,4)],[multiply1(2,4) multiply2(2,4)],[0 multiply2(3,4)],'LineWidth',2, 'color','g')
line([multiply2(1,4) multiply3(1,4)],[multiply2(2,4) multiply3(2,4)],[multiply2(3,4) multiply3(3,4)],'LineWidth',2, 'color','y')
line([multiply3(1,4) multiply4(1,4)],[multiply3(2,4) multiply4(2,4)],[multiply3(3,4) multiply4(3,4)],'LineWidth',2, 'color','b')
line([multiply4(1,4) multiply(1,4)],[multiply4(2,4) multiply(2,4)],[multiply4(3,4) multiply(3,4)],'LineWidth',2, 'color','k')
axis([-1000 1000 -1000 1000 -1000 1000])
grid on

%message
disp('Type [PumaForwardDH] in Command Window to Try Again');
