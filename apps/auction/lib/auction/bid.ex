defmodule Auction.Bid do
  use Ecto.Schema

  schema "bids" do
    field :amount, :integer

    timestamps()
  end
end
