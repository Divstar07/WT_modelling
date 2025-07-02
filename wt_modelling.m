clc; clearvars;

%% Rotor design
% Use this section if modelling expected geometry and rotational speed of a wind turbine given
% input parameters

% Setup input parameters
TSR = 4.5; % tip speed ratio (non-dimensional)
P = 4.0; % desired power in Watts
rho_air = 1.225; % density of air in kg/m^3
c_p = 0.4; % estimated coefficient of power (non-dimensional)
c_T = 0.8; % estimated thrust coefficient (non-dimensional)
sys_eff = 0.7; % efficiency of generator and gearbox system
fan_PWM = 50; % PWM of fan array in percent


% Intermediate results
u_wind = 0.1925*fan_PWM - 0.4635 % fan speed without contraction
q = 0.5*rho_air*(u_wind^2);

% Calculate expected rotor diameter and rotational speed
D = 2*(sqrt(2*P/(u_wind^3*rho_air*pi*c_p*sys_eff))) % expected radius of turbine rotor in meters
omega_rotor = ((TSR*u_wind)/(D/2)) * (60/(2*pi)) % rotational speed of the rotor in rev/min
A = (pi*D^2)/4; % Area of rotor
T = q*A*c_T % Thrust force in Newtons


% =========================================================================================================================
% =========================================================================================================================


%% Rotor evaluation
% Use this section if predicting forces given a turbine design
% input parameters, modelled after WiRE-01
clc; clearvars;

% Setup input parameters
TSR = 4.5; % tip speed ratio (non-dimensional)
rho_air = 1.225; % density of air in kg/m^3
c_p = 0.4; % estimated coefficient of power (non-dimensional)
c_T = 0.8; % estimated thrust coefficient (non-dimensional)
fan_PWM = 100; % PWM of fan array in percent
D = 0.15; % diameter of turbine rotor in meters

% Intermediate results
u_wind = 0.1925*fan_PWM - 0.4635 % fan speed without contraction
q = 0.5*rho_air*(u_wind^2);

% Calculate expected rotor diameter and rotational speed
A = (pi*D^2)/4; % Area of rotor in m^2
T = q*A*c_T % Thrust force in Newtons

% Calculate drag force from the tower
% input variables
C_d = 0.3; % Drag coefficient of a cylinder in turbulent flow
h_exposed = 0.12; % Height of tower exposed to incoming flow
d_upper = 0.0144; % Diameter of upper face of tower
d_lower = 0.0142; % Diameter of lower face of tower

% Intermediate results
A_exposed = 0.5*(d_lower + d_upper)*h_exposed;

% Calculate drag force
D = C_d*q*A_exposed

% Display percentage of Drag to Thrust
drag_to_thrust = (D/T)*100