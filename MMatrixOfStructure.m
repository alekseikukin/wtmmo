function [M, tetta2] = MMatrixOfStructure(tetta0, lambda, varargin)
%MMatrixOfStructure return M matrix of structure
% tetta0 - angle of incident
% lambda - wavelength
% varargin: couples of refractive indexes and thiknesses of films
if max(size(varargin)) < 2
    error('not enough input argument')
elseif max(size(varargin)) == 2
    tetta2 = tetta0;
    M = MTransmittance(varargin{1}, varargin{2}, lambda, tetta0);
elseif max(size(varargin)) == 3
    M1 = MTransmittance(varargin{1}, varargin{2}, lambda, tetta0);
    [M2, tetta2] = MReflectance(varargin{1}, varargin{3}, tetta0);
    M = M1 * M2;
else
    M1 = MTransmittance(varargin{1}, varargin{2}, lambda, tetta0);
    [M2, tetta1] = MReflectance(varargin{1}, varargin{3}, tetta0);
    varargin(1:2) = [];
    [M3, tetta2] = MMatrixOfStructure(tetta1, lambda, varargin{:});
    M = M1 * M2 * M3;
end
end

