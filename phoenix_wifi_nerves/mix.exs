defmodule PhoenixWifiNerves.Mixfile do
  use Mix.Project
  
  @target System.get_env("NERVES_TARGET") || "rpi3"

  def project do
    [apps_path: "apps",
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end
end
