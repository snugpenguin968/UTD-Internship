safe([]).
safe([Q|Qs]):-safe(Qs),\+ attack(Q,Qs).
    
attack(X,Xs):-attack(X,1,Xs).
attack(X,N,[Y|_]):-X is Y+N;X is Y-N.
attack(X,N,[_|Ys]):-N1 is N+1, attack(X,N1,Ys).

queens(N,Qs):-range(1,N,Ns),perm(Ns,Qs),safe(Qs).

range(N,N,[N]).
range(M,N,[M|T]):-M<N,M1 is M+1, range(M1,N,T).

perm([],[]).
perm(L,[X|P]):-select(X,L,R),perm(R,P).

select(X,[X|T],T).
select(X,[Y|T],[Y|R]):-select(X,T,R).


