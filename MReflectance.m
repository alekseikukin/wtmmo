function [M ,tetta2]= MReflectance(N1, N2, tetta1)
%MReflectance return M matrix of border between 2 mediums
[S, tetta2]  = SReflectance(N1, N2, tetta1);
M = SMMatrixConverter(S);
end

