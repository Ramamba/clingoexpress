% for path2drive encodings
% slow trains: speed(Z,V) means V time steps per cell (ICE 1, RB 2, freight 3)

% stay at least V steps on a path position before moving on
:- map(Z,D,P), map(Z,D+1,P+1), P >= 0, speed(Z,V), V > 1, not map(Z,D-V+1,P).
