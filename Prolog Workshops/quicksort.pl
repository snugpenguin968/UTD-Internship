%partition(P,L,Ss,Bs)

partition(P,[],[],[]).
partition(P,[H|T],[H|S],B):-H=<P,partition(P,T,S,B).
partition(P,[H|T],S,[H|B]):-H>P,partition(P,T,S,B).

qs([H|T],R):-partition(H,T,S,B),
    qs(S,S1),
    qs(B,B1),
    append(S1,[H|B1],R).
qs([],[]).