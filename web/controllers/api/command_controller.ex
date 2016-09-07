defmodule OkcrbServer.Api.CommandController do
  use OkcrbServer.Web, :controller

  def create(conn, params) do
    IO.inspect params

    json conn, %{response_type: "in_channel", text: "this is a slash command!"}
  end
end
