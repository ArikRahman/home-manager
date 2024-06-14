# home.nix
{
  #command to fix scaling
  #hyprctl keyword monitor "eDP-1,1920x1080@144,0x0,1.0"
  ##hyprctl reload && hyprctl keyword monitor "eDP-1,1920x1080@144,0x0,1.0"
  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.settings = {
     # smart_split = true;
    "$mod" = "SUPER";
    bindm =
    [
         "$mod, mouse:272, movewindow"
         "$mod, mouse:273, resizewindow"
    ];
    bind =
      [
        # Switch workspaces to a relative workspace
        "$mod+Ctrl, Right, workspace, r+1"
        "$mod+Ctrl, Left, workspace, r-1"

        # "$mod, P, togglesplit"
        # Scroll through existing workspaces
        "$mod, mouse_down, workspace, e-1"
        "$mod, mouse_up, workspace, e+1"
        "$mod SHIFT, L, exec, hyprctl dispatch exit"
        "$mod, W, togglefloating," # toggle the window between focus and float
        "$mod, L, exec, hyprlock"
        "$mod, F, exec, firefox"
        "$mod, Z, exec, zed"
        "$mod, X, exec, xplorer"
        "$mod, E, exec, kitty"
        "$mod CTRL, S, exec, steam"
        "$mod, Q, killactive"
        "$mod, A, exec, appflowy"
        "$mod, C, exec, code"
        "$mod, G, exec, github-desktop"
        "$mod, D, exec, armcord"
        "$mod, O, exec, hyprctl reload && hyprctl keyword monitor 'eDP-1,1920x1080@144,0x0,1.0' && hyprpaper"
        "$mod SHIFT, W, exec, hyprctl hyprpaper preload ~/Pictures/Wallpapers/yosemite.png && hyprctl hyprpaper wallpaper 'eDP-1,~/Pictures/Wallpapers/yosemite.png' && hyprctl hyprpaper unload ~/Pictures/Wallpapers/yosemite.png"
        "$mod SHIFT CTRL, C, exec, hyprctl hyprpaper preload ~/Pictures/Wallpapers/city.jpg && hyprctl hyprpaper wallpaper 'eDP-1,~/Pictures/Wallpapers/city.jpg' && hyprctl hyprpaper unload ~/Pictures/Wallpapers/yosemite.jpg"
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
              "$mod SHIFT, D, workspace, 9" # for discord, move to designated spot
            ]
          )
          10)
      );

    # plugin = {
    #   hyprbars = {
    #     bar_height = 38;
    #     bar_color = "rgb(1e1e1e)";
    #     col.text = "$foreground";
    #     bar_text_size = 12;
    #     bar_text_font = "Jetbrains Mono Nerd Font Mono Bold";
    #     bar_button_padding = 12;
    #     bar_padding = 10;
    #     bar_precedence_over_border = true;
    #     hyprbars-button = [
    #       { color = "$color1"; size = 20; icon = ""; action = "hyprctl dispatch killactive"; }
    #       { color = "$color3"; size = 20; icon = ""; action = "hyprctl dispatch fullscreen 2"; }
    #       { color = "$color4"; size = 20; icon = ""; action = "hyprctl dispatch togglefloating"; }
    #     ];
    #   };
    # };
  };
}
