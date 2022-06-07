chkeven([],[]).
chkeven([H|T],[H|T1]):-0 is H mod 2,chkeven(T,T1). 
chkeven([H|T],T1):-1 is H mod 2,chkeven(T,T1).

%range(N,L): L = [N,...,1]
range(0,[]).
range(N,[N|T]):-N1 is N-1,range(N1,T).

%range2(N,L): L= [1,...,N]
range2(N,L):-range2(N,1,L).
range2(N,N,[N]).
range2(N,M,[M|T] ):- M=<N, M1 is M+1, range2(N,M1,T).

