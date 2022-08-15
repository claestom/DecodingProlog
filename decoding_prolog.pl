is_prefix(X,Y):-
    append(X,_,Y);
    append(Y,_,X).

decode(_,[],[]).
decode(0,_,[]).
decode(N, Codes, Res):-
    get_candidates(N, Codes, Candidates),
    check_if_different(Candidates),
    check_no_prefix(Candidates),
    %write(Candidates),
    Candidates = Res.

%get_candidates(_,[],[]).
get_candidates(1,Tail, [Tail]):- Tail = [_|_].
get_candidates(N, Codes, [SubList|Candidates]):-
    SubList = [_|_],
    append(SubList, L1, Codes),
    N1 is N - 1,
    get_candidates(N1, L1, Candidates).

check_if_different([]).
check_if_different([X|Tail]):-
    check_ind(X,Tail),
    check_if_different(Tail).

check_ind(X,List):-
    not(member1(X,List)).

%member1(_,[]).
member1(El,[X|Tail]):-
    not(El=X),
    member1(El,Tail).
member1(El,[El|_Tail]).

check_no_prefix([]).
check_no_prefix([X|RestOfCandidates]):-
    check_ind_prefix(X,RestOfCandidates),
    check_no_prefix(RestOfCandidates).

check_ind_prefix(_,[]).
check_ind_prefix(X, [Y|Tail]):-
    not(is_prefix(X,Y)),
    check_ind_prefix(X,Tail).
