% for path2drive encodings
% translate drive into action fact format
% action(train(ID),Action,Time)


%% -- DETERMINANTS ---------

% off-map waiting
first(Z,T) :- drive(Z,_,T), not drive(Z,_,T-1).

% movement(Z,D,T)
movement(Z,D,T) :- 
    drive(Z,(X,Y),T-1), 
    drive(Z,(X',Y'),T), 
    offset(D,X'-X,Y'-Y).

% preserve direction a train is facing
heading(Z,H,T) :- first(Z,T), start(Z,_,_,H).   % starting direction
heading(Z,H,T) :- movement(Z,H,T).              % when moving
heading(Z,H,T) :- heading(Z,H,T-1), drive(Z,C,T-1), drive(Z,C,T).  % when waiting

% how many options does a train have in a specific cell
option(C,H,D) :- cell(C,Track), transition(Track,(H,D)).
decision(C,H) :- option(C,H,D), option(C,H,D'), D < D'.

% turn(H,D,A): going from heading H to direction D is a turn of kind A
turn(n,w,move_left).  turn(n,e,move_right).
turn(e,n,move_left).  turn(e,s,move_right).
turn(s,e,move_left).  turn(s,w,move_right).
turn(w,s,move_left).  turn(w,n,move_right).


%% -- ACTIONS ---------

% spawning actions
action(train(Z),wait,0..F-1) :- first(Z,F).
action(train(Z),move_forward,T) :- first(Z,T).

% wait
action(train(Z),wait,T) :- 
    drive(Z,C,T-1), 
    drive(Z,C,T).

% left/right when there is a directional decision AND a turn
action(train(Z),A,T) :- 
    movement(Z,D,T), 
    drive(Z,C,T-1), 
    heading(Z,H,T-1),
    decision(C,H), 
    turn(H,D,A).

% all else is forward
action(train(Z),move_forward,T) :- 
    movement(Z,_,T),
    not action(train(Z),move_left,T),
    not action(train(Z),move_right,T).

#show action/3.