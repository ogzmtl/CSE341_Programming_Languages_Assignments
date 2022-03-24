flight(istanbul,izmir,2).
flight(izmir,istanbul,2).
flight(istanbul,rize, 4).
flight(rize,istanbul,4).
flight(izmir,antalya,2).
flight(antalya,erzincan,3).
flight(erzincan,antalya,3).
flight(diyarbakir, antalya, 4).
flight(antalya,diyarbakir,4).
flight(canakkale,erzincan,6).
flight(erzincan,canakkale,6).
flight(izmir,ankara,6).
flight(ankara, izmir,6).
flight(ankara, istanbul, 1).
flight(istanbul, ankara, 1).
flight(ankara, rize,5).
flight(rize,ankara, 5).
flight(ankara,van,4).
flight(van,ankara,4).
flight(van,gaziantep,3).
flight(gaziantep,van,3).
flight(ankara,diyarbakir,8).
flight(diyarbakir,ankara,8).

route(X,Y,C) :-temp(X,Y,C,[X]).
temp(X,Y,C,_) :- flight(X,Y,C).
temp(X,Y,C,Liste) :- flight(X,Z,C1), \+member(Z,Liste), temp(Z,Y,C2,[Z|Liste]), C is C1+C2.



