/*                                                                           */
/* HW04_141044063_Rumeysa_Karakavak                                          */
/*                                                                           */
/* Created on 16/01/2020 by Rumeysa_Karakavak                                */
/* References                                                                */
/* ----------                                                                */
/* http://slideplayer.biz.tr/slide/2741449/                                  */
/* http://www.learnprolognow.org/                                            */
/*                                                                           */
/* for intersection predicate                                                */
/* -----------------														 */
/* https://stackoverflow.com/questions/9615002/intersection-union-of-2-lists */
/*---------------------------------------------------------------------------*/

/*4.1*/

element(H, [H|_]).
element(Y,[_|T]) :- element(Y,T).

/* 4.2*/
union([],L,L).
union([H | T], L2, I) :- contains(L2, H),!, union(T,L2, I).
union([H | T], L2, [H | I]) :- union(T, L2,I).
contains([H|_], H).
contains([_|T], Y) :- contains(T,Y).


/*4.3*/

	%define 2 empty list
	intersect([], _, []).
	% combine two list if there is not an element of another list.
	intersect([Head|L1tail], L2, I) :- memberchk(Head, L2), !,
	I = [Head|Itail], intersect(L1tail, L2, Itail).

	intersect([_|L1tail], L2, I) :- intersect(L1tail, L2, I).

/* 4.4*/

delete(X, [X|T], T).

delete(X, [H|T], [H|S]):-
    delete(X, T, S).

equivalent([], []).

equivalent([H|T], R):-
    equivalent(T, X), delete(H, R, X).

/*---------------------------------------------------------------------------*/
/*                              End of part4.pl                              */
/*---------------------------------------------------------------------------*/