function out = Rotation2D(ToRotate, alpha)
% Use a rotation matrix combined with matrix product to rotate coordinates

alpha_rad = (alpha/180)*pi; %convert degree angle to rad to deal with sin and cos functions
out = zeros(size(ToRotate)); %initialize the out function's size to optimize computing during for loop

%create rotation matrix (2x2 constant, alpha angle dependant)
RotationMat = [cos(alpha_rad) -sin(alpha_rad)
               sin(alpha_rad) cos(alpha_rad)];

    %do the matrix product between the rotation matrix and initial travel
    %coordinates matrix for the number of coordinates
for index = 1:1:(size(ToRotate, 1))
    out(index,1:2) = RotationMat * ToRotate(index,1:2)';
end

%add the Z coordinates that hasn't changed
out(:,3) = ToRotate(:,3);

end