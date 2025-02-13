% Assumes incompressible and inviscid
% Using continuity and bernoillis equation for 1D calculations
% Gonna test this with ANSYS at one point to see how off these numbers are

% All units in metric (kg, m, m/s, Pa, N) unless specified

v_inf = 10; 
P_inf = 101325;
rho_inf = 1.225;

fx = zeros(1,num_panels-1);
fy = zeros(1,num_panels-1);
P = zeros(1,num_panels-1);

% Calculate forces for each panel

for i=1:(num_panels-1)
    height = (panel_y(i)+panel_y(i+1))/2 % Use average height of panel
    P(i) = get_pressure(panel_y(1), height, v_inf, P_inf, rho_inf); % Calculate pressure
    fx(i) = (P_inf-P(i))*(panel_y(i+1)-panel_y(i)); % Find Fx for panel
    fy(i) = (P_inf-P(i))*(panel_x(i)-panel_x(i+1)); % Find Fy for panel
end

% Display Results

disp('Drag: ')
disp(sum(fx));
disp('Lift: ')
disp(sum(fy));

% Plot variables along length

subplot(2,2,1);
plot(panel_x, panel_y)
title('Geometry')
axis equal
grid on

subplot(2,2,2);
plot(P)
title('Pressure under geometry')
grid on

subplot(2,2,3);
plot(fy)
title('Fy (N)')
grid on

subplot(2,2,4);
plot(fx)
title('Fx (N)')
grid on

% Don't really need a separate function right now, but could be used later
function P = get_pressure(inlet_h, height, v_inf, P_inf, rho_inf)
    P = P_inf + 0.5*rho_inf*(v_inf^2)*(1-((inlet_h/height)^2));
end