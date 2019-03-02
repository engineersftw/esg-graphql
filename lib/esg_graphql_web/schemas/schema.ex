defmodule EsgGraphqlWeb.Schema do
  use Absinthe.Schema

  object :user do
    field :uid, non_null(:id)
    field :email, non_null(:string)
    field :full_name, :string
  end

  query do
    # TODO: Temporary, to test schema publication in GraphiQL
    field :users, list_of(:user)
  end
end
