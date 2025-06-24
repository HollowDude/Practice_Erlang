-module(cowboy_test_http_handler).
-behaviour(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
    Req = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Hola desde Cowboy!">>,
        Req0),
    {ok, Req, State}.