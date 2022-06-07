%sum([1,2,4],S) : S=7

sum([],0).
sum([H|T],S):-sum(T,S1),S is H+S1.
