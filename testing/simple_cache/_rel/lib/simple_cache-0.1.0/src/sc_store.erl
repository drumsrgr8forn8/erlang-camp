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

insert_testx(Dict) ->
  ?assertMatch({ok, value}, lookup(Dict, key)).

delete_testx(Dict) ->
  Dict2 = delete(Dict, key),
  Empty_dict = dict:new(),
  ?assertMatch(Empty_dict, Dict2).

setup_store() ->
  Dict0 = init(),
  Dict1 = insert(Dict0, key, value),
  Dict1.

cleanup_store(_) ->
  ok.

store_generator_test_() ->
  {foreach, fun setup_store/0, fun cleanup_store/1,
    [fun(F) -> 
       {"insert_testx", fun() -> insert_testx(F) end}
     end, 
     fun(F) -> 
        {"delete_testx", fun() -> delete_testx(F) end}
     end]}.
-endif.
