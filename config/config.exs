use Mix.Config

# Server configuration
# ~~~~~~
config :esg_graphql, EsgGraphqlWeb.Endpoint,
  pubsub: [
    name: EsgGraphql.PubSub,
    adapter: Phoenix.PubSub.PG2
  ],
  render_errors: [
    view: EsgGraphqlWeb.ErrorView,
    accepts: ~w(json)
  ],
  secret_key_base: "ax/TGusnLJ8Ex6kKQu2lQNGiL0s6t8SGN5wintgPjkegppWyNVIGYny94s4z99fx",
  url: [host: "localhost"]

# Logger configuration
# ~~~~~~
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# JSON parser
# ~~~~~~
# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Environment-specific config
# ~~~~~~
# This must remain at the bottom of this file so it
# overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
