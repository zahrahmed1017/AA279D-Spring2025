function DState = Propagate2Body(State, mu, Re)

% Parse state vector:
x  = State(1);
y  = State(2);
z  = State(3);
vx = State(4);
vy = State(5);
vz = State(6);

% J2 perturbation forumlation taken from Vallado (4e, p594)

r = sqrt(x^2 + y^2 + z^2);

J2 = 0.0010826267;

ax_j2 = -( (3*J2*mu*(Re^2)*x) / (2*r^5) ) * (1 - (5*z^2)/(r^2));
ay_j2 = -( (3*J2*mu*(Re^2)*y) / (2*r^5) ) * (1 - (5*z^2)/(r^2));
az_j2 = -( (3*J2*mu*(Re^2)*z) / (2*r^5) ) * (3 - (5*z^2)/(r^2));


% Calculate derivatives
r     = [x;y;z];
r_mag = norm(r);
ax    = ((-mu/(r_mag)^3)*r(1)) + ax_j2; 
ay    = ((-mu/(r_mag)^3)*r(2)) + ay_j2;
az    = ((-mu/(r_mag)^3)*r(3)) + az_j2;


% Package derivatives
DState    = zeros(size(State));
DState(1) = vx;
DState(2) = vy;
DState(3) = vz;
DState(4) = ax;
DState(5) = ay;
DState(6) = az;

end