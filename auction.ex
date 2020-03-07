defmodule Auction.Item  do
  defstruct [:id, :title, :description, :ends_at]

end

defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item{
      id: 1,
      title: "First Item",
      description: "Nice description.",
      ends_at: ~N[2020-01-01 00:00:00]
    },
    %Item{
      id: 2,
      title: "Second Item",
      description: "Functional thoughts melt my brain.",
      ends_at: ~N[2020-01-01 00:00:00]
    },
    %Item{
      id: 3,
      title: "Third Item",
      description: "Buy three, get three for free.",
      ends_at: ~N[2020-01-01 00:00:00]
    }
  ]

  def all(Item), do: @items

  def get!(Item, id) do
    Enum.find(@items, fn(item) -> item.id === id end)
  end
end

defmodule Auction do
  alias Auction.{FakeRepo, Item}

  @repo FakeRepo

  def list_items do
    @repo.all(Item)
  end

  def get_item(id) do
    @repo.get!(Item, id)
  end

  def get_item_by(attrs) do
    @repo.get_by(Item, attrs)
  end
end
