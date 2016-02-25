defmodule RethinkDB.Changefeed.Mixfile do
  use Mix.Project

  def project do
    [app: :rethinkdb_changefeed,
     version: "0.0.1",
     elixir: "~> 1.2",
     description: "RethinkDB Supervised Changefeeds",
     package: package,
     deps: deps]
  end

  def package do
    [
      maintainers: ["Peter Hamilton"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/hamiltop/rethinkdb_changefeed"}
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    env_apps = case Mix.env do
      :test -> [:flaky_connection]
      _ -> []
    end
    [applications: [:logger | env_apps]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:rethinkdb, "~> 0.4.0"},
      {:connection, "~> 1.0.1"},
      {:flaky_connection, github: "hamiltop/flaky_connection", only: :test}
    ]
  end
end
