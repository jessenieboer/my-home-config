{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    hello
  ];
}