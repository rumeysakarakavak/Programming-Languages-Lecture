/*--------------------------------------------------------------------------*/
/* part3.pl                                                                 */
/*                                                                          */
/* HW04_141044063_Rumeysa_Karakavak                                         */
/*                                                                          */
/* Created on 16/01/2020 by Rumeysa_Karakavak                               */
/*                                                                          */
/* Description                                                              */
/* -----------                                                              */
/*  This file is  database about classes, classrooms and student enrollment.*/
/*--------------------------------------------------------------------------*/





	enrolment(a,102).
	enrolment(a,108).
	enrolment(b,102).
	enrolment(c,108).
	enrolment(d,341).
	enrolment(e,455).


	when(102,10).
	when(102,11).
	when(108,12).
	when(108,13).
	when(341,14).
	when(341,15).
	when(455,16).
	when(455,17).
	when(452,17).
	when(452,18).

	where(102,z23).
	where(108,z11).
	where(341,z06).
	where(455,207).
	where(452,207).

	


%rules
	
schedule(S,P,T) :- enrolment(S,ST) , where(ST,P) , when(ST,T).
usage(P,T) :- where(ST, P) , when(ST, T).
conflict(X,Y) :- where(X, P), where(Y, P) ; when(X, T), when(Y, T). 
meet(X,Y) :- enrolment(X, Z), enrolment(Y, Z), where(Z, T), when(Z, P).



	
/*---------------------------------------------------------------------------*/
/*                              End of part3.pl                              */
/*---------------------------------------------------------------------------*/
