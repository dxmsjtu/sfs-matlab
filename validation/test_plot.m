function boolean = test_plot()
%TEST_PLOT tests the correctness of plot_sound_field()
%
%   Usage: boolean = test_driving_functions()
%
%   Output parameters:
%       booelan - true or false
%
%   TEST_PLOT() creates plots for monochromatic and time-domain sound field with
%   different dimensions and different grids.

%*****************************************************************************
% Copyright (c) 2010-2015 Quality & Usability Lab, together with             *
%                         Assessment of IP-based Applications                *
%                         Telekom Innovation Laboratories, TU Berlin         *
%                         Ernst-Reuter-Platz 7, 10587 Berlin, Germany        *
%                                                                            *
% Copyright (c) 2013-2015 Institut fuer Nachrichtentechnik                   *
%                         Universitaet Rostock                               *
%                         Richard-Wagner-Strasse 31, 18119 Rostock           *
%                                                                            *
% This file is part of the Sound Field Synthesis-Toolbox (SFS).              *
%                                                                            *
% The SFS is free software:  you can redistribute it and/or modify it  under *
% the terms of the  GNU  General  Public  License  as published by the  Free *
% Software Foundation, either version 3 of the License,  or (at your option) *
% any later version.                                                         *
%                                                                            *
% The SFS is distributed in the hope that it will be useful, but WITHOUT ANY *
% WARRANTY;  without even the implied warranty of MERCHANTABILITY or FITNESS *
% FOR A PARTICULAR PURPOSE.                                                  *
% See the GNU General Public License for more details.                       *
%                                                                            *
% You should  have received a copy  of the GNU General Public License  along *
% with this program.  If not, see <http://www.gnu.org/licenses/>.            *
%                                                                            *
% The SFS is a toolbox for Matlab/Octave to  simulate and  investigate sound *
% field  synthesis  methods  like  wave  field  synthesis  or  higher  order *
% ambisonics.                                                                *
%                                                                            *
% http://github.com/sfstoolbox/sfs                      sfstoolbox@gmail.com *
%*****************************************************************************


%% ===== Checking of input  parameters ===================================
nargmin = 0;
nargmax = 0;
narginchk(nargmin,nargmax);


%% ===== Configuration ===================================================
conf = SFS_config_example;

% 2-D plots
sound_field_mono_wfs([-2 2],[-2 2],0,[0 -1 0],'pw',1000,conf)
sound_field_mono_wfs([-2 2],0,[-2 2],[0 -1 0],'pw',1000,conf)
sound_field_mono_wfs(0,[-2 2],[-2 2],[0 -1 0],'pw',1000,conf)
% 1-D plots
sound_field_mono_wfs([-2 2],0,0,[0 -1 0],'pw',1000,conf)
sound_field_mono_wfs(0,0,[-2 2],[0 -1 0],'pw',1000,conf)
sound_field_mono_wfs(0,[-2 2],0,[0 -1 0],'pw',1000,conf)

% Non-regular grid
x1 = sort(randi([-2000 2000],300,1)/1000);
x2 = sort(randi([-2000 2000],300,1)/1000);
X1 = repmat(x1',[conf.resolution 1]);
X2 = repmat(x2',[conf.resolution 1])';
% 2-D plots
sound_field_mono_wfs(X1,X2,0,[0 -1 0],'pw',1000,conf)
sound_field_mono_wfs(X1,0,X2,[0 -1 0],'pw',1000,conf)
sound_field_mono_wfs(0,X1,X2,[0 -1 0],'pw',1000,conf)
% 1-D plots
sound_field_mono_wfs(X1,0,0,[0 -1 0],'pw',1000,conf)
sound_field_mono_wfs(0,0,X2,[0 -1 0],'pw',1000,conf)
sound_field_mono_wfs(0,X2,0,[0 -1 0],'pw',1000,conf)
