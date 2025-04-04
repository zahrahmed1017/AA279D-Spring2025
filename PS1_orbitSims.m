close all; clear

%% Part a) Define initial conditions and constants

a_i = 6978;
e_i = 0.001;
i_i = deg2rad(98);
raan_i = 0;
arg_p_i = 0;
f_i = deg2rad(90);
oe_i = [a_i, e_i, i_i, raan_i, arg_p_i, f_i]';

mu = 3.986012e5; % km^3 / m^2

%% Part b) treat as osculating quantities; compute rv in inertial frame

rv_eci = OE2ECI(oe_i, mu);
r_i = rv_eci(1:3);
v_i = rv_eci(4:6);

%% Part c) numerical integration w/ and w/o J2 

T = 2*pi*sqrt(a_i^3 / mu);
Re = 6378;
tspan = [0, 50*T];

% propagating w/o J2
options = odeset('RelTol', 1e-9, 'AbsTol', 1e-10);
[t_wo, rv_wo] = ode113(@(t, rv) Propagate2Body(rv, mu), tspan, rv_eci', options);

% propagating w/ J2
[t_w, rv_w] = ode113(@(t, rv) Propagate2Body_J2(rv, mu, Re), tspan, rv_eci', options);

figure
hold on
axis equal
plotEarth(Re, [0, 0, 0]);
plot3(rv_wo(:,1), rv_wo(:,2), rv_wo(:,3))
plot3(rv_w(:,1), rv_w(:,2), rv_w(:,3))
view(3)
legend('Earth', 'Unperturbed orbit', 'J2 perturbed orbit')
