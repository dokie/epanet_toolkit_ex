#
# Copyright © Inflowmatix Limited 2020-2023
# Copyright © arboricity™ 2020-2023
#
FROM elixir:1.14.4-alpine as builder

RUN apk update && \
    apk upgrade && \
    apk add git

ENV MIX_ENV=prod
ARG HEX_API_KEY

WORKDIR /opt/app

RUN mix local.hex --force && \
    mix local.rebar --force

RUN mix hex.organization auth inflowmatix --key $HEX_API_KEY

COPY mix.exs mix.lock ./
COPY config config

COPY lib lib

RUN mix deps.get
RUN mix deps.compile
RUN mix compile

COPY rel rel

RUN mix release

FROM elixir:1.14.4-alpine

RUN addgroup -S app && adduser -S -g app app \
    && mkdir -p /home/app \
    && chown app /home/app

WORKDIR /home/app

COPY --from=builder /opt/app/_build/prod/rel/elixir_template/ .
RUN chown -R app /home/app

USER app

CMD [ "./bin/elixir_template", "start" ]
