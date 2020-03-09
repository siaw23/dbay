defmodule AuctionWeb.Router do
  use AuctionWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AuctionWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/items", ItemController, except: [:delete]
    resources "/users", UserController, only: [:show, :new, :create]

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/login", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", AuctionWeb do
  #   pipe_through :api
  # end
end
