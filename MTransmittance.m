function M = MTransmittance(N, d, lambda, tetta)
% return S matrix of simple film
M = SMMatrixConverter(STransmittance(N, d, lambda, tetta));
end

