function globe = plotEarth(R, origin)
    % Assumes spherical earth

    npanels = 180;

    [x, y, z] = ellipsoid(0, 0, 0, R, R, R, npanels);
    x = x + origin(1);
    y = y + origin(2);
    z = z + origin(3);

    globe = surf(x, y, -z, 'FaceColor', 'none', 'EdgeColor', 0.5*[1 1 1]);

end