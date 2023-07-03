#
# Copyright © Inflowmatix Limited 2020-2023
# Copyright © arboricity™ 2020-2023
#
import Config

config :ex_unit,
  capture_log: [level: :warn],
  exclude: [:skip]

config :elixir_template,
  congruity_api_url: "https://localhost:8443/v1",
  kong_admin: [hostname: "localhost", port: 8001]
