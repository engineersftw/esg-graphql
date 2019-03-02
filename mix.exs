defmodule EsgGraphql.MixProject do
  use Mix.Project

  def project do
    [
      app: :esg_graphql,
      version: File.read!("VERSION.txt"),
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
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

  # Mix aliases
  # ~~~~~~
  # Handy shortcuts for common tasks
  defp aliases do
    [
      clean: ["clean", &phx_clean/1],
      install: ["deps.get"],
      start: ["phx.server"],
    ]
  end

  # Clean compiled Elixir code and processed static assets
  defp phx_clean(_) do
    [
      "rm -rf _build"
    ] |> Enum.each(&Mix.shell.cmd/1)
  end
end
