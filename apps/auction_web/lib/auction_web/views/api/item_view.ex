defmodule AuctionWeb.Api.ItemView do
  use AuctionWeb, :view

  def render("show.json", %{item: item}) do
    %{data: render_one(item, __MODULE__, "item.json")}
  end

  def render("item.json", %{item: item}) do
    %{
      type: "item",
      id: item.id,
      title: item.title,
      description: item.description,
      ends_at: item.ends_at
      }
  end

  # def render("show.json", %{item: item}) do
  #   %{
  #     data: %{
  #       type: "item",
  #       id: item.id,
  #       title: item.title,
  #       description: item.description,
  #       ends_at: item.ends_at
  #     }
  #   }
  # end
end
