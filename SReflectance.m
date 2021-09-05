function [S, tetta2]  = SReflectance(N1, N2, tetta1)
%SReflectance return S matrix of border between 2 mediums
% N1 - complex refractive index of first medium
% N2- complex refractive index of second medium
% tetta1 - angle of incident
% S - s-matrix
% tetta2 - angle of refraction
Tetta1 = @(n0, n1, tetta0)...
    asin(real(n0) ./ real(n1) * sin(tetta0)); % Snell's law

r00 = @(N1, N2, tetta1, tetta2)...  % p65 (55)
    (N2 * cos(tetta2) - N1 * cos(tetta1))/...
    (N2 * cos(tetta2) + N1* cos(tetta1));

t00 = @(N1, N2, tetta1, tetta2)...% p65 (55)
    2 * N1 * cos(tetta1) / (N1 * cos(tetta1) + N2 * cos(tetta2));

tetta2 = Tetta1(N1, N2, tetta1);
r12 = r00(N1, N2, tetta1, tetta2);
r21 =  r00(N2, N1, tetta2, tetta1);
t12 = t00(N1, N2, tetta1, tetta2);
t21 = t00(N2, N1, tetta2, tetta1);

S = [t12, r21; r12, t21];
end

