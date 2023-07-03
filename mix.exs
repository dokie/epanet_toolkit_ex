#
# Copyright © Inflowmatix Limited 2019-2023
# Copyright © arboricity™ 2019-2023
#
defmodule Arboricity.Template.MixProject do
  @moduledoc """
  Mix file for the Template project/library.
  """
  use Mix.Project

  def project do
    [
      aliases: aliases(),
      app: :elixir_template,
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
      mod: {Congruity.ElixirTemplate.Application, []}
    ]
  end

  defp deps do
    [
      # arboricity™ libraries
      {:api_spec, "~> 1.0", organization: "inflowmatix"},

      # HTTP client
      {:castore, "~> 0.1.0"},
      {:finch, "~> 0.14"},

      # Development and testing tools
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:hammox, "~> 0.7", only: [:test]},
      {:stream_data, "~> 0.5", only: [:dev, :test]},

      # Main libraries/apps
      {:jason, "~> 1.4"},
      {:nimble_parsec, "~> 1.3"},
      {:norm, github: "arboricity/norm"},
      {:plug_cowboy, "~> 2.6"}
    ]
  end

  defp description(), do: "A Template Project in Elixir."

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
      organization: "inflowmatix",
      maintainers: [""],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/arboricity/elixir-template",
        "Changelog" => "https://github.com/arboricity/elixir-template/blob/master/CHANGELOG.md"
      }
    ]
  end
end
