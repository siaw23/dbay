defmodule Auction.Item  do
  # defstruct [:id, :title, :description, :ends_at]
  use Ecto.Schema

  schema "items" do
    field :title, :string
    field :description, :string
    field :ends_at, :utc_datetime
    timestamps()
  end
end
