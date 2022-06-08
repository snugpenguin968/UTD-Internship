solve([X11, X12, X13, X21, X22, X23, X31, X32, X33]):- 
    select(X11, [1,2,3,4,5,6,7,8,9],R1), 
    select(X12, R1, R2), 
    select(X13, R2, R3), 
    15 is X11 + X12 + X13, 
    select(X21, R3, R4), 
    select(X22, R4, R5), 
    select(X23, R5, R6), 
    15 is X21 + X22 + X23, 
    select(X31,R6,R7), 
    15 is X11+X21+X31,
    select(X32,R7,R8), 
    15 is X12+X22+X32,
    select(X33,R8,_),
    15 is X13+X23+X33,
    15 is X11+X22+X33,
    15 is X13+X22+X31.
