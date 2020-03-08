defmodule Auction.Item  do
  import Ecto.Changeset
  use Ecto.Schema

  schema "items" do
    field :title, :string
    field :description, :string
    field :ends_at, :utc_datetime
    timestamps()
  end

  def changeset(item, params \\ %{}) do
    item
    |> cast(params, [:title, :description, :ends_at])
    |> validate_required(:title)
    |> validate_length(:title, min: 3)
    |> validate_length(:description, max: 100)
  end
end
