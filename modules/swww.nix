# swww.nix
{ pkgs, ... }:

let
  wallpaperPath = "/home/arik/Pictures/nbhd.png";  # Change this to the path of your wallpaper image
in
{
  home.packages = with pkgs; [ swww ];

  xsession.windowManager.command = ''
    ${pkgs.swww}/bin/swww img ${wallpaperPath} &
  '';
}
