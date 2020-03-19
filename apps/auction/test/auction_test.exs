defmodule AuctionTest do
  use ExUnit.Case
  alias Auction.{Repo}
  doctest Auction

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "true" do
    assert true
  end
end
