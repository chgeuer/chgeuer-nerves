# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"

config :ui, Ui.Endpoint,
  http: [port: 80],
  url: [host: "localhost", port: 80],
  secret_key_base: "#############################",
  root: Path.dirname(__DIR__),
  server: true,
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Nerves.PubSub]

config :nerves_interim_wifi, 
  regulatory_domain: "DE"

config :hello_wifi, :wlan0,
  ssid: "schlabber",
  key_mgmt: :"WPA-PSK",
  psk: "secret"

config :logger, level: :debug

#config :nerves, :firmware, 
#  fwup_conf: "config/fwup.conf"

