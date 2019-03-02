defmodule EsgGraphqlWeb.Router do
  use EsgGraphqlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graph", Absinthe.Plug,
      schema: EsgGraphqlWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: EsgGraphqlWeb.Schema,
      interface: :simple,
      context: %{pubsub: EsqGraphqlWeb.Endpoint}
  end
end
