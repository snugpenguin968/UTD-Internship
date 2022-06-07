map([region(a,A, [B,C,D]),region(b,B, [A,C,E]), region(c,C, [A,B,D,E,F]) ,region(d,D, [A,C,F]),
region(e,E,[B,C,F]),region(f,F,[C,D,E])]).

color_map([Region|Regions], Colors) :-
	color_region(Region,Colors),
	color_map(Regions,Colors).
color_map([], _).
color_region(region(_,Color,Neighbors), Colors) :-
	select(Color, Colors ,Colors1),
	members(Neighbors,Colors1).

select(X,[X|T],T).
select(X,[Y|T],[Y|R]) :- select(X,T,R).
members([],_).
members([H|T],S) :- member(H,S), members(T,S).
member(X,[X|_]).
member(X,[_|T]) :- member(X,T).


