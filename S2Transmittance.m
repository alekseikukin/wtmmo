function T = S2Transmittance(S, varargin)
%S2Reflectance return transmittance from S matrix
if isempty(varargin)
    T = abs(S(1,1))^2;
else
    T = abs(S(2,2))^2;
end
end

