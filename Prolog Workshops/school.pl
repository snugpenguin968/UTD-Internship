% s(CASP) Programming
:- use_module(library(scasp)).
% Uncomment to suppress warnings
%:- style_check(-discontiguous).
%:- style_check(-singleton).
%:- set_prolog_flag(scasp_unknown, fail).

%Who is afraid of math
student(dave).
student(mary).
student(bob).
student(pat).

dept(english).
dept(cs).
dept(math).

in(dave,english).
in(mary,cs).
in(bob,cs).
in(pat,math).

-in(S,D1)  :- dept(D1), dept(D2),
          	in(S,D2),
          	D1 \= D2.

afraid(S,math) :- student(S),
              	not ab_af(S),
              	not -afraid(S,math).

-afraid(mary,math).	%strong exception
%-afraid(S,F) :- in(S,F).
%ab_af(mary).

-afraid(S,math) :- in(S,math).
ab_af(S) :- student(S),
        	in(S,math).

ab_af(S) :- student(S),
        	in(S,cs).

