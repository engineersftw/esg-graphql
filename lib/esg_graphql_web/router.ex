defmodule EsgGraphqlWeb.Router do
  use EsgGraphqlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EsgGraphqlWeb do
    pipe_through :api
  end
end
