ExUnit.start

Mix.Task.run "ecto.create", ~w(-r OkcrbServer.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r OkcrbServer.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(OkcrbServer.Repo)

