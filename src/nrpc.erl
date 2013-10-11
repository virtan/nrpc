% Copyright 2013 and onwards Roman Gafiyatullin
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%     http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
% 
% See the NOTICE file distributed with this work for additional information regarding copyright ownership.
% 

-module (nrpc).
-export([ start/0, stop/0 ]).
-export([ call/5 ]).
-include("nrpc.hrl").

-spec start() -> ok.
-spec stop() -> ok.

-type aggregator() :: {nrpc_aggregator_name(), node()} | nrpc_aggregator_name().
-spec call(
		Client :: aggregator(), Server :: aggregator(),
		Module :: atom(), Function :: atom(), Args :: [ term() ]
	) -> term().



start() -> application:start(nrpc).
stop() -> application:stop(nrpc).
call( ClientAggr, ServerAggr, Module, Function, Args ) ->
	gen_server:call( ClientAggr, {call, ServerAggr, Module, Function, Args}, infinity ).

