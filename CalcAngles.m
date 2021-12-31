function [theta1,theta2,theta3] = CalcAngles(E_0, f, e, rf, re)

E_0_2 = Rotation2D(E_0, 120.0); %effector coordinates rotation to compute +120° arm kinematics
E_0_3 = Rotation2D(E_0, 240.0);%effector coordinates rotation to compute -120° arm kinematics

% cos120 = cos(2*pi/3);
% sin120 = sin(2*pi/3);
% 
% E_0_2(:,1) = E_0(:,1) .* cos120 + E_0(:,2) .* sin120;
% E_0_2(:,2) = E_0(:,2) .* cos120 - E_0(:,1) .* sin120;
% E_0_2(:,3) = E_0(:,3);
% 
% E_0_3(:,1) = E_0(:,1) .* cos120 - E_0(:,2) .* sin120;
% E_0_3(:,2) = E_0(:,2) .* cos120 + E_0(:,1) .* sin120;
% E_0_3(:,3) = E_0(:,3);

theta1 = CalcInvKinematics(E_0, f, e, rf, re);
theta2 = CalcInvKinematics(E_0_2, f, e, rf, re);
theta3 = CalcInvKinematics(E_0_3, f, e, rf, re);

end



