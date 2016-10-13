defmodule Fw do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # worker(Fw.Worker, [arg1, arg2, arg3]),
      # worker(Task, [fn -> Nerves.Networking.setup(:eth0, [mode: "dhcp"]) end], restart: :transient),
      worker(Task, [fn -> Nerves.InterimWiFi.setup("wlan0", key_mgmt: :"WPA-PSK", ssid: "schlabber", psk: "secret") end], restart: :transient),
      # worker(Task, [fn -> Nerves.InterimWiFi.setup("wlan0", Application.get_env(:hello_wifi, :wlan)) end], restart: :transient),

      # worker(Task, [&wifisetup/0], restart: :transient),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fw.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp wifisetup do
    opts = Application.get_env(:hello_wifi, :wlan0)
    Nerves.InterimWiFi.setup("wlan0", opts)
  end
end
