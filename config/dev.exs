#
# Copyright © Inflowmatix Limited 2020-2023
# Copyright © arboricity™ 2020-2023
#
import Config

config :logger, :console, level: :debug

if File.exists?("config/#{Mix.env()}.secret.exs") do
  import_config("#{Mix.env()}.secret.exs")
end
