defmodule Mtnblog.Router do
  use Mtnblog.Web, :router

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

  scope "/", Mtnblog do
    pipe_through :browser # Use the default browser stack

    get  "/", PageController, :index
    get  "/subscription", SubscriptionController, :challenge
    post "/subscription", SubscriptionController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", Mtnblog do
  #   pipe_through :api
  # end
end
