function [Ux_deriv] = GeneralMinmod(theta,U,ddx)
Nu = length(U);
U_right = [U(:,2:Nu),U(:,Nu)]; U_left = [U(:,1),U(:,1:Nu-1)];
Deriv_Left = theta*(U - U_left)/ddx;
Derive_Right = theta*(U_right - U)/ddx;
Derive_Central = 0.5*(U_right - U_left)/ddx;
DC = reshape(Derive_Central,1,2*Nu); 
DL = reshape(Deriv_Left,1,2*Nu);
DR = reshape(Derive_Right,1,2*Nu);
DD = [DC;DL;DR];
D_Max = max(DD);D_Min = min(DD);
D1 = double(D_Max<0).*D_Max; D2 = double(D_Min>0).*D_Min;
DD = D1 + D2;
Ux_deriv = reshape(DD,2,Nu);
end