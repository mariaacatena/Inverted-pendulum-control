% INVERTED PENDULUM
% Modeling, control design and discretization of an inverted pendulum

% TRANSFER FUNCTIONS
G_theta = tf(ss(A, B, C_theta, D));
G_x = tf(ss(A, B, C_x, D));
G_theta_x = G_x/G_theta;

% ANGLE CONTRTOLLER designed using root-locus analysis
figure
rlocus(-G_theta); 
title('Root locus of G_{theta}');
s = tf('s');
R_theta = (s+4)^2/(s*(s+100)); %High-frequency pole (-100) added for physical realizability

figure
rlocus(-R_theta*G_theta);
title('Root locus of L_{theta}');


figure
k_theta = 2500; 
R_theta = -k_theta*R_theta;
L_theta = minreal(R_theta*G_theta);
F = L_theta/(1+L_theta);
step(F);
title('Step reponse of F');



% ANGLE CONTROLLER – SPECIFICATIONS

figure
bode(F);
title('Bode diagram of F');
% SPECIFICATIONS: 
% - zero overshoot
% - settling time < 1.2
omega_c = 6; % desired crossover frequency

alpha = 10^(-20*log10(abs(evalfr(F, j*omega_c)))/20); 
tau = 10/(alpha*omega_c);
mu_f = 1/abs((evalfr(F/s,j*omega_c))); 

R_f_statico = mu_f/s;

R_f_dinamico = (1+s*alpha*tau)/(1+s*tau);
R_f_totale = R_f_statico*R_f_dinamico;

L_f = F*R_f_statico*R_f_dinamico;
figure
bode(L_f);
title('Bode diagram of L_f');
figure
step(L_f/(1+L_f));
title('Step response of L_ f/(1+L_f)');



% POSITION CONTROLLER

figure
rlocus(minreal(-G_theta_x));
title('Root locus of G_{theta_x}');


k_theta_x = -2;
R_theta_x = k_theta_x*s*(s-10)/(s+30)/(s+4);
L_theta_x = minreal(R_theta_x*G_theta_x);
figure
rlocus(L_theta_x);
title('Root locus of L_{theta_ x}');
figure
step(L_theta_x/(1+L_theta_x), 10);
title('Step response of L_{theta_ x}/(1+L_{theta_ x})');



% DISCRETISATION WITH TUSTIN

% Angle controller (root locus)
Ts_theta = sampling_time(L_theta);
R_z_theta = discretizza_tustin(R_theta, Ts_theta);

% Angle controller (specifications)
Ts_f = sampling_time(L_f);
R_z_f = discretizza_tustin(R_f_totale, Ts_f);

% Position controller
Ts_x = sampling_time(L_theta_x);
R_z_x = discretizza_tustin(R_theta_x, Ts_x);
