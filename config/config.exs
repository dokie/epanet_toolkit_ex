#
# Copyright © Inflowmatix Limited 2020-2023
# Copyright © arboricity™ 2020-2023
#
import Config

config :logger, :console,
  level: :info,
  format: "$date $time [$level] $metadata$message\n",
  metadata: [:request_id, :error_code, :resource, :service]

import_config("#{Mix.env()}.exs")
