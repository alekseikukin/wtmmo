function [S, tetta2] = SMatrixOfStructure(tetta0, lambda, varargin)
%SMatrixOfStructure return S matrix of structure
% tetta0 - angle of incident
% lambda - wavelength
% varargin: couples of refractive indexes and thiknesses of films
[M, tetta2] = MMatrixOfStructure(tetta0, lambda, varargin{:});
S = SMMatrixConverter(M);
end

