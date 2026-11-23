first_step(Z,M) :- M = #min{ T : drive(Z,_,T) }, train(Z).
final_step(Z,M) :- M = #max{ T : drive(Z,_,T) }, train(Z).
num_actions(Z,N) :- train(Z),
		first_step(Z,T),
		final_step(Z,T'),
		N = T'-T.
total_actions(Total) :- Total = #sum{ N : num_actions(_,N) }.

%#minimize{ 1,Total : total_actions(Total) }.

#show.
#show first_step/2.
#show final_step/2.
#show num_actions/2.
