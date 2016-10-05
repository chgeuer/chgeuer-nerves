defmodule Blinky.Mixfile do
  use Mix.Project

  @target System.get_env("NERVES_TARGET") || "rpi3"

  def project do
    [
      app: :blinky,
      version: "0.0.1",
      elixir: "~> 1.3",
      target: @target,
      archives: [nerves_bootstrap: "~> 0.1.4"],
      deps_path: "../../deps/#{@target}",
      build_path: "../../_build/#{@target}",
      config_path: "../../config/config.exs",
      lockfile: "../../mix.lock",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      aliases: aliases(Mix.env),
      deps: deps ++ system(@target, Mix.env)
    ]
  end

  def application do
     [mod: {Fw, []},
      applications: applications(Mix.env)]
  end
  defp applications(:prod), do: [:elixir_ale, :nerves_leds | general_apps]
  defp applications(_), do: general_apps
  defp general_apps, do: [:logger] 
  
  def system(target, :prod) do
    [
      {:"nerves_system_#{target}", ">= 0.0.0"},
    ]
  end
  def system(_, _), do: []

  defp deps do
    [
      {:nerves, "~> 0.3.0"},
      {:elixir_ale, "~> 0.5.5"},
      {:nerves_leds, "~> 0.7.0"}
    ]
  end

  def aliases(:prod) do
      ["deps.precompile": ["nerves.precompile", "deps.precompile"],
       "deps.loadpaths":  ["deps.loadpaths", "nerves.loadpaths"]]
  end
  def aliases(_), do: []

end
