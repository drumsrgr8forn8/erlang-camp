-module(sc_store).

-export([
         init/0,
         insert/3,
         delete/2,
         lookup/2
        ]).
init() ->
    dict:new().

insert(Store, Key, Value) ->
    dict:store(Key, Value, Store).

lookup(Store, Key) ->
    dict:find(Key, Store).

delete(Store, Key) ->
    dict:erase(Key, Store).

%%%=======================
-ifndef(NOTEST).
-include_lib("eunit/include/eunit.hrl").

insert_test() ->
  Dict0 = init(),
  Dict1 = insert(Dict0, key, value),
  ?assertMatch({ok, value}, lookup(Dict1, key)).

-endif.
