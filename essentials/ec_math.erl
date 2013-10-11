-module(ec_math).
-export([op/3]).

-spec op(add | sub, number(), number()) -> number() | error.
op(add, Num1, Num2) ->
  Num1 + Num2;
op(sub, Num1, Num2) when Num1 - Num2 >= 0 ->
  Num1 - Num2;
op(sub, _Num1, _Num2) ->
  error.

