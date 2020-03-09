defmodule AuctionWeb.ItemController do
  use AuctionWeb, :controller

  def index(conn, _params) do
    items = Auction.list_items()
    render(conn, "index.html", items: items)
  end

  def show(conn, %{"id" => id}) do
    item = Auction.get_item(id)
    render(conn, "show.html", item: item)
  end

  def new(conn, _params) do
    item = Auction.new_item()
    render(conn, "new.html", item: item)
  end

  def create(conn, %{"item" => item_params}) do
    case Auction.insert_item(item_params) do
      {:ok, item} -> redirect(conn, to: Routes.item_path(conn, :show, item))
      {:error, item} -> render(conn, "new.html", item: item)
    end
  end
end
