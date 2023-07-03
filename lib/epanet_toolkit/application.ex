#
# Copyright © QixSoft Limited 2002-2023
#
defmodule Congruity.ElixirTemplate.Application do
  @moduledoc """
  Main OTP Application supervisor for the Elixir EPANET toolkit wrapper.
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
