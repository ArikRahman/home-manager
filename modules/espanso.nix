{ config, pkgs, ... }:

let
  espansoConfig = ''
    # Espanso configuration
    matches:
      - trigger: ":email"
        replace: "your.email@example.com"

      - trigger: ":date"
        replace: "{{day}}/{{month}}/{{year}}"
  '';
in
{
  home.packages = with pkgs; [
    espanso-wayland
  ];

  services.espanso-wayland = {
    enable = true;
    # user = "arik"; # Replace with your actual username
  };

  home.file.".config/espanso/default.yml".text = espansoConfig;
}
