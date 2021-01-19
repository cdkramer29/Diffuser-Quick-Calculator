% Creates simple 2D geometry with the same horizontal length
% Edit panel_y to create the shape, and choose whether to output the plot
% Will maybe add importing splines from CAD if this works

plot_geometry = true;

length = 2;
width = 1;

num_panels = 10;
panel_x = 0:length/(num_panels-1):length;
panel_y = [0.2, 0.15, 0.1, 0.1, 0.1, 0.1, 0.1, 0.15, 0.2, 0.5];

if (plot_geometry == true)
    plot(panel_x, panel_y)
    axis equal
    grid on
end
