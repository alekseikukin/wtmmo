function [M ,tetta2]= MReflectance(N1, N2, tetta1)
%MReflectance return M matrix of border between 2 mediums
% N1 - complex refractive index of first medium
% N2- complex refractive index of second medium
% tetta1 - angle of incident
% tetta2 - angle of refraction
% M - M-matrix
[S, tetta2]  = SReflectance(N1, N2, tetta1);
M = SMMatrixConverter(S);
end

