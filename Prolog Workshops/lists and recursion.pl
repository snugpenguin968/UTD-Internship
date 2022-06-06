% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).  % limit term space (8Mb)
:- set_prolog_stack(local,  limit(2 000 000)).  % limit environment space

member(X,[X|_]).
member(X,[_|T]):-member(X,T). 

append([],Y,Y).
append([H|T],Y,[H|Z]):-append(T,Y,Z).

hanoi(1,A,B,C,[[A,B]]).
hanoi(N,A,B,C,L):-N1 is N-1, hanoi(N1,A,C,B,L1),
    L2 = [[A,B]], hanoi(N1,C,B,A,L3),append(L1,L2,Temp),
    append(Temp,L3,L).


last([X],X).
last([_|T],X):-last(T,X).

reverse([],[]).
reverse([H|T],R):-reverse(T,Tr),append(Tr,[H],R).

prefix([],L).
prefix([H|T1],[H|T2]):-prefix(T1,T2).


suffix(A,B):-reverse(A,AR),reverse(B,BR),prefix(AR,BR).