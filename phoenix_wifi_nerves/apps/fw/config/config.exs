use Mix.Config

config :fw, :wifi_opts,
  key_mgmt: :"WPA-PSK",
  ssid: "schlabber",
  psk: "secret"
