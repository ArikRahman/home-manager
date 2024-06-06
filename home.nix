{ config, pkgs, lib, mylib, ... }:

#hyprctl reload && hyprctl keyword monitor "eDP-1,1920x1080@144,0x0,1.0"

{
    # nixpkgs.config.allowUnfree = true;
  imports = [
    ./modules/zsh.nix
    ./modules/swww.nix
    ./modules/kitty.nix
    ./modules/alacritty.nix
    ./modules/floorp.nix
    ./modules/starship.nix
    # ./modules/espanso.nix
    # ./modules/zed-editor.nix
    # ./modules/cava.nix
    # ./modules/firefox/firefox.nix
    ./modules/firefox.nix
    ./modules/hyprland.nix
    # ./modules/steam.nix
    # ./modules/zoxide.nix
    # ./modules/hyprpaper.nix
  ];
  # imports = mylib.scanPaths ./.;
  #this is where paths are updates
  home.sessionVariables = {
    XDG_DATA_DIRS = lib.strings.concatStringsSep ":" [
      "${config.home.profileDirectory}/share"
      "/run/current-system/sw/share"
      "$HOME/.pub-cache/bin"
      "$XDG_DATA_DIRS" # Include the existing paths if they are set
    ];
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "arik";
  home.homeDirectory = "/home/arik";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfree = true;
  # home.shell = pkgs.zsh;
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    hello
    appflowy
    zed-editor
    zellij
    reaper
    maxfetch
    fastfetch
    github-desktop
    eza
    spotify
    vesktop
    vscode
    python312
    flutter
    calf
    # discord
    # betterdiscord-installer
    spacedrive
    android-studio
    gcc14
    rustup
    openssl
    pkg-config
    yt-dlp
    acpi
    hyprshot
    nodejs_18
    hyprpaper
    zoxide
    espanso-wayland
    obs-studio
    pavucontrol
    killall
    zoom-us
    qbittorrent
    bitwig-studio
    yabridge
    yabridgectl
    #yabridgectl add "$HOME/.wine/drive_c/Program Files/Common Files/CLAP"
    #yabridgectl sync
    wineWowPackages.waylandFull
    winetricks
    #isskinu.dll
    # winetricks vcrun6sp6
    # hyprlock
    # vencord
    armcord
    #catppuccin

    #


    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/arik/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    #  export PATH="$PATH":"$HOME/.pub-cache/bin"
  };
  # home.sessionPath = [ "$HOME/.pub-cache/bin"];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.yazi.enable = true;
  programs.thefuck.enable = true;
  # programs.zsh.enable = true;
  # programs.starship.enable = true;
  programs.fzf.enable = true;
  programs.git.enable = true;
  programs.hyprlock.enable = true;
  programs.spotify-player.enable = true;
  # programs.steam.enable = true;
  # services.espanso-wayland.enable = true;
  # services.espanso.enable = true;
  # programs.firefox.enable = true;


}


#
# napzend
# znc
# zoneminder
# zookeeper
#   with
#can change default now
#     programs.firefox.profiles.<name>.search.default

#   and add custom engines with

#     programs.firefox.profiles.<name>.search.engines.

#   It is also recommended to set

#     programs.firefox.profiles.<name>.search.force = true

#   since Firefox will replace the symlink for the search configuration on
#   every launch, but note that you'll lose any existing configuration by
#   enabling this.
