{config, ...}: let
  # variant = config.theme.name;
  # c = config.programs.matugen.theme.colors.colors.${variant};

  font_family = "GeistMono Nerd Font";
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = false;
        hide_cursor = false;
        no_fade_in = false;
      };

      background = [
        {
          monitor = "";
          path = "~/Pictures/Wallpapers/nbhd.png";
          blur_passes = 3;
          blur_size = 6;
          noise = 0.1;
          contrast = 1.1;
          brightness = 1.2;
        }
      ];

      input-fields = [
        {
          monitor = "eDP-1";

          size = {
            width = 300;
            height = 50;
          };

          outline_thickness = 2;

          # outer_color = "rgb(${c.primary})";
          # inner_color = "rgb(${c.on_primary_container})";
          # font_color = "rgb(${c.primary_container})";

          fade_on_empty = false;
          # placeholder_text = ''<span font_family="${font_family}" foreground="##${c.primary_container}">Password...</span>'';

          dots_spacing = 0.3;
          dots_center = true;
        }
      ];

      labels = [
        {
          monitor = "";
          text = "$TIME";
          inherit font_family;
          font_size = 50;
          # color = "rgb(${c.primary})";

          position = {
            x = 0;
            y = 80;
          };

          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
