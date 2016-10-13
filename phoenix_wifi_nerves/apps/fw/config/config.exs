use Mix.Config

config :fw, :wifi_opts,
  key_mgmt: :"WPA-PSK",
  ssid: "schlabber",
  psk: "secret"

#config :nerves, :firmware,
#  fwup_conf: "config/fwup.conf"
