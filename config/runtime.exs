#
# Copyright © Inflowmatix Limited 2020-2023
# Copyright © arboricity™ 2020-2023
#
import Config

# Runtime config for deployed environments (development and production)
if config_env() == :prod do
  config :elixir_template,
    kong_admin: [
      hostname: System.get_env("KONG_ADMIN_HOSTNAME", "kong-kong-admin.kong"),
      port: System.get_env("KONG_ADMIN_PORT", "8001") |> String.to_integer()
    ]
end
