{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./dev.nix
    ./git.nix
    ./lf
    ./zsh.nix
    ./fonts.nix
  ];

  nixpkgs = {
    overlays = [
      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];

    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "dmitry";
    homeDirectory = "/home/dmitry";
  };

  home.packages = with pkgs; [
    pkgs.telegram-desktop
    pkgs.zoom-us
    pkgs.obsidian
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
