function eci = ECEF2ECI(ecef, GMST)
% Convert ECEF position to ECI position
%
% Inputs:
%           ecef - 3xN ECEF position vectors (km)
%           GMST - 1xN list of GMST (radians)
% Outputs:
%           eci - 3xN ECI position vectors (km)

% Number of input vectors
N = size(ecef, 2);

% Check for correct input dimension
if (size(ecef, 1) == 3) && (N == length(GMST))
    
    % Size output
    eci = zeros(3, N);
    
    for ii = 1:N
        % Compute rotation from ECI to ECEF
        R_eci2ecef = [cos(GMST(ii)),  sin(GMST(ii)), 0; ...
                      -sin(GMST(ii)), cos(GMST(ii)), 0; ...
                      0,              0,             1];
        % Transpose for opposite direction
        R_ecef2eci = transpose(R_eci2ecef);

        % Compute ECEF position
        eci(:, ii) = R_ecef2eci * ecef(:, ii);
    end
    
else
    eci = nan(3, N);
    disp('Wrong input dimension for ECEF2ECI');
end
    
