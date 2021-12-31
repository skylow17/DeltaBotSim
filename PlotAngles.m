function PlotAngles(ax, x, theta1, theta2, theta3, angleMin, angleMax)

p = findobj(ax, 'tag', 'ArmAngle');

delete(p);

% draw motor angles curves
plot(ax, x, theta1, 'g', 'tag', 'ArmAngle');
hold(ax, 'on');
plot(ax, x, theta2, 'b', 'tag', 'ArmAngle');
hold(ax, 'on');
plot(ax, x, theta3, 'r','tag', 'ArmAngle');
hold(ax, 'on');

% plot(ax, x, angleMin, '-k','tag', 'ArmAngle');
% hold(ax, 'on');
% plot(ax, x, angleMax, '-k','tag', 'ArmAngle');
% hold(ax, 'on');

lgd = legend(ax, 'Motor 1', 'Motor 2', 'Motor 3');
end

