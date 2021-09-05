function M = MTransmittance(N, d, lambda, tetta)
%MTransmittance return S matrix of simple film
% N - complex refractive index
% d - thikness
% lambda - wavelength
% tetta - angle of propagation
M = SMMatrixConverter(STransmittance(N, d, lambda, tetta));
end

