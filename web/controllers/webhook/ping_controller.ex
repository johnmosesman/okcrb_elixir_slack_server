defmodule OkcrbServer.Webhook.PingController do
  use OkcrbServer.Web, :controller

  def create(conn, _params) do
    Task.start_link(fn ->
      data =
        %{text: "Webhook!"}
        |> Poison.encode!

      HTTPoison.start
      HTTPoison.post!("https://hooks.slack.com/services/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", data)
    end)

    json conn, :ok
  end
end
