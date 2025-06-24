-module(reverse).
-export([rev/1]).

rev(List)->
    rev(List, []).
rev([Head | Rest], R) ->
    rev(Rest, [Head | R]);
rev([], R)->
    R.