/*--------------------------------------------------------------------------*/
/* part2.pl                                                                 */
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


distance(istanbul,ankara, 351).
distance(ankara,istanbul, 351).
distance(istanbul,izmir, 328).
distance(izmir,istanbul, 328).
distance(izmir,isparta, 308).
distance(isparta,izmir, 308).
distance(isparta,burdur, 24).
distance(burdur,isparta, 24).
distance(istanbul,antalya, 482).
distance(antalya,istanbul, 482).
distance(antalya,gaziantep, 592).
distance(gaziantep,antalya, 592).
distance(antalya,konya, 192).
distance(konya,antalya, 192).
distance(konya,ankara, 227).
distance(ankara,konya, 227).
distance(ankara,van, 920).
distance(van,ankara, 920).
distance(van,rize, 373).
distance(rize,van, 373).
distance(rize,istanbul, 967).
distance(istanbul, rize, 967).
distance(istanbul,van, 1262).
distance(van,istanbul, 1262).
distance(istanbul,gaziantep, 847).
distance(gaziantep,istanbul, 847).
distance(edirne,edremit, 914).
distance(edremit,edirne, 914).
distance(edremit,erzincan, 736).
distance(erzincan,edremit, 736).

% rules

sroute(X,Y,C) :-	transfer(X,Y,C,[]).   

transfer(X,Y,C,R) :-	distance(X,Y,C), 
					\+ member(Y,R).  % If Y is not in Road(visited)

transfer(X,Y,C,R)	:-	distance(X,Z,C1), 
					\+ member(Z,R),   % Is not Z in R(oad) - visited?
					not(Z == Y),     % If it is not a destination 
					transfer(Z,Y,C2, [X|R]), 
					C is C1 + C2.

/*---------------------------------------------------------------------------*/
/*                              End of part2.pl                              */
/*---------------------------------------------------------------------------*/














