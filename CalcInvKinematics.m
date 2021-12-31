% p = base plate radius
% e = effector radius
% a = motor arm length
% b = effector arm
% E_0 = effector X(1)Y(2)Z(3) coodinates

function theta = CalcInvKinematics(E_0, f, e, rf, re)
x0 = E_0(:,1);
y0 = E_0(:,2) - e;
z0 = E_0(:,3);

y1 = f; % PEUT ETRE INVERSER

a = (x0.^2 + y0.^2 + z0.^2 + rf^2 - re^2 - y1^2) ./ (2*z0);
b = (y1 - y0) ./ z0;
d = -(a+b.*y1).*(a+b.*y1) + rf.*((b.^2 .* rf) + rf);


for index = 1:1:(size(d, 1))
    if(d(index,1)<0)
        fprintf("Non-existent position at sample %d and coord. : X%.4d Y%.4d Z%.4d\n", ...
            index, E_0(index,1), E_0(index,2), E_0(index,3));
    end
end


yj = (y1 - a.*b - sqrt(d))./(b.^2 + 1);
zj = a + b.*yj;
theta = 180.0 .* atan(-zj./(yj-y1))./pi;


%Uniquement si on souhaite avoir des angles positifs entre 0 et 360°
% if(yj>y1)
%     theta = theta+180.0;
% end

end