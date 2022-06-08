change(e,w).
change(w,e).
move([X,X,Goat,Cabbage],wolf,[Y,Y,Goat,Cabbage]):-change(X,Y).
move([X,Wolf,X,Cabbage],goat,[Y,Wolf,Y,Cabbage]):-change(X,Y).
move([X,Wolf,Goat,X],cabbage,[Y,Wolf,Goat,Y]):-change(X,Y).
move([X,Wolf,Goat,C],nothing,[Y,Wolf,Goat,C]):-change(X,Y).
oneEq(X,X,_).
oneEq(X,_,X).
safe([Man,Wolf,Goat,Cabbage]):-
    oneEq(Man,Goat,Wolf),
    oneEq(Man,Goat,Cabbage).
plan([w,w,w,w],_,[]).
plan(State,PreStates,[Move|Rest]):-move(State,Move,NextState),
    safe(NextState),\+member(NextState,PreStates),
    plan(NextState,[NextState|PreStates],Rest).

myplan(InitState,ListofMoves):-plan(InitState,[],ListofMoves).


