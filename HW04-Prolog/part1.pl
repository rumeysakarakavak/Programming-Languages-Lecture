/*--------------------------------------------------------------------------*/
/* part1.pl                                                                 */
/*                                                                          */
/* HW04_141044063_Rumeysa_Karakavak                                         */
/*                                                                          */
/* Created on 16/01/2020 by Rumeysa_Karakavak                               */
/*                                                                          */
/* Description                                                              */
/* -----------                                                              */
/*  This file is  database about flights.*/
/*--------------------------------------------------------------------------*/



flight(istanbul,ankara).
flight(ankara,istanbul).
flight(istanbul,izmir).
flight(izmir,istanbul).
flight(izmir,isparta).
flight(isparta,izmir).
flight(isparta,burdur).
flight(burdur,isparta).
flight(istanbul,antalya).
flight(antalya,istanbul).
flight(antalya,gaziantep).
flight(gaziantep,antalya).
flight(antalya,konya).
flight(konya,antalya).
flight(konya,ankara).
flight(ankara,konya).
flight(ankara,van).
flight(van,ankara).
flight(van,rize).
flight(rize,van).
flight(rize,istanbul).
flight(istanbul, rize).
flight(istanbul,van).
flight(van,istanbul).
flight(istanbul,gaziantep).
flight(gaziantep,istanbul).
flight(edirne,edremit).
flight(edremit,edirne).
flight(edremit,erzincan).
flight(erzincan,edremit).

% rules

route(X,Y) :-	transfer(X,Y,[]).

transfer(X,Y,R) :-	flight(X,Y), 
					\+ member(Y,R).  % If Y is not in Road(visited)

transfer(X,Y,R)	:-	flight(X,Z), 
					\+ member(Z,R),   % Is not Z in R(oad) - visited?
					not(Z == Y),     % If it is not a destination 
					transfer(Z,Y,[X|R]).

/*---------------------------------------------------------------------------*/
/*                              End of part1.pl                              */
/*---------------------------------------------------------------------------*/














