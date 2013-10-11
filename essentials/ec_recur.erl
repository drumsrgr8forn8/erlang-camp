-module(ec_recur).
-export([hr/1]).

-spec hr(number()) -> string().
hr(Num) ->
  hr(Num, "").

-spec hr(number(), string()) -> string().
hr(0, Acc) ->
  Acc;
hr(Num, Acc) ->
  hr(Num - 1, Acc ++ "-").
