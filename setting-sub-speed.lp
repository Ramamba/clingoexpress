% like setting-sub.lp, with train speeds speed(Z,V)
% set horizon on call, e.g. -c h=120

% environment physics
#include "encodings/aux_dir/aux_file.lp".

% specific approach
#include "encodings/constant.lp".
#include "encodings/translations/subnodes.lp".
#include "encodings/pathfinding/path2drive/pathfinding-subnodes.lp".
#include "encodings/pathfinding/path2drive/drive-map.lp".
#include "encodings/extensions/speed.lp".
#include "encodings/extensions/departure.lp".
#include "encodings/pathfinding/path2drive/drive-collisions.lp".
#include "encodings/actions/drive-to-actions-speed.lp".


%#show drive/3.
%#show action/3.
