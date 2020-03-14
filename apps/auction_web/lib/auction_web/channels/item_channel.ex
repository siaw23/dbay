defmodule AuctionWeb.ItemChannel do
  use Phoenix.Channel

  def join("item:" <> _item_id, _params, socket) do
    {:ok, socket}
  end
end
