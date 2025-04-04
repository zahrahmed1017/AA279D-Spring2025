function ecef = GEOC2ECEF(geoc, RP)
% Convert geocentric coordinates to ECEF position
%
% Inputs:
%           geoc - 3xN geocentric position data (latitude (deg), longitude (deg), height (km))
%           RP - radius of planet (km)
% Outputs:
%           ecef - 3xN ECEF position vectors (km)

% Number of input vectors
N = size(geoc, 2);

% Check for correct input dimension
if size(geoc, 1) == 3
    
    % Size output matrix
    ecef = zeros(3, N);
    
    for ii = 1:N
        lat = geoc(1, ii);
        long = geoc(2, ii);
        h = geoc(3, ii);
        % Compute ecef position from lat/long/alt
        ecef(1, ii) = (RP + h) * cosd(lat) * cosd(long);
        ecef(2, ii) = (RP + h) * cosd(lat) * sind(long);
        ecef(3, ii) = (RP + h) * sind(lat);
    end
    
else
    ecef = nan(3, N);
    disp('Wrong input dimension for GEOC2ECEF')
end
