% Model expected geometry and rotational speed of a wind turbine given
% input parameters

% Setup input parameters
TSR = 4.5; % tip speed ratio (non-dimensional)
P = 4.0; % desired power in Watts
rho_air = 1.225; % density of air in kg/m^3
c_p = 0.4; % estimated coefficient of power (non-dimensional)
sys_eff = 0.7; % efficiency of generator and gearbox system
u_wind = 14; % wind velocity in m/s

% Calculate expected radius and rotational speed
R = sqrt(2*P/(u_wind^3*rho_air*pi*c_p*sys_eff)) % expected radius of turbine rotor in meters
omega_rotor = ((TSR*u_wind)/R) * (60/(2*pi)) % rotational speed of the rotor in rev/min
