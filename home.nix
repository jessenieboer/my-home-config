{ config, lib, modulesPath, options, pkgs, specialArgs }: 

let emacs = with pkgs;
(emacsWithPackagesFromUsePackage {
  config = ./config.org;
  package = emacsNativeComp;
  extraEmacsPackages = epkgs:
  (with epkgs; []);
});

in {

  home.packages = with pkgs; [
    emacs
    hello
  ];

}

