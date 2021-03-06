{
  description = "home manager config for jessenieboer";

  inputs = {
    emacs-overlay.url = "github:nix-community/emacs-overlay"; 
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";    
  };

  outputs = {
    emacs-overlay,
    home-manager,
    nixpkgs,
    self
  }:

  let
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ emacs-overlay.overlay ];
    };
    system = "x86_64-linux";

  in {
    homeConfigurations = {
      jessenieboer = home-manager.lib.homeManagerConfiguration {
        inherit pkgs system;

        configuration = {
          imports = [
            ./home.nix
          ];
        };

        homeDirectory = "/home/jessenieboer";        
        stateVersion = "21.11";
        username = "jessenieboer";        
      };
    };
  };
}

