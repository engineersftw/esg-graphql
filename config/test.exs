use Mix.Config

# Server configuration
# ~~~~~~
# We don't run a server during test. If one is required,
# you can enable the server option below.
config :esg_graphql, EsgGraphqlWeb.Endpoint,
  http: [port: 4002],
  server: false

# Logger configuration
# ~~~~~~
# Print only warnings and errors during test
config :logger, level: :warn
