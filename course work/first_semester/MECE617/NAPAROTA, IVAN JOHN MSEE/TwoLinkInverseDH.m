clc;
clear all

syms t b

l1 = input('Link 1:');
l2 = input('Link 2:');
ex = input('End Effecter X:');
ey = input('End Effecter Y:');

T1 = [cos(t) -sin(t) 0 l1*cos(t)
sin(t) cos(t) 0 l1*sin(t)
0 0 1 0
0 0 0 1];

T2 = [cos(b) -sin(b) 0 l2*cos(b)
sin(b) cos(b) 0 l2*sin(b)
0 0 1 0
0 0 0 1];

T = T1*T2;

E1 = T(1,4) == ex;
E2 = T(2,4) == ey;

F = solve([E1,E2],[t,b]);

ans1 = [F.t(1,1) F.b(1,1)];
ee1 = eval(ans1);
EE1 = (ee1*180)/pi;
disp(EE1);

disp('OR');

ans2 = [F.t(2,1) F.b(2,1)];
ee2 = eval(ans2);
EE2 = (ee2*180)/pi;
disp(EE2);

disp('Type [TwoLinkInverseDH] in Command Window to Input again :)')
