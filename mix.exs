defmodule EsgGraphql.MixProject do
  use Mix.Project

  def project do
    [
      app: :esg_graphql,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # OTP application config
  # ~~~~~~
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {EsgGraphql.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Environment-specific paths config
  # ~~~~~~
  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Module dependencies
  # ~~~~~~
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.1"},
      {:phoenix_pubsub, "~> 1.1"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
