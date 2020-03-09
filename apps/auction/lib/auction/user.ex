defmodule Auction.User do
  use Ecto.Schema

  schema "users" do
    field :username, :string
    field :email_address, :string
    field :password, :string, virtual: true
    field :hashed_password, :string

    timestamps()
  end
end