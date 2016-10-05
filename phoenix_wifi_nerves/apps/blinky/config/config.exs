use Mix.Config

config :blinky, led_list: [ :red, :green ]
config :nerves_leds, names: [ red: "led0", green: "led1" ]

import_config "#{Mix.Project.config[:target]}.exs"
