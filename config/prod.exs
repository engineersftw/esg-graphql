use Mix.Config

# Server configuration
# ~~~~~~
config :esg_graphql, EsgGraphqlWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json",
  http: [
    :inet6,
    port: System.get_env("APP_PORT") || 4000
  ],
  load_from_system_env: true,
  secret_key_base: System.get_env("APP_SECRET"),
  server: true,
  url: [
    host: System.get_env("APP_HOST") || "graphql.engineers.sg",
    port: 80
  ]

# Logger configuration
# ~~~~~~
# Do not print debug messages in production
config :logger, level: :info

# Phoenix runtime configuration
# ~~~~~~
config :phoenix, :serve_endpoints, true

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :esg_graphql, EsgGraphqlWeb.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [
#         :inet6,
#         port: 443,
#         cipher_suite: :strong,
#         keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#         certfile: System.get_env("SOME_APP_SSL_CERT_PATH")
#       ]
#
# The `cipher_suite` is set to `:strong` to support only the
# latest and more secure SSL ciphers. This means old browsers
# and clients may not be supported. You can set it to
# `:compatible` for wider support.
#
# `:keyfile` and `:certfile` expect an absolute path to the key
# and cert in disk or a relative path inside priv, for example
# "priv/ssl/server.key". For all supported SSL configuration
# options, see https://hexdocs.pm/plug/Plug.SSL.html#configure/1
#
# We also recommend setting `force_ssl` in your endpoint, ensuring
# no data is ever sent via http, always redirecting to https:
#
#     config :esg_graphql, EsgGraphqlWeb.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.
