#
# Copyright © Inflowmatix Limited 2019-2023
# Copyright © arboricity™ 2019-2023
#
defmodule Congruity.ElixirTemplate.Application do
  @moduledoc """
  Main OTP Application supervisor for the Elixir Template service.
  """
  use Application

  require Logger

  @impl Application
  def start(_type, _args) do
    children = []

    opts = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end
end
