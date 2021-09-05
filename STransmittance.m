function S = STransmittance(N, d, lambda, tetta)
%STransmittance return S matrix of simple film
%N - complex rafractive index
%d  - thickness
%lambda - wavelength
%tetta - angle of beam
d1 = d / cos(tetta);
k0 = 2 * pi / lambda;
alpha = 2 * k0 * imag(N);
fi = real(N) * k0 * d1;
t12 = exp(- 1i * fi) * exp(- alpha * d1);
t21 = exp(- 1i * fi) * exp(- alpha * d1);
S = [t12, 0 ; 0, t21];
end

