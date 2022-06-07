insert(X,[],[X]).
insert(X,[H|T],[X,H|T]):-X<H.
insert(X,[H|T],[H|R]):-X>=H,insert(X,T,R).

mysort([],[]).
mysort([H|T],L):-mysort(T,L1),insert(H,L1,L).