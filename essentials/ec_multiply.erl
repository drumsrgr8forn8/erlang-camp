%%% @author Nate West
%%% @doc contains multiply func
%%% @copyright 2013 Erlware

-module(ec_multiply).
-export([mult/3]).

%%% @doc multiplies three numbers.
-spec mult(number(), number(), number()) -> number().
mult(A, B, C) ->
  A * B * C.
