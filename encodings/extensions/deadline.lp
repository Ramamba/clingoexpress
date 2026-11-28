% for path2drive encodings
% every train reaches its target in time: end(Z,_,Deadline)

% flatland counts arrival after the step, so arrival at T means T+1 <= Deadline
:- end(Z,_,DL), end_of_path(Z,P), map(Z,T,P), T >= DL.
