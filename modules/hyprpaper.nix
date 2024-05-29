{ config, pkgs, ... }:

{
  # Add hyprpaper package
  home.packages = with pkgs; [
    hyprpaper
  ];

  # Define the systemd user service for hyprpaper
  systemd.user.services.hyprpaper = {
    description = "Hyprpaper Service";
    wantedBy = [ "default.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
      Restart = "always";
      RestartSec = "5s";
    };
  };

  # Ensure the systemd user service is enabled

}
