#
# Copyright © QixSoft Limited 2002-2023
#
import Config

config :logger, :console,
  level: :info,
  format: "$date $time [$level] $metadata$message\n",
  metadata: [:request_id, :error_code, :resource, :service]

import_config("#{Mix.env()}.exs")
