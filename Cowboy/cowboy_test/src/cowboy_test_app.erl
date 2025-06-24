-module(cowboy_test_app).
-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    % Asegúrate de que cowboy está cargado
    application:ensure_all_started(cowboy),
    
    Dispatch = cowboy_router:compile([
        {'_', [
            {"/", cowboy_test_http_handler, []}
        ]}
    ]),
    {ok, _} = cowboy:start_clear(
        http_listener,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ),
    cowboy_test_sup:start_link().

stop(_State) ->
    ok = cowboy:stop_listener(http_listener).