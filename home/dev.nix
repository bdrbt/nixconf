{pkgs, ...}: {
  # development
  programs.helix = {
    enable = true;
  };

  home.packages = with pkgs; [
    pkgs.go
    pkgs.gopls
    pkgs.gotools

    pkgs.vscodium
  ];
}
