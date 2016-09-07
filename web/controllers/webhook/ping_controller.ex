defmodule OkcrbServer.Webhook.PingController do
  use OkcrbServer.Web, :controller

  def create(conn, _params) do
    Task.start_link(fn ->
      data =
        %{text: "Webhook!"}
        |> Poison.encode!

      HTTPoison.start
      HTTPoison.post!(System.get_env("SLACK_WEBHOOK_URL"), data)
    end)

    json conn, :ok
  end
end
