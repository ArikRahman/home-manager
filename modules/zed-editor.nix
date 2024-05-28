{pkgs, ...}: {
  pkgs.zed-editor = {
    enable = true;
    settings = {
      window = {

        startup_mode = "Maximized";
      };

    };
  };
}
