defmodule TrevikPetersonPeckAssessmentWeb.Router do
  use TrevikPetersonPeckAssessmentWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {TrevikPetersonPeckAssessmentWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TrevikPetersonPeckAssessmentWeb do
    pipe_through :browser

    # get "/", PageController, :home
    live "/", TruckLive.Index, :index
    live "/trucks", TruckLive.Index, :index
    live "/trucks/new", TruckLive.Index, :new
    live "/trucks/:id/edit", TruckLive.Index, :edit

    live "/trucks/:id", TruckLive.Show, :show
    live "/trucks/:id/show/edit", TruckLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", TrevikPetersonPeckAssessmentWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:trevik_peterson_peck_assessment, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: TrevikPetersonPeckAssessmentWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
