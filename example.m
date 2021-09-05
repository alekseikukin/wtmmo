lambda  = 1550; % [nm]
tetta = 0;  %[rad]
d_coating = 0:1000; %[nm]
%%%%%% calc of reflection spectrum of gold
[S_gold, tetta2] = SMatrixOfStructure(tetta, lambda,... %Calc S matrix
    1, 0,... % air layer
    N_gold(lambda), 0);  % gold layer
R_gold = abs(S_gold(1,2)) ^ 2; % calc R from S matrix
R_gold = zeros(size(d_coating)) + R_gold; % line of pure gold for graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% calc gold mirrors with different coatings %%%%%%%%%%%%%%
% initiation of arrays
R_coated_gold_1 = zeros(size(d_coating));
R_coated_gold_2 = zeros(size(d_coating));
R_coated_gold_3 = zeros(size(d_coating));
%calc for different thickness of coatings
for i = 1:max(size(d_coating))
    [S_coated_gold_1, tetta2] =...
        SMatrixOfStructure(tetta, lambda, N_air(lambda), 0,N_Si3N4(lambda), d_coating(i), N_gold(lambda), 0);
    R_coated_gold_1(i) = S2Reflectance(S_coated_gold_1);
    [S_coated_gold_2, tetta2] =...
        SMatrixOfStructure(tetta, lambda, N_air(lambda), 0,N_SiO2(lambda), d_coating(i), N_gold(lambda), 0);
    R_coated_gold_2(i) = S2Reflectance(S_coated_gold_2);
    [S_coated_gold_3, tetta2] =...
        SMatrixOfStructure(tetta, lambda,...
        N_air(lambda), 0,...
        N_Si3N4(lambda), d_coating(i)/2,...
        N_SiO2(lambda), d_coating(i)/2,...
        N_gold(lambda), 0);
    R_coated_gold_3(i) = S2Reflectance(S_coated_gold_3);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(d_coating, R_gold)
hold on
plot(d_coating, R_coated_gold_1)
plot(d_coating, R_coated_gold_2)
plot(d_coating, R_coated_gold_3)
hold off
legend('pure gold',...
    'gold coated by Si3N4',...
    'gold coated by SiO2',...
    'double layer')



%%%%%%%%%%%%%%%%%%%%%%%%%%% Secondary functions %%%%%%%%%%%%%%%%%%%%%%%%%%%
function N =  N_gold(lambda)% get refractive index of Au
data1 = dlmread('nk_Au.txt');
n_gold = data1(:, 2);
k_gold = data1(:, 3);
lambda_gold = data1(:, 1) * 1000;
N = interp1(lambda_gold, n_gold, lambda) + 1i * interp1(lambda_gold, k_gold, lambda);
end
function N =  N_Si3N4(lambda) % get refractive index of Si3N4
data2 = dlmread('nk_Si3N4.txt');
n_Si3N4 = data2(:, 2);
lambda_Si3N4 = data2(:, 1) * 1000;
N = interp1(lambda_Si3N4, n_Si3N4, lambda);
end
function N = N_air(lambda)% get refractive index of Air
N = 1;
end
function N =  N_SiO2(lambda)% get refractive index of SiO2
data1 = dlmread('nk_SiO2..txt');
n_gold = data1(:, 2);
lambda_gold = data1(:, 1) * 1000;
N = interp1(lambda_gold, n_gold, lambda);
end