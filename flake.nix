{
  description = "home manager config for jessenieboer";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
      lib = nixpkgs.lib;
    in {
      homeConfigurations = {
        jessenieboer = home-manager.lib.homeManagerConfiguration {
          inherit system pkgs;
          username = "jessenieboer";
          homeDirectory = "/home/jessenieboer";
          stateVersion = "21.11";
          configuration = {
            imports = [
              ./home.nix
            ];
          };
        };
      };
    };
}
      
