% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).  % limit term space (8Mb)
:- set_prolog_stack(local,  limit(2 000 000)).  % limit environment space

% Your program goes here

mother(lisa,abe).
mother(lisa,sarah).
mother(sarah,susan).
mother(nancy,john).
mother(mary,jill).
mother(susan,jack).
mother(susan,phil).

father(tony,abe).
father(tony,sarah).
father(bill,susan).
father(abe,john).
father(john,jill).
father(rob,jack).
father(rob,phil).

parent(P,C):-mother(P,C).
parent(P,C):-father(P,C).
sibling(X,Y):-parent(P,X),parent(P,Y),X\==Y.
gp(GP,GC):-parent(GP,P),parent(P,GC).

ggp(GGP,GGC):-parent(GGP,GP),gp(GP,GGC).

anc(A,D):-parent(A,D).
anc(A,D):-parent(P,D),anc(A,P).


fcousin(X,Y):-gp(GC,X),gp(GC,Y),X\=Y.
scousin(X,Y):-ggp(GGC,X),ggp(GGC,Y),X\=Y.
grnephew(X,Y):-sibling(S,X),gp(S,Y),X\=Y.
gen(P1, P2) :- gp(G,P1),gp(G,P2), P1\==P2. 
gen(P1, P2) :- parent(X, P1), parent(Y, P2), gen(X, Y),P1\==P2,X\==Y.

