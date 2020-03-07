defmodule Auction.Item  do
  defstruct [:id, :title, :description, :ends_at]
end

defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item{
      id: 1,
      title: "Oculus Quest",
      description: "A VR headset from Facebook.",
      ends_at: ~N[2020-01-01 00:00:00]
    },
    %Item{
      id: 2,
      title: "Phoenix Web Framework",
      description: "A nice web framework by Chris McCord.",
      ends_at: ~N[2020-01-01 00:00:00]
    },
    %Item{
      id: 3,
      title: "Ghana",
      description: "My beloved country.",
      ends_at: ~N[2020-01-01 00:00:00]
    }
  ]

  def all(Item), do: @items

  def get!(Item, id) do
    Enum.find(@items, fn(item) -> item.id === id end)
  end

  def get_by(Item, attrs) do
    Enum.find(@items, fn(item) ->
      Enum.all?(Map.keys(attrs), fn(key) ->
        Map.get(item, key) === attrs[key]
      end)
    end)
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
