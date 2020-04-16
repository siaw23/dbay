defmodule AuctionTest do
  use ExUnit.Case
  alias Auction.{Item, Repo}
  doctest Auction

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "list_items/0" do
    setup do
      {:ok, item1} = Repo.insert(%Item{title: "Item 1"})
      {:ok, item2} = Repo.insert(%Item{title: "Item 2"})
      {:ok, item3} = Repo.insert(%Item{title: "Item 3"})

      %{items: [item1, item2, item3]}
    end

    test "return all items", %{items: items} do
      assert items == Auction.list_items()
    end
  end
end
