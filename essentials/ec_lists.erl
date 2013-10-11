-module(ec_lists).
-export([print_each/1]).
-export([twomult/1]).
-export([mymap/2]).

print_each([]) ->
  ok;
print_each([Head|Tail]) ->
  io:format("~p ~n", [Head]),
  print_each(Tail).

twomult(List) ->
  twomult(List,[]).

twomult([], Acc) ->
  lists:reverse(Acc);
twomult([H|T], Acc) ->
  twomult(T, [H|Acc]).

mymap(F, List) ->
  mymap(F, List, []).

mymap(_F, [], Acc) ->
  lists:reverse(Acc);
mymap(F,[H|T], Acc) ->
  mymap(F, T, [F(H)|Acc]).
