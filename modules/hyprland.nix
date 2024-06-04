# home.nix
{
  #command to fix scaling
  #hyprctl keyword monitor "eDP-1,1920x1080@144,0x0,1.0"
  ##hyprctl reload && hyprctl keyword monitor "eDP-1,1920x1080@144,0x0,1.0"
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {

    "$mod" = "SUPER";
    bind =
      [
        # "$mod, P, togglesplit"
        "$mod, L, exec, hyprctl dispatch exit"
        "$mod, F, exec, firefox"
        "$mod, Z, exec, zed"
        "$mod, E, exec, kitty"
        "$mod CTRL, S, exec, steam"
        "$mod, Q, killactive"
        "$mod, A, exec, appflowy"
        "$mod, C, exec, code"
        "$mod, G, exec, github-desktop"
        "$mod, D, exec, armcord"
        "$mod, O, exec, hyprctl reload && hyprctl keyword monitor 'eDP-1,1920x1080@144,0x0,1.0' && hyprpaper"
        "$mod SHIFT, W, exec, hyprctl hyprpaper preload ~/Pictures/Wallpapers/yosemite.png && hyprctl hyprpaper wallpaper 'eDP-1,~/Pictures/Wallpapers/yosemite.png' && hyprctl hyprpaper unload ~/Pictures/Wallpapers/yosemite.png"

        "$mod, R, exec, hyprctl reload"  # Add this line to bind SUPER+R to reload Hyprland
        "ALT, F4, killactive"  # Added binding for Alt + F4 to close applications
        ", Print, exec, grimblast copy area"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );

  };
}
