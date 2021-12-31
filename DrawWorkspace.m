function DrawWorkspace(ax,X,Y,Z, maxHeight, VolumeHeight)

%% draw the workspace cube 
verticesOxy = [-X/2 -Y/2 0; X/2 -Y/2 0; X/2 Y/2 0; -X/2 Y/2 0];
verticesOxz = [-X/2 Y/2 -Z; X/2 Y/2 -Z; X/2 Y/2 VolumeHeight-Z; -X/2 Y/2 VolumeHeight-Z];
verticeMaxHeight = [-X/2 -Y/2 -Z+maxHeight; X/2 -Y/2 -Z+maxHeight; X/2 Y/2 -Z+maxHeight; -X/2 Y/2 -Z+maxHeight];

%draw cube upper hat
patch(ax,verticesOxy(:,1), verticesOxy(:,2), (VolumeHeight-Z) * ones(1,4), 'red', 'facecolor', 'none', 'edgecolor', 'red', 'tag', 'workspace');
hold(ax, 'on');

%draw cube hat
patch(ax,verticesOxy(:,1), verticesOxy(:,2), zeros(1,4), 'magenta', 'facecolor', 'none', 'edgecolor', 'magenta', 'tag', 'workspace');
hold(ax, 'on');
%draw cube floor
patch(ax,verticesOxy(:,1), verticesOxy(:,2), -Z*ones(1,4), 'red', 'facecolor', 'none', 'edgecolor', 'red', 'tag', 'workspace');
hold(ax, 'on');

%draw cube sides
patch(ax,verticesOxz(:,1), verticesOxz(:,2), verticesOxz(:,3), 'red', 'facecolor', 'none', 'edgecolor', 'red', 'tag', 'workspace');
hold(ax, 'on');
patch(ax,verticesOxz(:,1), -verticesOxz(:,2), verticesOxz(:,3), 'red', 'facecolor', 'none', 'edgecolor', 'red', 'tag', 'workspace');
hold(ax, 'on');

%draw max height limit
patch(ax,verticeMaxHeight(:,1), verticeMaxHeight(:,2), verticeMaxHeight(:,3), 'cyan', 'facecolor', 'none', 'edgecolor', 'cyan', 'tag', 'workspace');
hold(ax, 'on');

%% draw trihedron
%plot the arrow 3 times for each axis
quiver3(ax,0,0,0,0.3*X,0,0, 'g', 'LineWidth', 3, 'tag', 'workspace')
hold(ax, 'on');
quiver3(ax,0,0,0,0,0.3*Y,0, 'b', 'LineWidth', 3, 'tag', 'workspace')
hold(ax, 'on');
quiver3(ax,0,0,0,0,0,0.3*Z, 'r', 'LineWidth', 3, 'tag', 'workspace')
hold(ax, 'on');

%add label to each arrow
text(ax,0.4*X,0,0,"X", 'color','g', 'tag', 'workspace');
text(ax,0,0.4*Y,0,"Y", 'color','b', 'tag', 'workspace');
text(ax,0,0,0.4*Z,"Z", 'color','r', 'tag', 'workspace');


%% Draw robot arms directions

%create rotation matrix (2x2 constant, alpha angle dependant)
alpha_rad = 2*pi/3;
RotationMat = [cos(alpha_rad) -sin(alpha_rad)
               sin(alpha_rad) cos(alpha_rad)];
alpha_rad2 = -2*pi/3;
RotationMat2 = [cos(alpha_rad2) -sin(alpha_rad2)
               sin(alpha_rad2) cos(alpha_rad2)];

motor1 = [0,0.8*X/2,-Z*0.2];
motor2(1,1:2) = RotationMat * motor1(1,1:2)';
motor2(1,3) = motor1(1,3);
motor3(1,1:2) = RotationMat2 * motor1(1,1:2)';
motor3(1,3) = motor1(1,3);

quiver3(ax,0,0,0,motor1(1,1),motor1(1,2),motor1(1,3), ':g', 'LineWidth', 1, 'tag', 'workspace')
hold(ax, 'on');
quiver3(ax,0,0,0,motor2(1,1),motor2(1,2),motor2(1,3), ':b', 'LineWidth', 1, 'tag', 'workspace')
hold(ax, 'on');
quiver3(ax,0,0,0,motor3(1,1),motor3(1,2),motor3(1,3), ':r', 'LineWidth', 1, 'tag', 'workspace')
hold(ax, 'on');
end 