#
# Copyright © QixSoft Limited 2002-2023
#
import Config

config :logger, :console, level: :debug

if File.exists?("config/#{Mix.env()}.secret.exs") do
  import_config("#{Mix.env()}.secret.exs")
end
