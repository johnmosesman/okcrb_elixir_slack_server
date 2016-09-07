defmodule OkcrbServer.PageController do
  use OkcrbServer.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
