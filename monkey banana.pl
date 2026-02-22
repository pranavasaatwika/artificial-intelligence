
initial_state(state(atdoor, onfloor, atdoor, hasnot)).

goal_state(state(_, _, _, has)).

move(state(atdoor, onfloor, atdoor, H),
     state(middle, onfloor, atdoor, H)).

move(state(middle, onfloor, atdoor, H),
     state(atdoor, onfloor, atdoor, H)).

move(state(atdoor, onfloor, atdoor, H),
     state(middle, onfloor, middle, H)).

move(state(middle, onfloor, middle, H),
     state(middle, onbox, middle, H)).

move(state(middle, onbox, middle, hasnot),
     state(middle, onbox, middle, has)).

solve(State, _) :-
    goal_state(State),
    write('Goal reached: '), write(State), nl.

solve(State, Visited) :-
    move(State, NewState),
    \+ member(NewState, Visited),
    solve(NewState, [NewState | Visited]).

start :-
    initial_state(State),
    solve(State, [State]).