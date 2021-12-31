clc;clear;close all;


% e = 115.0;    % end effector
% f = 457.3;    % base
% re = 232.0;   % lower arm
% rf = 112.0;   %high arm
% y1 = -0.5 * tan(pi/6) * f;  %le pb vient peut être de là

e = 50.0;    % end effector
f = 55.0;    % base
re = 230.5;   % lower arm
rf = 90;   %high arm
y1 = -f;

z_0 = -sqrt(re^2 - (y1-rf+e)^2);

E_s = [0 40 z_0];
E_test = [0 0 -192.8];

theta = CalcInvKinematics(E_s, y1, e, rf, re);
[theta2,theta3,theta4] = CalcAngles(E_s, y1, e, rf, re);

%figure();

%ax = axes();

