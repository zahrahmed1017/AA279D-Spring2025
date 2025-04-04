close all; clear

%% Part a) Define initial conditions and constants

a_i = 6978;
e_i = 0.001;
i_i = 98;
raan_i = 0;
arg_p_i = 0;
f_i = 90;
oe_i = [a_i, e_i, i_i, raan_i, arg_p_i, f_i]';

mu = 3.986012e5; % km^3 / m^2

%% Part b) treat as osculating quantities; compute rv in inertial frame

rv_eci = OE2ECI(oe_i, mu);
r_i = rv_eci(1:3);
v_i = rv_eci(4:6);

%% Part c) numerical integration w/ and w/o J2 



