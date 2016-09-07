defmodule OkcrbServer.Router do
  use OkcrbServer.Web, :router

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

  scope "/", OkcrbServer do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", OkcrbServer do
    pipe_through :api

    resources "/commands", Api.CommandController, only: [:create]
  end

  scope "/webhooks", OkcrbServer do
    pipe_through :api

    resources "/pings", Webhook.PingController, only: [:create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", OkcrbServer do
  #   pipe_through :api
  # end
end
