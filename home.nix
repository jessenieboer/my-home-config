{ pkgs, ... }: {
  home.packages = with pkgs; [
    hello
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacsGit-nox;
  };
}
