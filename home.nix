{ config, lib, modulesPath, options, pkgs, specialArgs }: 

# see if package is available: nix-env -f 'nixpkgs' -qaP emacsPackages | grep packagename
let emacs = with pkgs;
(emacsWithPackagesFromUsePackage {
  config = ./config.org;
  package = emacsNativeComp;
  extraEmacsPackages = epkgs:
  (with epkgs; [
    hydra
  ]);
});

in {

  home.packages = with pkgs; [
    emacs
    hello
  ];

}

