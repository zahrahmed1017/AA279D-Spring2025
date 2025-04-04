function plot3Dbody(imageName,R,GMST)
% earthPlot Generate a plot of the Earth in the current axes
%
% Inputs:
%   imageName - string that is name of image to be used on globe
%   R - radius of central body
%   GMST - optional input, rotation of body since J200 in radians

% Options
npanels = 180;
alpha   = 1; % globe transparency level
    
% Turn off the normal axes
set(gca, 'NextPlot','add', 'Visible','on');

axis equal;
axis auto;

% Set initial view
view(3);

% Create a 3D meshgrid of the sphere points using the ellipsoid function
[x, y, z] = ellipsoid(0, 0, 0, R, R, R, npanels);
globe = surf(x, y, -z, 'FaceColor', 'none', 'EdgeColor', 0.5*[1 1 1]);

% Account for GMST rotation
if exist('GMST','var')
    hgx = hgtransform;
    set(hgx,'Matrix', makehgtform('zrotate',GMST));
    set(globe,'Parent',hgx);
end

% Load body image for texture map
cdata = imread(imageName);

% Set image as color data (cdata) property, and set face color to indicate
% a texturemap, which Matlab expects to be in cdata. Turn off the mesh edges.
set(globe, 'FaceColor', 'texturemap', 'CData', cdata, 'FaceAlpha', alpha, 'EdgeColor', 'none');

end