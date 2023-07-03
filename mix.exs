defmodule EPANET.Toolkit.MixProject do
  @moduledoc """
  Mix file for the EPANET Toolkit library.
  """
  use Mix.Project

  def project do
    [
      aliases: aliases(),
      app: :epanet_toolkit_ex,
      deps: deps(),
      description: description(),
      dialyzer: [
        ignore_warnings: ".dialyzer_ignore.exs",
        plt_add_apps: [:mix, :ex_unit],
        plt_ignore_apps: [],
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
      ],
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      preferred_cli_env: [
        check: :test,
        credo: :test,
        dialyzer: :test
      ],
      start_permanent: Mix.env() == :prod,
      version: "0.0.1"
    ]
  end

  defp aliases do
    [
      check: ["test", "credo --strict", "dialyzer"]
    ]
  end

  def application do
    [
      extra_applications: [:logger, :ssl],
      mod: {EPANET.Toolkit.Application, []}
    ]
  end

  defp deps do
    [
      # Development and testing tools
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:hammox, "~> 0.7", only: [:test]},
      {:stream_data, "~> 0.5", only: [:dev, :test]}

      # Main libraries/apps
    ]
  end

  defp description(), do: "An Elixir EPANET Toolkit wrapper."

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_env), do: ["lib"]

  defp package() do
    [
      files: [
        "lib",
        "LICENSE",
        "mix.exs",
        "README.md"
      ],
      maintainers: ["dokie"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/dokie/epanet_toolkit_ex",
        "Changelog" => "https://github.com/dokie/epanet_toolkit_ex/blob/master/CHANGELOG.md"
      }
    ]
  end
end
