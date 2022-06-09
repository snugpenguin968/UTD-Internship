% s(CASP) Programming
:- use_module(library(scasp)).
% Uncomment to suppress warnings
%:- style_check(-discontiguous).
%:- style_check(-singleton).
%:- set_prolog_flag(scasp_unknown, fail).


%George is a bachelor
%

-wedded(george,Y,T).

% George was born in Boston, collects stamps.
birth_city(george, boston).
hobby(george, stamp_collecting).


%A son of someone is a child who is male.
son(X,Y) :- child(X,Y), male(X). 	% X is son/child of Y
child(X,Y) :- son(X,Y).
male(X) :- son(X,Y).

child(george,mary).
child(george,fred).

male(george).


%George is the only son of Mary and Fred.
:- son(X, fred), son(Y, fred), Y .<>. X.
               	%only son of fred (assumption)
:- son(X, mary), son(Y, mary), Y .<>. X.
               	%only son of mary (assumption)

%A man is an adult male person.
man(X) :- adult(X), male(X).

%A bachelor is a man who has never been married.
bachelor(X) :- man(X), not wedded(X, Y, T).

%A (traditional) marriage is a contract between a man and a woman,
%enacted by a wedding and dissolved by a divorce. While the contract is
%in effect, the man (called the husband) and the woman (called the wife)
%are said to be married.

%married(X,Y, T) :- wedded(X,Y,T1), T .>. T1, not divorced(X,Y,T2),
%                    	T .<. T2, groom(X), bride(Y).
married(X,Y, T) :- groom(X), bride(Y), wedded(X,Y,T1), T .>. T1, not divorced(X,Y,T).
divorced(X,Y, T) :- husband(X), wife(Y), dissolved(X,Y,T1), T .>. T1.

groom(X) :- wedded(X,Y,T1), male(X).
bride(Y) :- wedded(X,Y,T1), female(Y).
husband(X) :- groom(X).
wife(X) :- bride(X).

:- wedded(X,Y,T1), divorced(X,Y,T2), groom(X), bride(Y), T1 .>=. T2.
            	%wedding precedes divorce

%Queries:
%George has never been the groom at a wedding.
%?- not groom(george).
%?- not -groom(george).

% Mary has an unmarried son born in Boston.
umsbb(M,X,C) :- son(X,M),birth_city(X,C), not married(X,Y,T).
%?- umsbb(mary,X,boston).

%No woman is the wife of any of Fred’s children.
fred_child_wife(Y) :- child(X,fred), married(X,Y,T), female(Y).
%?- not fred_child_wife(X).



