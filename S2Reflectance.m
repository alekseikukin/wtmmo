function R = S2Reflectance(S, varargin)
%S2Reflectance return reflectance from S matrix
if isempty(varargin)
    R = abs(S(1,2))^2;
else
    R = abs(S(1,1))^2;
    
end
end

